//
//  YKUserCenterViewController.swift
//  YiKu
//
//  Created by tyrbl on 2018/4/3.
//  Copyright © 2018年 dangshuai. All rights reserved.
//

import UIKit

class YKUserCenterViewController: UIViewController {
    @IBOutlet weak var nickNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "设置", style: .plain, target: self, action: #selector(buttonSetClick))
        let user : AVUser = AVUser.current()!
        nickNameLabel.text = user.username
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func buttonSetClick() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
