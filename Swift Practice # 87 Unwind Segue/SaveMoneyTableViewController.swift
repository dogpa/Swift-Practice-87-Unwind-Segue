//
//  SaveMoneyTableViewController.swift
//  Swift Practice # 87 Unwind Segue
//
//  Created by Dogpa's MBAir M1 on 2021/10/4.
//

import UIKit

class SaveMoneyTableViewController: UITableViewController {

    var moneyInfo = [MoneyStruct]() {
        didSet {
            MoneyStruct.saveInfo(moneyInfo)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let money = MoneyStruct.LoadInfo(){
            self.moneyInfo = money
        }
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
     */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return moneyInfo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moneyCell", for: indexPath)
        let moneyShowOnCell = moneyInfo[indexPath.row]
        cell.textLabel?.text = moneyShowOnCell.itemName

        return cell
    }
    
    
    @IBAction func unwindToSaveMoneyTableView(_ unwindSegue: UIStoryboardSegue) {
        
        if let source = unwindSegue.source as? AddListTableViewController, let money = source.saveMoney {
            if let indexPath = tableView.indexPathForSelectedRow {
                moneyInfo[indexPath.row] = money
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }else{
                moneyInfo.insert(money, at: 0)
                let newIndexPath = IndexPath(row: 0, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
        
        

    }
    


    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        moneyInfo.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? AddListTableViewController, let row = tableView.indexPathForSelectedRow?.row{
            controller.saveMoney = moneyInfo[row]
        }
    }
    

}
