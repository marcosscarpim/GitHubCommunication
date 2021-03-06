//
//  SecondViewController.swift
//  GitHubCommunication
//
//  Created by Marcos Vinicios Minucci Scarpim on 09/11/16.
//  Copyright © 2016 marcos.scarpim. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class RepoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    //var to save all users found on search
    var gitRepos = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchPressed(_ sender: Any) {
        
        if(textField.text?.isEmpty == false) {
            //GET request to GIT API
            Alamofire.request("https://api.github.com/search/repositories?q=" + textField.text!).responseJSON { (response) in
                print("Alamofire request returned")
                
                //save response in gitUsers and reload Table data
                if let json = response.result.value {
                    let dict = json as! NSDictionary
                    
                    self.gitRepos = dict.object(forKey: "items") as! NSArray
                    
                    print("Repos count: \(self.gitRepos.count)" )
                    
                    self.tableView.reloadData()
                }
                self.view.endEditing(true)
            }
        }
        
        
        
    }

}


extension RepoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell") as? RepoCell
        
        let dict = gitRepos[indexPath.row] as! NSDictionary
        
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
        return self.gitRepos.count
    }
    
}

