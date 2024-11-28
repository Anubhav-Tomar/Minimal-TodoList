//
//  ContentView.swift
//  Minimal Todo List
//
//  Created by Anubhav Tomar on 28/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .navigationTitle("Todo List")
        }
    }
}

#Preview {
    ContentView()
}
