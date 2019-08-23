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

class TableViewController: UIViewController {
    
    let tableView = TableView()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.layout(superView: self.view)
        
        bindUI()
    }
    
    func bindUI() {
        let rxCategories = ["TBD", "TBD", "TBD"]
        
        Observable.of(rxCategories)
            .bind(to: tableView.tableView.rx.items) { (tableView, index, category) -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as? MainCell
                cell?.label.text = category
                return cell ?? UITableViewCell()
            }.disposed(by: disposeBag)
        
        tableView.tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] index in
                print(index)
            }).disposed(by: disposeBag)
        
    }


}

