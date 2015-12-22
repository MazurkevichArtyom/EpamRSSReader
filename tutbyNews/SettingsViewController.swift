//
//  SettingsViewController.swift
//  tutbyNews
//
//  Created by Artyom Mazurkevich on 20/12/15.
//  Copyright © 2015 Artyom Mazurkevich. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var LabelToImg: UILabel!
    
    @IBOutlet var SwitchOnOff: UIView!
    
    @IBOutlet weak var LabelOnOff: UILabel!
    
    @IBOutlet weak var LabelBckgL: UILabel!
    
    @IBOutlet weak var Switch: UISwitch!
    
    @IBOutlet weak var ColorsPicker: UIPickerView!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var SetView: UIView!
    
    var colors = ["White", "Gray", "Yellow", "Green", "Red", "Blue"]
    
    override func viewDidLoad() {
        
        let value = UIInterfaceOrientation.Portrait.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        
        super.viewDidLoad()
        
        Switch.setOn(defaults.boolForKey("imgFlag"), animated: true)
        ColorsPicker.delegate = self
        ColorsPicker.dataSource = self
        let numb = defaults.integerForKey("BcgColor")
        SetView.backgroundColor = setBcgColor(numb)
        // Do any additional setup after loading the view.
    }
    @IBAction func imgOnOff(sender: UISwitch) {
        if sender.on{
            defaults.setBool(true, forKey: "imgFlag")
        }
        else{
            defaults.setBool(false, forKey: "imgFlag")
        }
    }
    
    @IBAction func cleanCache(sender: UIButton) {
        
        let alert = UIAlertController(title: "Clean cache", message: "Do you want clean caache?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {
            (action) -> Void in
            var cach : Cache
            cach = AppDelegate.getCache()
            cach.clear()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: {
            (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
     //   self.presentViewController(alert, animated: true, completion: nil)
        
        sender.setImage(UIImage(named: "delCache"), forState: .Highlighted)
        
        var cach : Cache
        cach = AppDelegate.getCache()
        cach.clear()
    }

    override func didReceiveMemoryWarning() {
        
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return colors.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        defaults.setInteger(row, forKey: "BcgColor")
        SetView.backgroundColor = setBcgColor(row)
        defaults.synchronize()
        //ColorsPicker.hidden = true;
    }
    
    
    override func shouldAutorotate() -> Bool {
        
        return true
    }
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        
         return UIInterfaceOrientationMask.Portrait
    }
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return UIInterfaceOrientation.Portrait
    }
    
    func setBcgColor(type: Int)->UIColor{
        
        if type == 0{
            return UIColor.whiteColor()
        }
        else if type == 1{
            return UIColor.grayColor()
        }
        else if type == 2{
            return UIColor.yellowColor()
        }
        else if type == 3{
            return UIColor.greenColor()
        }
        else if type == 4{
            return UIColor.redColor()
        }
        else{
            return UIColor.blueColor()
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}