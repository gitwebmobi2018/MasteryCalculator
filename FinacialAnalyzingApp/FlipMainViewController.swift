//
//  FlipMainViewController.swift
//  FinacialAnalyzingApp
//
//  Created by pei on 2017-05-02.
//
//

import UIKit
//extension UITableView {
//    func scrollToBottom(animated: Bool = true) {
//        let sections = self.numberOfSections
//        let rows = self.numberOfRows(inSection: sections - 1)
//        self.scrollToRow(at: NSIndexPath(row: rows - 1, section: sections - 1) as IndexPath, at: .bottom, animated: true)
//    }
//}

class FlipMainViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableViewHeightConstant: NSLayoutConstraint!
    @IBOutlet weak var detailBackgroundImaage: UIImageView!
    @IBOutlet weak var view_payResult: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lb_maxOfferValue: UILabel!
    @IBOutlet weak var segment_mode: UISegmentedControl!
    @IBOutlet weak var lb_maxOfferTitle: UILabel!
    @IBOutlet weak var view_tableView: UIView!
    @IBOutlet weak var lb_moreParameters: UILabel!
    @IBOutlet weak var detail_lb: UILabel!
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    
    var moreParameters = false
    var tableViewHeight : CGFloat = 0.0
    var halfrowCount:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("tableViewHeightConstant.constant = \(tableViewHeightConstant.constant)")
        print("contentiewHeightConstant.constant = \(contentViewHeight.constant)")
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = UITableView.automaticDimension

        self.navigationItem.title = "Flip Max"
        
        let dismissKeyboardTapGesture = UITapGestureRecognizer.init(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(dismissKeyboardTapGesture)
//        view_tableView.addSubview(lb_moreParameters)
//        scrollView.insertSubview(view_tableView, belowSubview: view_payResult)
        view.insertSubview(scrollView, belowSubview: view_payResult)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardDidShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        configure_ViewPayResult()
        configure_scrollView()
        configure_ViewTableView()
        configure_TableView()
        configure_maxOfferTitle()
        configure_maxOfferValue()
        configure_moreParameters()
        
        showMaxOfferValue()
        
        detailBackgroundImaage.layer.cornerRadius = 12.5
        detailBackgroundImaage.layer.borderColor = UIColor.lightGray.cgColor
        detailBackgroundImaage.layer.borderWidth = 1
        
        detailBackgroundImaage.layer.shadowColor = UIColor.black.cgColor
        detailBackgroundImaage.layer.shadowRadius = 1
        detailBackgroundImaage.layer.shadowOffset = CGSize(width: 0.5, height: 1)
        detailBackgroundImaage.layer.shadowOpacity = 1
        
        detailView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(detailAct))
        detailView.addGestureRecognizer(tapGesture)
        
        detail_lb.layer.shadowColor = UIColor.white.cgColor
        detail_lb.layer.shadowOffset = CGSize(width: 0, height: 1)
        detail_lb.layer.shadowOpacity = 1
        detail_lb.layer.shadowRadius = 1
        determineTabelViewHeight()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.tintColor = UIColor.green
