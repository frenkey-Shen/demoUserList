//
//  URLSessionObject.swift
//  demoUserList
//
//  Created by ChiaHao on 2020/3/16.
//  Copyright © 2020 ChiaHao. All rights reserved.
//

import UIKit

public struct userInList : Decodable {
    var login : String
    var id : Int
    var node_id : String
    var avatar_url : String
    var gravatar_id : String
    var url : String
    var html_url : String
    var followers_url : String
    var following_url : String
    var gists_url : String
    var starred_url : String
    var subscriptions_url : String
    var organizations_url : String
    var repos_url : String
    var events_url : String
    var received_events_url : String
    var type : String
    var site_admin : Bool
}

public struct userInfos : Decodable {
    var login : String
    var id : Int
    var node_id : String
    var avatar_url : String
    var gravatar_id : String
    var url : String
    var html_url : String
    var followers_url : String
    var following_url : String
    var gists_url : String
    var starred_url : String
    var subscriptions_url : String
    var organizations_url : String
    var repos_url : String
    var events_url : String
    var received_events_url : String
    var type : String
    var site_admin : Bool
    var name : String
    var company : String?
    var blog : String?
    var location : String?
    var email : String?
    var hireable : String?
    var bio : String?
    var public_repos : Int
    var public_gists : Int
    var followers : Int
    var following : Int
    var created_at : String
    var updated_at : String
}

class URLSessionObject: NSObject {

    public func getUserInfo(url : URL, callBack :@escaping (userInfos) -> Void, failCallBack : @escaping (String) -> Void) {
        let queue = DispatchQueue(label: "demoApiData")
        queue.sync {
            do {
                let request = NSMutableURLRequest(url: url)
                request.httpMethod = "GET"
                let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                                    
                    if error != nil{
                        failCallBack("Api Loading Fail")
                                        return
                                    }
                    
                    let prove : String = String(data: data!, encoding: String.Encoding.utf8)!
                    print(prove)
                    
                    do
                            {
                                let decoder = JSONDecoder()
                                

                                let result : userInfos = try! decoder.decode(userInfos.self, from: data!)
                                callBack(result)
                        }
                        
                    })
                task.resume()
            }
        }
    }
    
    public func getUsersList(url : URL, callUsersBack :@escaping ([userInList]) -> Void, failUsersCallBack :@escaping (String) -> Void) {
        let queue = DispatchQueue(label: "demoApiData")
        queue.sync {
            do {
                let request = NSMutableURLRequest(url: url)
                request.httpMethod = "GET"
                let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                                    
                    if error != nil{
                        failUsersCallBack("Api Loading Fail")
                                        return
                                    }
                    
                    do
                        {
                            let decoder = JSONDecoder()
                            let result : [userInList] = try! decoder.decode([userInList].self, from: data!)
                            callUsersBack(result)
                    }
                    
                })
                            
                task.resume()
            }
        }
    }
    
}
