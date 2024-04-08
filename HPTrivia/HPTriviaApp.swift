//
//  HPTriviaApp.swift
//  HPTrivia
//
//  Created by Ruben Movsisyan on 4/1/24.
//

import SwiftUI

@main
struct HPTriviaApp: App {
    @StateObject private var store = Store()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .task {
                    await store.loadProducts()
                }
        }
    }
}
