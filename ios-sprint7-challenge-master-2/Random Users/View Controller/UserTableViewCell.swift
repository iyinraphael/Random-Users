//
//  UserTableViewCell.swift
//  Random Users
//
//  Created by Iyin Raphael on 2/1/19.
//  Copyright © 2019 Erica Sadun. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var user: User?{
        didSet{
            update()
        }
    }
    
    func update(){
        if let user = user {
           let imageData = try? Data(contentsOf: user.pictureSmall)
            userImageView.image = UIImage(data: imageData!)
            nameLabel.text = "\(user.title) \(user.firstName) \(user.lastName)"
        }
    }
}
