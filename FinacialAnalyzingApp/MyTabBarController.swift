//
//  MyTabBarController.swift
//  FinacialAnalyzingApp
//
//  Created by pei on 2017-05-12.
//
//

import UIKit

class MyTabBarController: UITabBarController {
    
    let btnWidth = DataManagement.sharedInstance.windowSize.width/3
    
    var viewTabBar = UIView ()
    var greenBtn = UIButton()
    var yellowBtn = UIButton()
    var purpleBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView() {
        
        viewTabBar = UIView(frame: CGRect(x: 0, y: DataManagement.sharedInstance.windowSize.height - 49, width: DataManagement.sharedInstance.windowSize.width, height: 49))
        viewTabBar.backgroundColor = UIColor.clear
        
        greenBtn = UIButton(frame: CGRect(x: 0, y: 0, width: DataManagement.sharedInstance.windowSize.width/3, height: 49))
        greenBtn.setTitle("Flip", for: .normal)
        greenBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        greenBtn.backgroundColor = UIColor.clear
        greenBtn.tintColor = UIColor.clear
        greenBtn.setBackgroundImage(UIImage(named: "green.png"), for: .normal)
        greenBtn.setTitleColor(UIColor.black, for: .normal)
        greenBtn.setTitleColor(UIColor.white, for: UIControlState.init(rawValue: 1))
        greenBtn.addTarget(self, action: #selector(toFlip), for: UIControlEvents.init(rawValue: 3))
        
        yellowBtn = UIButton(frame: CGRect(x: DataManagement.sharedInstance.windowSize.width/3, y: 0, width: DataManagement.sharedInstance.windowSize.width/3, height: 49))
        yellowBtn.setTitle("Rental", for: UIControlState.init(rawValue: 0))
        yellowBtn.setBackgroundImage(UIImage(named: "yellow.png"), for: .normal)
        yellowBtn.setTitleColor(UIColor.lightGray, for: .normal)
        yellowBtn.setTitleColor(UIColor.white, for: UIControlState.init(rawValue: 1))
        yellowBtn.addTarget(self, action: #selector(toRental), for: UIControlEvents.init(rawValue: 3))
        yellowBtn.backgroundColor = UIColor.clear
        yellowBtn.tintColor = UIColor.clear
        
        purpleBtn = UIButton(frame: CGRect(x: DataManagement.sharedInstance.windowSize.width*2/3, y: 0, width: DataManagement.sharedInstance.windowSize.width/3, height: 49))
        purpleBtn.setTitle("Rehab", for: .normal)
        purpleBtn.setBackgroundImage(UIImage(named: "purple.png"), for: .normal)
        purpleBtn.setTitleColor(UIColor.lightGray, for: .normal)
        purpleBtn.setTitleColor(UIColor.white, for: UIControlState.init(rawValue: 1))
        purpleBtn.addTarget(self, action: #selector(toRehab), for: UIControlEvents.init(rawValue: 3))
        
        viewTabBar.addSubview(greenBtn)
        viewTabBar.addSubview(yellowBtn)
        viewTabBar.addSubview(purpleBtn)
        self.view.addSubview(viewTabBar)
    }
    func toFlip() {
        self.selectedIndex = 0
        greenBtn.setTitleColor(UIColor.black, for: .normal)
        greenBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        yellowBtn.setTitleColor(UIColor.lightGray, for: .normal)
        yellowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        purpleBtn.setTitleColor(UIColor.lightGray, for: .normal)
        purpleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }
    func toRental() {
        self.selectedIndex = 1
        yellowBtn.setTitleColor(UIColor.black, for: .normal)
        yellowBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        greenBtn.setTitleColor(UIColor.lightGray, for: .normal)
        greenBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        purpleBtn.setTitleColor(UIColor.lightGray, for: .normal)
        purpleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }
    func toRehab() {
        self.selectedIndex = 2
        purpleBtn.setTitleColor(UIColor.black, for: .normal)
        purpleBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        yellowBtn.setTitleColor(UIColor.lightGray, for: .normal)
        yellowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        greenBtn.setTitleColor(UIColor.lightGray, for: .normal)
        greenBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
