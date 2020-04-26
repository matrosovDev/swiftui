//
//  UserService.swift
//  BusinessTool
//
//  Created by Alexander Matrosov on 14.04.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import SwiftUI
import Parse

class UserService: ObservableObject {
    
    enum UserFetchResult {
        case success(data: User)
        case failure
    }
    
    typealias UserServiceResponse = (User?, NSError?) -> Void
    
    @Published var user = User(username: "Test", email: "test@test.com", avatar: nil)
    
    func getUser(with email: String, completion: @escaping (UserFetchResult) -> Void) {
        let findUsers:PFQuery = PFUser.query()!
        findUsers.whereKey("email",  equalTo: email)
        findUsers.findObjectsInBackground { (objects, error) in
            if error == nil {
                guard let firstFoundUser = objects?.first as? PFUser else {
                    print("Get users error")
                    completion(.failure)
                    return
                }
                print(Thread.current.threadName)
                self.user = User(pfUser: firstFoundUser)
                
                self.user.avatar?.getDataInBackground(block: { (data, error) in
                    if error == nil {
                        self.user.image = Image(data: data, placeholder: "ManPlaceholderAvatar")
                    }
                    completion(.success(data: self.user))
                })
            } else {
                print("Get users error")
                completion(.failure)
            }
        }
    }
    
    
}

extension Thread {
    
    var threadName: String {
        if let currentOperationQueue = OperationQueue.current?.name {
            return "OperationQueue: \(currentOperationQueue)"
        } else if let underlyingDispatchQueue = OperationQueue.current?.underlyingQueue?.label {
            return "DispatchQueue: \(underlyingDispatchQueue)"
        } else {
            let name = __dispatch_queue_get_label(nil)
            return String(cString: name, encoding: .utf8) ?? Thread.current.description
        }
    }
}
