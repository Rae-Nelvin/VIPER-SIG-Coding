//
//  TodoListViewController.swift
//  VIPER-Testing
//
//  Created by Leonardo Wijaya on 19/09/23.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var presenter: TodoListPresenterProtocol?
    
    struct Cells {
        static let customCell = "CustomCell"
    }
    
    var todos: [TodoItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillApper()
    }
    
    private func setupView() {
        // Set up the navigation bar
        view.backgroundColor = .white
        title = "VIPER Todo List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped(_:))
        )
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
    }
    
    @objc func addTapped(_ sender: Any) {
        let alertController = UIAlertController(
            title: "Add Todo Item",
            message: "Enter title and content",
            preferredStyle: .alert
        )
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak self] (_) in
            let titleText = alertController.textFields?[0].text ?? ""
            let contentText = alertController.textFields?[1].text ?? ""
            guard !titleText.isEmpty else { return }
            let todoItem = TodoItem(title: titleText, content: contentText)
            self?.presenter?.addTodo(todoItem)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let todo = todos[indexPath.row]
        cell.set(todo)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row]
        presenter?.showTodoDetail(todo)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let todoItem = todos[indexPath.row]
            presenter?.removeTodo(todoItem)
        }
    }
}

extension TodoListViewController: TodoListViewProtocol {
    func showTodos(_ todos: [TodoItem]) {
        self.todos = todos
    }
    
    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
