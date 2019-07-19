//
//  UserInfoCell.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import Kingfisher
class UserInfoCell: UICollectionViewCell {

    @IBOutlet weak var headView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    ///点击箭头回调
    var clickClose:(()->())!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindViewModel(model:UserInfoModel) {
        userNameLabel.text = model.userName
        headView.image = UIImage.init(named: model.avatar)
    }
    
    @IBAction func onClickArrowEvent(_ sender: Any) {
        if self.clickClose != nil{
            self.clickClose!()
        }
    }
    
    
}
