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
        
        let c1 : Conjunto = Conjunto()
        let c2 : Conjunto = Conjunto()
        
        if numConjuntosSegment.selectedSegmentIndex == 0 {
            let c3 : Conjunto = Conjunto()
            vistaConjuntos.conjuntos.append(c1)
            vistaConjuntos.conjuntos.append(c2)
            vistaConjuntos.conjuntos.append(c3)
        } else {
            vistaConjuntos.conjuntos.append(c1)
            vistaConjuntos.conjuntos.append(c2)
        }
    }
    
    //TODO create segment function that changes num of items in conjuntos whenever it is clicked
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

