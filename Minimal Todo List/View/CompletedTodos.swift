//
//  CompletedTodos.swift
//  Minimal Todo List
//
//  Created by Anubhav Tomar on 28/11/24.
//

import SwiftUI
import SwiftData

struct CompletedTodos: View {
    @Query private var completedTodo: [Todo]
    @Binding var showAll: Bool
    init(showAll: Binding<Bool>) {
        let predicate = #Predicate<Todo> { $0.isCompleted }
        let sort = [SortDescriptor(\Todo.lastUpdated, order: .reverse)]
        
        var descriptor = FetchDescriptor(predicate: predicate, sortBy: sort)
        if !showAll.wrappedValue {
            descriptor.fetchLimit = 10
        }
        
        _completedTodo = Query(descriptor, animation: .snappy)
        _showAll = showAll
    }
    
    var body: some View {
        Section {
            ForEach(completedTodo) {
                TodoRowView(todo: $0)
            }
        } header: {
            HStack {
                Text("Completed")
                
                Spacer()
                
                if showAll && !completedTodo.isEmpty {
                    Button("Show Recents") {
                        showAll.toggle()
                    }
                }
            }
            .font(.caption)
        } footer: {
            if completedTodo.count == 10 && !showAll && !completedTodo.isEmpty {
                HStack {
                    Text("Showing Recent 10 Tasks")
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Button("Show All") {
                        showAll.toggle()
                    }
                }
                .font(.caption)
            }
        }

    }
}
//
//#Preview {
//    CompletedTodos()
//}
