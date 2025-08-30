//
//  AppModel.swift
//  JokesPlus
//
//  Created by Dev Soni on 30/08/25.
//

import Foundation
import Observation

@MainActor
@Observable
final class AppModel {
    
    var category: String = "any"
    var selectedFlags: [String] = []
    var jokeText: String?
    var setupText: String?
    var deliveryText: String?
    var isLoading: Bool = false
    var error: Error?
    
    @ObservationIgnored private let service = DataService()
    
    func fetchJoke() async {
        isLoading = true
        error = nil
        
        let jokeResult = await service.getJoke(category: category, blacklistFlags: selectedFlags)
        
        if jokeResult.joke != nil {
            jokeText = jokeResult.joke!
        } else if jokeResult.setup != nil {
            jokeText = """
                \(jokeResult.setup!)
                
                \(jokeResult.delivery!)
                """
        } else {
            jokeText = "No Joke Found"
        }
        isLoading = false
    }

}
