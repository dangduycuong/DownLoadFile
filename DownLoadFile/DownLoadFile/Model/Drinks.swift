//
//  Drinks.swift
//  DownLoadFile
//
//  Created by Đặng Duy Cường on 1/4/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

struct Cocktail: Codable {
    var drinks: [Drinks]?
}

struct Drinks: Codable {
    var strTags: String?
    var strCategory: String?
    var strInstructions: String?
    var strDrinkThumb: String? // link image
    
    var dateModified: String?
    var strDrink: String?
    var idDrink: String?
    var strAlcoholic: String?
    
    var strIBA: String?
}
