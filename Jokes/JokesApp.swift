//
//  JokesApp.swift
//  Jokes
//
//  Created by Leon Gell on 2023-04-14.
//

import SwiftUI

@main
struct JokesApp: App {
    var body: some Scene {
        WindowGroup {
            JokeView()
            // Make the databse accessible to all the different views.
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
