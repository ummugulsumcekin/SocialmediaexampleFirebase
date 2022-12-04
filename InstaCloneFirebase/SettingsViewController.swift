//
//  SettingsViewController.swift
//  InstaCloneFirebase
//
//  Created by Ummugulsum Çekin on 24.11.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutClicked(_ sender: Any) {
    performSegue(withIdentifier: "toViewController", sender: nil)
        do
            {
                 try Auth.auth().signOut()
            }
            catch let error as NSError
            {
                print (error.localizedDescription)
            }
          
        
    }
     

}
