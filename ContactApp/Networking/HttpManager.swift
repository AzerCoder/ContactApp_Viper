//
//  HttpManager.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 28/02/24.
//

import Foundation

protocol HttpManagerProtocol{
    func apiPostList(complition: @escaping ([Contact])->Void)
    func apiPostDelete(contact:Contact,complition:  @escaping (Bool)->Void)
    func apiPostEdit(contact:Contact,complition: @escaping (Contact)->Void)
    func apiPostGreate(contact:Contact,complition: @escaping (Contact)->Void)
}

class HttpManager:HttpManagerProtocol{
    
    func apiPostList(complition: @escaping ([Contact]) -> Void) {
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: {respons in
            switch respons.result{
            case .success:
                let contact = try! JSONDecoder().decode([Contact].self, from: respons.data!)
                complition(contact)
            case let .failure(error):
                print(error)
                complition([Contact]())
            }
        })
    }
    
    func apiPostDelete(contact:Contact, complition: @escaping (Bool) -> Void) {
        AFHttp.del(url: AFHttp.API_POST_DELETE + contact.id!, params: AFHttp.paramsEmpty(), handler: {respons in
            switch respons.result{
            case .success:
                print(respons.result)
                complition(true)
            case let .failure(error):
                print(error)
                complition(false)
            }
        })
    }
    
    func apiPostEdit(contact:Contact,complition: @escaping (Contact) -> Void) {
        AFHttp.put(url: AFHttp.API_POST_UPDATE + contact.id!, params: AFHttp.paramsPostUpdate(contact: contact), handler: {respons in
            switch respons.result{
            case .success:
                print(respons.result)
             
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiPostGreate(contact:Contact,complition: @escaping (Contact) -> Void) {
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(contact: contact), handler: {respons in
            switch respons.result{
            case .success:
                print(respons.result)

            case let .failure(error):
                print(error)
            }
        })
    }
    
}

