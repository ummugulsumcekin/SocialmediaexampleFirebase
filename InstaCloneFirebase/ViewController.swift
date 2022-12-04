//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Ummugulsum Çekin on 23.11.2022.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var paswordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
      
      
    }

    @IBAction func signInClick(_ sender: Any) {
       
        if emailText.text != "" && paswordText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: paswordText.text!) { (authdata,error) in
                
                if error != nil {
                    let alert = UIAlertController(title: "Alert", message: error?.localizedDescription ?? "Error" , preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        switch action.style{
                            case .default:
                            print("default")
                            
                            case .cancel:
                            print("cancel")
                            
                            case .destructive:
                            print("destructive")
                            
                        
                        }
                    }))
                    self.present(alert, animated: true, completion: nil)
                    
               
            }else{
                self.performSegue(withIdentifier: "toFeedVC", sender: nil)
            }
                
            }
            
        }else{
           
            
        }
        
        
    }
    
    @IBAction func signUpClick(_ sender: Any) {
        if emailText.text != "" && paswordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: paswordText.text!) { (authdata, error) in
                
                if error != nil {
                    makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                    
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        }else{
            
        makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
            
        }
        func makeAlert(titleInput:String , messageInput:String){
            let alert = UIAlertController(title: "Error", message: "Username/Pasword", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}

