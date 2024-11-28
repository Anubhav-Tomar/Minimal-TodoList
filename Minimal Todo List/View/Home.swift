//
//  Home.swift
//  Minimal Todo List
//
//  Created by Anubhav Tomar on 28/11/24.
//

import SwiftUI
import SwiftData

struct Home: View {
    
    // Active toso's
    @Query(filter: #Predicate<Todo> { !$0.isCompleted },
           sort: [SortDescriptor(\Todo.lastUpdated, order: .reverse)],
           animation: .snappy)
    private var activeTodos: [Todo]
    
    @Environment(\.modelContext) private var context
    @State private var showAll: Bool = false
    
    var body: some View {
        List {
            Section(activeSectionTitle) {
                ForEach(activeTodos) {
                    TodoRowView(todo: $0)
                }
            }
            
            // Completed task
            CompletedTodos(showAll: $showAll)
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button {
                    // Creating empty todo task
                    let todo = Todo(task: "", priority: .normal)
                    
                    // Saving item into context
                    context.insert(todo)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .fontWeight(.light)
                        .font(.system(size: 42))
                }

            }
        }
    }
    
    var activeSectionTitle: String {
        let count = activeTodos.count
        return count == 0 ? "Active" : "\(count) Todos"
    }
}

#Preview {
    ContentView()
}
