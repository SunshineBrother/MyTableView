//
//  ActionViewModel.swift
//  test
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit

class ActionViewModel: NSObject,ListDiffable {
    let likes: Int
    
    init(likes: Int) {
        self.likes = likes
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return "action" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ActionViewModel else { return false }
        return likes == object.likes
    }
}
