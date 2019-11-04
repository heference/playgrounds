//
//  SnapGuideResultViewController.swift
//  HFProjectPlayground
//
//  Created by Ikarious on 02/09/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit

class SnapGuideResultViewController: UIViewController {
    
    let baseView = SnapGuideResultView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseView.layout(superView: self.view)
    }
}
