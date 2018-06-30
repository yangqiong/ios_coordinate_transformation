//
//  View1Controller.swift
//  coordinate_transformation
//
//  Created by leoqyang(杨琼) on 2018/4/6.
//  Copyright © 2018年 leoqyang(杨琼). All rights reserved.
//

import UIKit


class View1Controller: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for textField in textFields {
            textField.delegate = self
        }
    }
    
    @objc func viewShow(notification: Notification){
        textFields[0].becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textFields[0].becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(self.viewShow), name: Notification.Name(rawValue: "view1Focus"), object: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var coordinate = Coordinate()
    @IBOutlet weak var endPointX: UITextField!
    @IBOutlet weak var endPointY: UITextField!
    @IBOutlet var textFields: [UITextField]!
    
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
                    coordinate.distance = number
                    break
                case 3:
                    coordinate.degree = number
                    break
                case 4:
                    coordinate.minute = number
                    break
                case 5:
                    coordinate.second = number
                    break
                default:
                    break
                }
                caculate()
            }
        }
    }
    
    func caculate() {
        coordinate.calulateEndPoint()
        endPointX.text = String(format: "%0.4f", coordinate.endPointX)
        endPointY.text = String(format: "%0.4f", coordinate.endPointY)
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
