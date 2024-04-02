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
    
    private var filteredPeople: People {
        var people: People = []
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
                    
                    Section("Yeni Kullanici") {
                        NavigationLink {
                            AddPersonView()
                        } label: {
                            Text("Ekle")
                        }
                    }
                    
                    Section("Kisiler") {
                        if viewModel.people.isEmpty {
                            ProgressView()
                        } else {
                            ForEach(filteredPeople) { person in
                                NavigationLink {
                                    DetailView(personId: person.id)
                                } label: {
                                    Text(person.name)
                                }
                            }
                        }
                    }
                }
                .searchable(text: $searchText)
                .task {
                    await viewModel.getPeople()
                }
//            }
            .navigationTitle("Ana Sayfa")
        }
    }
}

#Preview {
    ContentView()
}
