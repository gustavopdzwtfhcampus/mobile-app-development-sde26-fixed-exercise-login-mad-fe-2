//
//  ContentView.swift
//  MAD Exercise
//
//  Created by Gustavo Podzuweit on 28.09.26.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Email")
                TextField("yourname@example.com", text: $email)
                    .textFieldStyle(.roundedBorder)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Password")
                TextField("Your password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }

            HStack {
                Spacer()
                Button("Login") {
                }
                Spacer()
            }
            .padding(.top, 8)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
