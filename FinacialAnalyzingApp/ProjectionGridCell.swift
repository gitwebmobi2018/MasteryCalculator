//
//  ProjectionGridCell.swift
//  FinacialAnalyzingApp
//
//  Created by wwww on 2017-05-16.
//
//

import UIKit

class ProjectionGridCell: UITableViewCell {

    @IBOutlet weak var initialVlaue_lb: UILabel!
    @IBOutlet weak var salePrice_lb: UILabel!
    @IBOutlet weak var sellingCosts_lb: UILabel!
    @IBOutlet weak var netCashFlow_lb: UILabel!
    @IBOutlet weak var profitFromSale_lb: UILabel!
    @IBOutlet weak var totalProfit_lb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initWithData(array: [String]) {
        if array.count != 0 {
            initialVlaue_lb.text = array[0]
            salePrice_lb.text = array[1]
            sellingCosts_lb.text = array[2]
            netCashFlow_lb.text = array[3]
            profitFromSale_lb.text = array[4]
            totalProfit_lb.text = array[5]
            let align = NSTextAlignment.right
            toAlignLabel(align: align)
        } else {
            let alignment = NSTextAlignment.center
            toAlignLabel(align: alignment)
        }
    }
    func toAlignLabel(align:NSTextAlignment) {
        initialVlaue_lb.textAlignment = align
        salePrice_lb.textAlignment = align
        sellingCosts_lb.textAlignment = align
        netCashFlow_lb.textAlignment = align
        profitFromSale_lb.textAlignment = align
        totalProfit_lb.textAlignment = align
    }
}
