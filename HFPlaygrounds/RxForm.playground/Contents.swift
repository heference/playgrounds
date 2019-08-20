//: A UIKit based Playground for presenting user interface

import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 150, y: 250, width: 200, height: 20))
        button.setTitle("Button", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button)
        
        button.rx.tap
            .map {
                print("tap")
            }.subscribe(onNext: {  in
                <#code#>
            }
        
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
