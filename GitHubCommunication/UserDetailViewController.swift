//
//  UserDetailViewController.swift
//  GitHubCommunication
//
//  Created by Marcos Vinicios Minucci Scarpim on 10/11/16.
//  Copyright © 2016 marcos.scarpim. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class UserDetailViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var user = NSDictionary()
    
    var userRepos = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: user.object(forKey: "avatar_url") as! String)
        userImageView?.af_setImage(withURL: url!)
        
        userNameLabel.text = user.object(forKey: "login") as? String
        
        //request user repositories
        //GET request to GIT API
        Alamofire.request((user.object(forKey: "repos_url") as? String)!).responseJSON { (response) in
            print("Alamofire request returned")
            
            //save response in gitUsers and reload Table data
            if let json = response.result.value {
                self.userRepos = json as! NSArray
                
                print("Repos count: \(self.userRepos.count)" )
                
                self.tableView.reloadData()
            }
            self.view.endEditing(true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell") as? RepoCell
        
        let dict = userRepos[indexPath.row] as! NSDictionary
        
        //let ownerDict = dict.object(forKey: "owner") as! NSDictionary
        
        //language can be null sometimes
        var language = dict.object(forKey: "language")
        if(language is NSNull) {
            language = "No language"
        }
        
        //cell?.configureCell(dict.object(forKey: "name") as! String!, withScore: dict.object(forKey: "score") as! Int, withOwner: ownerDict.object(forKey: "login") as! String!)
        cell?.configureCell(dict.object(forKey: "name") as! String!,
                            withLanguage: language as! String!,
                            withStarCount: dict.object(forKey: "stargazers_count") as! Int,
                            withForkCount: dict.object(forKey: "forks_count") as! Int)
        
        
        //add border to separate cells
        cell?.contentView.layer.borderColor = UIColor.gray.cgColor
        cell?.contentView.layer.borderWidth = 1.0
        
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userRepos.count
    }
    
}
