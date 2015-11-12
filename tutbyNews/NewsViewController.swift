//
//  NewsViewController.swift
//  tutbyNews
//
//  Created by Artyom Mazurkevich on 12/11/15.
//  Copyright © 2015 Artyom Mazurkevich. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController{
    
    var news = News()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "goToWebPage"){
            if let webVC = segue.destinationViewController as? WebNewsViewViewController{
                let address = news.linkNews;
                webVC.urlString = address;
            }

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
