//
//  Settings.swift
//  HandWashHelper
//
//  Created by Benson Fan on 2020-08-13.
//  Copyright © 2020 Benson Fan. All rights reserved.
//

import UIKit

class Settings: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData = [["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"],["hr(s)"],["00","15","30","45"],["mins"]]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func changeUpdateNotification(_ sender: Any) {
        
        let notification = notificationClass();
        let hour = Int(pickerData[0][pickerView.selectedRow(inComponent: 0)]) ?? 6
        let minute = Int(pickerData[2][pickerView.selectedRow(inComponent: 2)]) ?? 0
        
        notification.updateNotificationInterval(hour: hour, minute: minute)
       
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    // the data to return for row and component that is being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    
    // Capture picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // use the row to get the selected row from the picker view
        // using the row extract the value from your datasource (array[row])
        
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
