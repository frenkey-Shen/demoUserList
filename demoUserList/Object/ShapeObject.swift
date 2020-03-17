//
//  ShapeObject.swift
//  demoUserList
//
//  Created by ChiaHao on 2020/3/17.
//  Copyright © 2020 ChiaHao. All rights reserved.
//

import UIKit

class ShapeObject: NSObject {
    
    public func makeCircle(view : UIView){
        view.layer.cornerRadius = view.frame.size.height / 2;
        view.layer.masksToBounds = true;
    }
}
