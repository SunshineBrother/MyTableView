//
//  CommentsCell.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit

class CommentsCell: UICollectionViewCell {

    @IBOutlet weak var commtentsLabel: UILabel!
     
     ///删除回调
     var deleteClose:(()->())!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func bindViewModel(model:CommentsModel) {
        let str: String = model.userName + "回复了:" + model.text
        let attr: NSMutableAttributedString = NSMutableAttributedString(string: str)
        let nsrange = NSRange(location: 0, length: model.userName.count)
        attr.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.green], range: nsrange)
        
        commtentsLabel.attributedText = attr
    }
    
    
    
    @IBAction func deleteButtonEvent(_ sender: Any) {
     if self.deleteClose != nil{
          self.deleteClose!()
     }
    }
    
    
}
