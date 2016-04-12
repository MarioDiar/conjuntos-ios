//
//  FirstViewController.swift
//  conjuntos
//
//  Created by Mario Díaz on 4/2/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var conjuntosTextview: UITextView!
    @IBOutlet weak var vistaConjuntos: VistaConjuntos!
    @IBOutlet weak var numConjuntosSegment: UISegmentedControl!
    @IBOutlet weak var unionInterSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if numConjuntosSegment.selectedSegmentIndex == 0 {
            vistaConjuntos.numConjuntos = 3
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 3)
        } else {
            vistaConjuntos.numConjuntos = 2
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 2)
        }
    }
    //TODO create loadData function to avoid repeating viewDidload and cambiaNum code
    
    @IBAction func cambiaNumSegment(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            vistaConjuntos.numConjuntos = 3
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 3)
        } else {
            vistaConjuntos.numConjuntos = 2
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 2)
        }
        vistaConjuntos.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

