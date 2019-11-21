//
//  SegmentationResultMLMultiArray.swift
//  HFProjectPlayground
//
//  Created by Ikarious on 2019/11/21.
//  Copyright © 2019 sfp. All rights reserved.
//

import CoreML

class SegmentationResultMLMultiArray {
    let mlMultiArray: MLMultiArray
    let segmentationmapWidthSize: Int
    let segmentationmapHeightSize: Int
    
    init(mlMultiArray: MLMultiArray) {
        self.mlMultiArray = mlMultiArray
        self.segmentationmapWidthSize = mlMultiArray.shape[0].intValue
        self.segmentationmapHeightSize = mlMultiArray.shape[1].intValue
    }
    
    subscript(colunmIndex: Int, rowIndex: Int) -> NSNumber {
        let index = colunmIndex*(segmentationmapHeightSize) + rowIndex
        return mlMultiArray[index]
    }
}
