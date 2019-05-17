//
//  CashDetailTableViewCell.swift
//  FinacialAnalyzingApp
//
//  Created by wwww on 2017-05-18.
//
//

import UIKit

class CashDetailTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initWithViewIndex(valueSection: Int, valueIndex: Int, title: String, value: String) {
        self.textLabel?.text = title
//        let numComma = DataManagement.sharedInstance.addComma(number: Int(value)!)
        self.detailTextLabel?.text = "$ \(value)"
        if valueSection == 0 {
            if valueIndex == 4 || valueIndex == 5 {
                self.detailTextLabel?.text = "\(value)%"
            }
        } else if valueSection == 1 {
            if valueIndex == 4 {
                if value == "0.0" {
                    self.detailTextLabel?.text = "Infinite!"
                }
            }
            if valueIndex == 8 {
                if value == "0.0" {
                    self.detailTextLabel?.text = "No $$ Down!"
                }
            }
            if valueIndex == 5 || valueIndex == 9 || valueIndex == 11 || valueIndex == 12 {
                self.detailTextLabel?.text = "\(value)%"
            }
            if valueIndex == 10 {
                self.detailTextLabel?.text = "\(value)"
            }
        } else if valueIndex == 1 || valueIndex == 2 {
            self.detailTextLabel?.text = "\(value)"
        }
    }
}