//        var tableViewHeight:CGFloat = 0;
//        for (var i = tableView(self.tableView , numberOfRowsInSection: 0) - 1; i>0; i-=1 ){
//            tableViewHeight = height + tableView(self.tableView, heightForRowAtIndexPath: NSIndexPath(forRow: i, inSection: 0) )
//        }
//        tableViewHeightLayout.constant = tableViewHeight
//        tableViewHeight = tableView.frame.size.height
//        tableView.reloadData()
        print("table view frame is \(tableView.frame.size.height)")
        print("contentiewHeightConstant.constant = \(contentViewHeight.constant)")

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: My functions
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if !moreParameters {
                scrollView.isScrollEnabled = true
            }
            guard let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
                else{
                    print("returning")
                    return
            }
            
            print(bottomPadding)

            let contentInsets = UIEdgeInsets(top:0.0, left:0.0, bottom:keyboardSize.height, right:0.0)
            scrollView.contentInset = contentInsets
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if moreParameters == false {
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            scrollView.contentInset = contentInsets
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
            scrollView.isScrollEnabled = false
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0,
                                                   left: 0,
                                                   bottom: 0,
                                                   right: 0)
        }
    }
    
    @objc func dismissKeyboard() {
        if DataManagement.sharedInstance.keyboardHide {
            return
        } else {
            DataManagement.sharedInstance.hideTextF()
            view.endEditing(true)
            DataManagement.sharedInstance.keyboardHide = true
        }
    }
    func determineTabelViewHeight(){
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("IPHONE 5,5S,5C")
                tableViewHeight = 214
            case 1334:
                print("IPHONE 6,7,8 IPHONE 6S,7S,8S ")
                tableViewHeight = 291.5
//                return CGFloat(Int(291.5)/count)
            case 1920, 2208:
                print("IPHONE 6PLUS, 6SPLUS, 7PLUS, 8PLUS")
                tableViewHeight = 345
//                return CGFloat(Int(345)/count)
            case 2436:
                print("IPHONE X, IPHONE XS")
                tableViewHeight = 346.3
//                return CGFloat(Int(346.3)/count)
            case 2688:
                print("IPHONE XS_MAX")
                tableViewHeight = 412
//                return CGFloat(Int(412)/count)
            case 1792:
                print("IPHONE XR")
                tableViewHeight = 412
//                return CGFloat(Int(412)/count)
            default:
                
                print("UNDETERMINED")
                tableViewHeight = tableView.frame.size.height/6
//                return CGFloat(Int(tableView.frame.size.height)/6)
            }
        }
        
        
        
    }
    func configure_maxOfferTitle() {
        lb_maxOfferTitle.layer.shadowColor = UIColor.white.cgColor
        lb_maxOfferTitle.layer.shadowOffset = CGSize(width: 0, height: 2)
        lb_maxOfferTitle.layer.shadowOpacity = 1
        lb_maxOfferTitle.layer.shadowRadius = 1
    }
    func configure_maxOfferValue() {
        lb_maxOfferValue.layer.shadowColor = UIColor.white.cgColor
        lb_maxOfferValue.layer.shadowOffset = CGSize(width: 0, height: 2)
        lb_maxOfferValue.layer.shadowOpacity = 1
        lb_maxOfferValue.layer.shadowRadius = 1
    }
    func configure_scrollView() {
//        scrollView.frame = CGRect(x: 0, y: view_payResult.frame.origin.y + view_payResult.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height-49-(view_payResult.frame.origin.y+view_payResult.frame.size.height))
//        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.size.height)
    }
    
   private func configure_ViewPayResult() {
        view_payResult.layer.shadowColor = UIColor.black.cgColor
        view_payResult.layer.shadowRadius = 3
        view_payResult.layer.shadowOffset = CGSize(width: 0.5, height: 2.5)
        view_payResult.layer.shadowOpacity = 0.5
    }
   private  func configure_ViewTableView() {
//        view_tableView.backgroundColor = .clear
//        view_tableView.frame = CGRect(x: 10, y: 14, width: scrollView.frame.size.width - 20, height: scrollView.frame.size.height - 28)
        
        view_tableView.clipsToBounds = true
        view_tableView.layer.masksToBounds = false
        view_tableView.layer.cornerRadius = 10
        view_tableView.layer.shadowOffset = CGSize.zero
        view_tableView.layer.shadowColor = UIColor.black.cgColor
        view_tableView.layer.shadowRadius = 3
        view_tableView.layer.shadowOpacity = 0.5
    }
   private func configure_TableView() {
//        tableView.backgroundColor = .red
        tableView.isScrollEnabled = false
//        tableViewHeight = tableView.frame.size.height
//        tableViewHeight = tableView.frame.size.height
//        print("table view heifht is \(tableViewHeight)")
//        print("the height of table view is \(tableViewHeight)")
//        tableViewHeight = view_tableView.frame.size.height - 100 - 40
//        tableViewHeight = self.view.frame.size.height - 49 - view_payResult.frame.origin.y - view_payResult.frame.size.height - 28 - 100
//        tableView.frame = CGRect(x: 0, y: 60, width: view_tableView.frame.size.width, height: tableViewHeight)
//        tableView.contentSize = CGSize(width: tableView.frame.size.width, height: tableView.frame.size.height)
    }
    private func configure_moreParameters() {
        
//        lb_moreParameters.backgroundColor = .yellow
//        lb_moreParameters.frame = CGRect(x: view_tableView.frame.size.width/2.0 - lb_moreParameters.frame.size.width/2.0, y: view_tableView.frame.size.height - 40, width: view_tableView.frame.size.width, height: 40)
        
        lb_moreParameters.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(moreParamAct))
        tapGesture.numberOfTapsRequired = 1
        lb_moreParameters.addGestureRecognizer(tapGesture)
    }
   private  func cellCounts() -> Int {
        if moreParameters == false {
            
//            scrollView.contentInset = UIEdgeInsets.zero
//            scrollView.contentOffset = CGPoint(x: 0, y: 0)
//            configure_ViewTableView()
//            lb_moreParameters.frame = CGRect(x: view_tableView.frame.size.width/2.0 - lb_moreParameters.frame.size.width/2.0, y: view_tableView.frame.size.height - 40, width: lb_moreParameters.frame.size.width, height: lb_moreParameters.frame.size.height)
             halfrowCount = DataManagement.sharedInstance.flip_flipMax_InputTitleArray.count/2

            scrollView.isScrollEnabled = false
//            print("table view height is \(tableViewHeight) and cell count is \(halfrowCount) and estimated height is \(Int(Int(tableViewHeight)/halfrowCount))")
//
           
            return halfrowCount
        } else {
            scrollView.isScrollEnabled = true
//            scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: CGFloat(scrollView.frame.size.height + CGFloat((12-(tableViewHeight/44-5))*44)+20))
//            view_tableView.frame = CGRect(x: 10, y: 14, width: scrollView.frame.size.width - 20, height: scrollView.frame.size.height + CGFloat(12-(tableViewHeight/44-5)*44)-8)
//            lb_moreParameters.frame = CGRect(x: view_tableView.frame.size.width/2.0 - lb_moreParameters.frame.size.width/2.0, y: view_tableView.frame.size.height - 40, width: view_tableView.frame.size.width, height: 40)
            
//            tableView.contentSize = CGSize(width: tableView.frame.size.width,
//                                           height: CGFloat(tableViewHeight) + CGFloat((12-(tableViewHeight/44-5))*44))
//            scrollView.contentOffset = CGPoint(x: 0, y: Int((12-(tableViewHeight/44-5)) * 44)+20)
////            tableView.frame.size = tableView.contentSize
//            let indexPath = NSIndexPath(row: self.halfrowCount*2-1 , section: 0)
//            self.tableView.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: true)

            let rowCount = DataManagement.sharedInstance.flip_flipMax_InputTitleArray.count
            print("row coubnt is \(rowCount)")
            
            return rowCount
        }
    }
   private  func reloadTableView() {

        UIView.transition(with: tableView, duration: 0.4, options: UIView.AnimationOptions(rawValue: 5), animations: {
           
                
          self.tableView.reloadData()
        }, completion: nil)
    }
    @objc func moreParamAct() {
        if lb_moreParameters.text == "More parameters" {
            lb_moreParameters.text = "Less parameters"
            moreParameters = true
//            scrollView.contentInset = UIEdgeInsets.zero
//            scrollView.contentOffset = CGPoint(x: 0, y: 0)
            let height = tableViewHeight
            print(height)
            UIView.animate(withDuration: 0.4) {
                print("heihg constant is \(self.contentViewHeight.constant)")
                self.contentViewHeight.constant = self.contentViewHeight.constant + self.tableViewHeight
                print("tableview height after clicking on more paramters\(self.tableViewHeight) and height constant isx \(self.contentViewHeight.constant)")
//                let contentInsets = UIEdgeInsets(top:0.0, left:0.0, bottom:self.tableViewHeight, right:0.0)
//                self.scrollView.contentInset = contentInsets
                self.scrollView.contentOffset = CGPoint(x: 0, y: Int((self.tableViewHeight) ))
                
            }

//            let indexPath = NSIndexPath(row: self.halfrowCount*2-1 , section: 0)
//
//            self.tableView.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: true)
            //            tableView.frame.size = CGSize(width: tableView.frame.size.width,
            

          
           
        }
         else {
            moreParameters = false
            lb_moreParameters.text = "More parameters"
//             scrollView.contentOffset = CGPoint(x: 0, y:  tableView.frame.size.height)
//            let scrollPoint = CGPoint(x: 0, y: self.tableView.contentSize.height - self.tableView.frame.size.height)
//            self.tableView.setContentOffset(scrollPoint, animated: true)
            
//            let indexPath = NSIndexPath(row: self.halfrowCount*2-1 , section: 0)
//
//            self.tableView.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: true)
//            let height = tableViewHeight
            UIView.animate(withDuration: 0.4) {
//                print("tableview height after clicking on less paramters\(self.tableViewHeight)")
                self.contentViewHeight.constant = self.contentViewHeight.constant - self.tableViewHeight
                print("current size of tableiew")
                print(self.tableView.frame.size.height)
                print("tableview height after clicking on less paramters\(self.tableViewHeight) and height constant isx \(self.contentViewHeight.constant)")
                self.scrollView.contentInset = UIEdgeInsets.zero
                self.scrollView.contentOffset = CGPoint(x: 0, y: 0  )
                

            }
            
//            tableView.frame.size = CGSize(width: tableView.frame.size.width,
//                                         height: tableView.frame.size.height-CGFloat((12-(tableViewHeight/44-5))*44))
        }
        reloadTableView()
    }
    func showMaxOfferValue() {
        if segment_mode.selectedSegmentIndex == 0 {
            DataManagement.sharedInstance.flip_Flipping_FlipMaxCalculator_GetValueArray()
            let numComma = DataManagement.sharedInstance.addComma(number: Int(DataManagement.sharedInstance.flip_Flipping_FlipMaxCalculator_Values[9])!)
            lb_maxOfferValue.text = "$ \(numComma)"
        } else {
            DataManagement.sharedInstance.flip_Flipping_CashFlow_GetValueArray()
            let numComma = DataManagement.sharedInstance.addComma(number: Int(DataManagement.sharedInstance.flip_Flipping_CashFlow_Values[8])!)
            lb_maxOfferValue.text = "$ \(numComma)"
        }
    }
    @objc func detailAct() {
        DataManagement.sharedInstance.viewMode_Flip = "Detail"
        performSegue(withIdentifier: "DetailSegue", sender: nil)
    }
    //MARK: My Event Functions
    
    @IBAction func settingAct(_ sender: Any) {
        print("hello flip")
    }
    @IBAction func segmentValueChaned(_ sender: Any) {
        showMaxOfferValue()
        if segment_mode.selectedSegmentIndex == 0 {
             self.navigationItem.title = "Flip Max"
        } else {
            self.navigationItem.title = "Cash Flow"
        }
        let contentOffSetOfScrollview = scrollView.contentOffset
        tableView.reloadData()
        scrollView.contentOffset = contentOffSetOfScrollview
    }
    @IBAction func definitionAct(_ sender: Any) {
        DataManagement.sharedInstance.viewMode_Flip = "Definition"
        performSegue(withIdentifier: "DetailSegue", sender: nil)
    }
    @IBAction func logoLinkAct(_ sender: Any) {
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.chicagocashflow.com")!, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
    }

   // MARK: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               let count = 6
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("IPHONE 5,5S,5C")
                return CGFloat(Int(214)/count)
            case 1334:
                print("IPHONE 6,7,8 IPHONE 6S,7S,8S ")
                return CGFloat(Int(291.5)/count)
            case 1920, 2208:
                print("IPHONE 6PLUS, 6SPLUS, 7PLUS, 8PLUS")
                return CGFloat(Int(345)/count)
            case 2436:
                print("IPHONE X, IPHONE XS")
                return CGFloat(Int(346.3)/count)
            case 2688:
                print("IPHONE XS_MAX")

                return CGFloat(Int(412)/count)
            case 1792:
                print("IPHONE XR")
                return CGFloat(Int(412)/count)
            default:
                print("UNDETERMINED")
                return CGFloat(Int(tableViewHeight)/count)
            }
        }
        
        
        
        
        
        
        
