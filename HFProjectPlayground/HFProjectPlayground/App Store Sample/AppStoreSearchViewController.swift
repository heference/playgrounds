//
//  AppStoreSearchViewController.swift
//  HFProjectPlayground
//
//  Created by Heference on 23/08/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AppStoreSearchViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        bindUI()
    }
    
    let navigationBarTitle = "검색"
    let isLargeTitle = true
    
    func bindUI() {
        Observable.just(navigationBarTitle)
            .subscribe(onNext: { title in
                self.title = title
            })
            .disposed(by: disposeBag)
        
        Observable.just(isLargeTitle)
            .subscribe(onNext: { isLargeTitle in
                self.navigationController?.navigationBar.prefersLargeTitles = isLargeTitle
            })
            .disposed(by: disposeBag)
        
        
    }
}
