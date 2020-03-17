//
//  UserDataViewController.swift
//  demoUserList
//
//  Created by ChiaHao on 2020/3/16.
//  Copyright © 2020 ChiaHao. All rights reserved.
//

import UIKit
import SDWebImage

class UserDataViewController: UIViewController, UserDataViewModelDelegate {
    @IBOutlet var returnButton: UIButton!
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var smallIconView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var staffMarkLabel: UILabel!
    @IBOutlet var areaLabel: UILabel!
    @IBOutlet var blogAddress: UILabel!
    @IBOutlet var staffHideConstraint: NSLayoutConstraint!
    
    public var targetName : String = String()
    let dataModel : UserDataViewModel = UserDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel.delegate = self
        dataModel.getUserInfoData(name: targetName)
        let shapeOBject : ShapeObject = ShapeObject()
        shapeOBject.makeCircle(view: avatarImageView)
        // Do any additional setup after loading the view.
    }
    
    // MAEK: custom function
    func setUI(data : userInfos) {
        avatarImageView.sd_setImage(with: URL(string: data.avatar_url), placeholderImage: UIImage(named: "nav_icon_people"))
        nameLabel.text = data.name
        subLabel.text = data.login
        areaLabel.text = data.location
        blogAddress.text = data.blog
        staffMarkLabel.text = data.site_admin ? "Staff" : ""
        staffHideConstraint.constant = data.site_admin ? 24.0 : 35.0
        
        print(data)
    }
    
    // MARK:UIAction
    @IBAction func returnButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    // MARK: ViewModelDelegate
    func dataReceiver(datas: userInfos) {
        setUI(data: datas)
    }
    
    func errorCaller(errorStr: String) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
