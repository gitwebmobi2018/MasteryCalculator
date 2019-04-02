//
//  DetailViewController.swift
//  FinacialAnalyzingApp
//
//  Created by pei on 2017-05-05.
//
//

import UIKit
//import LUExpandableTableView

class DetailViewController: UIViewController, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var showValueArray: [String] = []
    var showTitleArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if DataManagement.sharedInstance.viewMode_Flip == "Definition" {
            tableView.isScrollEnabled = true
        } else {
            tableView.isScrollEnabled = false
        }
        
        backgroundImage.clipsToBounds = false
        backgroundImage.layer.masksToBounds = false
        backgroundImage.layer.shadowColor = UIColor.black.cgColor
        backgroundImage.layer.shadowRadius = 5
        backgroundImage.layer.shadowOpacity = 0.5
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoLinkAct(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.chicagocashflow.com")!, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DataManagement.sharedInstance.viewMode_Flip == "Definition"{
            let font  = UIFont(name: "Helvetica", size: 15)
            let height = 44 + self.heightForView(text: DataManagement.sharedInstance.flip_Definitions_content[indexPath.row], font: font!, width: self.view.frame.size.width - 33)
            return height
        } else {
            return 44
        }
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    //MARK: MyFunctions
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }

}

extension DetailViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if DataManagement.sharedInstance.viewMode_Flip == "Definition" {
            return DataManagement.sharedInstance.flip_Definitions_Tilte.count
        } else {
            return showTitleArray.count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if DataManagement.sharedInstance.viewMode_Flip == "Definition" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefinitionCell", for: indexPath) as! DefinitionTableViewCell
            
            cell.initWithData(title: DataManagement.sharedInstance.flip_Definitions_Tilte[indexPath.row], content: DataManagement.sharedInstance.flip_Definitions_content[indexPath.row])
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            cell.textLabel?.text = showTitleArray[indexPath.row]
            cell.textLabel?.layer.shadowColor = UIColor.white.cgColor
            cell.textLabel?.layer.shadowOffset = CGSize(width: 0, height: 2)
            cell.textLabel?.layer.shadowOpacity = 1
            cell.textLabel?.layer.shadowRadius = 1
            
            let numComma = DataManagement.sharedInstance.addComma(number: Int(showValueArray[indexPath.row])!)
            cell.detailTextLabel?.text = "$\(numComma)"
            cell.detailTextLabel?.layer.shadowColor = UIColor.white.cgColor
            cell.detailTextLabel?.layer.shadowOffset = CGSize(width: 0, height: 2)
            cell.detailTextLabel?.layer.shadowOpacity = 1
            cell.detailTextLabel?.layer.shadowRadius = 1
            
            return cell
        }
    }
}
