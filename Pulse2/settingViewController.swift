//
//  settingViewController.swift
//  Pulse2
//
//  Created by Yohanes Patrik Handrianto on 9/19/17.
//  Copyright © 2017 Yohanes Patrik Handrianto. All rights reserved.
//

import Foundation
import UIKit


class settingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func returnHome(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true);
    }
}
