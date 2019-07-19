//
//  CommentsSectionController.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class CommentsSectionController: ListSectionController {
    var object: Feed!
    lazy var viewModels: [CommentsModel] = {
        
        return object.comments
    }()
   
    override func didUpdate(to object: Any) {
        self.object = object as? Feed
    }
    
    override func numberOfItems() -> Int {
        return viewModels.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat! = collectionContext?.containerSize(for: self).width
        return CGSize(width: width, height: 30)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "CommentsCell", bundle: nil, for: self, at: index) as? CommentsCell else { fatalError() }
         
        cell.bindViewModel(model: viewModels[index])
        cell.deleteClose = {
            self.collectionContext?.performBatch(animated: true, updates: { (batch) in
                self.viewModels.remove(at: index)
                batch.delete(in: self, at: IndexSet(integer: index))
            }, completion: nil)
        }
        
        return cell
    }
    

}
