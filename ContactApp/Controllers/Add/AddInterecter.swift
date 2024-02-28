//
//  AddInterecter.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 28/02/24.
//

import Foundation

protocol AddInterecterProtocol{
    func apiPostGreate(contact:Contact)
}

class AddInterecter:AddInterecterProtocol{
    var manager:HttpManagerProtocol!
    var response:AddResponseProtocol!
    
    func apiPostGreate(contact:Contact) {
        manager.apiPostGreate(contact: contact, complition: {(result) in
            self.response.onPostGreate(contact: result)
        })
    }
    
}
