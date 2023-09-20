//
//  TodoDetailPresenter.swift
//  VIPER-Testing
//
//  Created by Leonardo Wijaya on 19/09/23.
//

import UIKit

class TodoDetailPresenter: TodoDetailPresenterProtocol {
    var view: TodoDetailViewProtocol?
    var router: TodoDetailRouterProtocol?
    var interactor: TodoDetailInteractorInputProtocol?
    
    func viewDidLoad() {
        if let todoItem = interactor?.todoItem {
            view?.showTodo(todoItem)
        }
    }
    
    func editTodo(title: String, content: String) {
        interactor?.editTodo(title: title, content: content)
    }
    
    func deleteTodo() {
        interactor?.deleteTodo()
    }
}

extension TodoDetailPresenter: TodoDetailInteractorOutputProtocol {
    func didDeleteTodo() {
        if let view = view {
            router?.navigateBackToListViewController(from: view)
        }
    }
    
    func didEditTodo(_ todo: TodoItem) {
        view?.showTodo(todo)
    }
}
