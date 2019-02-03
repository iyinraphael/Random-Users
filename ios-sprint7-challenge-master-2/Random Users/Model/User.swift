//
//  User.swift
//  Random Users
//
//  Created by Iyin Raphael on 2/1/19.
//  Copyright © 2019 Erica Sadun. All rights reserved.
//

import Foundation


struct User: Decodable {
    
    let title: String
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    let pictureLarge: URL
    let pictureSmall: URL
    
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case phone
        case picture
        
        enum forName: String, CodingKey {
            case title
            case first
            case last
        }
        
        enum forPicture: String, CodingKey {
            case large
            case thumbnail
        }
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        email = try container.decode(String.self, forKey: .email)
        phone = try container.decode(String.self, forKey: .phone)
        
        let containerName = try container.nestedContainer(keyedBy: CodingKeys.forName.self, forKey: .name)
        title = try containerName.decode(String.self, forKey: .title)
        firstName = try containerName.decode(String.self, forKey: .first)
        lastName = try containerName.decode(String.self, forKey: .last)
        
        let containerPicture = try container.nestedContainer(keyedBy: CodingKeys.forPicture.self, forKey: .picture)
        pictureLarge = URL(string: try containerPicture.decode(String.self, forKey: .large))!
        pictureSmall = URL(string: try containerPicture.decode(String.self, forKey: .thumbnail))!
    }
    
    
}

struct Result{
    let result: [User]
}