//
        if count == halfrowCount{
            let c = CGFloat(count)
            print("the height of each row is  \(tableViewHeight/c)")
            return tableViewHeight/c

        }

        else{
            _ = CGFloat(DataManagement.sharedInstance.flip_flipMax_InputTitleArray.count)
//            print("table view heght is \(tableViewHeight/count)")
            return tableViewHeight/12
        }
}
//    func tableView(_ tableView: UITableView,heightForRowAt indexPath:IndexPath) -> CGFloat
//    {
//        return UITableView.automaticDimension
//    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return tableViewHeight/6
//    }
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        return UITableView.automaticDimension
////    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailSubView = segue.destination as! DetailViewController
        if segment_mode.selectedSegmentIndex == 0 {
            detailSubView.showTitleArray = DataManagement.sharedInstance.flip_Flipping_FlipMaxCalculator
            detailSubView.showValueArray = DataManagement.sharedInstance.flip_Flipping_FlipMaxCalculator_Values
        } else {
            detailSubView.showTitleArray = DataManagement.sharedInstance.flip_Flipping_CashFlow
            detailSubView.showValueArray = DataManagement.sharedInstance.flip_Flipping_CashFlow_Values
        }
    }

}

//MARK: UITableViewDataSource

extension FlipMainViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCounts()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FlipSliderTableViewCell
        var title = ""
        if segment_mode.selectedSegmentIndex == 0 {
            title = DataManagement.sharedInstance.flip_flipMax_InputTitleArray[indexPath.row]
        } else {
            title = DataManagement.sharedInstance.flip_cashFlow_InputTitleArray[indexPath.row]
        }
        let value = DataManagement.sharedInstance.flip_ValueArray[indexPath.row]
        cell.initWithData(parent: self, title: title, value: value, value_index: indexPath.row)
        return cell
    }
    
}
