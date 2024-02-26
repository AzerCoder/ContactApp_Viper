//
//  Post.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import Foundation

struct Contact:Decodable{
    var id:String? = ""
    var name:String? = ""
    var phone:String? = ""
    
    init(name: String? = nil, phone: String? = nil) {
        self.name = name
        self.phone = phone
    }
}
