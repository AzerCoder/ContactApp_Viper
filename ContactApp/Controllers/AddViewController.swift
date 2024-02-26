//
//  AddViewController.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import UIKit

class AddViewController: BaseViewController {

    @IBOutlet weak var nameFild: UITextField!
    @IBOutlet weak var phoneFild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButton(_ sender: Any) {
        HomeViewController().apiContactCreate(name: nameFild.text!, phone: phoneFild.text!)
        navigationController?.popViewController(animated: true)
        HomeViewController().apiContactList()
    }

    
}
