//
//  ApiConfigObject.swift
//  demoUserList
//
//  Created by ChiaHao on 2020/3/16.
//  Copyright © 2020 ChiaHao. All rights reserved.
//

import UIKit

class ApiConfigObject: NSObject {
    static var Single_User = "https://api.github.com/users/%@"
    static var Page_UsersList = "https://api.github.com/user/repos?page=%@&per_page=20"
    static var All_Users = "https://api.github.com/users"

}
