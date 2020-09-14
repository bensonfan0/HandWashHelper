//
//  Timer Screen.swift
//  HandWashHelper
//
//  Created by Benson Fan on 2020-08-13.
//  Copyright © 2020 Benson Fan. All rights reserved.
//

import UIKit
import Foundation

class Timer_Screen: UIViewController {
    
    var timer = Timer()
    var timerDisplayed = 30
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        timer.invalidate()
        timerDisplayed = 30
        rewriteTimerDisplay()
    }
    
    @IBAction func startButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
        
    }
    
    @objc func Action(){
        timerDisplayed -= 1;
        
        rewriteTimerDisplay()
        
        if (timerDisplayed <= 0) {
            // reset back to 30 s
            timerDisplayed = 30;
            timer.invalidate()
            rewriteTimerDisplay()
        }
    }
    
    func rewriteTimerDisplay() {
        label.text = "\(String(timerDisplayed)) s"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
