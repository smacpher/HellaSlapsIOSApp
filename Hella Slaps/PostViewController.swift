//
//  PostViewController.swift
//  Hella Slaps
//
//  Created by Sean MacPherson on 3/9/16.
//  Copyright © 2016 loofy. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    var tutorialURL : NSURL!
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        //Navbar
        
        
        let attributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: "ArcaMajora-Heavy", size: 30)!
        ]
}
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if tutorialURL != nil && webView != nil {
            let request : NSURLRequest = NSURLRequest(URL: tutorialURL)
            
            webView.loadRequest(request)
            
            if webView.hidden {
                webView.hidden = false
            }
            
        }
    }
    
}
