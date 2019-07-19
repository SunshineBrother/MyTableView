//
//  Comment.swift
//  test
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class Comment: NSObject,ListDiffable {
    
    let username: String
    let text: String
    
    init(username: String, text: String) {
        self.username = username
        self.text = text
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return "comment" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}
