////
////  ViewController.swift
////  test
////
////  Created by yunna on 2019/7/18.
////  Copyright © 2019年 yunna. All rights reserved.
////
//
import UIKit
import IGListKit
class SecondListController: UIViewController,ListAdapterDataSource {
    var data: [ListDiffable] = [ListDiffable]()

    let collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flow)
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        return collectionView
    }()
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        return adapter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.frame = view.bounds

        data.append(Post(
            username: "@janedoe",
            timestamp: "15min",
            imageURL: URL(string: "https://placekitten.com/g/375/250")!,
            likes: 384,
            comments: [
                Comment(username: "@ryan", text: "this is beautiful!"),
                Comment(username: "@jsq", text: "😱"),
                Comment(username: "@caitlin", text: "#blessed"),
                ]
        ))

        adapter.dataSource = self
        adapter.collectionView = self.collectionView
    }

    // MARK: ListAdapterDataSource
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data
    }
    
    func listAdapter(
        _ listAdapter: ListAdapter,
        sectionControllerFor object: Any
        ) -> ListSectionController {
        return PostSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? { return nil }
}

 
