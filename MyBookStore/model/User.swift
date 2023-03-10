//
//  User.swift
//  MyBookStore
//
//  Created by Mirzabek on 08/01/23.
//

import Foundation

/// User Struct
struct User {
    
    var uid: String?
    var email:String?
    var displayname:String?
    
    init(uid: String? = nil, email: String? = nil, displayname: String? = nil) {
        self.uid = uid
        self.email = email
        self.displayname = displayname
        
    }
}
