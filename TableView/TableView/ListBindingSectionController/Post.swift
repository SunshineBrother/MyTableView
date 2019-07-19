//
//  Post.swift
//  test
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class Post: NSObject,ListDiffable {
    let username: String
    let timestamp: String
    let imageURL: URL
    let likes: Int
    let comments: [Comment]
    
    init(username: String, timestamp: String, imageURL: URL, likes: Int, comments: [Comment]) {
        self.username = username
        self.timestamp = timestamp
        self.imageURL = imageURL
        self.likes = likes
        self.comments = comments
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return (username + timestamp) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}
