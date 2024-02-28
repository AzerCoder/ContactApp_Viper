//
//  HomePresenter.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 28/02/24.
//

import Foundation

protocol HomePresenterProtocol:HomeRequestProtocol{
    func apiPostList()
    func apiPostDelete(contact:Contact)
    
    func navigateGreateScreen()
    func navigateEditScreen(contact:Contact)
}

class HomePresenter:HomePresenterProtocol{
   
    var interector: HomeInterecterProtocol!
    var routing: HomeRoutingProtocol!
    
    var controller: BaseViewController!
    
    
    func apiPostList() {
        controller.showProgres()
        interector.apiPostList()
    }
    
    func apiPostDelete(contact:Contact) {
        controller.showProgres()
        interector.apiPostDelete(contact: contact)
    }
    
    func navigateGreateScreen() {
        routing.navigateGreateScreen()
    }
    
    func navigateEditScreen(contact:Contact) {
        routing.navigateEditScreen(contact: contact)
    }
    
   
    func apiPostDelete() {
        
    }
    
    func navigateEditScreen() {
        
    }
    
    
    
}
