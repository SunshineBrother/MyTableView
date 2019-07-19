//
//  LikeCell.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit

class LikeCell: UICollectionViewCell {

    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var likeNumberLabel: UILabel!
    ///点赞回调
    var likeClose:(()->())!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindViewModel(model:LikesModel) {
        let like = model.isLike ? "like" : "Nolike"
        likeBtn.setImage(UIImage.init(named: like), for: .normal)
        likeNumberLabel.text = "\(model.likes)个👍"
    }
    
    @IBAction func likeButtonEvent(_ sender: Any) {
        if self.likeClose != nil{
            self.likeClose!()
        }
    }
    
    
    
}
