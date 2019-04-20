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
    
//    var viewTabBar:UIView = {
//        let viewTabBar = UIView()
//        viewTabBar.backgroundColor = UIColor.clear
//        viewTabBar.translatesAutoresizingMaskIntoConstraints = false
//
//        return viewTabBar
//    }()
//    var viewTabBar = UIView()
    var greenBtn : UIButton = {
        let greenBtn = UIButton()
        greenBtn.setTitle("Flip", for: .normal)
//        greenBtn.titleLabel?.font = UIFont(.boldSystemFont(ofSize: 20)
        print("the gotham font is \(String(describing: UIFont(name: "Gotham-Black", size: CGFloat(20))))")
        greenBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))

        greenBtn.backgroundColor = UIColor.clear
        greenBtn.tintColor = UIColor.clear
        greenBtn.setBackgroundImage(UIImage(named: "green.png"), for: .normal)
        greenBtn.setTitleColor(UIColor.black, for: .normal)
//        greenBtn.setTitleColor(UIColor.white, for: UIControl.State.init(rawValue: 1))
        greenBtn.addTarget(self, action: #selector(toFlip), for: UIControl.Event.init(rawValue: 3))

        return greenBtn
    }()
    
    var yellowBtn : UIButton = {
        let yellowBtn = UIButton()
        yellowBtn.setTitle("Rental", for: UIControl.State.init(rawValue: 0))
        yellowBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))
        yellowBtn.setBackgroundImage(UIImage(named: "yellow.png"), for: .normal)
        yellowBtn.setTitleColor(UIColor.lightGray, for: .normal)
//        yellowBtn.setTitleColor(UIColor.white, for: UIControl.State.init(rawValue: 1))
        yellowBtn.addTarget(self, action: #selector(toRental), for: UIControl.Event.init(rawValue: 3))
        yellowBtn.backgroundColor = UIColor.clear
        yellowBtn.tintColor = UIColor.clear
        return yellowBtn
    }()
    
    var purpleBtn : UIButton = {
        let purpleBtn = UIButton()
        purpleBtn.setTitle("Rehab", for: .normal)
        purpleBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))

        purpleBtn.setBackgroundImage(UIImage(named: "purple.png"), for: .normal)
        purpleBtn.setTitleColor(UIColor.lightGray, for: .normal)
//        purpleBtn.setTitleColor(UIColor.white, for: UIControl.State.init(rawValue: 1))
        purpleBtn.addTarget(self, action: #selector(toRehab), for: UIControl.Event.init(rawValue: 3))
        
        return purpleBtn
    }()
    
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
     
//
//        viewTabBar = UIView(frame: CGRect(x: 0, y: DataManagement.sharedInstance.windowSize.height - 60, width: DataManagement.sharedInstance.windowSize.width, height: 60))
//
//        viewTabBar.backgroundColor = UIColor.clear
        guard let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
         else{
            print("returning")
            return
        }
            
        print(bottomPadding)

        
        let stackView = UIStackView(arrangedSubviews: [greenBtn,yellowBtn,purpleBtn])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
//        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor+bottomPadding).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 49+bottomPadding).isActive = true
        
//        greenBtn = UIButton(frame: CGRect(x: 0, y: 0, width: DataManagement.sharedInstance.windowSize.width/3, height: 60))
//        greenBtn.setTitle("Flip", for: .normal)
//        greenBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        greenBtn.backgroundColor = UIColor.clear
//        greenBtn.tintColor = UIColor.clear
//        greenBtn.setBackgroundImage(UIImage(named: "green.png"), for: .normal)
//        greenBtn.setTitleColor(UIColor.black, for: .normal)
//        greenBtn.setTitleColor(UIColor.white, for: UIControl.State.init(rawValue: 1))
//        greenBtn.addTarget(self, action: #selector(toFlip), for: UIControl.Event.init(rawValue: 3))
        
//        yellowBtn = UIButton(frame: CGRect(x: DataManagement.sharedInstance.windowSize.width/3, y: 0, width: DataManagement.sharedInstance.windowSize.width/3, height: 60))
//        yellowBtn.setTitle("Rental", for: UIControl.State.init(rawValue: 0))
//        yellowBtn.setBackgroundImage(UIImage(named: "yellow.png"), for: .normal)
//        yellowBtn.setTitleColor(UIColor.lightGray, for: .normal)
//        yellowBtn.setTitleColor(UIColor.white, for: UIControl.State.init(rawValue: 1))
//        yellowBtn.addTarget(self, action: #selector(toRental), for: UIControl.Event.init(rawValue: 3))
//        yellowBtn.backgroundColor = UIColor.clear
//        yellowBtn.tintColor = UIColor.clear
        
//        purpleBtn = UIButton(frame: CGRect(x: DataManagement.sharedInstance.windowSize.width*2/3, y: 0, width: DataManagement.sharedInstance.windowSize.width/3, height: 60))
//        purpleBtn.setTitle("Rehab", for: .normal)
//        purpleBtn.setBackgroundImage(UIImage(named: "purple.png"), for: .normal)
//        purpleBtn.setTitleColor(UIColor.lightGray, for: .normal)
//        purpleBtn.setTitleColor(UIColor.white, for: UIControl.State.init(rawValue: 1))
//        purpleBtn.addTarget(self, action: #selector(toRehab), for: UIControl.Event.init(rawValue: 3))
//
//        viewTabBar.addSubview(greenBtn)
//        viewTabBar.addSubview(yellowBtn)
//        viewTabBar.addSubview(purpleBtn)
//        self.view.addSubview(viewTabBar)
    }
    @objc func toFlip() {
        self.selectedIndex = 0
        greenBtn.setTitleColor(UIColor.black, for: .normal)
        greenBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))
        yellowBtn.setTitleColor(UIColor.lightGray, for: .normal)
        yellowBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))
        purpleBtn.setTitleColor(UIColor.lightGray, for: .normal)
        purpleBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))
    }
    @objc func toRental() {
        self.selectedIndex = 1
        greenBtn.setTitleColor(UIColor.lightGray, for: .normal)
        greenBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))
        yellowBtn.setTitleColor(UIColor.black, for: .normal)
        yellowBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))
        purpleBtn.setTitleColor(UIColor.lightGray, for: .normal)
        purpleBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))
    }
    @objc func toRehab() {
        self.selectedIndex = 2
        greenBtn.setTitleColor(UIColor.lightGray, for: .normal)
        greenBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))
        yellowBtn.setTitleColor(UIColor.lightGray, for: .normal)
        yellowBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))
        purpleBtn.setTitleColor(UIColor.black, for: .normal)
        purpleBtn.titleLabel?.font = UIFont(name: "Gotham-Bold", size: CGFloat(20))
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
