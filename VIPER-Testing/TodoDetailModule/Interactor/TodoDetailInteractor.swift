//
//  TodoDetailInteractor.swift
//  VIPER-Testing
//
//  Created by Leonardo Wijaya on 19/09/23.
//

import Foundation

class TodoDetailInteractor: TodoDetailInteractorInputProtocol {
    var presenter: TodoDetailInteractorOutputProtocol?
    var todoStore = TodoStore.shared
    var todoItem: TodoItem?
    
    func deleteTodo() {
        guard let todoItem = todoItem else { return }
        todoStore.removeTodo(todoItem)
        presenter?.didDeleteTodo()
    }
    
    func editTodo(title: String, content: String) {
        guard let todoItem = todoItem else { return }
        todoItem.title = title
        todoItem.content = content
        presenter?.didEditTodo(todoItem)
    }
}
