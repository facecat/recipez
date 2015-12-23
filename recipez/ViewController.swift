//
//  ViewController.swift
//  recipez
//
//  Created by 邱国邦 on 15/12/23.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var recipes = [Recipe]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self

    }
    
    override func viewDidAppear(animated: Bool) {
        
    }


    //MARK: UITabelView atasource & delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]

        if let cell = tableview.dequeueReusableCellWithIdentifier("RecipeCell") as? RecipeCell {
            cell.configureCell(recipe)
            return cell
        } else {
            let newCell = RecipeCell()
            newCell.configureCell(recipe)
            return newCell
        }
    }
}

