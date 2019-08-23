//
//  MainCell.swift
//  HFProjectPlayground
//
//  Created by Heference on 22/08/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit
class MainCell: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "MainCell")
        self.backgroundColor = UIColor.white
        
        self.addSubview(label)
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
