//
//  ImageCell.swift
//  test
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import Kingfisher
import IGListKit
class SecondImageCell: UICollectionViewCell,ListBindable {

    @IBOutlet weak var imageV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? ImageViewModel else { return }
        imageV.kf.setImage(with: viewModel.url)
        
    }
}
