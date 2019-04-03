//
//  RehabDetailBaseTableViewCell.swift
//  FinacialAnalyzingApp
//
//  Created by wwww on 2017-08-09.
//
//

import UIKit

class RehabDetailBaseTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var title_lb: UILabel!
    @IBOutlet weak var quentity_lb: UILabel!
    @IBOutlet weak var quentity_tf: UITextField!
    @IBOutlet weak var unitVal_lb: UILabel!
    @IBOutlet weak var selectionRepairReplace: UISegmentedControl!
    @IBOutlet weak var totalCostVal_lb: UILabel!
    @IBOutlet weak var laborVal_lb: UILabel!
    @IBOutlet weak var materialVal_lb: UILabel!
    
    var parentVC : RehabDetailViewController?
    var calModeSubIndex : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: functions
    
    func initFrameLayout() {
        
        selectionRepairReplace.selectedSegmentIndex = DataManagement.sharedInstance.selectionMode
        
        backView.layer.cornerRadius = 5
        backView.layer.borderColor = UIColor(red: 11/255, green: 2/255, blue: 118/255, alpha: 1).cgColor
        backView.layer.borderWidth = 1
        
        if quentity_tf.text == "" {
            quentity_lb.textColor = UIColor.red
        } else {
            quentity_lb.textColor = UIColor(red: 11/255, green: 2/255, blue: 118/255, alpha: 1)
        }
    }
    
    func initKeyboard() {
        let toolbarDone = UIToolbar.init()
        toolbarDone.barStyle = UIBarStyle.blackTranslucent
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(hideTextField))
        done.tintColor = UIColor.white
        
        let items = NSMutableArray()
        items.add(flexSpace)
        items.add(done)
        
        toolbarDone.items = items as? [UIBarButtonItem]
        toolbarDone.sizeToFit()
        quentity_tf.inputAccessoryView = toolbarDone
    }
    
    @objc func hideTextField() {
        quentity_tf.resignFirstResponder()
    }
    
    func initWithData(parentVc : RehabDetailViewController, calModeSubIndexFromParent : Int) {
        parentVC = parentVc
        calModeSubIndex = calModeSubIndexFromParent
    
        initCell()
    }
    
    func initCell() {
        DataManagement.sharedInstance.initRehabDetailCellWithData(calModeSubIndex: calModeSubIndex)
        
        title_lb.text = DataManagement.sharedInstance.valueTitle
        unitVal_lb.text = DataManagement.sharedInstance.unit
        
        selectionRepairReplace.setTitle("Cost/unit Replace $\(String(describing: DataManagement.sharedInstance.costReplace!))", forSegmentAt: 0)
        selectionRepairReplace.setTitle("Cost/Unit Repair $\(String(describing: DataManagement.sharedInstance.costRepair!))", forSegmentAt: 1)
        
        let (quentityValue, totalValue, laborValue, materialValue) = DataManagement.sharedInstance.getValues(index: calModeSubIndex)
        
        quentity_tf.text = quentityValue
        totalCostVal_lb.text = "$ \(totalValue)"
        laborVal_lb.text = "$ \(laborValue)"
        materialVal_lb.text = "$ \(materialValue)"
        
        initKeyboard()
        initFrameLayout()
        setTotalValuesView()
        
    }
    
    //MARK: UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var txtAfterUpdate:NSString = textField.text! as NSString
        txtAfterUpdate = txtAfterUpdate.replacingCharacters(in: range, with: string) as NSString
        
        let (totalValue, laborValue, materialValue) = DataManagement.sharedInstance.calculation(index: calModeSubIndex, quentity: txtAfterUpdate as String, selectionModeNum: selectionRepairReplace.selectedSegmentIndex)
        
        totalCostVal_lb.text = "$ \(totalValue)"
        laborVal_lb.text = "$ \(laborValue)"
        materialVal_lb.text = "$ \(materialValue)"
        
        if txtAfterUpdate == "" {
            quentity_lb.textColor = UIColor.red
        } else {
            quentity_lb.textColor = UIColor(red: 11/255, green: 2/255, blue: 118/255, alpha: 1)
        }
        
        setTotalValuesView()
        
        return true
    }
    
    //MARK: Set Total Values
    
    func setTotalValuesView() {
        parentVC?.setTotalTitleAndValue()
    }
    
    @IBAction func selectingRepairReplace(_ sender: Any) {
        
        let selectedIndex = selectionRepairReplace.selectedSegmentIndex
        
        let (totalValue, laborValue, materialValue) = DataManagement.sharedInstance.calculation(index: calModeSubIndex, quentity: quentity_tf.text!, selectionModeNum: selectedIndex)
        
        totalCostVal_lb.text = "$ \(totalValue)"
        laborVal_lb.text = "$ \(laborValue)"
        materialVal_lb.text = "$ \(materialValue)"
        
        setTotalValuesView()
        
    }
    
}
