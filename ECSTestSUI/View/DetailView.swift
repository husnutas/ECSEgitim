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
    @State private var lastName = ""
    @State private var age = ""
    
    var body: some View {
        Form {
            TextField("Ad", text: $name)
            TextField("Soyad", text: $lastName)
            TextField("Yas", text: $age)
            
            Button("Kaydet", action: saveData)
        }
    }
}

extension DetailView {
    private func saveData() {
        let person = Person(name: name, lastName: lastName, age: Int(age) ?? 0)
        print(person)
        viewModel.saveToDevice(value: name, key: .userName)
    }
}

#Preview {
    DetailView()
}
