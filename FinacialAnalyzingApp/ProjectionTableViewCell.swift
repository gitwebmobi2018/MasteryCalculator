//
//  ProjectionTableViewCell.swift
//  FinacialAnalyzingApp
//
//  Created by wwww on 2017-05-16.
//
//

import UIKit

class ProjectionTableViewCell: UITableViewCell {

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
extension ProjectionTableViewCell: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 22
    }
}
extension ProjectionTableViewCell: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GridCell", for: indexPath) as! ProjectionGridCell
        var viewArray = [String]()
        switch indexPath.row {
        case 1:
            viewArray = DataManagement.sharedInstance.cash_projection_getValue(intialValue: "Intial Value")
            break
        case 2:
            viewArray = DataManagement.sharedInstance.cash_projection_getValue(intialValue: "5")
            break
        case 3:
            viewArray = DataManagement.sharedInstance.cash_projection_getValue(intialValue: "7")
            break
        case 4:
            viewArray = DataManagement.sharedInstance.cash_projection_getValue(intialValue: "10")
            break
        case 5:
            viewArray = DataManagement.sharedInstance.cash_projection_getValue(intialValue: "12")
            break
        default:
            break
        }
        cell.initWithData(array: viewArray)
        
        if indexPath.row%2 == 0 {
            cell.backgroundColor = UIColor(red: 236/250, green: 236/250, blue: 236/250, alpha: 1)
        } else {
            cell.backgroundColor = UIColor(red: 217/250, green: 217/250, blue: 217/250, alpha: 1)
        }
        return cell
    }
}
