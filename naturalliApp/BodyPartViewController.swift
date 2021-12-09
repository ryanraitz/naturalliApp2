//
//  BodyPartViewController.swift
//  naturalliApp
//
//  Created by Ryan Raitz on 11/27/19.
//  Copyright © 2019 Ryan Raitz. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import Firebase

//View controller for weekly workouts screen
class BodyPartViewController: UIViewController {

    let ref = Database.database().reference(withPath: "maleExercises")
    
    @IBOutlet weak var logoutButtonStyle: UIBarButtonItem!
    
    
    @IBOutlet weak var headNeckButtonStyle: UIButton!
    
    
    @IBOutlet weak var upperMidBackButtonStyle: UIButton!
    
    
    @IBOutlet weak var lowerBackGlutesButtonStyle: UIButton!
    
    
    @IBOutlet weak var chestShouldersButtonStyle: UIButton!
    
    
    @IBOutlet weak var hipsAbsObliquesButtonStyle: UIButton!
    
    
    @IBOutlet weak var upperLowerLegsButtonStyle: UIButton!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBAction func logoutButton(_ sender: UIButton) {
        
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
               
                //switching to login screen
               let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewcontroller") as! LoginViewController
               self.navigationController?.pushViewController(loginViewController, animated: true)
               self.dismiss(animated: false, completion: nil)
    
    }
    
    
    @IBAction func headNeckButton(_ sender: Any) {
        
        
        let tempViewController = self.storyboard?.instantiateViewController(withIdentifier: "Viewcontroller") as! ViewController
        tempViewController.title = "Head/Neck"
        tempViewController.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemTeal]
        self.navigationController?.pushViewController(tempViewController, animated: true)
        
        self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func upperMidBackButton(_ sender: Any) {
        
        let tempViewController = self.storyboard?.instantiateViewController(withIdentifier: "Viewcontroller") as! ViewController
        tempViewController.title = "Upper Back/Mid Back"
        self.navigationController?.pushViewController(tempViewController, animated: true)
        
        self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func lowerBackGlutesButton(_ sender: Any) {
        
        let tempViewController = self.storyboard?.instantiateViewController(withIdentifier: "Viewcontroller") as! ViewController
        tempViewController.title = "Lower Back/Glutes"
        self.navigationController?.pushViewController(tempViewController, animated: true)
        
        self.dismiss(animated: false, completion: nil)
        
    }
    
    
    @IBAction func chestShouldersButton(_ sender: Any) {
        
        let tempViewController = self.storyboard?.instantiateViewController(withIdentifier: "Viewcontroller") as! ViewController
        tempViewController.title = "Chest/Shoulders"
        self.navigationController?.pushViewController(tempViewController, animated: true)
        
        self.dismiss(animated: false, completion: nil)
        
    }
    
    
    @IBAction func hipsAbsObliquesButton(_ sender: Any) {
        
        let tempViewController = self.storyboard?.instantiateViewController(withIdentifier: "Viewcontroller") as! ViewController
        tempViewController.title = "Hips/Abs/Obliques"
        self.navigationController?.pushViewController(tempViewController, animated: true)
        
        self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func upperLowerLegsButton(_ sender: Any) {
        
        let tempViewController = self.storyboard?.instantiateViewController(withIdentifier: "Viewcontroller") as! ViewController
        tempViewController.title = "Upper/Lower Legs"
        self.navigationController?.pushViewController(tempViewController, animated: true)
        
        self.dismiss(animated: false, completion: nil)
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        titleLabel.layer.shadowColor = UIColor.black.cgColor
        titleLabel.layer.shadowOffset = CGSize(width: 0, height: 10)
        titleLabel.layer.shadowRadius = 10
        titleLabel.layer.shadowOpacity = 1.0
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        
        if let name = Auth.auth().currentUser?.displayName
        {
            //setting the name to label
            let backButton = UIBarButtonItem(title: "Hey " + name + "!", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
            
             
            navigationItem.leftBarButtonItem = backButton
            //navBar.title = "Hello " + name + "!"
        }
        else
        {
            let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
            navigationItem.leftBarButtonItem = backButton
        }
    }
}
