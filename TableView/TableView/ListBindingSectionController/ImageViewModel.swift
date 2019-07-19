//
//  ImageViewModel.swift
//  test
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class ImageViewModel: NSObject,ListDiffable {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return "image" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ImageViewModel else { return false }
        return url == object.url
    }
}
