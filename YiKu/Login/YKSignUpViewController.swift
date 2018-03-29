//
//  YKSignUpViewController.swift
//  YiKu
//
//  Created by tyrbl on 2018/3/28.
//  Copyright © 2018年 dangshuai. All rights reserved.
//

import UIKit

class YKSignUpViewController: UIViewController {

    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var psdText: UITextField!
    
    var infoDictionary : Dictionary = [Int:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameText.addTarget(self, action: #selector(textFieldValueChanged(_:)), for: .editingChanged)
        psdText.addTarget(self, action: #selector(textFieldValueChanged(_:)), for: .editingChanged)

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
    
    @IBAction func cancelButtonClick(_ sender: UIButton) {
        self.dismiss(animated: true,completion: nil)
    }
    
    @IBAction func signupButtonClick(_ sender: UIButton) {
        hideKeyboardTap()
        print(infoDictionary)
        let name = infoDictionary[1000]
        let pwd  = infoDictionary[2000]
        
        guard name?.count != 0 else { showAlert(msg: "填写昵称");   return }
        guard pwd?.count != 0 else { showAlert(msg: "填写密码");   return }
        
        
        let user = AVUser()
        user.password = pwd
        user.username = name
        user.signUpInBackground { (succecss: Bool, error : Error?) in
            if succecss {
                self.showAlert(msg: "注册成功")
                UserDefaults.standard.set(name, forKey: "username")
                UserDefaults.standard.synchronize()
            } else {
                self.showAlert(msg: (error?.localizedDescription)!)
            }
        }
    }
    
    
    func showAlert(msg:String) {
        let alert = UIAlertController(title: "注意", message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
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
