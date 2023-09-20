//
//  TodoListRouter.swift
//  VIPER-Testing
//
//  Created by Leonardo Wijaya on 19/09/23.
//

import UIKit

class TodoListRouter: TodoListRouterProtocol {
    
    static func createTodoListModule() -> UIViewController {
        let navController = UINavigationController(rootViewController: TodoListViewController())
        guard let todoListViewController = navController.topViewController as? TodoListViewController else { fatalError("Invalid View Controller") }
        
        // Create the presenter, interactor, and router
        let presenter: TodoListPresenterProtocol & TodoListInteractorOuputProtocol = TodoListPresenter()
        let interactor: TodoListInteractorInputProtocol = TodoListInteractor()
        let router = TodoListRouter()
        
        // Connect the components
        todoListViewController.presenter = presenter
        presenter.view = todoListViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
                
        return navController
    }
    
    func presentTodoDetailScreen(from view: TodoListViewProtocol, for todo: TodoItem) {
        let todoDetailViewController = TodoDetailRouter.createTodoDetailRouterModule(with: todo)
        guard let viewVC = view as? UIViewController else { fatalError("Invalid View Protocol type") }
        viewVC.navigationController?.pushViewController(todoDetailViewController, animated: true)
    }
}

