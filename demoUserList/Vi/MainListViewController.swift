//
//  MainListViewController.swift
//  demoUserList
//
//  Created by ChiaHao on 2020/3/16.
//  Copyright © 2020 ChiaHao. All rights reserved.
//

import UIKit

class MainListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MainListModelDelegate {
    
    @IBOutlet var listTable: UITableView!
    let dataModel : MainListModel = MainListModel()
    internal var listDatas : [userInList] = [userInList]()
    var page : NSInteger = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTable.delegate = self
        listTable.dataSource = self
        dataModel.delegate = self
        self.navigationController?.navigationBar.isHidden = true;
        dataModel.getUsersListData(page: page)
        // Do any additional setup after loading the view.
    }
    
    // MARK: TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        cell.avatarIconView.sd_setImage(with: URL(string: listDatas[indexPath.row].avatar_url), placeholderImage: UIImage(named: "nav_icon_people"))
        cell.nameLabel.text = listDatas[indexPath.row].login
        cell.staffLabel.text = listDatas[indexPath.row].site_admin ? "Staff" : ""
        cell.staffLabelHeightConstraint.constant = listDatas[indexPath.row].site_admin ? 21.0 : 10.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailVC") as? UserDataViewController
        
        detailVC!.targetName = listDatas[indexPath.row].login
        self.navigationController!.pushViewController(detailVC!, animated: false)
    }
    
    // MARK: viewModelDelegate
    func dataReceiver(datas: [userInList]) {
        listDatas += datas
        print(datas)
        listTable.reloadData()
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
