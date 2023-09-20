//
//  TodoListInteractor.swift
//  VIPER-Testing
//
//  Created by Leonardo Wijaya on 19/09/23.
//

import Foundation

class TodoListInteractor: TodoListInteractorInputProtocol {
    weak var presenter: TodoListInteractorOuputProtocol?
    var todoStore = TodoStore.shared
    var todos: [TodoItem] {
        return todoStore.todos
    }
    
    func retrieveTodos() {
        presenter?.didRetrieveTodos(todos)
    }
    
    func saveTodo(_ todo: TodoItem) {
        todoStore.addTodo(todo)
        presenter?.didAddTodo(todo)
    }
    
    func deleteTodo(_ todo: TodoItem) {
        todoStore.removeTodo(todo)
        presenter?.didRemoveTodo(todo)
    }
}
