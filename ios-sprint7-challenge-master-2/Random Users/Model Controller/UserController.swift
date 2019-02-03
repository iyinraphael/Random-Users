//
//  UserController.swift
//  Random Users
//
//  Created by Iyin Raphael on 2/3/19.
//  Copyright © 2019 Erica Sadun. All rights reserved.
//

import Foundation


class UserController{
    
    let baseURL = URL(string: "https://randomuser.me/api/?format=json&inc=name,email,phone,picture&results=1000")!
    
    typealias CompletionHandler = (Error?) -> Void
    var users = [User]()
    
    func getPerson(completion: @escaping CompletionHandler = {_ in}) {
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error{
                NSLog("Error occured in conneting Api \(error)")
                completion(error)
                return
            }
            guard let data = data else {
                NSLog("Error getting data \(String(describing: error))")
                completion(error)
                return
            }
            
            do{
                self.users = try JSONDecoder().decode(Result.self, from: data).results
                print(self.users)
                completion(nil)
            } catch {
                NSLog("Error Decoding data \(error)")
                completion(error)
            }
        }.resume()
    }
}
