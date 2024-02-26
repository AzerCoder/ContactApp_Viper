//
//  BaseViewController.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import UIKit
import JGProgressHUD

class BaseViewController: UIViewController {
    
    let hud = JGProgressHUD()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func appDelegate()-> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func sceneDelegate()-> SceneDelegate{
        return ((UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate))
    }

    func showProgres(){
        if !hud.isVisible{
            hud.textLabel.text = "Loading"
            hud.show(in: self.view)
        }
    }
    
    func hideProgres(){
        if hud.isVisible{
           hud.dismiss()
        }
    }
}
