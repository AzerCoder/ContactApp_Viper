//
//  HomeRouting.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 28/02/24.
//

import Foundation

protocol HomeRoutingProtocol{
    func navigateGreateScreen()
    func navigateEditScreen(contact:Contact)
}

class HomeRouting:HomeRoutingProtocol{
    weak var viewController : HomeViewController!
    func navigateGreateScreen() {
        viewController.callAddViewController()
    }
    
    func navigateEditScreen(contact:Contact) {
        viewController.callEditViewController(contact: contact)
    }
    
    
}
