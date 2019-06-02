//
//  IngredientsTableViewController.swift
//  make my meal
//
//  Created by Gayun Kim on 2/6/19.
//  Copyright © 2019 Insub Lim. All rights reserved.
//

import UIKit

class IngredientsTableViewController: UITableViewController {

    var addedIngredients: [String] = []
    let dataStroage = DataRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addedIngredients = try! dataStroage.loadIngredients()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        try? dataStroage.saveIngredients(addedIngredients)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addedIngredients.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientsCell", for: indexPath)

        let ingredient = addedIngredients[indexPath.row]
        cell.textLabel?.text = ingredient

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            addedIngredients.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            try? dataStroage.saveIngredients(addedIngredients)
        } 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == "toNewIngredient" else {return}
//        let newIngredientViewController = segue.destination as! NewIngredientViewController
//        newIngredientViewController.addedIngredients = addedIngredients
        
//        guard segue.identifier == "toRecipes" else {return}
//        let matchingRecipeListTableViewController = segue.destination as! MatchingRecipeListTableViewController
//        matchingRecipeListTableViewController.addedIngredients = addedIngredients
    }
    
    
    @IBAction func nextBtn(_ sender: Any) {
        performSegue(withIdentifier: "toRecipes", sender: self)
    }
    
}