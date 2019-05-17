//
//  ThirdMainViewController.swift
//  FinacialAnalyzingApp
//
//  Created by pei on 2017-04-11.
//
//

import UIKit

class ThirdMainViewController: UIViewController {
    
    @IBOutlet weak var interior_btn: UIButton!
    @IBOutlet weak var exterior_btn: UIButton!
    @IBOutlet weak var plumbing_btn: UIButton!
    @IBOutlet weak var electrical_btn: UIButton!
    @IBOutlet weak var hvac_btn: UIButton!
    @IBOutlet weak var general_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initButtonFrames(button: interior_btn)
        initButtonFrames(button: exterior_btn)
        initButtonFrames(button: plumbing_btn)
        initButtonFrames(button: electrical_btn)
        initButtonFrames(button: hvac_btn)
        initButtonFrames(button: general_btn)
        
        DataManagement.sharedInstance.initRehabData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be 
    }
    
    @IBAction func logoLinkAct(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.chicagocashflow.com")!, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func initButtonFrames(button : UIButton) {
        button.layer.cornerRadius = 15
//        button.setTitleColor(UIColor(red: 11/255, green: 2/255, blue: 118/255, alpha: 1), for: .highlighted)
////        button.setBackgroundImage()
//        button.setImage(UIImage(named: "background.png"), for: .highlighted)
    }
    
    //MARK: My Event Action functions
    @IBAction func exterior_Act(_ sender: Any) {
        DataManagement.sharedInstance.fieldIndex = 0
        performSegue(withIdentifier: "detail", sender: nil)
    }
    @IBAction func interior_Act(_ sender: Any) {
        DataManagement.sharedInstance.fieldIndex = 1
        performSegue(withIdentifier: "detail", sender: nil)
    }
    @IBAction func plumbing_Act(_ sender: Any) {
        DataManagement.sharedInstance.fieldIndex = 2
        performSegue(withIdentifier: "detail", sender: nil)
    }
    @IBAction func electrical_Act(_ sender: Any) {
        DataManagement.sharedInstance.fieldIndex = 3
        performSegue(withIdentifier: "detail", sender: nil)
    }
    @IBAction func hvac_Act(_ sender: Any) {
        DataManagement.sharedInstance.fieldIndex = 4
        performSegue(withIdentifier: "detail", sender: nil)
    }
    @IBAction func general_Act(_ sender: Any) {
        DataManagement.sharedInstance.fieldIndex = 5
        performSegue(withIdentifier: "detail", sender: nil)
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
