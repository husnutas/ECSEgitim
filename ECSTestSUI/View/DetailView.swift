//
//  DetailView.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 26.03.2024.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel = DetailViewModel()
    
    @State private var name = ""
    @State private var bio = ""
    @State private var isChecked = false
    
    var body: some View {
        Form {
            TextField("Ad", text: $name)
            TextField("Bio", text: $bio)
            
            Toggle("Kontrol edildi", isOn: $isChecked)
            
            Button("Kaydet", action: saveData)
        }
    }
}

extension DetailView {
    private func saveData() {
        let person = Person(id: UUID().uuidString, avatarURL: "", name: name, bio: bio, isChecked: isChecked)
        print(person)
        viewModel.saveToDevice(value: name, key: .userName)
    }
}

#Preview {
    DetailView()
}
