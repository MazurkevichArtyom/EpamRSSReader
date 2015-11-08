//
//  Parser.swift
//  tutbyNews
//
//  Created by Artyom Mazurkevich on 26/10/15.
//  Copyright © 2015 Artyom Mazurkevich. All rights reserved.
//

import UIKit

class Parser : NSXMLParser, NSXMLParserDelegate {
    
    var xmlPaeser : NSXMLParser!
    var news = [News]()
    
    func refreshNews(UrlString : NSURL) {
        self.xmlPaeser = NSXMLParser(contentsOfURL: UrlString)
        self.xmlPaeser.delegate = self
        self.xmlPaeser.parse()
    }
    
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
        print(news[22].descriptionNews)
        //  print(news[0].linkNews)
        print(news[22].imageLinkNews)
        
    }

    
}