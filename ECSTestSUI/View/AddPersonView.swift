//
//  AddPersonView.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 26.03.2024.
//

import SwiftUI

struct AddPersonView: View {
    @StateObject private var viewModel = AddPersonViewModel(service: AddPersonService())
    
    @State private var name = ""
    @State private var bio = ""
    @State private var avatarUrl = "https://static.vecteezy.com/system/resources/previews/024/183/502/original/male-avatar-portrait-of-a-young-man-with-a-beard-illustration-of-male-character-in-modern-color-style-vector.jpg"
    @State private var isChecked = false
    
    var body: some View {
        Form {
            TextField("Ad", text: $name)
            TextField("Bio", text: $bio)
            TextField("Avatar", text: $avatarUrl)
            
            Toggle("Kontrol edildi", isOn: $isChecked)
            
            Button("Kaydet", action: saveData)
        }
    }
}

extension AddPersonView {
    private func saveData() {
        let person = Person(id: UUID().uuidString, avatarURL: avatarUrl, name: name, bio: bio, isChecked: isChecked)
        print(person)
        viewModel.saveToDevice(value: name, key: .userName)
        Task {
            await viewModel.addPerson(person)
        }
    }
}

#Preview {
    AddPersonView()
}
