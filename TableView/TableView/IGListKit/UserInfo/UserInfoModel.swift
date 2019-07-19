//
//  UserInfoModel.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class UserInfoModel: NSObject {
    var avatar = "" //头像
    var userName = "" //用户名
    init(avatar:String,userName:String) {
        self.avatar = avatar
        self.userName = userName
    }
    
}

extension UserInfoModel:ListDiffable{
    func diffIdentifier() -> NSObjectProtocol {
        return "UserInfo" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? UserInfoModel else  { return false }
        return avatar == object.avatar
            && userName == object.userName
    }
    
    
}



