//
//  Minimal_Todo_ListApp.swift
//  Minimal Todo List
//
//  Created by Anubhav Tomar on 28/11/24.
//

import SwiftUI

@main
struct Minimal_Todo_ListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Todo.self)
    }
}
