//
//  ItemTableViewController.swift
//  ShoppingList
//
//  Created by Mykhailo Bondarenko on 15.03.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {

    var items: [Item] = Item.fake(10)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Shopping List Items"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItems?.append(editButtonItem)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)

        let item = items[indexPath.row]
        cell.textLabel?.text = item.name

        if item.isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - IBActions
    
    @IBAction func didSelectAdd(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New shopping list item", message: "Enter item to add to the shopping list:", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (_) in
            if let itemName = alert.textFields?[0].text {
                let itemCount = self.items.count
                let item = Item(name: itemName)
                self.items.append(item)
                self.tableView.insertRows(at: [IndexPath(row: itemCount, section: 0)], with: .top)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
