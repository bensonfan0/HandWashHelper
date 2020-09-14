//
//  HelperMethodsClass.swift
//  HandWashHelper
//
//  Created by Benson Fan on 2020-08-18.
//  Copyright © 2020 Benson Fan. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


class notificationClass: NSObject {
    
    let myCenter = UNUserNotificationCenter.current()
    
    func sortPrivileges(viewController:UIViewController) {
        
        myCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            // this block will run
            if !granted {
                // pop up saying can change in settings
                self.popUpNotification(message:"You can adjust notification privileges in Device General Settings", viewController:viewController)
            }
        }
    
        // default reminds user every 4 hours to wash hands
        self.updateNotificationInterval(hour: 4, minute: 0)
    }
    
    /*
    MODIFIES:
    EFFECTS: creates a pop up notification with message as parameter, viewController as "self", and title as app name
     */
    func popUpNotification (message:String, viewController:UIViewController) {
        DispatchQueue.main.async {
            let alertMessage = UIAlertController(title: "Handwasher App", message: message, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
            
            alertMessage.addAction(cancelAction)
            
            viewController.present(alertMessage, animated: true, completion: nil)
        }
    }
    
    
    /*
     MODIFIES: UNMutableNotificationContent
     EFFECTS: Changes the amount of time between notification popups given hour and minute intervals.
     */
    func updateNotificationInterval(hour:Int, minute:Int) {
        let content = UNMutableNotificationContent()
        content.title = "Time to wash hands!"
        content.body = "squeaky, squeaky clean"
        
        // debugging purposes
        print(hour)
        print(minute)
        
        let totalSeconds:Int = hour * 60 * 60 + minute * 60
        
        let date = Date().addingTimeInterval(TimeInterval(totalSeconds))
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // create request
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        myCenter.add(request) { (error) in
            // handle any errors
        }
        
    }
    
}
