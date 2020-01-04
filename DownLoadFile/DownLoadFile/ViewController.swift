//
//  ViewController.swift
//  DownLoadFile
//
//  Created by Đặng Duy Cường on 1/4/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var drinks: [Drinks]?
    var s: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        BaseRouter.shared.getData(urlString: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a") { (data: Cocktail) in
            self.drinks = data.drinks
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks == nil ? 0 : drinks!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinksCell", for: indexPath) as! DrinksCell
        cell.data = drinks![indexPath.row]
        cell.fillData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailDrinkVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC
        detailDrinkVC?.detailDrink = drinks![indexPath.row]
        present(detailDrinkVC!, animated: true, completion: nil)
    }

    @IBAction func serachDrinks(_ sender: UIButton) {
        drinks?.removeAll()
        s = searchBar.text ?? ""
        BaseRouter.shared.getData(urlString: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(s)") { (data: Cocktail) in
            self.drinks = data.drinks
            self.tableView.reloadData()
        }
    }
}

