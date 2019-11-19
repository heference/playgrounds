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
        // Multiple object detection in static images
        let options = VisionObjectDetectorOptions()
        options.detectorMode = .singleImage
        
//        // Live detection and tracking
//        options.detectorMode = .stream
        options.shouldEnableMultipleObjects = true
        options.shouldEnableClassification = true  // Optional
        
        // Or, to change the default settings:
        let objectDetector = Vision.vision().objectDetector(options: options)
        
        let sampleImage = baseView.imageView.image!
        let newImage = UIImage(cgImage: sampleImage.cgImage!, scale: sampleImage.scale, orientation: .up)
        
        let image = VisionImage(image: newImage)
        
        objectDetector.process(image) { detectedObjects, error in
            guard error == nil else {
                // Error.
                return
            }
            guard let detectedObjects = detectedObjects, !detectedObjects.isEmpty else {
                // No objects detected.
                return
            }
            
            // Success. Get object info here.
            // ...
            // detectedObjects contains one item if multiple object detection wasn't enabled.
//            for obj in detectedObjects {
//
//                let bounds = obj.frame
//                let id = obj.trackingID
//
//                // If classification was enabled:
//                let category = obj.classificationCategory
//                let confidence = obj.confidence
            
                
                //Add Bounding Box
//                let boundingBox = UIView()
//                boundingBox.bounds = bounds
//                boundingBox.backgroundColor = UIColor.clear
//                boundingBox.layer.borderColor = UIColor.red.cgColor
//                boundingBox.layer.borderWidth = 1
//
//                self.baseView.imageView.addSubview(boundingBox)
                
                
//                let boundingBox = CALayer()
//                boundingBox.frame = bounds
//                boundingBox.frame.origin = CGPoint(x: 0, y: 0)
//                boundingBox.borderColor = UIColor.red.cgColor
//                boundingBox.borderWidth = 1
//                boundingBox.masksToBounds = true

//                self.baseView.imageView.layer.addSublayer(boundingBox)
//                print("frame: \(bounds)")
//                print("confidence : \(confidence)")
//            }
            
            let transform = self.transformMatrix()
            
            detectedObjects.forEach { object in
                self.drawFrame(object.frame, in: .green, transform: transform)
                
                let transformedRect = object.frame.applying(transform)
                UIUtilities.addRectangle(
                    transformedRect,
                    to: self.baseView,
                    color: .green
                )
            }
            
        }
    }
    
    private func transformMatrix() -> CGAffineTransform {
        guard let image = baseView.imageView.image else { return CGAffineTransform() }
        let imageViewWidth = baseView.imageView.frame.size.width
        let imageViewHeight = baseView.imageView.frame.size.height
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        
        let imageViewAspectRatio = imageViewWidth / imageViewHeight
        let imageAspectRatio = imageWidth / imageHeight
        let scale = (imageViewAspectRatio > imageAspectRatio) ?
            imageViewHeight / imageHeight :
            imageViewWidth / imageWidth
        
        // Image view's `contentMode` is `scaleAspectFit`, which scales the image to fit the size of the
        // image view by maintaining the aspect ratio. Multiple by `scale` to get image's original size.
        let scaledImageWidth = imageWidth * scale
        let scaledImageHeight = imageHeight * scale
        let xValue = (imageViewWidth - scaledImageWidth) / CGFloat(2.0)
        let yValue = (imageViewHeight - scaledImageHeight) / CGFloat(2.0)
        
        var transform = CGAffineTransform.identity.translatedBy(x: xValue, y: yValue)
        transform = transform.scaledBy(x: scale, y: scale)
        return transform
    }
    
    private func drawFrame(_ frame: CGRect, in color: UIColor, transform: CGAffineTransform) {
        let transformedRect = frame.applying(transform)
        UIUtilities.addRectangle(
            transformedRect,
            to: self.baseView,
            color: color
        )
    }
}
