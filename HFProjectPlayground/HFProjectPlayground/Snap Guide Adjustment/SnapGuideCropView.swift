//
//  SnapGuideCropView.swift
//  HFProjectPlayground
//
//  Created by Ikarious on 02/09/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit

class SnapGuideCropView: UIView {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "sample1")
        view.contentMode = UIView.ContentMode.scaleAspectFit
        return view
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SNAP", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    
    func layout(superView: UIView) {
        superView.backgroundColor = UIColor.white
        superView.addSubview(self)
        self.topAnchor(equalTo: superView.safeAreaLayoutGuide.topAnchor)
        self.leadingAnchor(equalTo: superView.safeAreaLayoutGuide.leadingAnchor)
        self.trailingAnchor(equalTo: superView.safeAreaLayoutGuide.trailingAnchor)
        self.bottomAnchor(equalTo: superView.safeAreaLayoutGuide.bottomAnchor)
        
        self.addSubview(imageView)
        imageView.topAnchor(equalTo: self.topAnchor, constant: 30)
        imageView.leadingAnchor(equalTo: self.leadingAnchor, constant: 15)
        imageView.trailingAnchor(equalTo: self.trailingAnchor, constant: -15)
        imageView.bottomAnchor(equalTo: self.centerYAnchor)
        
        self.addSubview(button)
        button.heightAnchor(equalToConstant: 30)
        button.leadingAnchor(equalTo: self.leadingAnchor, constant: 15)
        button.trailingAnchor(equalTo: self.trailingAnchor, constant: -15)
        button.bottomAnchor(equalTo: self.bottomAnchor, constant: -30)
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
