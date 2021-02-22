//
//  BaseClaverTapViewController.swift
//  iosAnalyticsTest
//
//  Created by vivek G on 22/02/21.
//  Copyright © 2021 Vivek. All rights reserved.
//

import UIKit
import CleverTapSDK

class BaseClaverTapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

            /*
         //Other event gether from claver tap developer portal
            // To set a multi-value property
            CleverTap.sharedInstance()?.profileSetMultiValues(["bag", "shoes"], forKey: "myStuff")

            // To add an additional value(s) to a multi-value property
            CleverTap.sharedInstance()?.profileAddMultiValue("coat", forKey: "myStuff")
            // or
            CleverTap.sharedInstance()?.profileAddMultiValues(["socks", "scarf"], forKey: "myStuff")

            //To remove a value(s) from a multi-value property
            CleverTap.sharedInstance()?.profileRemoveMultiValue("bag", forKey: "myStuff")
            CleverTap.sharedInstance()?.profileRemoveMultiValues(["shoes", "coat"], forKey: "myStuff")

            //To remove the value of a property (scalar or multi-value)
            CleverTap.sharedInstance()?.profileRemoveValueForKey("myStuff")
        */
    }
    
    /// Record Event
    func recordEvent(strEventName:String)
    {
        CleverTap.sharedInstance()?.recordEvent(strEventName)
    }
    /// Record Event with data
    func recordEventWithData(strEventName:String,dictData:[String:Any])
    {
        CleverTap.sharedInstance()?.recordEvent(strEventName, withProps: dictData)
    }
    /// Record Charged event
    func recoreChargedEventWithData(dictChargeEvent:[String:Any],dictData:[[String:Any]])
    {
        CleverTap.sharedInstance()?.recordChargedEvent(withDetails: dictChargeEvent, andItems: dictData)
    }
    //record push event 
    func profilePushEvent(dictProfile:[String:Any])
    {
        CleverTap.sharedInstance()?.profilePush(dictProfile)
    }
}

extension BaseClaverTapViewController : CleverTapInboxViewControllerDelegate
{
    func messageDidSelect(_ message: CleverTapInboxMessage, at index: Int32, withButtonIndex buttonIndex: Int32) {
        print("inbox message is clicked")
      // This is called when an inbox message is clicked(tapped or call to action)
    }
    func messageButtonTapped(withCustomExtras customExtras: [AnyHashable : Any]?) {
        print("App Inbox Button Tapped with custom extras: ", customExtras ?? "");
    }

    func callAppInbox()
    {
        //Step 1: Integrating the CleverTap App Inbox
        //Initialize the CleverTap App Inbox
        CleverTap.sharedInstance()?.initializeInbox(callback: ({ (success) in
            let messageCount = CleverTap.sharedInstance()?.getInboxMessageCount()
            let unreadCount = CleverTap.sharedInstance()?.getInboxMessageUnreadCount()
            print("Inbox Message:\(String(describing: messageCount))/\(String(describing: unreadCount)) unread")
                    
    }))
        
        //Step 2: Configure App Inbox Styling
        // config the style of App Inbox Controller
          let style = CleverTapInboxStyleConfig.init()
          style.title = "App Inbox"
//        style.backgroundColor = UIColor.blue
          style.messageTags = ["tag1", "tag2"]
//          style.navigationBarTintColor = UIColor.blue
          style.navigationTintColor = UIColor.blue
          style.tabUnSelectedTextColor = UIColor.blue
          style.tabSelectedTextColor = UIColor.blue
//          style.tabSelectedBgColor = UIColor.blue
          
        if let inboxController = CleverTap.sharedInstance()?.newInboxViewController(with: style, andDelegate: self ) {
              let navigationController = UINavigationController.init(rootViewController: inboxController)
              self.present(navigationController, animated: true, completion: nil)
        }
         #if DEBUG
            CleverTap.setDebugLevel(CleverTapLogLevel.debug.rawValue)
        #else
            CleverTap.setDebugLevel(CleverTapLogLevel.off.rawValue)
        #endif
    }
}
