//
//  Ingredients.swift
//  DownLoadFile
//
//  Created by Đặng Duy Cường on 1/4/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

struct LookupIngredients: Codable {
    var ingredients: [Ingredients]?
}

struct Ingredients: Codable {
    var strIngredient: String?
    var strDescription: String?
}
