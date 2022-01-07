//
//  ViewController.swift
//  DateExtension
//
//  Created by varol on 6.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        
        //Testing function
        print(date.day())
        print(date.month())
        print(date.year())
        print(date.dateAsPrettyString())

    }


}

extension Date {
    
    func day () -> String {
        
        //Preparing date formatte for getting day
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd")
        
        //Using date formatter for getting day
        let formatedDate = dateFormatter.string(from: self)

        return formatedDate
    }
    
    func month () -> String {
        //Preparing date formatte for getting month
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MM")
        
        //Using date formatter for getting month
        let formatedDate = dateFormatter.string(from: self)

        return formatedDate
    }
    
    func year () -> String {
        //Preparing date formatte for getting year
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy")
        
        //Using date formatter for getting year
        let formatedDate = dateFormatter.string(from: self)

        return formatedDate
    }
    
    func dateAsPrettyString () -> String {
        let day = self.day()
        let month = self.month()
        let year = self.year()
        
        //Printing the variables
        return "\(day)<>\(month)<>\(year)"
    }
}

