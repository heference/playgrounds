//
//  ViewController.swift
//  HFProjectPlayground
//
//  Created by Heference on 22/08/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    let mainView = MainView()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.layout(superView: self.view)
        
        bindUI()
    }
    
    func bindUI() {
        let rxCategories = ["UITableView RxSwift",
                            "Form RxSwift",
                            "UICollectionView RxSwift",
                            "App Store Sample",
                            "Infinite Page View Controller"
                            ]
        
        Observable.of(rxCategories)
            .bind(to: mainView.tableView.rx.items) { (tableView, index, category) -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as? MainCell
                cell?.label.text = category
                return cell ?? UITableViewCell()
            }.disposed(by: disposeBag)
        
        mainView.tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] index in
                if index.row == 0 {
                    print(index)
                } else if index.row == 1 {
                    print(index)
                } else if index.row == 2 {
                    print(index)
                } else if index.row == 3 {
                    UIApplication.shared.keyWindow?.rootViewController = AppStoreMainViewController()
                } else if index.row == 4 {
                    UIApplication.shared.keyWindow?.rootViewController = InfinitePageViewController()
                }
            }).disposed(by: disposeBag)
        
    }


}

