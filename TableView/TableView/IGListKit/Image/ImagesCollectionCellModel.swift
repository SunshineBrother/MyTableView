//
//  ImagesCollectionCellModel.swift
//  IGListKitDemoSwift
//
//  Created by gxy on 2018/10/6.
//  Copyright © 2018年 bruce. All rights reserved.
//

import UIKit
import IGListKit

class ImagesCollectionCellModel: NSObject {
      var images: [String] = []
    
}

extension ImagesCollectionCellModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return "images" as NSObjectProtocol
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ImagesCollectionCellModel else  { return false }
        return images == object.images
    }
}
