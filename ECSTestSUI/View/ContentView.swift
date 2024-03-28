//
//  ContentView.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 19.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MainViewModel()
    @State private var searchText = ""
    private let persistenceManager = PersistenceManager.shared
    
    private var filteredPeople: [Person] {
        var people: [Person] = []
        people.append(contentsOf: viewModel.people.filter { $0.name.lowercased() == searchText.lowercased() || searchText.isEmpty })
        return people
    }
    
    var body: some View {
        NavigationStack {
//            ScrollView {
                List {
                    Section {
                        Text("Merhaba \(persistenceManager.userName)")
                    }
                    Section("Detay") {
                        NavigationLink {
                            DetailView()
                        } label: {
                            Text("Tikla")
                        }
                    }
                    
                    Section("Kisiler") {
                        ForEach(filteredPeople) { person in
                            Text("\(person.name) \(person.lastName)")
                        }
                    }
                }
                .searchable(text: $searchText)
                .onAppear {
                    viewModel.fetchData()
                }
//            }
            .navigationTitle("Ana Sayfa")
        }
    }
}

#Preview {
    ContentView()
}
