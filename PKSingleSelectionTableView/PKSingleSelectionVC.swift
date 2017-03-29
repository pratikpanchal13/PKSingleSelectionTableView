//
//  PKSingleSelectionVC.swift
//  PKSingleSelectionTableView
//
//  Created by indianic on 29/03/17.
//  Copyright © 2017 pratik. All rights reserved.
//

import UIKit

class PKSingleSelectionVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var objHomeVCData: Int = 0
    var selectedIndex: Int = 0

    public var invitedUsers:([String], _ index:Int)->() = {_ in}
    @IBOutlet weak var tblView: UITableView!
    var arrContent : [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        arrContent = ["Mac","Iphone","IWatch","IPad","IPod","IMac"]

    }

    override func viewWillAppear(_ animated: Bool) {
        
        print("objFirstVC \(objHomeVCData)")
        let indexPath = IndexPath(row: objHomeVCData, section: 0)
        tblView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
    }

    @IBAction func btnBackClicked(_ sender: Any) {
        
        
        self.willMove(toParentViewController: nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    
    @IBAction func btnDoneClicked(_ sender: Any) {
        
        
        UserDefaults.standard.set(selectedIndex, forKey: "indexPath")
        UserDefaults.standard.synchronize()
        
        
        let myDict = [ "Data": arrContent[selectedIndex], "indexPath":selectedIndex] as [String : Any]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notify"), object: myDict)
        
        self.willMove(toParentViewController: nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.willMove(toParentViewController: nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
        
    }

}

class Cell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    
}


extension PKSingleSelectionVC{
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell
        cell?.lblName.text = arrContent[indexPath.row]
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return arrContent.count
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let selectedCell:Cell = tableView.cellForRow(at: indexPath)! as! Cell
        //        selectedCell.contentView.backgroundColor = UIColor.lightGray
        self.invitedUsers([arrContent[indexPath.row]], indexPath.row) // Call back Block
        //
        //        UserDefaults.standard.set(indexPath.row, forKey: "indexPath")
        //        UserDefaults.standard.synchronize()
        
        
        selectedIndex = indexPath.row
        //        self.dismiss(animated: true, completion: nil)
        
        //        let myDict = [ "Data": arrContent[indexPath.row], "indexPath":indexPath.row] as [String : Any]
        //
        //
        //        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notify"), object: myDict)
        //
        //        self.willMove(toParentViewController: nil)
        //        self.view.removeFromSuperview()
        //        self.removeFromParentViewController()
        
        
    }
    
}

