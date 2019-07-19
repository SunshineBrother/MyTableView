
//
//  UserModel.swift
//  test
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit

class UserViewModel: NSObject,ListDiffable{
    let username: String
    let timestamp: String
    
    init(username: String, timestamp: String) {
        self.username = username
        self.timestamp = timestamp
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        // 1
        return "MyUserCell" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        // 2
        guard let object = object as? UserViewModel else  { return false }
        return username == object.username
            && timestamp == object.timestamp
    }
}
