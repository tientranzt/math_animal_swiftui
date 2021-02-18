//
//  ZodiacModel.swift
//  math_animal
//
//  Created by tientran on 23/01/2021.
//

import Foundation


struct ZodiacModel : Decodable, Hashable{
    var name : String
    var image : String
    var score : Int
}
