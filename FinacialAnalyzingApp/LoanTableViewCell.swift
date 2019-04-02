//
//  LoanTableViewCell.swift
//  FinacialAnalyzingApp
//
//  Created by wwww on 2017-05-18.
//
//

import UIKit

class LoanTableViewCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initWithTableFrame(viewWidth:CGFloat) {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right:tableView.frame.size.width - viewWidth)
    }

}
extension LoanTableViewCell: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 22
    }
}
extension LoanTableViewCell : UITableViewDataSource  {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 178
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoanGridCell", for: indexPath) as! LoanGridTableViewCell
        
        if indexPath.row != 0 {
            cell.initWithData(array: DataManagement.sharedInstance.valuesOfArrays[indexPath.row - 1])
        }
        
        if indexPath.row%2 == 0 {
            cell.backgroundColor = UIColor(red: 236/250, green: 236/250, blue: 236/250, alpha: 1)
        } else {
            cell.backgroundColor = UIColor(red: 217/250, green: 217/250, blue: 217/250, alpha: 1)
        }
        return cell
    }
}
