//
//  LoanGridTableViewCell.swift
//  FinacialAnalyzingApp
//
//  Created by wwww on 2017-05-18.
//
//

import UIKit

class LoanGridTableViewCell: UITableViewCell {

    @IBOutlet weak var no_lb: UILabel!
    @IBOutlet weak var payDate_lb: UILabel!
    @IBOutlet weak var begBal_lb: UILabel!
    @IBOutlet weak var schPay_lb: UILabel!
    @IBOutlet weak var extPay_lb: UILabel!
    @IBOutlet weak var totPay_lb: UILabel!
    @IBOutlet weak var pric_lb: UILabel!
    @IBOutlet weak var interest_lb: UILabel!
    @IBOutlet weak var endBal_lb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initWithData(array:[String]) {
        no_lb.text = array[0]
        payDate_lb.text = array[1]
        begBal_lb.text = array[2]
        schPay_lb.text = array[3]
        extPay_lb.text = array[4]
        totPay_lb.text = array[5]
        pric_lb.text = array[6]
        interest_lb.text = array[7]
        endBal_lb.text = array[8]
        let align = NSTextAlignment.right
        toAlignLabel(align: align)
    }
    func toAlignLabel(align:NSTextAlignment) {
        no_lb.textAlignment = align
        payDate_lb.textAlignment = align
        begBal_lb.textAlignment = align
        schPay_lb.textAlignment = align
        extPay_lb.textAlignment = align
        totPay_lb.textAlignment = align
        pric_lb.textAlignment = align
        interest_lb.textAlignment = align
        endBal_lb.textAlignment = align
    }
}
