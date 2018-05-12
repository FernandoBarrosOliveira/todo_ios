//
//  CreateToDoViewController.swift
//  TODO_iOS
//
//  Created by ios on 12/05/18.
//  Copyright © 2018 Joao Paulo. All rights reserved.
//

import UIKit

class CreateToDoViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var dtpDate: UIDatePicker!
    @IBOutlet weak var txtPriotiry: UITextField!
    @IBAction func btnCreateClick(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
