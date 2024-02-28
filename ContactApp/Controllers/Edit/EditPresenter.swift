//
//  EditPresenter.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 28/02/24.
//

import Foundation

protocol EditPresenterProtocol{
    func apiPostEdit(contact:Contact)
}

class EditPresenter:EditPresenterProtocol{
    
    var interector: EditInterecterProtocol!
    var routing: EditRoutingProtocol!
    var controller: BaseViewController!
    
    func apiPostEdit(contact:Contact) {
        controller.showProgres()
        interector.apiPostEdit(contact: contact)
    }
   
}
