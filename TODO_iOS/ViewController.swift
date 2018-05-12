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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnLoginClick(_ sender: Any) {
        Auth.auth().signIn(withEmail: txtUser.text!, password: txtPassword.text!, completion: { (user, error) in
            
            if error == nil{
                self.performSegue(withIdentifier: "grantedSegue", sender: nil)
                print("Acabei de logar")
            }else{
                DialogHelper.dialogoErro(mensagemErro: "erro ao realizar o login", view: self)
            }
            
            
        })
        
    }
    @IBAction func btnSignUpClick(_ sender: Any) {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener({ (auth, user) in
            print(user?.email)
            if user != nil {
                print(user?.email)
                self.performSegue(withIdentifier: "grantedSegue", sender: nil)
            }
        })
        
    }

}

