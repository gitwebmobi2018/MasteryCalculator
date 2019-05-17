//
//  RootViewController.swift
//  FinacialAnalyzingApp
//
//  Created by pei on 2017-05-02.
//
//

import UIKit
import paper_onboarding

class RootViewController: UIViewController {

    @IBOutlet weak var start_btn: UIButton!
    @IBOutlet weak var onboarding_view: PaperOnboarding!
    
    let textfont = UIFont(name: "Gotham-Bold", size: CGFloat(25)) ?? UIFont.systemFont(ofSize: 25)
    let descriptionFont = UIFont(name: "Gotham-Bold", size: CGFloat(17)) ?? UIFont.systemFont(ofSize: 17)
    let textColor = UIColor.white
    let descriptionColor = UIColor.white
    
    let flipBackgroundColor = UIColor(red: 197/255, green: 225/255, blue: 138/255, alpha: 1)
    let flipImage = UIImage(named: "flipImage.png")
    let flipIcon = UIImage(named: "Icon.png")
    
    let rentalBackgroundColor = UIColor(red: 248/255, green: 221/255, blue: 131/255, alpha: 1)
    let rentalImage = UIImage(named: "rentalImage.png")
    let rentalIcon = UIImage(named: "Icon.png")
    
    let rehabBackgroundColor = UIColor(red: 176/255, green: 178/255, blue: 249/255, alpha: 1)
    let rehabImage = UIImage(named: "rehabImage.png")//cashImage.png
    let rehabIcon = UIImage(named: "Icon.png")
    
    
//    let onboarding = PaperOnboarding()
//    onboarding.dataSource = self
//    onboarding.translatesAutoresizingMaskIntoConstraints = false
//    view.addSubview(onboarding)
//
//    // add constraints
//    for attribute: NSLayoutAttribute in [.Left, .Right, .Top, .Bottom] {
//    let constraint = NSLayoutConstraint(item: onboarding,
//    attribute: attribute,
//    relatedBy: .Equal,
//    toItem: view,
//    attribute: attribute,
//    multiplier: 1,
//    constant: 0)
//    view.addConstraint(constraint)
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboarding_view.dataSource=self
        onboarding_view.delegate = self
        
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        
        // Do any additional setup after loading the view.
//        onboarding.dataSource = self
//        onboarding.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(onboarding)
//
//        // add constraints
//        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
//            let constraint = NSLayoutConstraint(item: onboarding,
//                                                attribute: attribute,
//                                                relatedBy: .equal,
//                                                toItem: view,
//                                                attribute: attribute,
//                                                multiplier: 1,
//                                                constant: 0)
//            view.addConstraint(constraint)
//        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.start_btn.layer.opacity = 0.0
        start_btn.isEnabled = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func checking() {
        
        let dateFormatter = DateFormatter()
        var timezoneName: String { return TimeZone.current.identifier }
        dateFormatter.timeZone = TimeZone(identifier: timezoneName)
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let currentDate = Date()
        
        let toDateStr = "06/13/2017"
        let toDate = dateFormatter.date(from: toDateStr)
        
        if currentDate > toDate! {
            DataManagement.sharedInstance.expired = true
        }
    }
    @IBAction func startCalculating(_ sender: Any) {
        
        performSegue(withIdentifier: "startSegue", sender: nil)
        
//        let userDefaults = UserDefaults.standard
//        let isEnteredWithPWD = userDefaults.string(forKey: "pwd")
//        if isEnteredWithPWD == "yes" {
//            
//        } else {
//            let alertController = UIAlertController(title: nil, message: "Input Password", preferredStyle: .alert)
//            alertController.addTextField { ( textField ) in
//                textField.placeholder = "password"
//                textField.returnKeyType = .done
//                textField.isSecureTextEntry = true
//            }
//            let actionOK = UIAlertAction(title: "Done", style: .default) { (UIAlertAction) in
//                if alertController.textFields?[0].text == "Mastery257" {
//                    self.performSegue(withIdentifier: "startSegue", sender: nil)
//                    userDefaults.set("yes", forKey: "pwd")
//                } else if alertController.textFields?[0].text == "" {
//                    self.presentSubErrorAlert(txt: "Please input password!")
//                } else {
//                    self.presentSubErrorAlert(txt: "Inputted password is not correct!")
//                }
//            }
//            alertController.addAction(actionOK)
//            present(alertController, animated: true, completion: nil)
//        }
    }
    
    func presentSubErrorAlert(txt: String) {
        let alertSubController = UIAlertController(title: "Warning!", message: txt, preferredStyle: .alert)
        let actionSubOK = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alertSubController.addAction(actionSubOK)
        self.present(alertSubController, animated: true, completion: nil)
    }
}

