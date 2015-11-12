//
//  WebNewsViewViewController.swift
//  tutbyNews
//
//  Created by Artyom Mazurkevich on 12/11/15.
//  Copyright © 2015 Artyom Mazurkevich. All rights reserved.
//

import UIKit

class WebNewsViewViewController: UIViewController {
    
    var urlString = ""
    @IBOutlet weak var newsWebPage: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = NSURL(string: urlString) {
            let reqNsURL = NSURLRequest(URL: url)
            newsWebPage.loadRequest(reqNsURL)
        }
        

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
