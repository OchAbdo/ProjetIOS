//
//  ApiChat.swift
//  ProjetIOS
//
//  Created by Tekup-mac-7 on 16/5/2025.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var userInput: String = ""

    func sendMessage() {
        let userMessage = ChatMessage(role: "user", content: userInput)
        messages.append(userMessage)

        let parameters: [String: Any] = [
            "messages": messages.map { ["role": $0.role, "content": $0.content] },
            "model": "gpt-4o-mini"
        ]

        guard let url = URL(string: "https://chatgpt-42.p.rapidapi.com/chat") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("5f990ba77emsh52170a48f8a539cp1104d6jsna300eba95ce4", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("chatgpt-42.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            print("Erreur encodage JSON: \(error)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Erreur réseau : \(error?.localizedDescription ?? "Inconnue")")
                return
            }

            // Affiche la réponse brute pour debug
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Réponse JSON brute: \(jsonString)")
            }

            do {
                let decoded = try JSONDecoder().decode(ChatAPIResponse.self, from: data)
                DispatchQueue.main.async {
                    if let reply = decoded.choices.first?.message {
                        self.messages.append(reply)
                        self.userInput = ""
                    }
                    
                }
            } catch {
                print("Erreur de décodage : \(error)")
            }
        }.resume()
    }
}

