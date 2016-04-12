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
    
    var conjuntos = [Conjunto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vistaConjuntos.conjuntos.removeAll()
        let c1 : Conjunto = Conjunto()
        let c2 : Conjunto = Conjunto()
        let c3 : Conjunto = Conjunto()
        
        for i in 0...4 {
            c1.datos[i] = i
        }
        
        for i in 0...4 {
            c2.datos[i] = i+7
        }
        
        for i in 0...4 {
            c3.datos[i] = i+13
        }
        
        if numConjuntosSegment.selectedSegmentIndex == 0 {
            
            vistaConjuntos.conjuntos.append(c1)
            vistaConjuntos.conjuntos.append(c2)
            vistaConjuntos.conjuntos.append(c3)
        } else {
            vistaConjuntos.conjuntos.append(c1)
            vistaConjuntos.conjuntos.append(c2)
        }
    }
    //TODO create loadData function to avoid repeating viewDidload and cambiaNum code
    
    @IBAction func cambiaNumSegment(sender: UISegmentedControl) {
        let c1 : Conjunto = Conjunto()
        let c2 : Conjunto = Conjunto()
        let c3 : Conjunto = Conjunto()
        
        vistaConjuntos.conjuntos.removeAll()
        
        if sender.selectedSegmentIndex == 0 {
            vistaConjuntos.conjuntos.append(c1)
            vistaConjuntos.conjuntos.append(c2)
            vistaConjuntos.conjuntos.append(c3)
        } else {
            vistaConjuntos.conjuntos.append(c1)
            vistaConjuntos.conjuntos.append(c2)
        }
        vistaConjuntos.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

