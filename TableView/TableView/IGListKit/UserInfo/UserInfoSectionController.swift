//
//  UserInfoSectionController.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit



class UserInfoSectionController: ListSectionController {
   

    var object: Feed!
   
    lazy var viewModel: UserInfoModel = {
        let model = UserInfoModel(avatar: object.avatar, userName: object.userName)
        return model
    }()
   
    ///更新数据
    override func didUpdate(to object: Any) {
        self.object = object as? Feed
    }
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat! = collectionContext?.containerSize(for: self).width
        return CGSize(width: width, height: 50)
    }
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "UserInfoCell", bundle: nil, for: self, at: index) as? UserInfoCell else { fatalError() }
        
        cell.bindViewModel(model: viewModel)
        
        
        return cell
    }
    
    
    
    
}
