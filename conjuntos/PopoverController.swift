//
//  PopoverController.swift
//  conjuntos
//
//  Created by Mario Díaz on 4/27/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

protocol CambiaElementosDelegate {
    func cambiaElementos(num: Int, conj: Int)
}

class PopoverController: UIViewController {
    
    var cambiaElementosDelegate: CambiaElementosDelegate?
    
    @IBOutlet weak var numConjuntosSlider: UISlider!
    var numConjuntos = 0
    var numDeConjunto = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numConjuntosSlider.value = Float(numConjuntos)
    }
    

    @IBAction func cambiaSlider(sender: UISlider) {
        cambiaElementosDelegate?.cambiaElementos(Int(sender.value), conj: numDeConjunto)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
