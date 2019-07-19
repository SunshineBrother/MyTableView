//
//  TableViewController.swift
//  SwiftToolTest
//
//  Created by yunna on 2018/4/28.
//  Copyright © 2018年 yunna. All rights reserved.
//

/*
 [iOS：如何构建具有多种 Cell 类型的表视图](https://juejin.im/post/5c89a917e51d457efe07f4f9)
 
 [抛弃UITableView,让所有列表页不再难构建](https://juejin.im/post/5bfa5ad8e51d450cb4187ca0#heading-11)
 
 [快速上手 Instagram/IGListKit 框架 (官方 Demo 教程文档翻译整理)](https://learnku.com/articles/24068)
 
 [比 UICollectionView更好用的IGListKit教程](https://blog.csdn.net/kmyhy/article/details/54846390)
 
 */



import UIKit
import SwiftyJSON

class TableViewController: UITableViewController {
    ///数据源
    let dataList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "TableView"
        //获取数据源
        obtainDataSource()
    }
 
    ///获取数据源
    func obtainDataSource() {
        
        let filePath = Bundle.main.path(forResource: "TableView", ofType: "plist")
        let arr = NSArray(contentsOfFile: filePath!)
        let json = JSON(arr ?? []).arrayValue
        for item in json {
            let model = Model()
            model.title = item["Title"].stringValue
            model.className = item["Class"].stringValue
            self.dataList.add(model)
        }
  
        
    }
 

    // MARK: - Table view data source
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        
        let model = self.dataList[indexPath.row] as! Model
        cell?.textLabel?.text = model.title
        
        return cell!
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let model = self.dataList[indexPath.row] as! Model
        let nameSpace = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        guard let cls = NSClassFromString(nameSpace + "." + model.className) as? UIViewController.Type else {
            return
        }
        // 通过得到的class类型创建对象
        let vcClass = cls.init()
        
        vcClass.title = model.title
        self.navigationController?.pushViewController(vcClass, animated: true)
 
    }

}






























