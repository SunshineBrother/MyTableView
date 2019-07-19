//
//  ActionCell.swift
//  test
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit
class ActionCell: UICollectionViewCell,ListBindable {

    @IBOutlet weak var numberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? ActionViewModel else { return }
        numberLabel.text = "\(viewModel.likes)"
        
    }
    
    @IBAction func actionEvent(_ sender: Any) {
    }
}
