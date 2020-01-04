//
//  DrinksCell.swift
//  DownLoadFile
//
//  Created by Đặng Duy Cường on 1/4/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class DrinksCell: UITableViewCell {

    @IBOutlet weak var strCategoryLabel: UILabel!
    @IBOutlet weak var strDrinkLabel: UILabel!
    @IBOutlet weak var strTagsLabel: UILabel!
    @IBOutlet weak var strInstructionsLabel: UILabel!
    @IBOutlet weak var dateModifiedLabel: UILabel!
    
    var data = Drinks()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillData() {
        strCategoryLabel.text = data.strCategory
        strDrinkLabel.text = data.strDrink
        strTagsLabel.text = data.strTags == nil ? " " : data.strTags
        strInstructionsLabel.text = data.strInstructions
        dateModifiedLabel.text = data.dateModified
    }

}
