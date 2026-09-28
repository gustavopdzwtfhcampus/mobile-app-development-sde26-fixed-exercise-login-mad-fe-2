//
//  ContentView.swift
//  MAD Exercise
//
//  Created by Gustavo Podzuweit on 28.09.26.
//

import SwiftUI

struct ContentView: View {
    private enum Field {
        case email
        case password
    }

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showValidationError: Bool = false
    @FocusState private var focusedField: Field?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Email")
                TextField("yourname@example.com", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .submitLabel(.next)
                    .focused($focusedField, equals: .email)
                    .onSubmit {
                        focusedField = .password
                    }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Password")
                SecureField("Your password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.password)
                    .submitLabel(.go)
                    .focused($focusedField, equals: .password)
                    .onSubmit {
                        login()
                    }
            }

            if showValidationError {
                Text("Please fill in both email and password.")
                    .foregroundStyle(.red)
                    .font(.footnote)
            }

            HStack {
                Spacer()
                Button("Login") {
                    login()
                }
                Spacer()
            }
            .padding(.top, 8)

            Spacer()
        }
        .padding()
    }

    private func login() {
        guard !email.isEmpty, !password.isEmpty else {
            showValidationError = true
            return
        }
        showValidationError = false
    }
}

#Preview {
    ContentView()
}
