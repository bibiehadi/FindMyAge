//
//  ViewController.swift
//  Find My Age
//
//  Created by Bibie Hadi on 08/01/20.
//  Copyright © 2020 NullNetwork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var ageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calculateMyAge(_ sender: Any) {
        let birthDate = self.datePicker.date
        
        let today = Date()
        
        if birthDate >= today {
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid date", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "yes", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.year,.month,.day], from: birthDate, to: today)
        
        
        guard let ageYears = components.year else {return}
        guard let ageMonth = components.month else {return}
        guard let ageDay = components.day else {return}
        
        self.ageLabel.text = "\(ageYears) years, \(ageMonth) month, \(ageDay) day"
    }
    

}

