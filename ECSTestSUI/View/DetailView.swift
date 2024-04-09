//
//  DetailView.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 2.04.2024.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel = DetailViewModel(service: DetailService())
    let personId: String
    
    var body: some View {
        VStack {
            if let person = viewModel.person {
                // avatar
                AsyncImage(url: URL(string: person.avatarURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .frame(height: 200)
                
                Text(person.name)
                
                Text(person.bio)
                
                Spacer()
            } else {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .task {
            await viewModel.getUser(id: personId)
        }
    }
}

#Preview {
    DetailView(personId: "C1D8A643-F0C5-4474-B632-50FE6F3C1280")
}
