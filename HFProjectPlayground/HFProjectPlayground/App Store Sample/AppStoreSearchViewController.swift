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
    let searchView = AppStoreSearchMainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.layout(superView: self.view)
        bindUI()
    }
    
    let navigationBarTitle = "검색"
    let isLargeTitle = true
    
    let keywordList = [
        "facebook",
        "instagram"
    ]
    
    func bindUI() {
        Observable.just(navigationBarTitle)
            .subscribe(onNext: { title in
                self.title = title
            })
            .disposed(by: disposeBag)
        
        Observable.just(isLargeTitle)
            .subscribe(onNext: { isLargeTitle in
                self.navigationController?.navigationBar.prefersLargeTitles = isLargeTitle
                let searchController = UISearchController(searchResultsController: nil)
                self.navigationItem.searchController = searchController
                self.navigationItem.hidesSearchBarWhenScrolling = false
            })
            .disposed(by: disposeBag)
        
        Observable.just(keywordList)
            .bind(to: searchView.tableView.rx.items) { (tableView, index, category) -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as? MainCell
                cell?.label.text = category
                return cell ?? UITableViewCell()
            }.disposed(by: disposeBag)
        
        searchView.tableView.rx.itemSelected
            .subscribe(onNext: { index in
                print(self.keywordList[index.row])
            }).disposed(by: disposeBag)
    }
}
