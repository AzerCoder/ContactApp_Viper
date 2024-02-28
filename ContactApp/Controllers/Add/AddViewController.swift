//
//  AddViewController.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import UIKit

protocol AddRequestProtocol{
    func apiPostGreate(contact:Contact)
}

protocol AddResponseProtocol{
    func onPostGreate(contact:Contact)
}

class AddViewController: BaseViewController,AddResponseProtocol{
    
    var presenter: AddPresenterProtocol!
    @IBOutlet weak var nameFild: UITextField!
    @IBOutlet weak var phoneFild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurViper()
        // Do any additional setup after loading the view.
    }

    func onPostGreate(contact: Contact) {
        presenter.apiPostGreate(contact: contact)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        presenter.apiPostGreate(contact: Contact(name: nameFild.text!,phone: phoneFild.text!))
        navigationController?.popViewController(animated: true)
       
    }

    func configurViper(){
        
        let manager = HttpManager()
        let presenter = AddPresenter()
        let interecter = AddInterecter()
        let routing = AddRouting()
        
        presenter.controller = self
        
        self.presenter = presenter
        presenter.interector = interecter
        presenter.routing = routing
        routing.viewController = self
        interecter.manager = manager
        interecter.response = self
        
    }
}
