//
//  ViewController.swift
//  coordinate_transformation
//
//  Created by leoqyang(杨琼) on 2018/4/6.
//  Copyright © 2018年 leoqyang(杨琼). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view1.isHidden = true
        self.view2.isHidden = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showComponent(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            UIView.animate(withDuration: 0.5) {
                self.view1.isHidden = true
                self.view2.isHidden = false
                NotificationCenter.default.post(name: Notification.Name(rawValue: "view1Focus"), object: nil)
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.view1.isHidden = false
                self.view2.isHidden = true
                NotificationCenter.default.post(name: Notification.Name(rawValue: "view2Focus"), object: nil)
            }
        }
    }
}

