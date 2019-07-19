//
//  ContentCell.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentLabel.numberOfLines = 0
    }

    
    func bindViewModel(model:ContentModel) {
         contentLabel.text = model.content
    }
    
    
    
    
    
    
}
