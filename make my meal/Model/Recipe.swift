//
//  Recipe.swift
//  make my meal
//
//  Created by Insub Lim on 22/5/19.
//  Copyright © 2019 Insub Lim. All rights reserved.
//

import Foundation


class Recipe:Codable, Equatable {
    
    var name: String
    var description: String
    var ingredients: [String]
    var time: String
    
    init(name: String, description: String, ingredients: [String], time: String) {
        
        self.name = name
        self.description = description
        self.ingredients = ingredients
        self.time = time
        
    }
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool{
        if ( lhs.name == rhs.name) {
            return true
        } else {
            return false
        }
    }

}


