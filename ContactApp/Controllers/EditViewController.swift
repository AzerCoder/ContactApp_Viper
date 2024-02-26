//
//  EditViewController.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import UIKit

class EditViewController: BaseViewController {
    
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
        
    }
    @IBAction func UpdateButton(_ sender: Any) {
        guard let newName = nameLb.text, let newPhone = phoneLb.text else {
            return
        }
        
        if var contact = contact {
            contact.name = newName
            contact.phone = newPhone
            hvc.apiContactUpdate(contact: contact)
        }
        
        dismiss(animated: true, completion: {
            self.hvc.apiContactList()
        })
    }
}

