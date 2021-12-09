//
//  loginViewController.swift
//  fitnessApp
//
//  Created by Ryan Raitz on 10/24/19.
//  Copyright © 2019 Ryan Raitz. All rights reserved.
//

import UIKit
import Alamofire
import Firebase
 
class LoginViewController: UIViewController {
 
    //The login script url make sure to write the ip instead of localhost
    //you can get the ip using ifconfig command in terminal
    let URL_USER_LOGIN = "http://localhost/FitnessApp-2/api/login.php"
    
    //the defaultvalues to store user data
    let defaultValues = UserDefaults.standard
    
    //the connected views
    //don't copy instead connect the views using assistant editor
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBOutlet weak var textFieldUserName: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    //the button action function
    @IBOutlet weak var signUpButton: UIButton!
    
        //Login button action method
        @IBAction func buttonLogin(_ sender: UIButton)
        {
        
            Auth.auth().signIn(withEmail: textFieldUserName.text!, password: textFieldPassword.text!)
            { (user, error) in
               
                //Successful login
                if error == nil
                {
                     //set default value to register if user has previously logged in
                     self.defaultValues.set(true, forKey: "usersignedin")
                     self.defaultValues.synchronize()
                     //migrate views to WeekViewController
                     let tempViewController = self.storyboard?.instantiateViewController(withIdentifier: "BodyPartViewcontroller") as! BodyPartViewController
                         self.navigationController?.pushViewController(tempViewController, animated: true)
                         
                         self.dismiss(animated: false, completion: nil)
                 }
                //Failed login
                else
                {
                         //error message in case of invalid credential
                         self.labelMessage.text = "Invalid username or password"
                }
            }
        }

                
        //Sign up button action method
        @IBAction func buttonSignUp(_ sender: UIButton)
        {
            //Reroute to sign up page
            let tempViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewcontroller") as! RegisterViewController
            self.navigationController?.pushViewController(tempViewController, animated: true)
            
            self.dismiss(animated: false, completion: nil)
            
        }
        
                
        override func viewDidLoad() {
            
            super.viewDidLoad()
            
            //Hide the navigation button
            let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
            navigationItem.leftBarButtonItem = backButton
            
            //Title label styling
            labelTitle.layer.shadowColor = UIColor.black.cgColor
            labelTitle.layer.shadowOffset = CGSize(width: 10, height: 10)
            labelTitle.layer.shadowRadius = 10
            labelTitle.layer.shadowOpacity = 1.0
            
            //Navigation bar styling
            self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemBlue]
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.view.backgroundColor = .clear
            
            //Email text field styling
            let bottomLine1 = CALayer()
            bottomLine1.frame = CGRect(x: 0, y: textFieldUserName.frame.height-2, width: textFieldUserName.frame.width, height: 2)
            bottomLine1.backgroundColor = UIColor.white.cgColor
            textFieldUserName.borderStyle = .none
            textFieldUserName.layer.addSublayer(bottomLine1)
            self.textFieldUserName.attributedPlaceholder = NSAttributedString(string: "Enter Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            //Password text field styling
            let bottomLine2 = CALayer()
            bottomLine2.frame = CGRect(x: 0, y: textFieldPassword.frame.height-2, width: textFieldPassword.frame.width, height: 2)
            bottomLine2.backgroundColor = UIColor.white.cgColor
            textFieldPassword.borderStyle = .none
            textFieldPassword.layer.addSublayer(bottomLine2)
            self.textFieldPassword.attributedPlaceholder = NSAttributedString(string: "Enter Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            //If the user is already logged in
            if defaultValues.bool(forKey: "usersignedin")
            {
                let tempViewController = self.storyboard?.instantiateViewController(withIdentifier: "BodyPartViewcontroller") as! BodyPartViewController
                self.navigationController?.pushViewController(tempViewController, animated: true)
            }
            
        }
             
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
     
    }
