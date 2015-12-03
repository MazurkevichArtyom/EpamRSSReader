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
    
    @IBOutlet weak var NewsView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleOfNews: UINavigationItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.scrollView.delegate = self
        self.scrollView.frame = UIScreen.mainScreen().bounds
        
        titleOfNews.title = news.titleNews
        
        let subView = UIView()
        subView.translatesAutoresizingMaskIntoConstraints = false;
        
        let topConstr = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: -30)
        let bottom = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        let right = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0)
        let left = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0)
        let width =  NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: UIScreen.mainScreen().bounds.width)
        
        scrollView.addSubview(subView)
        
        scrollView.addConstraints([topConstr, bottom, left, right, width])
        
        
        let title = UILabel()
        title.numberOfLines = 0
        title.font = UIFont.monospacedDigitSystemFontOfSize(18, weight: 2)
        title.text=news.titleNews
        title.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        title.adjustsFontSizeToFitWidth = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstrl = NSLayoutConstraint(item: title, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 10)
        let leftConstrl = NSLayoutConstraint(item: title, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10)
        let rightConstrl = NSLayoutConstraint(item: title, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10)
        
        subView.addSubview(title)
        subView.addConstraints([topConstrl,leftConstrl,rightConstrl])
        
        
        let category = UILabel()
        category.numberOfLines = 0
        category.font = UIFont.monospacedDigitSystemFontOfSize(17, weight: 2)
        category.text=news.categoryNews
        category.translatesAutoresizingMaskIntoConstraints = false
        
        subView.addSubview(category)
        
        
        let topCat = NSLayoutConstraint(item: category, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: title, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10)
        let leftCat = NSLayoutConstraint(item: category, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10)
        let widthCat = NSLayoutConstraint(item: category, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Width, multiplier: 0.5, constant: 0)
        subView.addConstraints([topCat, leftCat, widthCat])
        
        
        let dateNews = UILabel()
        dateNews.numberOfLines = 0
        dateNews.font = UIFont.italicSystemFontOfSize(16)
        dateNews.adjustsFontSizeToFitWidth = true
        dateNews.text=news.dateNews
        dateNews.translatesAutoresizingMaskIntoConstraints = false
        
        subView.addSubview(dateNews)
        
        let topDate = NSLayoutConstraint(item: dateNews, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: title, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10)
        let lefDate = NSLayoutConstraint(item: dateNews, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: category, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 10)
        let rightDate = NSLayoutConstraint(item: dateNews, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10)
        subView.addConstraints([topDate, lefDate, rightDate])
        
        
        
        let text = UILabel()
        text.numberOfLines = 0
        text.font = UIFont.monospacedDigitSystemFontOfSize(16, weight: 0)
        text.text=news.descriptionNews
        text.translatesAutoresizingMaskIntoConstraints = false
        
        subView.addSubview(text)
        
        let topText = NSLayoutConstraint(item: text, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: dateNews, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10)
        let lefText = NSLayoutConstraint(item: text, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10)
        let rightText = NSLayoutConstraint(item: text, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10)
        
        subView.addConstraints([topText, lefText, rightText])
        
        if (news.mediaContent.count==0){
            let bottomDesC =  NSLayoutConstraint(item: text, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10)
            subView.addConstraint(bottomDesC)
        }
        
        let queue: dispatch_queue_t = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)
        
        var prevImg : UIView? = nil
        for link in self.news.mediaContent{
            if ((link.hasSuffix(".jpg") || link.hasSuffix(".png") || link.hasSuffix(".gif")) && link.containsString("knopka")==false){
                
                let image = UIImageView()
                image.translatesAutoresizingMaskIntoConstraints = false
                image.backgroundColor = UIColor.grayColor()
                
                dispatch_async(queue, { () -> Void in
                    
                    if let imageData = NSData(contentsOfURL: NSURL(string: link)!){
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            image.image=UIImage(data: imageData)
                        })
                    }
                })
                subView.addSubview(image)
                
                let imgHeight =  NSLayoutConstraint(item: image, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 300)
                
                let imgLeft =  NSLayoutConstraint(item: image, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10)
                
                let imgRight =  NSLayoutConstraint(item: image, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10)
                
                subView.addConstraints([imgHeight, imgLeft, imgRight])
                if(prevImg == nil) {
                    let topC =  NSLayoutConstraint(item: image, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: text, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10)
                    subView.addConstraint(topC);
                }
                else {
                    let topC =  NSLayoutConstraint(item: image, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: prevImg, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10)
                    subView.addConstraint(topC);
                }
                
                prevImg = image;
            }
        }
        
        if(prevImg != nil){
            let bottomC =  NSLayoutConstraint(item: prevImg!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: subView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10)
            subView.addConstraint(bottomC)
        }
        
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
    }*/
}


