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
import RxDataSources

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
    
    
    var search = [String]()
    
//    var mode = Observable.just("RecentlyKeyword")
    var keywordRelay = BehaviorRelay(value: "")
    var searchRelay = BehaviorRelay(value: [String]())
    var searchResultRelay = BehaviorRelay(value: [ITunesSearchAPI]())
    
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
                searchController.dimsBackgroundDuringPresentation = false
                self.navigationItem.searchController = searchController
                self.navigationItem.hidesSearchBarWhenScrolling = false
            })
            .disposed(by: disposeBag)
        
        self.navigationItem.searchController?.searchBar.rx.searchButtonClicked
            .subscribe(onNext: { _ in
                print("clicked")
                if let keyword = self.navigationItem.searchController?.searchBar.text,
                    keyword.isEmpty == false {
                    self.search.append(keyword)
                    self.searchRelay.accept(self.search)
                    self.keywordRelay.accept(keyword)
                }
            })
            .disposed(by: disposeBag)
        
        
//        searchRelay
//            .bind(to: searchView.tableView.rx.items) { (tableView, index, keyword) -> UITableViewCell in
//                let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as? MainCell
//                cell?.label.text = keyword
//                return cell ?? UITableViewCell()
//            }.disposed(by: disposeBag)
        
        searchView.tableView.rx.itemSelected
            .subscribe(onNext: { index in
//                print(self.searchRelay.value[index.row])
            }).disposed(by: disposeBag)
        
        keywordRelay.subscribe(onNext: { keyword in
            self.searchAPI(text: keyword)
        }).disposed(by: disposeBag)
        
        searchResultRelay
            .bind(to: searchView.tableView.rx.items) { (tableView, index, search) -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "AppStoreSearchListCell") as? AppStoreSearchListCell
                cell?.appTitleLabel.text = search.trackCensoredName
                return cell ?? UITableViewCell()
            }.disposed(by: disposeBag)
        
        
        
//        Observable.combineLatest(mode, keywordRelay, searchRelay, searchResultRelay)
//            .subscribe(onNext: { mode, keyword, keywordList, result in
//                
//                print(keyword)
//                print(keywordList)
//            })
//            .disposed(by: disposeBag)
        
        
//        let dataSource = RxTableViewSectionedReloadDataSource<SectionedViewItem>(configureCell: { _, tableView, indexPath, item in
//            
//            if let viewItem = item as? BannerViewItem {
//                guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.Key, for: indexPath) as? BannerCell else { fatalError() }
//                cell.configureBindings(itemSource: viewItem)
//                return cell
//            } else if let viewItem = item as? CarSpecificationViewItem {
//                guard let cell = tableView.dequeueReusableCell(withIdentifier: CarSpecificationCell.Key, for: indexPath) as? CarSpecificationCell else { fatalError() }
//                cell.configureBindings(itemSource: viewItem)
//                return cell
//            } else if let viewItem = item as? CarBenefitViewItem {
//                guard let cell = tableView.dequeueReusableCell(withIdentifier: CarBenefitCell.Key, for: indexPath) as? CarBenefitCell else { fatalError() }
//                cell.configureBindings(itemSource: viewItem)
//                return cell
//            } else if let viewItem = item as? FavoriteHeaderViewItem {
//                guard let cell = tableView.dequeueReusableCell(withIdentifier: CarFavoritesCell.Key, for: indexPath) as? CarFavoritesCell else { fatalError() }
//                cell.configureBindings(itemSource: viewItem)
//                return cell
//            } else {
//                return UITableViewCell()
//            }
//        })
        
        
        
    }
    
    
    func searchAPI(text: String) {
        let request = URLRequest(url: URL(string: "https://itunes.apple.com/search?term=\(text)&country=kr&entity=software")!)
        URLSession.shared.rx.data(request: request)
            .map {
                self.parseData(data: $0)
            }
            .subscribe(onNext: { apiResult in
                self.searchResultRelay.accept(apiResult.results ?? [])
            })
            .disposed(by: self.disposeBag)
    }
    
    func parseData(data: Data) -> APIResult {
        let json = try? JSONDecoder().decode(APIResult.self, from: data)
        return json ?? APIResult(resultCount: 0, results: [])
    }

}

enum ViewType: String {
    case RecentlyKeyword = "RecentlyKeyword"
    case SearchKeyword = "SearchKeyword"
    case SearchApp = "SearchApp"
}
