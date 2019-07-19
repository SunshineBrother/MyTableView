//
//  CommentsModel.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class CommentsModel: NSObject {
    var userName = ""   //评论人
    var text = ""       //评论内容
    
}

extension CommentsModel:ListDiffable{
    func diffIdentifier() -> NSObjectProtocol {
        return "Comments" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CommentsModel else  { return false }
        return text == object.text
            && userName == object.userName
    }
    
}
