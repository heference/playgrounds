//
//  AppStoreMainViewController.swift
//  HFProjectPlayground
//
//  Created by Heference on 23/08/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AppStoreMainViewController: UITabBarController {
    
    private let disposeBag = DisposeBag()
    
    let controllers = [
        UINavigationController(rootViewController: AppStoreTodayViewController()),
        UINavigationController(rootViewController: AppStoreGameViewController()),
        UINavigationController(rootViewController: AppStoreAppsViewController()),
        UINavigationController(rootViewController: AppStoreArcadeViewController()),
        UINavigationController(rootViewController: AppStoreSearchViewController())
    ]
    
    let tabbars = [
        UITabBarItem(title: "투데이", image: nil, tag: 0),
        UITabBarItem(title: "게임", image: nil, tag: 1),
        UITabBarItem(title: "앱", image: nil, tag: 2),
        UITabBarItem(title: "아케이드", image: nil, tag: 3),
        UITabBarItem(title: "검색", image: nil, tag: 4)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    func bindUI() {
        Observable<[UIViewController]>.just(controllers)
            .bind { viewControllers in
                for (index, controller) in viewControllers.enumerated() {
                    controller.tabBarItem = self.tabbars[index]
                    self.setViewControllers(viewControllers, animated: true)
                }
            }.disposed(by: disposeBag)
    }
}
