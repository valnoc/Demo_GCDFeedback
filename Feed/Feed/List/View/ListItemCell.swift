//
//  ListItemCell.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 16.08.2021.
//

import UIKit

struct ListItemCellVM {
    let title: String
    let text: String
}

class ListItemCell: UITableViewCell {
    lazy var lbTitle: UILabel = {
        let element = UILabel()
        element.font = .preferredFont(forTextStyle: .headline)
        element.textColor = .black
        return element
    }()
    
    lazy var lbText: UILabel = {
        let element = UILabel()
        element.font = .preferredFont(forTextStyle: .body)
        element.textColor = .darkGray
        element.numberOfLines = 3
        return element
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbText.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(lbTitle)
        contentView.addSubview(lbText)
        
        NSLayoutConstraint.activate([
            lbTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            lbTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lbTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            
            lbText.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 4),
            lbText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lbText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            lbText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListItemCell {
    func update(_ vm: ListItemCellVM) {
        lbTitle.text = vm.title
        lbText.text = vm.text
        setNeedsLayout()
    }
}
