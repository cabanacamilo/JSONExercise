//
//  pokemonData.swift
//  JSONExercise
//
//  Created by Camilo Cabana on 10/5/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import Foundation

struct Pokemon {
    var count: Int
    var next: String
    var results: [Result]
}

struct Result {
    var name: String
    var url: String
}
