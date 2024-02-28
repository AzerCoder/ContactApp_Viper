//
//  Addpresenter.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 28/02/24.
//

import Foundation

protocol AddPresenterProtocol:AddRequestProtocol{
    func apiPostGreate(contact:Contact)
}

class AddPresenter:AddPresenterProtocol{
    
    var interector: AddInterecterProtocol!
    var routing: AddRoutingProtocol!
    var controller: BaseViewController!
    
    
    func apiPostGreate(contact:Contact) {
        controller.showProgres()
        interector.apiPostGreate(contact: contact)
    }
    
}
