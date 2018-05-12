//
//  ToDoTableViewController.swift
//  TODO_iOS
//
//  Created by ios on 12/05/18.
//  Copyright © 2018 Joao Paulo. All rights reserved.
//

import UIKit
import Firebase

class ToDoTableViewController: UITableViewController {
    
    var itemTodoList = [ItemTodo]()
    var ref: DatabaseReference?

    @IBOutlet var tbvToDoList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm a"
        
        let refItem = ref?.child("itemtodo")
        refItem?.observe(.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.itemTodoList.removeAll()
                for items in snapshot.children.allObjects as! [DataSnapshot]{
                    let itemObject = items.value as? [String: AnyObject]
                    let titulo =  itemObject?["titulo"] as? String ?? ""
                    let descricao  =  itemObject?["titulo"] as? String ?? ""
                    let dataCadastro = itemObject?["dataCadastro"] as? String ?? ""
                    let dataInicio = itemObject?["dataInicio"] as? String ?? ""
                    let dataFim = itemObject?["dataFim"] as? String ?? ""
                    let prioridade = itemObject?["prioridade"] as? Int ??  0
                    let status = itemObject?["status"] as? Bool ?? false
                
                    var item = ItemTodo(id:  items.key, titulo: titulo, descricao: descricao, dataCadastro: dateFormatter.date(from: dataCadastro)!, dataInicio: dateFormatter.date(from: dataInicio)!, dataFim: dateFormatter.date(from: dataFim)!, prioridade: prioridade, status: status)
                    
                      self.itemTodoList.append(item)
                    
                    
                }
                self.tbvToDoList.reloadData()
                
                
            }
        })
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemTodoList.count
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

        
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Del") { (action, currentIndexPath) in
            print("a")
        }
        
        return [deleteAction]
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ToDoTableCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ToDoTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        let item: ItemTodo
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        item = itemTodoList[indexPath.row]

        cell.lblTitle.text = item.titulo
        cell.lblDate.text = dateFormatter.string(from:item.dataCadastro)
        dateFormatter.dateFormat = "hh:mm a"
        cell.lblHour.text = dateFormatter.string(from:item.dataCadastro)
        cell.lblPriority.text = String(item.prioridade)
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
