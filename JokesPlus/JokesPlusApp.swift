//
//  JokesPlusApp.swift
//  JokesPlus
//
//  Created by Dev Soni on 28/08/25.
//

import SwiftUI

@main
struct JokesPlusApp: App {
    @State private var model = AppModel()
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                ContentView()
                    .environment(model)
            } else {
                OnboardingView()
            }
        }
    }
}
