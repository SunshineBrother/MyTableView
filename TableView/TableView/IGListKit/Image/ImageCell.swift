//
//  ImageCell.swift
//  IGListKitDemoSwift
//
//  Created by gxy on 2018/10/6.
//  Copyright © 2018年 bruce. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindViewModel(imageName:String) {
        var bgColor = UIColor.gray
        
        switch imageName {
        case "red":
            bgColor = UIColor.red
        case "blue":
            bgColor = UIColor.blue
        case "yellow":
            bgColor = UIColor.yellow
        case "green":
            bgColor = UIColor.green
        default:
            bgColor = UIColor.gray
        }
        
        imageView.backgroundColor = bgColor
        
    }
    
}
