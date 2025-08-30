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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
