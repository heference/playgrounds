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
    
    var searchKeyword: Observable<String>?
    var searchResult: Observable<[String]> = Observable.just(["facebook", "instagram"])
    
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
        
        searchView.tableView.rx.itemSelected
            .subscribe(onNext: { index in
                
            }).disposed(by: disposeBag)
        
        
        searchKeyword = self.navigationItem.searchController?.searchBar.rx.text.orEmpty
            .throttle(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)
        
        self.navigationItem.searchController?.searchBar.rx.searchButtonClicked
            .subscribe(onNext: { _ in
                print("clicked")
//                searchKeyword = self.navigationItem.searchController?.searchBar.rx.text.orEmpty
            })
            .disposed(by: disposeBag)
        
        
        searchKeyword?.asObservable()
            .subscribe(onNext: { keyword in
                print(keyword)
            }, onCompleted: {
                print("onCompleted")
            })
            .disposed(by: disposeBag)
        
        
        
        searchResult
            .bind(to: searchView.tableView.rx.items) { (tableView, index, category) -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as? MainCell
                cell?.label.text = category
                return cell ?? UITableViewCell()
            }.disposed(by: disposeBag)

        
        
        
        
        
        let keyword = "etners"
        let request = URLRequest(url: URL(string: "https://itunes.apple.com/search?term=\(keyword)&country=kr&entity=software")!)
        URLSession.shared.rx.data(request: request)
            .subscribe(onNext: { data in
                do {
                    let json = try JSONDecoder().decode(APIResult.self, from: data)
                    print(json)
                } catch let error {
                    print(error)
                }
            }, onError: { error in
                print(error)
            }, onCompleted: {
                print("onCompleted")
            })
            .disposed(by: disposeBag)
        
        
    }

}