extension RootViewController : PaperOnboardingDataSource,PaperOnboardingDelegate {
    func onboardingItemsCount() -> Int {
        return 4
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return [
            OnboardingItemInfo(informationImage: flipImage!, title: "Flipping For A Living", description: "This is a Max Flip Offer calculator. Helps mastery students put in their expected ARV, rehab costs, carrying, selling costs and profit margin to determine the Max Offer Price. A quick and easy way of running your numbers and pretty accurate guideline when making offers on flips.", pageIcon: flipIcon!, color: flipBackgroundColor, titleColor: textColor, descriptionColor: descriptionColor, titleFont: textfont, descriptionFont: descriptionFont),
            OnboardingItemInfo(informationImage: rentalImage!, title: "Cash Flow For Life", description: "This a rental cash flow calculator designed using the refi model to come up with a cash on cash return, monthly cash flow, and Andrew's Ratio.", pageIcon: rentalIcon!, color: rentalBackgroundColor, titleColor: textColor, descriptionColor: descriptionColor, titleFont: textfont, descriptionFont: descriptionFont),
            OnboardingItemInfo(informationImage: rehabImage!, title: "Rehab", description: "It is designed to help you estimate rehab costs.", pageIcon: rehabIcon!, color: rehabBackgroundColor, titleColor: textColor, descriptionColor: descriptionColor, titleFont: textfont, descriptionFont: descriptionFont),
            OnboardingItemInfo(informationImage: rehabIcon!, title: "", description: "", pageIcon: rehabIcon!, color:UIColor.blue , titleColor: textColor, descriptionColor: descriptionColor, titleFont: textfont, descriptionFont: descriptionFont)
            
        ][index]
      
//
    }
    
//    func onboardingItem(at index: Int) -> OnboardingItemInfo {
//        return [(flipImage! , "Flipping For A Living", "This is a Max Flip Offer calculator. Helps mastery students put in their expected ARV, rehab costs, carrying, selling costs and profit margin to determine the Max Offer Price. A quick and easy way of running your numbers and pretty accurate guideline when making offers on flips.", flipIcon!, flipBackgroundColor, textColor,  descriptionColor, textfont, descriptionFont),
//                (rentalImage!, "Cash Flow For Life", "This a rental cash flow calculator designed using the refi model to come up with a cash on cash return, monthly cash flow, and Andrew's Ratio.", rentalIcon!, rentalBackgroundColor, textColor, descriptionColor, textfont, descriptionFont),
//                (rehabImage!, "Rehab", "It is designed to help you estimate rehab costs.", rehabIcon!, rehabBackgroundColor, textColor, descriptionColor, textfont, descriptionFont),
//                (rehabIcon!, "", "", rehabIcon!, UIColor.blue, textColor, descriptionColor, textfont, descriptionFont)
//            ][index]
//    }
    
//    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
//        return [(flipImage! , "Flipping For A Living", "This is a Max Flip Offer calculator. Helps mastery students put in their expected ARV, rehab costs, carrying, selling costs and profit margin to determine the Max Offer Price. A quick and easy way of running your numbers and pretty accurate guideline when making offers on flips.", flipIcon!, flipBackgroundColor, textColor,  descriptionColor, textfont, descriptionFont),
//                (rentalImage!, "Cash Flow For Life", "This a rental cash flow calculator designed using the refi model to come up with a cash on cash return, monthly cash flow, and Andrew's Ratio.", rentalIcon!, rentalBackgroundColor, textColor, descriptionColor, textfont, descriptionFont),
//                (rehabImage!, "Rehab", "It is designed to help you estimate rehab costs.", rehabIcon!, rehabBackgroundColor, textColor, descriptionColor, textfont, descriptionFont),
//                (rehabIcon!, "", "", rehabIcon!, UIColor.blue, textColor, descriptionColor, textfont, descriptionFont)
//            ][index]
//    }
//    
//    func onboardingItemsCount() -> Int {
//        return 4
//
//    }
    func onboardingConfigurationItem(_: OnboardingContentViewItem, index : Int) {
        if index == 3 {
            UIView.animate(withDuration: 1.3, animations: {
                self.start_btn.layer.opacity = 1.0
            })
            start_btn.isEnabled = true
            onboarding_view.layer.opacity = 0.5
        } else {
            onboarding_view.layer.opacity = 1
            self.start_btn.layer.opacity = 0
            start_btn.isEnabled = false
        }
    }
    
   
}
