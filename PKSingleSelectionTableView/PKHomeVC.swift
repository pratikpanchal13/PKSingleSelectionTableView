//
//  PKHomeVC.swift
//  PKSingleSelectionTableView
//
//  Created by indianic on 29/03/17.
//  Copyright © 2017 pratik. All rights reserved.
//

import UIKit

class PKHomeVC: UIViewController {

    public var inedexPass = Int()

    @IBOutlet weak var btnClickeMe: UIButton!


    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getIndexWithValue), name: NSNotification.Name("notify"), object: nil)
    }
    
    //MARK: - Get Notification
    func getIndexWithValue(notification : NSNotification)
    {
        let UserData = notification.object as! NSDictionary
        inedexPass = (UserData["indexPath"])! as! Int

        if let value:Int = inedexPass
        {
            btnClickeMe.setTitle("\((UserData["Data"])!)", for: UIControlState.normal)
        }
    }
    
    //MARK: - Button Action
    @IBAction func btnClickMeOpen(_ sender: Any) {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let objPKSingleSelectionVC:PKSingleSelectionVC = storyboard.instantiateViewController(withIdentifier: "PKSingleSelectionVC") as! PKSingleSelectionVC
        
        objPKSingleSelectionVC.objHomeVCData=inedexPass // If you want to pass value
    
        if let returnValue = UserDefaults.standard.object(forKey: "indexPath") as? Int {
            objPKSingleSelectionVC.objHomeVCData = returnValue
        }
        
        let screenSize: CGRect = UIScreen.main.bounds
        objPKSingleSelectionVC.view.frame = CGRect(x: screenSize.origin.x, y: screenSize.origin.y, width: screenSize.width * 1, height: screenSize.height * 1)
        
        
        let transition = CATransition()
        transition.duration = 0.1
        //        transition.type = kCAAnimationPaced
        //        transition.subtype = kCATransitionFade
        
        self.view!.layer.add(transition, forKey: kCATransition)
        
        objPKSingleSelectionVC.willMove(toParentViewController: self)
        self.view.addSubview(objPKSingleSelectionVC.view)
        self.addChildViewController(objPKSingleSelectionVC)
        objPKSingleSelectionVC.didMove(toParentViewController: self)
    }



}
