//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Ummugulsum Çekin on 23.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var paswordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClick(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    
    @IBAction func signUpClick(_ sender: Any) {
    }
}

