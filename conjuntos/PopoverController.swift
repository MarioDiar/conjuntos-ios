//
//  PopoverController.swift
//  conjuntos
//
//  Created by Mario Díaz on 4/27/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

class PopoverController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButtonPressed(sender: AnyObject?) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

}
