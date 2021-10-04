//
//  AddListTableViewController.swift
//  Swift Practice # 87 Unwind Segue
//
//  Created by Dogpa's MBAir M1 on 2021/10/4.
//

import UIKit

class AddListTableViewController: UITableViewController {

    var saveMoney:MoneyStruct?
    
    @IBOutlet weak var itemNameTextField: UITextField!
    
    @IBOutlet weak var itemMoneyTextField: UITextField!
    
    
    func updateInfo () {
        if let saveMoney = saveMoney {
            itemNameTextField.text = saveMoney.itemName
            itemMoneyTextField.text = saveMoney.itemPrice
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfo()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if itemNameTextField.text?.isEmpty == false, itemMoneyTextField.text?.isEmpty == false {
            return true
        }else{
            let alertController = UIAlertController(title: "有資料沒輸入喔", message: "再檢查吧", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "了解", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return false
        }
        
    }
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        
        
        let itemNamePassToSave = itemNameTextField.text ?? ""
        let itemPricePassToSave = itemMoneyTextField.text ?? ""
        
        saveMoney = MoneyStruct(itemName: itemNamePassToSave, itemPrice: itemPricePassToSave)
    }
    

}
