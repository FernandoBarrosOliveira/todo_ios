//
//  CreateToDoViewController.swift
//  TODO_iOS
//
//  Created by ios on 12/05/18.
//  Copyright © 2018 Joao Paulo. All rights reserved.
//

import UIKit
import Firebase

class CreateToDoViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var dtpDate: UIDatePicker!
    @IBOutlet weak var txtPriotiry: UITextField!
    
    @IBOutlet weak var btnToDo: UIButton!
    var ref: DatabaseReference?
    var item: ItemTodo?
    
    @IBAction func btnCreateClick(_ sender: Any) {
        
        if Validar(){
        
            var titulo = txtTitle.text
            var descricao = txtDescription.text
            var dateInicio = dtpDate.date
            var prioridade =  Int(txtPriotiry.text!)
            
            if let itemAtual = item{
                let itemUpdate = ItemTodo(id: itemAtual.id, titulo: titulo!, descricao: descricao!, dataCadastro: Date(), dataInicio: dateInicio, dataFim: Date(), prioridade: prioridade!, status: false)
                ref?.child("itemtodo").child(itemUpdate.id).setValue(itemUpdate.toDictionary())
                

            } else{
                let itemAdd = ItemTodo(id: "", titulo: titulo!, descricao: descricao!, dataCadastro: Date(), dataInicio: dateInicio, dataFim: Date(), prioridade: prioridade!, status: false)
                ref?.child("itemtodo").childByAutoId().setValue(itemAdd.toDictionary())
            }
        }
    

        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        if let itemAtual = item {
            txtTitle.text = itemAtual.titulo
            txtDescription.text = itemAtual.descricao
            dtpDate.date = itemAtual.dataInicio
            txtPriotiry.text = String(itemAtual.prioridade)
           // btnToDo.currentTitle = ""

        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Validar() -> Bool{
        
        if (txtPriotiry.text?.isEmpty)! ||
            (txtTitle.text?.isEmpty)! ||
            (txtDescription.text?.isEmpty)!{
            DialogHelper.dialogoErro(mensagemErro: "Existe campos vazios", view: self)
            return false
        }
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
