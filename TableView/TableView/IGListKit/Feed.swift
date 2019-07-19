
//
//  Feed.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
import SwiftyJSON
class Feed: NSObject {
    var feedId: Int = 0
    var avatar: String = ""
    var userName: String = ""
    var content: String? = ""
    var isFavor: Bool! = false
    var favor: Int = 0
    var images: [String]! = []
    var comments: [CommentsModel] = Array()
    
    func assignmentFeed(item:JSON) {
        feedId = item["feedId"].intValue
        avatar = item["avatar"].stringValue
        userName = item["userName"].stringValue
        content = item["content"].stringValue
        isFavor = item["isFavor"].boolValue
        favor = item["favor"].intValue
        let imageList = item["images"].arrayValue
        for _item in imageList {
            images.append(_item.stringValue)
        }
        let commentList = item["comments"].arrayValue
        for _item in commentList {
            let model = CommentsModel()
            model.userName = _item["person"].stringValue
            model.text = _item["comment"].stringValue
            comments.append(model)
        }
        
    }
    
}

extension Feed: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return feedId as NSObjectProtocol
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? Feed else { return false }
        return feedId == object.feedId
    }
}
