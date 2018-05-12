//
//  ToDoTableViewCell.swift
//  GoogleToolboxForMac
//
//  Created by ios on 12/05/18.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {


    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var swtConclude: UISwitch!
    @IBOutlet weak var lblPriority: UILabel!
    @IBOutlet weak var lblHour: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
