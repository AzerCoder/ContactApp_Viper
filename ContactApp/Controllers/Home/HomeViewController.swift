//
//  HomeViewController.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import UIKit

protocol HomeRequestProtocol{
    func apiPostList()
    func apiPostDelete()
    
    func navigateGreateScreen()
    func navigateEditScreen(contact:Contact)
}
protocol HomeResponseProtocol{
    func onPostList(contact:[Contact])
    func onPostDelete(delete:Bool)
}

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,HomeResponseProtocol{
    @IBOutlet weak var tableView: UITableView!
    var items : Array<Contact> = Array()
    var presenter: HomePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        initView()
    }
    
    func refreshTableView(contact: [Contact]){
        self.items = contact
        self.tableView.reloadData()
    }
    
    func onPostList(contact: [Contact]) {
        self.hideProgres()
        self.refreshTableView(contact: contact)
    }
    
    func onPostDelete(delete: Bool) {
        self.hideProgres()
        presenter.apiPostList()
    }
      
    
    // Mark: - Method
    func initView(){
        initNavigation()
        configurViper()
        presenter.apiPostList()
    }
    
    func initNavigation(){
        let refresh = UIImage(systemName: "arrow.clockwise")
        let add = UIImage(systemName: "person.fill.badge.plus")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: refresh, style: .plain, target: self, action: #selector(leftTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: add, style: .plain, target: self, action: #selector(rightTapped))
        title = "Contacts Viper"
    }
    
    func configurViper(){
        let manager = HttpManager()
        let presenter = HomePresenter()
        let interecter = HomeInterecter()
        let routing = HomeRouting()
        
        presenter.controller = self
        
        self.presenter = presenter
        presenter.interector = interecter
        presenter.routing = routing
        routing.viewController = self
        interecter.manager = manager
        interecter.response = self
        
    }
    
    func callAddViewController(){
        let vc = AddViewController(nibName: "AddViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func callEditViewController(contact: Contact){
        let vc = EditViewController(nibName: "EditViewController", bundle: nil)
        vc.contact = contact
        let nc = UINavigationController(rootViewController: vc)
        self.present(nc, animated: true, completion: nil)
       
    }
    
    // Mark: - Actions
    
    @objc func leftTapped(){
        presenter.apiPostList()
    }
    @objc func rightTapped(){
        callAddViewController()
    }
    
    // Mark: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = (Bundle.main.loadNibNamed("ContactTableViewCell", owner: self,options: nil)?.first as? ContactTableViewCell)!
        cell.nameLabel.text = item.name
        cell.phoneLabel.text = item.phone
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [makeCompliteContextualAction(forRowAt:indexPath,contact: items[indexPath.row])])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [makeDeleteContextualAction(forRowAt:indexPath,contact: items[indexPath.row])])
    }
    
    private func makeDeleteContextualAction(forRowAt indexpath: IndexPath, contact:Contact)->UIContextualAction{
        return UIContextualAction(style: .destructive, title: "Delete") { (action, swipeButtonView,complition) in
            complition(true)
            self.presenter.apiPostDelete(contact: contact)
        }
    }
    
    private func makeCompliteContextualAction(forRowAt indexpath: IndexPath, contact:Contact)->UIContextualAction{
        return UIContextualAction(style: .normal, title: "Edit") { (action, swipeButtonView,complition) in
            complition(true)
            self.callEditViewController(contact: contact)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.apiPostList()
    }
    
}
