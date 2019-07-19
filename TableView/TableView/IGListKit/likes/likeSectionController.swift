//
//  likeSectionController.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class likeSectionController: ListSectionController {
    var object: Feed!
    lazy var viewModel: LikesModel = {
        let model = LikesModel(likes: object.favor, isLike: object.isFavor)
        return model
    }()
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
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "LikeCell", bundle: nil, for: self, at: index) as? LikeCell else { fatalError() }
        
        cell.bindViewModel(model: viewModel)
        
        //点赞回调
        cell.likeClose = {
            let likes = self.viewModel.isLike ? -1 : 1
            self.viewModel.isLike.toggle()
            self.viewModel.likes += likes
            self.collectionContext?.performBatch(animated: true, updates: { (batch) in
                batch.reload(in: self, at: IndexSet(integer: 0))
            }, completion: nil)
        }
        
        return cell
    }
}
