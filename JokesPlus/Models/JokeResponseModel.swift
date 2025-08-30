//
//  JokeResponseModel.swift
//  JokesPlus
//
//  Created by Dev Soni on 30/08/25.
//

import Foundation


struct JokeResponseModel: Identifiable, Decodable {
    var category: String
    var type: String
    var setup: String?
    var delivery: String?
    var joke: String?
    var flags: Flags
    let id: Int
    var safe: Bool
}

struct Flags: Decodable {
    var nsfw: Bool
    var religious: Bool
    var political: Bool
    var racist: Bool
    var sexist: Bool
    var explicit: Bool
}
