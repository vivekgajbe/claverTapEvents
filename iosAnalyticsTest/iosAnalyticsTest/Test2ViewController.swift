//
//  Test2ViewController.swift
//  iosAnalyticsTest
//
//  Created by vivek G on 20/02/21.
//  Copyright © 2021 Vivek. All rights reserved.
//

import UIKit


class Test2ViewController: BaseClaverTapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
//MARK: - Button delegate method
    
    @IBAction func btnRecordEvent(_ sender: Any) {
        //1: record event
        recordEvent(strEventName:"Test 2 Class viewed")
        self.showAlert(strTitle: "Record Event",strSubTitle: "Send User Date ")
    }
    @IBAction func btnRecordEventWithProperties(_ sender: Any) {
        //2: record Event with properties
        let dictEvent: [String:Any] = [
            "Name": "Vivek",
            "Prefered Language": "English/Hindi/Marathi"
        ]
        self.recordEventWithData(strEventName:"Send User Date",dictData:dictEvent)
        self.showAlert(strTitle: "Record Event with Param",strSubTitle: "Send User Data with Param: \(dictEvent)")
    }
    @IBAction func btnRecordCharedEvent(_ sender: Any) {
        //3: Record chared event
            let chargeDetails = ["Amount": 300,
            "Payment mode": "Credit Card",
            "Charged ID": 24052013
                ] as [String : Any]

        let item1 = [
            "Category": "books",
            "Book name": "The Millionaire next door",
            "Quantity": 1
        ] as [String : Any]

        let item2 = [
            "Category": "books",
            "Book name": "Achieving inner zen",
            "Quantity": 1
        ] as [String : Any]

        let item3 = [
            "Category": "books",
            "Book name": "Chuck it, let's do it",
            "Quantity": 5
        ] as [String : Any]

    self.recoreChargedEventWithData(dictChargeEvent:chargeDetails,dictData:[item1,item2,item3])
        self.showAlert(strTitle: "Record Chared Event",strSubTitle:"\(chargeDetails) : \([item1,item2,item3])")
    }
    @IBAction func btnOpenAppInbox(_ sender: Any) {
        //4 : Call App Inbox
        self.callAppInbox()
        self.showAlert(strTitle: "Open App Inbox",strSubTitle:"App inbox is initialize,now you can re-click to open App Inbox view")
    }
    @IBAction func btnPushProfileEvent(_ sender: Any) {
        //5.2: Profile push Event
        let profile: [String:Any] = [
            //Update pre-defined profile properties
            "Name":"Vivek Gajbe",
            "Email":"vpgajbe1991@gmail.com",
            //Update custom profile properties
            "Plan type":"Demo:- TODO",
            "Favorite Food":"Non-Veg"
        ]
        self.profilePushEvent(dictProfile:profile)
        self.showAlert(strTitle: "Push Profile Event",strSubTitle:"\(profile)")
    }
    
}

extension Test2ViewController
{
    func showAlert(strTitle:String,strSubTitle:String = "")
    {
        let alert = UIAlertController(title: strTitle, message: strSubTitle, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default , handler:{ (UIAlertAction)in
            print("User click Approve button")
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}
