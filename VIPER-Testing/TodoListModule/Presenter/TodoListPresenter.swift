//
//  TodoListPresenter.swift
//  VIPER-Testing
//
//  Created by Leonardo Wijaya on 19/09/23.
//

import UIKit

class TodoListPresenter: TodoListPresenterProtocol {
    weak var view: TodoListViewProtocol?
    var interactor: TodoListInteractorInputProtocol?
    var router: TodoListRouterProtocol?
    
    func showTodoDetail(_ todo: TodoItem) {
        guard let view = view else { return }
        router?.presentTodoDetailScreen(from: view, for: todo)
    }
    
    func addTodo(_ todo: TodoItem) {
        interactor?.saveTodo(todo)
    }
    
    func viewWillApper() {
        interactor?.retrieveTodos()
    }
    
    func removeTodo(_ todo: TodoItem) {
        interactor?.deleteTodo(todo)
    }
}

extension TodoListPresenter: TodoListInteractorOuputProtocol {
    func didAddTodo(_ todo: TodoItem) {
        interactor?.retrieveTodos()
    }
    
    func didRetrieveTodos(_ todos: [TodoItem]) {
        view?.showTodos(todos)
    }
    
    func onError(message: String) {
        view?.showErrorMessage(message)
    }
    
    func didRemoveTodo(_ todo: TodoItem) {
        interactor?.retrieveTodos()
    }
}
