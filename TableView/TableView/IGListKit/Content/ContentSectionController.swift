//
//  ContentSectionController.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class ContentSectionController: ListSectionController {
    var object: Feed!
    var expanded: Bool = false //是否展开
    
    lazy var viewModel: ContentModel = {
        let model = ContentModel(content: object.content ?? "")
        return model
    }()
    
    override func didUpdate(to object: Any) {
        self.object = object as? Feed
    }
    
    override func numberOfItems() -> Int {
        return viewModel.content == "" ? 0 : 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat! = collectionContext?.containerSize(for: self).width
        let height = expanded ? obtainTextHeight(for: viewModel.content as NSString, limitwidth: width) + 10 : 30
        
        return CGSize(width: width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "ContentCell", bundle: nil, for: self, at: index) as? ContentCell else { fatalError() }
        
        cell.bindViewModel(model: viewModel)
        
        return cell
    }
    
    override func didSelectItem(at index: Int) {
        expanded.toggle()
        UIView.performWithoutAnimation {
            self.collectionContext?.invalidateLayout(for: self, completion: nil)
        }
    }
    
   
    
}


func obtainTextHeight(for text: NSString,limitwidth: CGFloat) -> CGFloat {
    let font = UIFont.systemFont(ofSize: 17)
    let size: CGSize = CGSize(width: limitwidth - 20, height: CGFloat.greatestFiniteMagnitude)
    let rect = text.boundingRect(with: size, options: [.usesFontLeading,.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font:font], context: nil)
    return ceil(rect.height)
}
