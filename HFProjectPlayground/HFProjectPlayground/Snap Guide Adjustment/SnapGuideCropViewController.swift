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
    var selectedImage = BehaviorRelay<UIImage>(value: UIImage())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.layout(superView: self.view)
        
        baseView.button.rx.tap
            .subscribe(onNext: { _ in
                self.bindImagePickerViewController()
            })
            .disposed(by: disposeBag)
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
            
            guard let cgImage = image.cgImage else { return }
            let request = self.createCoreMLRequest()
            request.imageCropAndScaleOption = .centerCrop
            
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? handler.perform([request])
        })
        .disposed(by: self.disposeBag)
    }
    
    func createCoreMLRequest() -> VNCoreMLRequest {
        let model = try? VNCoreMLModel(for: DeepLabV3().model)
        let request = VNCoreMLRequest(model: model!) { (request, error) in
            self.processSegmentation(for: request, error: error)
        }
        return request
    }
    
    func processSegmentation(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else { return }
            if let observations = request.results as? [VNCoreMLFeatureValueObservation],
                let segmentationmap = observations.first?.featureValue.multiArrayValue {
                self.baseView.drawingView.segmentationmap = SegmentationResultMLMultiArray(mlMultiArray: segmentationmap)
            }
        }
    }
}

class DrawingSegmentationView: UIView {
    
    static private var colors: [Int32: UIColor] = [:]
    
    func segmentationColor(with index: Int32) -> UIColor {
        if let color = DrawingSegmentationView.colors[index] {
            return color
        } else {
            let color = UIColor(hue: CGFloat(index) / CGFloat(30), saturation: 1, brightness: 1, alpha: 0.5)
            print(index)
            DrawingSegmentationView.colors[index] = color
            return color
        }
    }
    
    var segmentationmap: SegmentationResultMLMultiArray? = nil {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        if let ctx = UIGraphicsGetCurrentContext() {
            
            ctx.clear(rect);
            
            guard let segmentationmap = self.segmentationmap else { return }
            
            let size = self.bounds.size
            let segmentationmapWidthSize = segmentationmap.segmentationmapWidthSize
            let segmentationmapHeightSize = segmentationmap.segmentationmapHeightSize
            let w = size.width / CGFloat(segmentationmapWidthSize)
            let h = size.height / CGFloat(segmentationmapHeightSize)
            
            for j in 0..<segmentationmapHeightSize {
                for i in 0..<segmentationmapWidthSize {
                    let value = segmentationmap[j, i].int32Value

                    let rect: CGRect = CGRect(x: CGFloat(i) * w, y: CGFloat(j) * h, width: w, height: h)

                    let color: UIColor = segmentationColor(with: value)

                    color.setFill()
                    UIRectFill(rect)
                }
            }
        }
    } // end of draw(rect:)
}
