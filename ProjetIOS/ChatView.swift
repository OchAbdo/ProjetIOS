//
//  ChatView.swift
//  ProjetIOS
//
//  Created by Tekup-mac-7 on 16/5/2025.
//

import SwiftUI


struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @Environment(\.dismiss) var dismiss  // ← pour fermer la vue

    var body: some View {
        VStack {
            // Header avec flèche de retour
            HStack {
                Button(action: {
                    dismiss() // ← Ferme la vue
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color(red: 112/255, green: 211/255, blue: 166/255))
                        .clipShape(Circle())
                }
                Spacer()
            }
            .padding()

            ScrollView {
                ForEach(viewModel.messages) { message in
                    HStack {
                        if message.role == "user" {
                            Spacer()
                            Text(message.content)
                                .padding()
                                .background(Color(red: 112/255, green: 211/255, blue: 166/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        } else {
                            Text(message.content)
                                .padding()
                                .background(Color(red: 112/255, green: 211/255, blue: 166/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                }
            }

            HStack {
                TextField("Entrez votre message...", text: $viewModel.userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 44)

                Button("Envoyer") {
                    viewModel.sendMessage()
                }
                .foregroundColor(Color(red: 112/255, green: 211/255, blue: 166/255))
                .disabled(viewModel.userInput.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding()
        }
        .navigationTitle("Chat GPT (RapidAPI)")
    }
}

#Preview {
    ChatView()
}
