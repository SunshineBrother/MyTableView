//
//  UserCell.swift
//  test
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class UserCell: UICollectionViewCell,ListBindable {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? UserViewModel else { return }
        userNameLabel.text = viewModel.username
        timeLabel.text = viewModel.timestamp
    }

}
