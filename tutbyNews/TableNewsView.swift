//
//  TableNewsViewTableViewController.swift
//  tutbyNews
//
//  Created by Artyom Mazurkevich on 23/10/15.
//  Copyright © 2015 Artyom Mazurkevich. All rights reserved.
//

import UIKit


class TableNewsView : UITableViewController{//, NSXMLParserDelegate{
    
    
    var myParser = Parser()
    var news = [News]()
    /*var xmlPaeser : NSXMLParser!
    //http://www.theverge.com/rss/frontpage
    //http://www.nytimes.com/services/xml/rss/nyt/World.xml
    let UrlString = NSURL(string: "http://news.tut.by/rss/index.rss")
    func refreshNews() {
        self.xmlPaeser = NSXMLParser(contentsOfURL: UrlString!)
        self.xmlPaeser.delegate = self
        self.xmlPaeser.parse()
    }
    
    var news = [News]()
    
    var entryTitle = ""
    var entryLink = ""
    var entryImage = ""
    var entryDescription = ""
    var entryCategory = ""
    var entryPubDate = ""
    
    var currentParsedElement = String()
    
    var weAreInsideAnItem = false
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]){
        
        if (elementName == "item") {
            weAreInsideAnItem = true
        }
        if weAreInsideAnItem {
            switch elementName{
                
            case "title":
                entryTitle = String()
                currentParsedElement = "title"
                
            case "link":
                entryLink = String()
                currentParsedElement = "link"
                
            case "description":
                entryDescription = String()
                currentParsedElement = "description"
                
            case "category":
                entryCategory = String()
                currentParsedElement = "category"
                
            case "enclosure":
                entryImage = attributeDict["url"] as String!
                currentParsedElement = "enclosure"
                
            case "pubDate":
                entryPubDate = String()
                currentParsedElement = "pubDate"
                
            default :break
            }
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if weAreInsideAnItem {
            
            switch currentParsedElement{
                
            case "title":
                entryTitle = entryTitle + string
                
            case "link":
                entryLink = entryLink + string
                
            case "description":
                entryDescription = entryDescription + string
                
            case "category":
                entryCategory = entryCategory + string
                
            case "enclosure":
                entryImage = entryImage + string
                
            case "pubDate":
                entryPubDate = entryPubDate + string
                
            default: break
            }
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if weAreInsideAnItem {
            
            switch elementName{
                
            case "title":
                currentParsedElement = ""
                
            case "link":
                currentParsedElement = ""
                
            case "description":
                currentParsedElement = ""
                
            case "category":
                currentParsedElement = ""
                
            case "enclosure":
                currentParsedElement = ""
                
            case "pubDate":
                currentParsedElement = ""
                
            default: break
            }
            
            if elementName == "item"{
                let entryNews = News()
                entryNews.titleNews = entryTitle
                entryNews.linkNews = entryLink
                entryNews.descriptionNews = entryDescription.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "",options: .RegularExpressionSearch, range: nil)
                entryNews.categoryNews = entryCategory
                entryNews.imageLinkNews = entryImage
                entryNews.dateNews = entryPubDate
                
                news.append(entryNews)
                weAreInsideAnItem = false
            }
            
        }
    }
    
    func parserDidEndDocument(parser: NSXMLParser){
        //print(news[0].titleNews)
        //print(news[0].categoryNews)
        // print(news[0].dateNews)
        print(news[0].descriptionNews)
        //  print(news[0].linkNews)
        print(news[0].imageLinkNews)
        print(news[1].imageLinkNews)
        print(news[2].imageLinkNews)
    }
*/
    
    
    override func viewDidLoad() {
        let UrlString = NSURL(string: "http://news.tut.by/rss/index.rss")
        if (UrlString != nil){
            myParser.refreshNews(UrlString!)
            news = myParser.news
        }
        //refreshNews()
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
        if (newsToCell.imageLinkNews.hasSuffix("jpg") || newsToCell.imageLinkNews.hasSuffix("jpg") || newsToCell.imageLinkNews.hasSuffix("gif")){
            let urlPict = NSURL(string: newsToCell.imageLinkNews)
            if let newsImage = UIImage(data: NSData(contentsOfURL: urlPict!)!){
                cell.pictureNews.image = newsImage
            }
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
