//
//  ModelChat.swift
//  ProjetIOS
//
//  Created by Tekup-mac-7 on 16/5/2025.
//

import Foundation

struct ChatMessage: Codable, Identifiable {
    let role: String
    let content: String

    var id: UUID {
        UUID()
    }
}
struct ChatAPIResponse: Codable {
    struct Choice: Codable {
        let message: ChatMessage
    }
    let choices: [Choice]
}
