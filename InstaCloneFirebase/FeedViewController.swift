//
//  FeedViewController.swift
//  InstaCloneFirebase
//
//  Created by Ummugulsum Çekin on 24.11.2022.
//

import UIKit
import Firebase

class FeedViewController : UIViewController , UITableViewDataSource , UITableViewDelegate {
   

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        getDataFromFiresStore()
    }
    
    func getDataFromFiresStore() {
        
        let firesStoreDatabase = Firestore.firestore()
        
        /*let settings = FiresStoreDatabase.settings
        settings.areTimestampsInSnapshotsEnabled = true
        firesStoreDatabase.settings = settings
       */
        
        firesStoreDatabase.collection("Posts").addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
                
            } else {
                
                if snapshot?.isEmpty != true && snapshot != nil {
                  
                    for document in   snapshot!.documents {
                        
                        let documentID = document.documentID
                        print(documentID)
                    }
                }
                
                
            }
        
    }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
        func tableView(_ tableView: UITableView ,cellForRowAtIndexPath indexPath: IndexPath ) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
            
            cell.userEmailLabel.text = "user@email.com"
            cell.likeLabel.text = "0"
            cell.commentLabel.text = "comment"
            cell.userImageView.image = UIImage(named: "select.png")
            
            return cell
        }
    
        
        
    }
 


    }
