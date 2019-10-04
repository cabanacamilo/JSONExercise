//
//  ViewStarWarsController.swift
//  JSONExercise
//
//  Created by Camilo Cabana on 10/4/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class ViewStarWarsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var starWarsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(starWars)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWars.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarWars") as! TableViewStarWarsCell
        cell.name.text = starWars[indexPath.row].name
        cell.gender.text = starWars[indexPath.row].gender
        return cell
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
