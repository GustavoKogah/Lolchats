//
//  MessageResponse.swift
//  Lolchats
//
//  Created by Luis Gustavo Fermino Moraes on 19/10/22.
//

import Foundation

class MessageResponse: Decodable {
    
    let message: String
    let itsMe: Bool
    
    enum CodingKeys: String, CodingKey {
        case message = "mensagem"
        case itsMe = "souEu"
    }
}
