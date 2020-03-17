//
//  UserTableViewCell.swift
//  demoUserList
//
//  Created by ChiaHao on 2020/3/17.
//  Copyright © 2020 ChiaHao. All rights reserved.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {

    @IBOutlet var avatarIconView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var staffLabel: UILabel!
    @IBOutlet var staffLabelHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let shapeOBject : ShapeObject = ShapeObject()
        shapeOBject.makeCircle(view: avatarIconView)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
