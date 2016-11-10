//
//  UserViewController.swift
//  GitHubCommunication
//
//  Created by Marcos Vinicios Minucci Scarpim on 09/11/16.
//  Copyright © 2016 marcos.scarpim. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class UserViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //var to save all users found on search
    var gitUsers = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        
        //GET request to GIT API
        Alamofire.request("https://api.github.com/search/users?q=" + textField.text!).responseJSON { (response) in
            print("Alamofire request returned")
            
            //save response in gitUsers and reload Table data
            if let json = response.result.value {
                let dict = json as! NSDictionary
                
                self.gitUsers = dict.object(forKey: "items") as! NSArray
                
                print("Users count: \(self.gitUsers.count)" )
                
                self.tableView.reloadData()
            }
            
            self.view.endEditing(true)
        }
        
    }
    
}

extension UserViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell
        
        let dict = gitUsers[indexPath.row] as! NSDictionary
        
        cell?.configureCell(dict.object(forKey: "login") as! String!, withScore: dict.object(forKey: "score") as! Int)
        
        //this code should be inside UserCell. But pod is not working properly in obj-c file!
        let url = URL(string: dict.object(forKey: "avatar_url") as! String)
        cell?.userImageView?.af_setImage(withURL: url!)
        
        cell?.contentView.layer.borderColor = UIColor.black.cgColor
        cell?.contentView.layer.borderWidth = 1.0
        
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gitUsers.count
    }
    
}
