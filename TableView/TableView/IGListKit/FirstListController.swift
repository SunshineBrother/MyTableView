//
//  FirstListController.swift
//  TableView
//
//  Created by yunna on 2019/7/18.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import SwiftyJSON
import IGListKit
class FirstListController: BaseIGListKitController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    ///加载数据
    func loadData() {
        let url = Bundle.main.path(forResource: "IGListKit", ofType: "json")
        let data = NSData.init(contentsOfFile: url!)
        let json:NSArray = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        let jsonArr = JSON(json).arrayValue
        for item in jsonArr {
            let feed = Feed()
            feed.assignmentFeed(item: item)
            objects.append(feed)
        }
        adapter.performUpdates(animated: true, completion: nil)
    }
    
     
    override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let userInfo = UserInfoSectionController()
        let Content = ContentSectionController()
        let Image = ImageSectionController()
        let like = likeSectionController()
        let Comments = CommentsSectionController()
        
        let stack = ListStackedSectionController(sectionControllers: [
            userInfo,
            Content,
            Image,
            like,
            Comments
            ])
        
        stack.inset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        return stack
    }
}
