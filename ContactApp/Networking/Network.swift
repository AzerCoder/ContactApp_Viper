//
//  Network.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 25/02/24.
//

import Foundation
import Alamofire

private let IS_TESTER = true
private let DEP_SER = "https://65da38d8bcc50200fcdcc344.mockapi.io/"
private let DEV_SER = "https://65da38d8bcc50200fcdcc344.mockapi.io/"

let headers: HTTPHeaders = [
"Accept": "application/json"
]

class AFHttp{
    
    // MARK : - AFHttp Requests
    class func get(url:String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .get, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    class func post(url:String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .post, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    class func put(url:String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .put, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    class func del(url:String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .delete, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    // MARK : - AFHttp Methods
    
    class func server(url: String) -> URL{
        if(IS_TESTER){
            return URL(string: DEV_SER + url)!
        }
        return URL(string: DEP_SER + url)!
    }
    // MARK : - AFHttp Apis
    
    static let API_POST_LIST = "api/cont"
    static let API_POST_SINGLE = "api/cont/" //id
    static let API_POST_CREATE = "api/cont"
    static let API_POST_UPDATE = "api/cont/" //id
    static let API_POST_DELETE = "api/cont/" //id
    
    // MARK: - AFHttp Params|
    class func paramsEmpty() -> Parameters{
        let parameters: Parameters = [
            :]
        return parameters
    }
    
    class func paramsPostCreate(contact: Contact) -> Parameters {
        let parameters: Parameters = [
            "name": contact.name!,
            "phone": contact.phone!
            
        ]
        return parameters
    }
    
    class func paramsPostUpdate(contact: Contact) -> Parameters {
        let parameters: Parameters = [
            "name": contact.name!,
            "phone": contact.phone!,
            "id": contact.id!
        ]
        return parameters
    }
}
