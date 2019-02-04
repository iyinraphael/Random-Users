//
//  UsersTableViewController.swift
//  Random Users
//
//  Created by Iyin Raphael on 2/1/19.
//  Copyright © 2019 Erica Sadun. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {

    var userController = UserController()
    override func viewDidLoad() {
        super.viewDidLoad()
        userController.getPerson { (_) in
            DispatchQueue.main.async {
                 self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userController.users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        let user = userController.users[indexPath.row]
        cell.user = user
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSegue"{
            let detailVC = segue.destination as! UserDetailViewController
            detailVC.userController = userController
        }
    }


}
