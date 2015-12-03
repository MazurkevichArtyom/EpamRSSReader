//
//  TableNewsViewTableViewController.swift
//  tutbyNews
//
//  Created by Artyom Mazurkevich on 23/10/15.
//  Copyright © 2015 Artyom Mazurkevich. All rights reserved.
//

import UIKit


class TableNewsView : UITableViewController{
    
    var myParser = Parser()
    var news = [News]()
    var indexRow = 0
    var imageCache = [String:UIImage]()
    
    override func viewDidLoad() {
        let UrlString = NSURL(string: "http://news.tut.by/rss/index.rss")
        

        if (UrlString != nil){
            
            myParser.refreshNews(UrlString!)
        }
        news = myParser.news
            
        //http://deepapple.com/news/rss/rss.xml
        //http://news.tut.by/rss/index.rss
        //http://www.nytimes.com/services/xml/rss/nyt/World.xml
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as! NewsCell
        let newsToCell = news[indexPath.row]
        cell.textNews.text = newsToCell.descriptionNews
        cell.dateNews.text = newsToCell.dateNews
        cell.nameNews.text = newsToCell.titleNews
        cell.pictureNews.image = UIImage(named: "e6506d85fdbbe181e04d9ceaf2b8f5ea.jpg")
        cell.indexTag = indexPath.row
        let queue: dispatch_queue_t = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)
        
        if let newsImage = imageCache[newsToCell.imageLinkNews]{
            cell.pictureNews.image = newsImage

        }
        else{
            dispatch_async(queue, { () -> Void in
                if (newsToCell.imageLinkNews.hasSuffix(".jpg") || newsToCell.imageLinkNews.hasSuffix(".png") || newsToCell.imageLinkNews.hasSuffix(".gif")){
            
            let urlPict = NSURL(string: newsToCell.imageLinkNews)
            if let newsImage = UIImage(data: NSData(contentsOfURL: urlPict!)!){
                self.imageCache[newsToCell.imageLinkNews]=newsImage
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if (cell.indexTag == indexPath.row){
                        cell.pictureNews.image = newsImage
                        }
                    })
                    }
                }
            })
        }

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "goToNews"){
            if let nextVC = segue.destinationViewController as? NewsViewController{
                let index = self.tableView.indexPathForSelectedRow;
                nextVC.news = news[index!.row]
            }
        }
    }
    
    @IBAction func goToHome(segue: UIStoryboardSegue){
        
    }
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
