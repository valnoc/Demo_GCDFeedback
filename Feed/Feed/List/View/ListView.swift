//
//  ListView.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 07.08.2021.
//

import UIKit

class ListView: UIView {
    private lazy var tableView: UITableView = {
        let item = UITableView()
        return item
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: topAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        tableView.register(ListItemCell.self, forCellReuseIdentifier: "ListItemCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var vmsCache: [ListItemCellVM] = []
    private var action: ((ListVC.Event) -> Void)?
}

extension ListView {
    func updateList(_ vms: [ListItemCellVM], action: @escaping (ListVC.Event) -> Void) {
        vmsCache = vms
        self.action = action
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vmsCache.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath) as? ListItemCell else { return UITableViewCell() }
        cell.update(vmsCache[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = vmsCache[indexPath.row].userInfo as? FeedItem else { return }
        action?(.didSelectItem(item))
    }
}
