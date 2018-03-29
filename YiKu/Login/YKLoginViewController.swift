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
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var infoDictionary : Dictionary = [Int:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupButton.layer.borderColor  = UIColor.black.cgColor
        signupButton.layer.cornerRadius = 4
        signupButton.layer.borderWidth  = 1
        usernameTextField.addTarget(self, action: #selector(textFieldValueChanged(_:)), for: .editingChanged)
        pwdTextField.addTarget(self, action: #selector(textFieldValueChanged(_:)), for: .editingChanged)
        
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardTap))
        self.view.addGestureRecognizer(hideTap)
    }
    
    @objc func hideKeyboardTap() {
        self.view.endEditing(true)
    }
    
    @objc func textFieldValueChanged(_ tf:UITextField) {
        infoDictionary.updateValue(tf.text!, forKey: tf.tag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginButtonClick(_ sender: UIButton) {
        hideKeyboardTap()
        let name = infoDictionary[1000]
        let pwd  = infoDictionary[2000]
        
        guard (name != nil), name?.count != 0 else {  return }
        guard (pwd != nil), pwd?.count != 0  else {  return }
        
        AVUser.logInWithUsername(inBackground: name!, password: pwd!) { (user:AVUser?, e:Error?) in
            if e == nil {
                UserDefaults.standard.set(user?.username, forKey: "username")
                UserDefaults.standard.synchronize()
                
                let app : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                app.login()
            } else {
                print(e?.localizedDescription ?? "...")
            }
        }
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
