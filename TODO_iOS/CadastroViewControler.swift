//
//  CadastroViewControler.swift
//  TODO_iOS
//
//  Created by ios on 12/05/18.
//  Copyright © 2018 Joao Paulo. All rights reserved.
//

import UIKit
import Firebase

class CadastroViewControler: UIViewController {

    @IBOutlet weak var txtCadastroUser: UITextField!
    @IBOutlet weak var txtCadastroPassword: UITextField!
    @IBOutlet weak var txtCadastroConfirmPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnConfirm(_ sender: Any) {
        
        if (txtCadastroUser.text?.isEmpty)! ||
            (txtCadastroPassword.text?.isEmpty)! ||
            (txtCadastroConfirmPassword.text?.isEmpty)!{
            DialogHelper.dialogoErro(mensagemErro: "Existe campos vazios", view: self)
            
            
        }else
            if txtCadastroPassword.text != txtCadastroConfirmPassword.text {
                DialogHelper.dialogoErro(mensagemErro: "Password não são iguais", view: self)
                
            }else{
                Auth.auth().createUser(withEmail: txtCadastroUser.text!, password: txtCadastroPassword.text!, completion: { (user, error) in
                    if error == nil{
                        print("usuario criado")
                        
                    }else{
                        DialogHelper.dialogoErro(mensagemErro: "Erro ao cadastrar", view: self)
                        print(error.debugDescription)
                    }
                    
                    
                })
                
                
        }
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
