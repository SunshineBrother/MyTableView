//
//  PostSectionController.swift
//  test
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class PostSectionController: ListBindingSectionController<Post>,
ListBindingSectionControllerDataSource {
    
    
    override init() {
        super.init()
        dataSource = self
    }
    
    // MARK: ListBindingSectionControllerDataSource
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        // 1
        guard let object = object as? Post else { fatalError() }
        // 2
        let results: [ListDiffable] = [
            UserViewModel(username: object.username, timestamp: object.timestamp),
            ImageViewModel(url: object.imageURL),
            ActionViewModel(likes: object.likes)
        ]
        // 3
        return results + object.comments
    }
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        // 1
        guard let width = collectionContext?.containerSize.width else { fatalError() }
        // 2
        let height: CGFloat
        switch viewModel {
        case is ImageViewModel: height = 250
        case is Comment: height = 35
        // 3
        default: height = 55
        }
        return CGSize(width: width, height: height)
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        let identifier: String
        
        switch viewModel {
        case is ImageViewModel:
            identifier = "SecondImageCell"
        case is Comment:
            identifier = "CommentCell"
        case is UserViewModel:
            identifier = "UserCell"
        default:
            identifier = "ActionCell"
        }
        
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: identifier, bundle: nil, for: self, at: index) else {
            fatalError()
        }
         
        return cell as! UICollectionViewCell & ListBindable
    }
    
    
    
    
}
