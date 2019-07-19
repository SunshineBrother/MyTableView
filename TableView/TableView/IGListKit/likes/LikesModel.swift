
//
//  LikesModel.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class LikesModel: NSObject {

    var likes:Int = 0 //点赞数量
    var isLike:Bool = false //我是否点赞
    
    init(likes:Int,isLike:Bool) {
        self.likes = likes
        self.isLike = isLike
    }
    
    
}
extension LikesModel:ListDiffable{
    func diffIdentifier() -> NSObjectProtocol {
        return "Likes" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? LikesModel else  { return false }
        return likes == object.likes
            && isLike == object.isLike
    }
    
}
