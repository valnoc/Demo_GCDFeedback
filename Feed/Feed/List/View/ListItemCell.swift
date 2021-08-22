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
    let isLiked: Bool
    let showLikeButton: Bool
    
    let likeAction: () -> Void
    
    let userInfo: Any
}

// MARK: - ListItemCell
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
    
    lazy var bnLike: UIButton = {
        let element = UIButton(type: .custom)
        element.setImage(UIImage(systemName: "heart"), for: .normal)
        element.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        element.addTarget(self, action: #selector(bnLikeAction), for: .touchUpInside)
        return element
    }()
    
    var vm: ListItemCellVM?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        bnLike.translatesAutoresizingMaskIntoConstraints = false
        lbText.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(lbTitle)
        contentView.addSubview(bnLike)
        contentView.addSubview(lbText)
        
        NSLayoutConstraint.activate([
            lbTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            lbTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            bnLike.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            bnLike.leadingAnchor.constraint(equalTo: lbTitle.trailingAnchor, constant: 8),
            bnLike.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            lbText.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 4),
            lbText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lbText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
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
        
        bnLike.isHidden = !vm.showLikeButton
        bnLike.isSelected = vm.isLiked
        updateBnLikedImage()
        
        self.vm = vm
        setNeedsLayout()
    }
    
    private func updateBnLikedImage() {
        if isSelected {
            bnLike.setImage(UIImage(systemName: "heart"), for: .highlighted)
        } else {
            bnLike.setImage(UIImage(systemName: "heart.fill"), for: .highlighted)
        }
    }
    
    @objc private func bnLikeAction() {
        vm?.likeAction()
    }
}
