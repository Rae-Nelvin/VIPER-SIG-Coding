//
//  CustomCell.swift
//  VIPER-Testing
//
//  Created by Leonardo Wijaya on 20/09/23.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(contentLabel)
        setTitleConstraints()
        setContentConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ todo: TodoItem) {
        titleLabel.text = todo.title
        contentLabel.text = todo.content
    }
    
    func setTitleConstraints() {
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }
    
    func setContentConstraints() {
        contentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        contentLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 20).isActive = true
    }
    
}
