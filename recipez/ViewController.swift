//
//  ViewController.swift
//  recipez
//
//  Created by 邱国邦 on 15/12/23.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var recipes = [Recipe]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self

    }
    
    override func viewDidAppear(animated: Bool) {
        // Call func to load data
        fetchAndSetResults()
        tableview.reloadData()
    }


    //MARK: Function
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.recipes = results as! [Recipe]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    //MARK: UITableViewDataSource & UITableViewDelegate
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

