//
//  UserDetailViewController.swift
//  Random Users
//
//  Created by Iyin Raphael on 2/1/19.
//  Copyright © 2019 Erica Sadun. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    var user: User?{
        didSet{
            update()
        }
    }
    
    func update(){
        guard isViewLoaded else {return}
        if let user = user{
            let imageData = try? Data(contentsOf: user.pictureLarge)
            userImageView.image = UIImage(data: imageData!)
            nameLabel.text = "\(user.title) \(user.firstName) \(user.lastName)"
            phoneLabel.text = user.phone
            emailLabel.text = user.email
        }
    }
    
   var userController = UserController()
   
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
}
