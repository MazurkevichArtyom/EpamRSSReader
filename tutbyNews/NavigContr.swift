//
//  NavigContr.swift
//  tutbyNews
//
//  Created by Artyom Mazurkevich on 22/12/15.
//  Copyright © 2015 Artyom Mazurkevich. All rights reserved.
//

import UIKit

class NavigContr: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension NavigContr {
    
    override func shouldAutorotate() -> Bool {
        return visibleViewController!.shouldAutorotate()
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return visibleViewController!.supportedInterfaceOrientations()
    }
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return visibleViewController!.preferredInterfaceOrientationForPresentation()
    }
    
    
}
