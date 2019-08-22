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
    }


}

