//
//  MyIGListKitController.swift
//  TableView
//
//  Created by yunna on 2019/7/17.
//  Copyright © 2019年 yunna. All rights reserved.
//

import UIKit
import IGListKit

class BaseIGListKitController: UIViewController {
    var objects: [ListDiffable] = [ListDiffable]()
    
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
        adapter.collectionView = collectionView
        adapter.dataSource = self
        collectionView.frame = view.bounds
        
    }
  
    
    
}


extension BaseIGListKitController : ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
