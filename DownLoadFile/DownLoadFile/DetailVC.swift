//
//  DetailVC.swift
//  DownLoadFile
//
//  Created by Đặng Duy Cường on 1/4/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var strIBALabel: UILabel!
    @IBOutlet weak var strDrinkLabel: UILabel!
    
    var detailDrink = Drinks()
    var ingredients: [Ingredients]?
    weak var detailDrinkImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = self.detailDrink.strDrinkThumb
        
        if url != nil, let linkImageView = URL(string: url!) {
            detailDrinkImageView.dowloadFromServer(url: linkImageView)
        }
        displayData()
        callAPI()
    }
    
    func displayData() {
        strIBALabel.text = detailDrink.strIBA ?? " "
        strDrinkLabel.text = detailDrink.strDrink
    }
    
    // lấy các ký tự
    var name: String = ""
    func getNameForSearch() {
        guard detailDrink.strDrink != nil else { return }
        for character in detailDrink.strDrink! {
            if character == " " {
                break
            } else {
                name.append(character)
            }
        }
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func callAPI() {
        name = ""
        getNameForSearch()
        BaseRouter.shared.getData(urlString: "https://www.thecocktaildb.com/api/json/v1/1/search.php?i=\(name)") { (data: LookupIngredients) in
            self.ingredients = data.ingredients
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients == nil ? 0 : ingredients!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailDrinkCell", for: indexPath) as! DetailDrinkCell
        cell.strIngredientLabel.text = ingredients![indexPath.row].strIngredient
        cell.strDescriptionLabel.text = ingredients![indexPath.row].strDescription
        cell.detailDrinkImageView.image = detailDrinkImageView.image
        return cell
    }
}
