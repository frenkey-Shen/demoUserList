//
//  MainListModel.swift
//  demoUserList
//
//  Created by ChiaHao on 2020/3/16.
//  Copyright © 2020 ChiaHao. All rights reserved.
//

import UIKit

protocol MainListModelDelegate {
    func dataReceiver(datas : [userInList])
    func errorCaller(errorStr : String)
}

class MainListModel: NSObject {
    var delegate:MainListModelDelegate?
    
    func getUsersListData(page : NSInteger) {
        let url : URL = URL.init(string: ApiConfigObject.All_Users)!
        let dataLoader : URLSessionObject = URLSessionObject()
        dataLoader.getUsersList(url: url, callUsersBack: { (datas) in
            DispatchQueue.main.async(execute: { () -> Void in
                var newDataTuple : [userInList] = [userInList]()
                if datas.count >= 100 {
                    newDataTuple = Array(datas[0 ..< 100])
                } else {
                    newDataTuple = datas
                }
                self.delegate?.dataReceiver(datas: newDataTuple)
            })
        }) { (errorStr) in
            DispatchQueue.main.async(execute: { () -> Void in
                self.delegate?.errorCaller(errorStr: errorStr)
            })
        }
    }
}
