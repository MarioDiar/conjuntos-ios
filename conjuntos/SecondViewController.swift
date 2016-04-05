//
//  SecondViewController.swift
//  conjuntos
//
//  Created by Mario Díaz on 4/2/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var preguntaTextview: UITextView!
    @IBOutlet weak var vistaConjuntos: VistaConjuntos!
    @IBOutlet weak var numConjuntosSegment: UISegmentedControl!
    @IBOutlet weak var unionInterSegment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

