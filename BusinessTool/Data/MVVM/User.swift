//
//  User.swift
//  BusinessTool
//
//  Created by Alexander Matrosov on 18.04.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import SwiftUI
import Parse

struct User {
    let username: String
    let email: String
    let avatar: PFFileObject?
    var image: Image = Image("ManPlaceholderAvatar")
}

extension User {
    init(pfUser: PFUser) {
        username = pfUser.username ?? "no value"
        email = pfUser.email ?? "no value"
        avatar = pfUser.value(forKey: "avatar") as? PFFileObject
    }
}
