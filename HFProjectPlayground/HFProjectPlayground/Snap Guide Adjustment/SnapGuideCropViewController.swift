//
//  SnapGuideCropViewController.swift
//  HFProjectPlayground
//
//  Created by Ikarious on 02/09/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Vision
import Firebase

class SnapGuideCropViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    let baseView = SnapGuideCropView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.layout(superView: self.view)
        
        baseView.button.rx.tap
            //Map Snap Crop Logic....
            //Subscribe Image Bind And Navigating
            .subscribe(onNext: { _ in
                self.crop()
//                self.navigationController?.pushViewController(SnapGuideResultViewController(), animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    func crop() {
        
        guard let cgImage = baseView.imageView.image?.cgImage! else { return }
        let imageRequestHandler = VNImageRequestHandler(cgImage: cgImage,
                                                        orientation: .up,
                                                        options: [:])
        let imageViewBoudingBox = baseView.imageView.bounds
        let request =
        VNTrackObjectRequest(detectedObjectObservation: VNDetectedObjectObservation(boundingBox: imageViewBoudingBox)) { (request, error) in
            DispatchQueue.main.async {
                guard let results = request.results as? [VNDetectedObjectObservation] else {
                        return
                }
                
                for observation in results {
                    print(observation.boundingBox)
                    
                }
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try imageRequestHandler.perform([request])
            } catch let error as NSError {
                print("Failed to perform image request: \(error)")
                return
            }
        }
    }
    
    
}
