//
//  ViewController.swift
//  HandWashHelper
//
//  Created by Benson Fan on 2020-08-13.
//  Copyright © 2020 Benson Fan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // keep in mind -> everything here is called everytime app opens
        let helperClass = notificationClass();
        helperClass.sortPrivileges(viewController:self)
    }
    
}

