//
//  UserDataViewModel.swift
//  demoUserList
//
//  Created by ChiaHao on 2020/3/16.
//  Copyright © 2020 ChiaHao. All rights reserved.
//

import UIKit

protocol UserDataViewModelDelegate {
    func dataReceiver(datas : userInfos)
    func errorCaller(errorStr : String)
}

class UserDataViewModel: NSObject {
    var delegate:UserDataViewModelDelegate?
    
    func getUserInfoData(name : String) {
        let url : URL = URL.init(string: String(format:ApiConfigObject.Single_User,name))!
        let dataLoader : URLSessionObject = URLSessionObject()
        dataLoader.getUserInfo(url: url, callBack: { (datas) in
            DispatchQueue.main.async(execute: { () -> Void in
                self.delegate?.dataReceiver(datas: datas)
            })
        }) { (errorStr) in
            DispatchQueue.main.async(execute: { () -> Void in
                self.delegate?.errorCaller(errorStr: errorStr)
            })
        }
    }
}
