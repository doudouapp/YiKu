//
//  YKPublishViewController.swift
//  YiKu
//
//  Created by dangshuai on 2018/6/20.
//  Copyright © 2018年 dangshuai. All rights reserved.
//

import UIKit

class YKPublishViewController: UIViewController {
    @IBOutlet weak var textInput: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "发布"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func pulishAct(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
        print(self.textInput.text)
        let currentUser:AVUser = AVUser.current()!
        let pub = AVObject.init(className: "Posts")
        pub.setObject(self.textInput.text, forKey: "content")
        pub.setObject(currentUser, forKey: "owner")
        pub.setObject(currentUser.username, forKey: "username")
        pub.saveInBackground { (res:Bool, err:Error?) in
            if res {
                print("保存成功")
            }
        }
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
