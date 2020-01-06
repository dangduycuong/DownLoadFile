//
//  DetailDrinkCell.swift
//  DownLoadFile
//
//  Created by Đặng Duy Cường on 1/4/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class DetailDrinkCell: UITableViewCell {
    @IBOutlet weak var detailDrinkImageView: UIImageView!
    @IBOutlet weak var strIngredientLabel: UILabel!
    @IBOutlet weak var strDescriptionLabel: UILabel!
    
    var url: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData() {
        detailDrinkImageView.dowloadFromServer(link: url ?? "")
    }
}
