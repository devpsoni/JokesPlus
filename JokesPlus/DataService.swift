//
//  DataService.swift
//  JokesPlus
//
//  Created by Dev Soni on 30/08/25.
//

import Foundation


struct DataService {
    func getJoke(category: String, blacklistFlags: [String]) async -> JokeResponseModel {
        var url = "https://v2.jokeapi.dev/joke"
        
        if category != "" && !category.isEmpty {
            url.append("/\(category)")
        }
        
        if blacklistFlags.count > 0 {
            url.append("?blacklistFlags=\(blacklistFlags.joined(separator: ",").lowercased())")
        }
        
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                return try decoder.decode(JokeResponseModel.self, from: data)
            } catch {
                print(error)
            }
        }
        
        return JokeResponseModel(
                    category: "",
                    type: "",
                    setup: nil,
                    delivery: nil,
                    joke: nil,
                    flags: Flags(
                        nsfw: false,
                        religious: false,
                        political: false,
                        racist: false,
                        sexist: false,
                        explicit: false
                    ),
                    id: 0,
                    safe: true
                )
    }
}
