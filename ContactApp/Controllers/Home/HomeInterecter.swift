//
//  HomeInterecter.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 28/02/24.
//

import Foundation

protocol HomeInterecterProtocol{
    func apiPostList()
    func apiPostDelete(contact:Contact)
}

class HomeInterecter:HomeInterecterProtocol{
    var manager:HttpManagerProtocol!
    var response:HomeResponseProtocol!
    
    func apiPostList() {
        manager.apiPostList(complition: {(result) in
            self.response.onPostList(contact: result)
        })
    }
    
    func apiPostDelete(contact:Contact) {
        manager.apiPostDelete(contact: contact, complition: {(result) in
            self.response.onPostDelete(delete: result)
        })
    }
    
    
}
