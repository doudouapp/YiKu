//
//  YKHomeViewController.swift
//  YiKu
//
//  Created by tyrbl on 2018/4/3.
//  Copyright © 2018年 dangshuai. All rights reserved.
//

import UIKit

class YKHomeViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource : [YKPostModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "YiKu"
        self.dataSource = Array()
        tableView.register(YKHomeViewCell.self, forCellReuseIdentifier: "YKHomeViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100;
        tableView.rowHeight = UITableViewAutomaticDimension
        let query = AVQuery(className: "Posts");
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (objects: [Any]?, error:Error?) in
            print(objects!)
            let objs :[AVObject] = objects as! [AVObject]
            for obj:AVObject in objs {
                let model = YKPostModel.init()
                model.userName = obj.value(forKey: "username") as! String
                model.content = obj.value(forKey: "content") as! String
                self.dataSource?.append(model)
            }
            self.refreshView()
        }
    }
    
    func refreshView() {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard self.dataSource == nil else {
            return self.dataSource.count
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : YKHomeViewCell  = tableView.dequeueReusableCell(withIdentifier: "YKHomeViewCell", for: indexPath) as! YKHomeViewCell
        let model:YKPostModel = self.dataSource[indexPath.row]
        cell.userName.text = model.userName
        cell.content.text = model.content
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
