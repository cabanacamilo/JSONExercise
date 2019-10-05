//
//  ViewController.swift
//  JSONExercise
//
//  Created by Camilo Cabana on 9/21/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

var users = [UserInfo]()
var starWars = [StarWarsInfo]()
var pokemon = Pokemon(count: 0, next: "", results: [Result(name: "", url: "")])

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        downloadUsers()
        downloadStarWars()
        downloadPokemon()
    }

    @IBAction func getButton(_ sender: UIButton) {
        
        
    }
    
    @IBAction func postButton(_ sender: UIButton) {
//        let parameters = ["username": "Camilo Cabana", "post": "hello dude"]
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
//        request.httpBody = httpBody
//        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
////            if let urlResponse = response {
////                print(urlResponse)
////            }
//            if let urlData = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: urlData, options: .mutableContainers)
//                    print(json)
//                } catch { }
//            }
//        }
//        session.resume()
    }
    
    func downloadUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let urlResponse = response {
//                print(urlResponse)
//            }
            if let urlData = data {
//                print(urlData)
                do {
//                    let json = try JSONSerialization.jsonObject(with: urlData, options: [])
                    let decoder = JSONDecoder()
                    let json = try decoder.decode([UserInfo].self, from: urlData)
                    users = json
//                    print(json)
                } catch { }
            }
        }
        session.resume()
    }
    
    func downloadStarWars() {
            
        guard let url = URL(string: "https://swapi.co/api/people") else { return }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let urlData = data {
//                print(urlData)
                do {
//                    let decoder = JSONDecoder()
//                    let json = try decoder.decode(StarWarsInfo.self, from: urlData)
//                    starWars = json
//                    print(json)
                    let json = try JSONSerialization.jsonObject(with: urlData, options: []) as? [String: Any]
//                    if let count = json?["count"] {
//                        print(count)
//                    }
                    if let results = json?["results"] as? Array<Dictionary<String, Any>> {
                        for i in results.indices {
                            let info = StarWarsInfo()
                            info.name = results[i]["name"] as! String
                            info.height = results[i]["height"] as! String
                            info.mass = results[i]["mass"] as! String
                            info.gender = results[i]["gender"] as! String
                            info.birth_year = results[i]["birth_year"] as! String
                            info.eye_color = results[i]["eye_color"] as! String
                            info.hair_color = results[i]["hair_color"] as! String
                            starWars.append(info)
                        }
                    }
                } catch { }
            }
        }
        session.resume()
    }
    
    func downloadPokemon() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else { return }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let urlData = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: urlData, options: []) as? [String: Any]
                    if let count = json?["count"] as? Int {
                        pokemon.count = count
                    }
                    if let next = json?["next"] as? String{
                        pokemon.next = next
                    }
                    if let results = json?["results"] as? Array<Dictionary<String, String>> {
                        var resultArray = [Result(name: "", url: "")]
                        var result = Result(name: "", url: "")
                        for i in results.indices {
                            if let name = results[i]["name"] {
                                result.name = name
                            }
                            if let url = results[i]["url"] {
                                result.url = url
                            }
                            resultArray.append(result)
                        }
                        resultArray.remove(at: 0)
                        pokemon.results = resultArray
                    }
                } catch { }
            }
        }
        session.resume()
    }
}

