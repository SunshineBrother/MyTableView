//
//  CommentCell.swift
//  test
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class CommentCell: UICollectionViewCell,ListBindable {
    @IBOutlet weak var CommentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? Comment else { return }
        CommentLabel.text = viewModel.username + " " + viewModel.text
        
    }
}
