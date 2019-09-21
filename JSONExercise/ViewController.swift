//
//  ViewController.swift
//  JSONExercise
//
//  Created by Camilo Cabana on 9/21/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getButton(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let urlResponse = response {
                print(urlResponse)
            } 
            if let urlData = data {
                print(urlData)
                do {
                    let json = try JSONSerialization.jsonObject(with: urlData, options: [])
                    print(json)
                } catch { }
            }
        }
        session.resume()
    }
    
    @IBAction func postButton(_ sender: UIButton) {
        let parameters = ["username": "Camilo Cabana", "post": "hello dude"]
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let urlResponse = response {
                print(urlResponse)
            }
            if let urlData = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: urlData, options: [])
                    print(json)
                } catch { }
            }
        }
        session.resume()
    }
}

