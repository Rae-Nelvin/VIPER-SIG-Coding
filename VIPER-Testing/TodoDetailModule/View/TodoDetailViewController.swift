//
//  TodoDetailViewController.swift
//  VIPER-Testing
//
//  Created by Leonardo Wijaya on 19/09/23.
//

import UIKit

class TodoDetailViewController: UIViewController {
    
    var titleLabel: UILabel = UILabel()
    var contentLabel: UILabel = UILabel()
    
    var presenter: TodoDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        let deleteButton = UIBarButtonItem(
            barButtonSystemItem: .trash, target: self, action: #selector(deleteTapped(_:))
        )
        deleteButton.tintColor = UIColor.red
        navigationItem.rightBarButtonItems = [
            deleteButton,
            UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editTapped(_:))),
        ]
        view.addSubview(titleLabel)
        view.addSubview(contentLabel)
        setupTitleLabelConstraints()
        setupContentLabelConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    private func setupContentLabelConstraints() {
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 40).isActive = true
        contentLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        contentLabel.font = .systemFont(ofSize: 15)
    }
    
    @objc func deleteTapped(_ sender: Any) {
        presenter?.deleteTodo()
    }
    
    @objc func editTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Edit Todo Item", message: "Enter title and content", preferredStyle: .alert)
        
        alertController.addTextField { $0.text = self.titleLabel.text }
        alertController.addTextField { $0.text = self.contentLabel.text }
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak self](_) in
            let titleText = alertController.textFields![0].text ?? ""
            let contentText = alertController.textFields![1].text ?? ""
            guard !titleText.isEmpty else { return }
            self?.presenter?.editTodo(title: titleText, content: contentText)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension TodoDetailViewController: TodoDetailViewProtocol {
    
    func showTodo(_ todo: TodoItem) {
        titleLabel.text = todo.title
        contentLabel.text = todo.content
    }
}
