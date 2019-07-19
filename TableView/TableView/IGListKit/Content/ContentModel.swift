
//
//  ContentModel.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class ContentModel: NSObject {
    var content = "" //内容
    
    init(content:String) {
        self.content = content
    }
    
}

extension ContentModel:ListDiffable{
    func diffIdentifier() -> NSObjectProtocol {
        return "content" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ContentModel else  { return false }
        return content == object.content
    }

}
