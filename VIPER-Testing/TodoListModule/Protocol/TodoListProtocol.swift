//
//  TodoListProtocol.swift
//  VIPER-Testing
//
//  Created by Leonardo Wijaya on 19/09/23.
//

import UIKit

protocol TodoListViewProtocol: class {
    var presenter: TodoListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showTodos(_ todos: [TodoItem])
    func showErrorMessage(_ message: String)
}

protocol TodoListPresenterProtocol: class {
    var view: TodoListViewProtocol? { get set }
    var interactor: TodoListInteractorInputProtocol? { get set }
    var router: TodoListRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewWillApper()
    func showTodoDetail(_ todo: TodoItem)
    func addTodo(_ todo: TodoItem)
    func removeTodo(_ todo: TodoItem)
}

protocol TodoListInteractorInputProtocol: class {
    var presenter: TodoListInteractorOuputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveTodos()
    func saveTodo(_ todo: TodoItem)
    func deleteTodo(_ todo: TodoItem)
}

protocol TodoListInteractorOuputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didAddTodo(_ todo: TodoItem)
    func didRemoveTodo(_ todo: TodoItem)
    func didRetrieveTodos(_ todos: [TodoItem])
    func onError(message: String)
}

protocol TodoListRouterProtocol: class {
    static func createTodoListModule() -> UIViewController
    
    // PRESENTER -> ROUTER
    func presentTodoDetailScreen(from view: TodoListViewProtocol, for todo: TodoItem)
}
