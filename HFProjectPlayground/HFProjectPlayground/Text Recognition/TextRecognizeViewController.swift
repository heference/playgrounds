//
//  TextRecognizeViewController.swift
//  HFProjectPlayground
//
//  Created by Ikarious on 2019/11/19.
//  Copyright © 2019 sfp. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class TextRecognizeViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    var selectedImage = PublishRelay<UIImage>()
    
    let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let textImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = UIView.ContentMode.scaleAspectFit
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let selectButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SELECT IMAGE", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(baseView)
        baseView.topAnchor(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        baseView.leadingAnchor(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        baseView.trailingAnchor(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        baseView.bottomAnchor(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        
        self.baseView.addSubview(textImageView)
        textImageView.centerXAnchor(equalTo: baseView.centerXAnchor)
        textImageView.widthAnchor(equalToConstant: 250)
        textImageView.heightAnchor(equalToConstant: 250)
        textImageView.topAnchor(equalTo: baseView.topAnchor, constant: 30)
        
        self.baseView.addSubview(selectButton)
        selectButton.heightAnchor(equalToConstant: 50)
        selectButton.leadingAnchor(equalTo: baseView.leadingAnchor, constant: 15)
        selectButton.trailingAnchor(equalTo: baseView.trailingAnchor, constant: -15)
        selectButton.bottomAnchor(equalTo: baseView.bottomAnchor, constant: -15)
        
        selectButton.rx.tap.subscribe(onNext: { _ in
//                self.bindImagePickerViewController()
            }).disposed(by: disposeBag)
        
        selectedImage.subscribe(onNext: { image in
                self.textImageView.image = image
            }).disposed(by: disposeBag)
    }
    
    func bindImagePickerViewController() {
        UIImagePickerController.rx.createWithParent(self) { picker in
            picker.sourceType = .photoLibrary
            picker.allowsEditing = false
        }
        .subscribeOn(MainScheduler.instance)
        .flatMap{ $0.rx.didFinishPickingMediaWithInfo }
        .take(1)
        .map { info in
            return info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage
        }.subscribe(onNext: { image in
            self.selectedImage.accept(image)
            
        })
        .disposed(by: self.disposeBag)
    }
}
