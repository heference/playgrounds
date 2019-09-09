//
//  SnapGuideResultView.swift
//  HFProjectPlayground
//
//  Created by Ikarious on 02/09/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit

class SnapGuideResultView: UIView {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "")
        view.contentMode = UIView.ContentMode.scaleAspectFit
        return view
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 12, weight: .light)
        textView.textColor = UIColor.black
        textView.isEditable = false
        textView.textAlignment = .left
        textView.text = ""
        
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        return textView
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
        
        self.addSubview(textView)
        textView.topAnchor(equalTo: self.centerYAnchor, constant: 15)
        textView.leadingAnchor(equalTo: self.leadingAnchor, constant: 15)
        textView.trailingAnchor(equalTo: self.trailingAnchor, constant: -15)
        textView.bottomAnchor(equalTo: self.bottomAnchor, constant: -15)
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
