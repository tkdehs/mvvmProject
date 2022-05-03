//
//  MainTableViewCell.swift
//  mvvmProject
//
//  Created by sangdon kim on 2022/05/03.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    static let cellID = "MainTableViewCell"

    @IBOutlet weak var lbLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(strLable:String) {
        lbLable.text = strLable
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
