//
//  NewsViewController.swift
//  tutbyNews
//
//  Created by Artyom Mazurkevich on 12/11/15.
//  Copyright © 2015 Artyom Mazurkevich. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,UIScrollViewDelegate{
    
    var news = News()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleOfNews: UINavigationItem!
    
    override func viewDidLoad() {
       
        titleOfNews.title = news.titleNews
        
        let title = UILabel(frame: CGRect(x: 7, y: -50, width: 400, height: 100))
        title.numberOfLines = 0
        title.font = UIFont.monospacedDigitSystemFontOfSize(18, weight: 2)
        title.text=news.titleNews
        scrollView.addSubview(title)
        
        
        let dateNews = UILabel(frame: CGRect(x: 227, y: -20, width: 150, height: 150))
        dateNews.numberOfLines = 0
        dateNews.font = UIFont.italicSystemFontOfSize(16)
        dateNews.text=news.dateNews
        scrollView.addSubview(dateNews)
        
        let text = UILabel(frame: CGRect(x: 7, y: 70, width: 400, height: 150))
        text.numberOfLines = 0
        text.font = UIFont.monospacedDigitSystemFontOfSize(16, weight: 0)
        text.text=news.descriptionNews
        scrollView.addSubview(text)
        
        let category = UILabel(frame: CGRect(x: 7, y: 40, width: 200, height: 20))
        category.numberOfLines = 0
        category.font = UIFont.monospacedDigitSystemFontOfSize(17, weight: 2)
        category.text=news.categoryNews
        scrollView.addSubview(category)
        
        var lengthToImg = 0
        
        
        let queue: dispatch_queue_t = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)
        
        for link in self.news.mediaContent{
            if (link.hasSuffix(".jpg") || link.hasSuffix(".png") || link.hasSuffix(".gif")){
                
                let image = UIImageView(frame: CGRect(x: 7, y: 270+lengthToImg, width: 400, height: 300))
                image.backgroundColor = UIColor.grayColor()
                
                lengthToImg+=310
                
                 dispatch_async(queue, { () -> Void in
                    
                    if let imageData = NSData(contentsOfURL: NSURL(string: link)!){
                        image.image=UIImage(data: imageData)
                    }
                })
                scrollView.addSubview(image)
                
            }
        }
        
        
        
        self.scrollView.contentSize = CGSize(width: 400, height: 310*(self.news.mediaContent.count+1))
        self.scrollView.delegate = self
        
        
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
