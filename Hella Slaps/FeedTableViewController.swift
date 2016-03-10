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
    
    var xmlParser : XMLParser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.hellaslaps.com")
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let currentDictionary = xmlParser.arrParsedData[indexPath.row] as Dictionary<String, String>
        
        cell.textLabel?.text = currentDictionary["title"]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
}
