//
//  CashDetailTableViewController.swift
//  FinacialAnalyzingApp
//
//  Created by pei on 2017-05-16.
//
//

import UIKit
import ExpandableTableViewController

enum TableViewRows: Int {
    case list1 = 0, list2, list3, list4, list5
}

class CashDetailTableViewController: ExpandableTableViewController, ExpandableTableViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataManagement.sharedInstance.cash_first_GetValueArray()
        DataManagement.sharedInstance.cash_summary_GetValueArray()
        DataManagement.sharedInstance.loan_first_getValueArray()
        DataManagement.sharedInstance.loan_table_first_getValue()
        print("\(DataManagement.sharedInstance.loan_first_sumOfInterest())")
        
        self.expandableTableView.expandableDelegate = self as ExpandableTableViewDelegate
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: MY Functions
    
    @IBAction func logoLinkAct(_ sender: Any) {
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.chicagocashflow.com")!, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: - Init
    
    override func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if cell.responds(to: #selector(setter: UIView.preservesSuperviewLayoutMargins)){
            cell.preservesSuperviewLayoutMargins = false
        }
        
        if cell.responds(to: #selector(setter: UIView.layoutMargins)){
            cell.layoutMargins = UIEdgeInsets.zero
        }
    }

    // MARK: - Rows
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> UITableViewCell {
        
        let sectionHeader = expandableTableView.dequeueReusableCellWithIdentifier("SectionCell", forIndexPath: expandableIndexPath) as! CommonTableViewCell
        var sectionString = ""
        
        switch expandableIndexPath.row {
        case 0:
            sectionString = "Cash Basic:"
            break
        case 1:
            sectionString = "Summary:"
            break
        case 2:
            sectionString = "Projection:"
            break
        case 3:
            sectionString = "Scheduled Loan:"
            break
        case 4:
            sectionString = "Loan Stream:"
            break
        default:
            break
        }

        sectionHeader.sectionTitle_lb.text = sectionString
//        if !expandableTableView.isCellExpandedAtExpandableIndexPath(expandableIndexPath){
//            sectionHeader.showSeparator()
//        }
        
        return sectionHeader
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> CGFloat {
        return 44
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, estimatedHeightForRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> CGFloat {
        return 44
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) {
        
        if let cell = expandableTableView.cellForRowAtIndexPath(expandableIndexPath) as? CommonTableViewCell{
            if expandableTableView.isCellExpandedAtExpandableIndexPath(expandableIndexPath){
                cell.showSeparator()
            }else{
                cell.hideSeparator()
            }
        }
        
//        switch(expandableIndexPath.row){
//            case TableViewRows.list1.rawValue, TableViewRows.list2.rawValue, TableViewRows.list3.rawValue:
//                if let cell = expandableTableView.cellForRowAtIndexPath(expandableIndexPath) as? CommonTableViewCell{
//                    if expandableTableView.isCellExpandedAtExpandableIndexPath(expandableIndexPath){
//                        cell.showSeparator()
//                    }else{
//                        cell.hideSeparator()
//                    }
//                }
//                break
//                    
//            default:
//                break
//        }
        expandableTableView.deselectRowAtExpandableIndexPath(expandableIndexPath, animated: true)
    }
    
    // MARK: - SubRows
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfSubRowsInRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> Int {
        
        switch(expandableIndexPath.row){
        case TableViewRows.list1.rawValue:
            return DataManagement.sharedInstance.cash_first_titleArray.count
        case TableViewRows.list2.rawValue:
            return DataManagement.sharedInstance.cash_summary_titleArray.count
        case TableViewRows.list3.rawValue:
            return 4
        case TableViewRows.list4.rawValue:
            return DataManagement.sharedInstance.loan_first_value.count
        case TableViewRows.list5.rawValue:
            return 1
        default:
            return 0
        }
        
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, subCellForRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
            switch(expandableIndexPath.row){
                
            case TableViewRows.list1.rawValue:
                let listTextCell = expandableTableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: expandableIndexPath) as! CashDetailTableViewCell
                listTextCell.initWithViewIndex(valueSection: expandableIndexPath.row, valueIndex: expandableIndexPath.subRow, title: DataManagement.sharedInstance.cash_first_titleArray[expandableIndexPath.subRow], value: DataManagement.sharedInstance.cash_first_valueArray[expandableIndexPath.subRow])
                cell = listTextCell
                break
            case TableViewRows.list2.rawValue:
                let listTextCell = expandableTableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: expandableIndexPath) as! CashDetailTableViewCell
                listTextCell.initWithViewIndex(valueSection: expandableIndexPath.row, valueIndex: expandableIndexPath.subRow, title: DataManagement.sharedInstance.cash_summary_titleArray[expandableIndexPath.subRow], value: DataManagement.sharedInstance.cash_summary_valueArray[expandableIndexPath.subRow])
                cell = listTextCell
                break
            case TableViewRows.list3.rawValue:
                
                if expandableIndexPath.subRow == 0 {
                    let projectionCell = expandableTableView.dequeueReusableCellWithIdentifier("ProjectionCell", forIndexPath: expandableIndexPath) as! ProjectionTableViewCell
                    projectionCell.initWithTableFrame(viewWidth: self.view.frame.size.width)
                    cell = projectionCell
                } else {
                    let proCell = expandableTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: expandableIndexPath)
                    
                    switch expandableIndexPath.subRow {
                    case 1:
                        proCell.textLabel?.text = ""
                        break
                    case 2:
                        proCell.textLabel?.text = "Property Paid In Months"
                        break
                    case 3:
                        proCell.textLabel?.text = "Property Paid In Years         0.0"
                        break
                    default:
                        break
                    }
                    if expandableIndexPath.subRow%2 == 0 {
                        proCell.backgroundColor = UIColor(red: 217/250, green: 217/250, blue: 217/250, alpha: 1)
                    } else {
                        proCell.backgroundColor = UIColor(red: 236/250, green: 236/250, blue: 236/250, alpha: 1)
                    }
                    return proCell
                }
                break
            case TableViewRows.list4.rawValue:
                let listTextCell = expandableTableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: expandableIndexPath) as! CashDetailTableViewCell
                listTextCell.initWithViewIndex(valueSection: expandableIndexPath.row, valueIndex: expandableIndexPath.subRow, title: DataManagement.sharedInstance.loan_first_titleArray[expandableIndexPath.subRow], value: DataManagement.sharedInstance.loan_first_value[expandableIndexPath.subRow])
                cell = listTextCell
                break
            case TableViewRows.list5.rawValue:
                let listTextCell = expandableTableView.dequeueReusableCellWithIdentifier("LoanTableCell", forIndexPath: expandableIndexPath) as! LoanTableViewCell
                listTextCell.initWithTableFrame(viewWidth: self.view.frame.size.width)
                cell = listTextCell
                break
            default:
                cell = UITableViewCell()
                break
            }
        
        if expandableIndexPath.subRow%2 == 0 {
            cell.backgroundColor = UIColor(red: 236/250, green: 236/250, blue: 236/250, alpha: 1)
        } else {
            //            cell.backgroundColor = UIColor(red: 185/250, green: 211/250, blue: 218/250, alpha: 1)
            cell.backgroundColor = UIColor(red: 217/250, green: 217/250, blue: 217/250, alpha: 1)
        }
        return cell
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForSubRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> CGFloat {
        
        if expandableIndexPath.row == TableViewRows.list3.rawValue && expandableIndexPath.subRow == 0 {
            return 132.0
        } else if expandableIndexPath.row == TableViewRows.list5.rawValue {
            return CGFloat(DataManagement.sharedInstance.valuesOfArrays.count)*22.0
        } else {
            return 22.0
        }
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, estimatedHeightForSubRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> CGFloat {
        
        if expandableIndexPath.row == TableViewRows.list3.rawValue && expandableIndexPath.subRow == 0 {
            return 132.0
        } else if expandableIndexPath.row == TableViewRows.list5.rawValue {
            return CGFloat(DataManagement.sharedInstance.valuesOfArrays.count)*22.0
        } else {
            return 22.0
        }
        
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectSubRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath){
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
