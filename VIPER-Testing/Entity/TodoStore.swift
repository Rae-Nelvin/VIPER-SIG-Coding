//
//  TodoStore.swift
//  VIPER-Testing
//
//  Created by Leonardo Wijaya on 19/09/23.
//

import Foundation

class TodoStore {
    private init() {}
    public static let shared = TodoStore()
    
    public private(set) var todos: [TodoItem] = [
        TodoItem(title: "Focus", content: "Learning VIPER for 24 hours"),
        TodoItem(title: "Leisure", content: "Take Baba for a walk"),
        TodoItem(title: "Action", content: "Go to the gym")
    ];
    
    func addTodo(_ todo: TodoItem) {
        todos.append(todo)
    }
    
    func removeTodo(_ todo: TodoItem) {
        if let index = todos.firstIndex(where: { $0 === todo}) {
            todos.remove(at: index)
        }
    }
}
