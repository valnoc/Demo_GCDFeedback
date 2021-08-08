//
//  ListView.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 07.08.2021.
//

import UIKit

class ListView: UIView {
    lazy var tableView: UITableView = {
        let item = UITableView()
        return item
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        addConstraints([tableView.topAnchor.constraint(equalTo: topAnchor),
                        tableView.topAnchor.constraint(equalTo: topAnchor),
                        tableView.topAnchor.constraint(equalTo: topAnchor),
                        tableView.topAnchor.constraint(equalTo: topAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

extension ListView: UITableViewDelegate {
    
}
