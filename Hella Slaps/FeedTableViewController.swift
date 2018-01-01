//
//  FeedTableViewController.swift
//  Hella Slaps
//
//  Created by Sean MacPherson on 3/9/16.
//  Copyright © 2016 loofy. All rights reserved.
//

import UIKit
import Foundation

class FeedTableViewController: UITableViewController, XMLParserDelegate {
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    var xmlParser : XMLParser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Navbar
        
        let attributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: "ArcaMajora-Heavy", size: 30)!
        ]
        
        self.navigationController!.hidesBarsOnSwipe = true
        
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        
        let image = UIImage(named: "HellaSlaps Icon.png")! as UIImage
        
        self.navigationController!.navigationBar.setBackgroundImage(image,
            forBarMetrics: .Default)
        //Register custom cell
        
        let nib = UINib(nibName: "PostTableCell", bundle: nil)
        
        self.tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        let url = NSURL(string: "http://www.hellaslaps.com/feed")
        xmlParser = XMLParser()
        xmlParser.delegate = self
        xmlParser.startParsingWithContentsOfURL(url!)
        
    }
    
    func parsingWasFinished() {
        self.tableView.reloadData()
    }
    
    
    //TABLE VIEW
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return xmlParser.arrParsedData.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:PostTableCellViewController = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PostTableCellViewController
        
        let currentDictionary = xmlParser.arrParsedData[indexPath.row] as Dictionary<String, String>
        
        
        cell.PostTitle.text = currentDictionary["title"]
        
        let albumImage: UIImage = UIImage(named: "HellaSlaps Icon")!
        
        cell.AlbumArt.image = albumImage
        
        let author = currentDictionary["dc:creator"]
        
        
        let str = currentDictionary["pubDate"]
        
        var trimmedString: String
        
        if ((author) != nil) {
            trimmedString = author!.stringByTrimmingCharactersInSet(
                NSCharacterSet.whitespaceAndNewlineCharacterSet()
            )
            
        } else {
            trimmedString = "anonymous"
        }
        
        let infoText = "Slapped by " + trimmedString + " on " + str!.substringWithRange(Range<String.Index>(start: str!.startIndex.advancedBy(0), end: str!.endIndex.advancedBy(-14))) + "at" + str!.substringWithRange(Range<String.Index>(start: str!.startIndex.advancedBy(16), end: str!.endIndex.advancedBy(-9)))
        
        cell.PostInfo.text = infoText
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dictionary = xmlParser.arrParsedData[indexPath.row] as Dictionary<String, String>
        let tutorialLink = dictionary["link"]
        
        let tutorialViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("idPost") as! PostViewController
        
        tutorialViewController.tutorialURL = NSURL(string: tutorialLink!)
        
        showDetailViewController(tutorialViewController, sender: self)
        
    }
    
}
