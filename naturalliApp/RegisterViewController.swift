//
//  RegisterViewController.swift
//  fitnessApp
//
//  Created by Ryan Raitz on 10/25/19.
//  Copyright © 2019 Ryan Raitz. All rights reserved.
//

import Alamofire
import UIKit
import Firebase
 
class RegisterViewController: UIViewController {
 
    //Defined a constant that holds the URL for our web service
    let URL_USER_REGISTER = "http://localhost/FitnessApp-2/api/register.php"
    
    //View variables
    
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    
    //Button action
    @IBAction func buttonRegister(_ sender: UIButton) {
    
        Auth.auth().createUser(withEmail: textFieldUsername.text!, password: textFieldPassword.text!)
        { (user, error) in
            if error == nil
            {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                
                changeRequest?.displayName = self.textFieldName.text!
                changeRequest?.commitChanges { (error) in
                      // ...
                }
                
                  let tempViewController = self.storyboard?.instantiateViewController(withIdentifier: "BodyPartViewcontroller") as! BodyPartViewController
                  //tempViewController.title = "Welcome"
                  self.navigationController?.pushViewController(tempViewController, animated: true)
                  
                  self.dismiss(animated: false, completion: nil)
                
            }
            else
            {
                  //error message in case of invalid credential
                  self.labelMessage.text = "error"
                
            }
            
        }
    
    }
    
    override func viewDidLoad() {
        
          super.viewDidLoad()
          
          //Title label styling
          labelTitle.layer.shadowColor = UIColor.black.cgColor
          labelTitle.layer.shadowOffset = CGSize(width: 10, height: 10)
          labelTitle.layer.shadowRadius = 10
          labelTitle.layer.shadowOpacity = 1.0
          
          //Navigation bar styling
          self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemTeal]
          self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
          self.navigationController?.navigationBar.shadowImage = UIImage()
          self.navigationController?.navigationBar.isTranslucent = true
          self.navigationController?.navigationBar.barTintColor = UIColor.systemTeal
          self.navigationController?.view.backgroundColor = .clear
          
          //Email text field styling
          let bottomLine1 = CALayer()
          bottomLine1.frame = CGRect(x: 0, y: textFieldUsername.frame.height-2, width: textFieldUsername.frame.width, height: 2)
          bottomLine1.backgroundColor = UIColor.white.cgColor
          textFieldUsername.borderStyle = .none
          textFieldUsername.layer.addSublayer(bottomLine1)
          self.textFieldUsername.attributedPlaceholder = NSAttributedString(string: "Enter Email Address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
          
          //Password text field styling
          let bottomLine2 = CALayer()
          bottomLine2.frame = CGRect(x: 0, y: textFieldPassword.frame.height-2, width: textFieldPassword.frame.width, height: 2)
          bottomLine2.backgroundColor = UIColor.white.cgColor
          textFieldPassword.borderStyle = .none
          textFieldPassword.layer.addSublayer(bottomLine2)
          self.textFieldPassword.attributedPlaceholder = NSAttributedString(string: "Enter Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
          //Name text field styling
          let bottomLine4 = CALayer()
          bottomLine4.frame = CGRect(x: 0, y: textFieldName.frame.height-2, width: textFieldName.frame.width, height: 2)
          bottomLine4.backgroundColor = UIColor.white.cgColor
          textFieldName.borderStyle = .none
          textFieldName.layer.addSublayer(bottomLine4)
          self.textFieldName.attributedPlaceholder = NSAttributedString(string: "Enter First Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
          //Sign up button styling
          registerButton.layer.cornerRadius = 5
          registerButton.layer.shadowColor = UIColor.black.cgColor
          registerButton.layer.shadowOffset = CGSize(width: 5, height: 5)
          registerButton.layer.shadowRadius = 10
          registerButton.layer.shadowOpacity = 1.0
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
 
}
