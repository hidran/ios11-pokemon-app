//
//  SignUpCtrlViewController.swift
//  testfirebase
//
//  Created by Hidran Arias on 23/04/18.
//  Copyright © 2018 Hidran Arias. All rights reserved.
//

import UIKit
import Firebase
class SignUpCtrlViewController: UIViewController {

    @IBOutlet weak var emailfld: UITextField!
    @IBOutlet weak var passwordfld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didSignup(_ sender: UIButton) {
        
        guard let email = emailfld.text, !email.isEmpty,
            let password = passwordfld.text, !password.isEmpty
            else {
                return
            }
        Auth.auth().createUser(withEmail: email, password: password) {
            (user, err) in
            if err != nil {
                
               let alert = UIAlertController(title: "Error", message: err!.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print(err!.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "goToDoList", sender: nil)
                
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
