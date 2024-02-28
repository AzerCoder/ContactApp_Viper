//
//  EditInterecter.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 28/02/24.
//

import Foundation

protocol EditInterecterProtocol{
    func apiPostEdit(contact:Contact)
}

class EditInterecter:EditInterecterProtocol{
    var manager:HttpManagerProtocol!
    var response:EditResponseProtocol!
    
    func apiPostEdit(contact:Contact) {
        manager.apiPostEdit(contact: contact, complition: {(result) in
            self.response.onPostEdit(contact: result)
        })
    }
   
}
