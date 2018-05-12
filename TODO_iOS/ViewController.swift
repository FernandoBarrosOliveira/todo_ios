//
//  ViewController.swift
//  TODO_iOS
//
//  Created by ios on 12/05/18.
//  Copyright © 2018 Joao Paulo. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    var ref: DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
//        ref = Database.database().reference()
            //add()
//        readAll()
        
        Auth.auth().addStateDidChangeListener({ (auth, user) in
            print(user?.email)
            if user != nil {
                print(user?.email)
                self.performSegue(withIdentifier: "grantedSegue", sender: nil)
            }
        })
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnLoginClick(_ sender: Any) {
        Auth.auth().signIn(withEmail: txtUser.text!, password: txtPassword.text!, completion: { (user, error) in
            
            if error == nil{
                self.performSegue(withIdentifier: "SegueTodoList", sender: nil)
                print("Acabei de logar")
            }else{
                DialogHelper.dialogoErro(mensagemErro: "erro ao realizar o login", view: self)
            }
            
            
        })
        
    }
    @IBAction func btnSignUpClick(_ sender: Any) {
        
        
    }
    
    
    func add(){
        
        let item = ItemTodo(id: "", titulo: "teste", descricao: "teste descricao", dataCadastro: Date(), dataInicio: Date(), dataFim: Date(), prioridade: 1, status: false)
        ref?.child("itemtodo").childByAutoId().setValue(item.toDictionary())
        
    }
    
    
    func readAll(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm a"
        
        let refItem = ref?.child("itemtodo")
        refItem?.observe(.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
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
                
                item.descricao = "atualizando dados"
                self.update(id: items.key, item: item)
                self.delete(id: items.key)
                print(item.toDictionary())
                }
                
                
            }
            })
    }
    
    func delete(id: String){
         ref?.child("itemtodo").child(id).setValue(nil)
        
    }
    
    func update(id: String, item: ItemTodo){
        
         ref?.child("itemtodo").child(id).setValue(item.toDictionary())
        
        
        
    }

}

