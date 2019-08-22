//: A UIKit based Playground for presenting user interface

import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

class MyViewController : UIViewController {
    
    var disposeBag = DisposeBag()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        

        let textField = UITextField()
        textField.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        textField.text = "Hello World!"
        textField.textColor = .black
        view.addSubview(textField)
        
        let button = UIButton(frame: CGRect(x: 150, y: 250, width: 200, height: 20))
        button.setTitle("Button", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button)
        
        
        textField.rx.text.asObservable()
            .map {
                print("\($0)")
            }
            .subscribe(onNext: {
                
            }, onCompleted: {
                
            })
            .disposed(by: disposeBag)
        
        button.rx.tap
            .subscribe(onNext: {
                print("tap")
            }, onCompleted: {
                print("onCompleted")
            })
            .disposed(by: disposeBag)
        
        
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
