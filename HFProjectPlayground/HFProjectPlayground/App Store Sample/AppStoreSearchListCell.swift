//
//  AppStoreListCell.swift
//  HFProjectPlayground
//
//  Created by Heference on 27/08/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit

class AppStoreSearchListCell: UITableViewCell {
    
    let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 0.2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let appSummaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.lightGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = ""
        return label
    }()
    
    let appStarValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.lightGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "☆☆☆☆☆"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let appValueCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.lightGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = ""
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let appDownloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray
//        button.setTitleColor(UIColor.iOSDefault.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitle("열기", for: .normal)
        return button
    }()
    
//    let screenshotCollectionView: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//
//        let itemSize = (Constant.screenWidth-60)/3
//        flowLayout.itemSize = CGSize(width: itemSize, height: itemSize*2-24)
//        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
//        flowLayout.minimumInteritemSpacing = 0
//
//        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = UIColor.white
//        view.isScrollEnabled = false
//        return view
//    }()
    
    func initView() {
        self.selectionStyle = .none
        
        self.addSubview(appIconImageView)
        appIconImageView.widthAnchor(equalToConstant: 50)
        appIconImageView.heightAnchor(equalToConstant: 50)
        appIconImageView.topAnchor(equalTo: self.topAnchor, constant: 15)
        appIconImageView.leadingAnchor(equalTo: self.leadingAnchor, constant: 15)
        
        self.addSubview(appDownloadButton)
        appDownloadButton.layer.cornerRadius = 15
        appDownloadButton.widthAnchor(equalToConstant: 60)
        appDownloadButton.heightAnchor(equalToConstant: 30)
        appDownloadButton.centerYAnchor(equalTo: appIconImageView.centerYAnchor)
        appDownloadButton.trailingAnchor(equalTo: self.trailingAnchor, constant: -15)
        
        self.addSubview(appTitleLabel)
        appTitleLabel.topAnchor(equalTo: appIconImageView.topAnchor)
        appTitleLabel.leadingAnchor(equalTo: appIconImageView.trailingAnchor, constant: 15)
        appTitleLabel.trailingAnchor(equalTo: appDownloadButton.leadingAnchor, constant: -10)
        appTitleLabel.heightAnchor(equalToConstant: 16)
        
        self.addSubview(appSummaryLabel)
        appSummaryLabel.topAnchor(equalTo: appTitleLabel.bottomAnchor, constant: 5)
        appSummaryLabel.leadingAnchor(equalTo: appIconImageView.trailingAnchor, constant: 15)
        appSummaryLabel.trailingAnchor(equalTo: appDownloadButton.leadingAnchor, constant: -10)
        appSummaryLabel.heightAnchor(equalToConstant: 14)
        
        self.addSubview(appStarValueLabel)
        appStarValueLabel.topAnchor(equalTo: appSummaryLabel.bottomAnchor, constant: 5)
        appStarValueLabel.leadingAnchor(equalTo: appIconImageView.trailingAnchor, constant: 15)
        
        self.addSubview(appValueCountLabel)
        appValueCountLabel.topAnchor(equalTo: appSummaryLabel.bottomAnchor, constant: 5)
        appValueCountLabel.leadingAnchor(equalTo: appStarValueLabel.trailingAnchor, constant: 15)
        
//        self.addSubview(screenshotCollectionView)
//        screenshotCollectionView.topAnchor(equalTo: appIconImageView.bottomAnchor, constant: 15)
//        screenshotCollectionView.leadingAnchor(equalTo: appIconImageView.leadingAnchor)
//        screenshotCollectionView.trailingAnchor(equalTo: appDownloadButton.trailingAnchor)
//        screenshotCollectionView.bottomAnchor(equalTo: self.bottomAnchor, constant: -15)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AppStoreSearchListCell")
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
