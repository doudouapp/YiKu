//
//  YKLoginViewController.swift
//  YiKu
//
//  Created by tyrbl on 2018/3/28.
//  Copyright © 2018年 dangshuai. All rights reserved.
//

import UIKit

class YKLoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonClick(_ sender: UIButton) {
    }
    
    @IBAction func signUpButtonClick(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignUp", sender: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}