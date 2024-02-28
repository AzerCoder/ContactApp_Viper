//
//  EditViewController.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import UIKit

protocol EditRequestProtocol{
    func apiPostEdit(contact:Contact)
}

protocol EditResponseProtocol{
    func onPostEdit(contact:Contact)
}

class EditViewController: BaseViewController ,EditResponseProtocol{
    
    var presenter: EditPresenterProtocol!
    @IBOutlet weak var nameLb: UITextField!
    @IBOutlet weak var phoneLb: UITextField!
    var contact: Contact?
    var hvc = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = contact {
            nameLb.text = contact.name
            phoneLb.text = contact.phone
        }
        configurViper()
    }
    
    func onPostEdit(contact:Contact) {
        presenter.apiPostEdit(contact: contact)
    }
    
    @IBAction func UpdateButton(_ sender: Any) {
        guard let newName = nameLb.text, let newPhone = phoneLb.text else {
            return
        }
        
        if var contact = contact {
            contact.name = newName
            contact.phone = newPhone
            presenter.apiPostEdit(contact: contact)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func configurViper(){
        
        let manager = HttpManager()
        let presenter = EditPresenter()
        let interecter = EditInterecter()
        let routing = EditRouting()
        
        presenter.controller = self
        
        self.presenter = presenter
        presenter.interector = interecter
        presenter.routing = routing
        routing.viewController = self
        interecter.manager = manager
        interecter.response = self
        
    }
}

