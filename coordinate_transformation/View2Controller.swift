//
//  View2Controller.swift
//  coordinate_transformation
//
//  Created by leoqyang(杨琼) on 2018/4/6.
//  Copyright © 2018年 leoqyang(杨琼). All rights reserved.
//

import UIKit

class View2Controller: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for textField in textFields {
            textField.delegate = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func viewShow(notification: Notification){
        textFields[0].becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.viewShow), name: Notification.Name(rawValue: "view2Focus"), object: nil)
    }
    
    
    
    var coordinate = Coordinate()
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var degree: UITextField!
    @IBOutlet weak var minute: UITextField!
    @IBOutlet weak var second: UITextField!
    @IBOutlet weak var distance: UITextField!
    @IBOutlet weak var degreeLabel: UILabel!
    
    @IBAction func textChange(_ sender: UITextField) {
        let index = textFields.index(of: sender)
        if index != nil {
            if let number = Double(sender.text!) {
                switch index {
                case 0:
                    coordinate.startPointX = number
                    break
                case 1:
                    coordinate.startPointY = number
                    break
                case 2:
                    coordinate.endPointX = number
                    break
                case 3:
                    coordinate.endPointY = number
                    break
                default:
                    break
                }
                caculate()
            }
        }
    }
    
    func caculate() {
        coordinate.calulateDistance()
        coordinate.calulateDegree()
        for textField in textFields {
    
            if (textField.text == "") {
                distance.text = ""
                degreeLabel.text = ""
                degree.text = ""
                minute.text = ""
                second.text = ""
                return
            }
        }
        
        distance.text = String(format: "%0.4f", coordinate.distance)
        degreeLabel.text = String(format: "%0.4f", coordinate.degreeDouble)
        degree.text = String(format: "%0.0f", coordinate.degree)
        minute.text = String(format: "%0.0f", coordinate.minute)
        second.text = String(format: "%0.0f", coordinate.second)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        let nextResponder = textField.superview?.superview?.viewWithTag(nextTag) as UIResponder?
        if nextResponder != nil {
            nextResponder?.becomeFirstResponder()
        } else {
            textFields[0].becomeFirstResponder()
        }
        return true
    }
}
