//
//  ViewUsersController.swift
//  JSONExercise
//
//  Created by Camilo Cabana on 9/25/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

var indexUser = 0

class ViewUsersController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(users)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "users") as! TableViewUsersCell
        cell.userName.text = users[indexPath.row].name
        cell.userEmail.text = users[indexPath.row].email
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        usersTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexUser = indexPath[1]
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
