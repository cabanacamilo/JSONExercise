//
//  ViewUserInfoController.swift
//  JSONExercise
//
//  Created by Camilo Cabana on 9/25/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class ViewUserInfoController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userInfoTableView: UITableView!
    
    let headerTitle = ["General","Company","Address"]
    let general = ["Name", "ID","E-Mail","Phone"]
    let company = ["Name","Phrase"]
    let address = ["Street","Suite","Zip Code"]
    var generalData = [String]()
    var companyData = [String]()
    var addressData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return general.count
        } else if section == 1 {
            return company.count
        } else {
            return address.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitle[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userInfo") as! TableViewCell
        if indexPath.section == 0 {
            cell.userInfo.text = general[indexPath.row]
            cell.userData.text = generalData[indexPath.row]
        } else if indexPath.section == 1 {
            cell.userInfo.text = company[indexPath.row]
            cell.userData.text = companyData[indexPath.row]
        } else {
            cell.userInfo.text = address[indexPath.row]
            cell.userData.text = addressData[indexPath.row]
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let name = users[indexUser].name
        let id = String(users[indexUser].id)
        let email = users[indexUser].email
        let phone = users[indexUser].phone
        generalData = [name,id,email,phone]
        let companyName = users[indexUser].company.name
        let companyPhrase = users[indexUser].company.catchPhrase
        companyData = [companyName,companyPhrase]
        let addressStreet = users[indexUser].address.street
        let addressSuite = users[indexUser].address.suite
        let addressZipCode = users[indexUser].address.zipcode
        addressData = [addressStreet,addressSuite,addressZipCode]
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
