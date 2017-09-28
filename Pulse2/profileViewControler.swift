//
//  profileViewControler.swift
//  Pulse2
//
//  Created by Yohanes Patrik Handrianto on 9/19/17.
//  Copyright © 2017 Yohanes Patrik Handrianto. All rights reserved.
//

import Foundation
import UIKit


class profileViewController: UIViewController {
    @IBAction func homeButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeViewSeguep", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
