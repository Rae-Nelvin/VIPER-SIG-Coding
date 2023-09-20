//
//  TodoDetailRouter.swift
//  VIPER-Testing
//
//  Created by Leonardo Wijaya on 19/09/23.
//

import UIKit

class TodoDetailRouter: TodoDetailRouterProtocol {
    func navigateBackToListViewController(from view: TodoDetailViewProtocol) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
    
    static func createTodoDetailRouterModule(with todo: TodoItem) -> UIViewController {
        let todoDetailViewController = TodoDetailViewController() 
        
        let presenter: TodoDetailPresenter & TodoDetailInteractorOutputProtocol = TodoDetailPresenter()
        let router: TodoDetailRouterProtocol = TodoDetailRouter()
        let interactor: TodoDetailInteractorInputProtocol = TodoDetailInteractor()
        
        todoDetailViewController.presenter = presenter
        presenter.view = todoDetailViewController
        interactor.todoItem = todo
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return todoDetailViewController
    }
}
