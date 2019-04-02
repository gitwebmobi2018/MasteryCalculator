//
//  DefinitionTableViewCell.swift
//  FinacialAnalyzingApp
//
//  Created by pei on 2017-04-11.
//
//

import UIKit

class DefinitionTableViewCell: UITableViewCell {

    @IBOutlet weak var title_lb: UILabel!
    @IBOutlet weak var content_lb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func initWithData(title: String, content: String) {
        title_lb.text = title
        content_lb.text = content
        content_lb.adjustsFontSizeToFitWidth = true
        title_lb.backgroundColor = UIColor.clear
        content_lb.backgroundColor = UIColor.clear
        
        shadowLabel(label: title_lb)
        shadowLabel(label: content_lb)
    }
    func shadowLabel(label: UILabel) {
        label.layer.shadowColor = UIColor.white.cgColor
        label.layer.shadowOffset = CGSize(width: 0, height: 2)
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
    }
}
