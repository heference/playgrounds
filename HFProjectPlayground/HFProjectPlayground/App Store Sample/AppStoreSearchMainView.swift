//
//  AppStoreSeachMainView.swift
//  HFProjectPlayground
//
//  Created by Ikarious on 24/08/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit

class AppStoreSearchMainView: UIView {
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.register(MainCell.self, forCellReuseIdentifier: "MainCell")
        view.register(AppStoreSearchListCell.self, forCellReuseIdentifier: "AppStoreSearchListCell")
        return view
    }()
    
    func layout(superView: UIView) {
        superView.backgroundColor = UIColor.white
        superView.addSubview(self)
        
        self.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
