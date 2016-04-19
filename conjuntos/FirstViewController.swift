//
//  FirstViewController.swift
//  conjuntos
//
//  Created by Mario Díaz on 4/2/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var ALabel: UILabel!
    @IBOutlet weak var BLabel: UILabel!
    @IBOutlet weak var CLabel: UILabel!
    
    @IBOutlet weak var rightOneLabel: UILabel!
    @IBOutlet weak var rightTwoLabel: UILabel!
    @IBOutlet weak var rightThreeLabel: UILabel!
    @IBOutlet weak var rightFourLabel: UILabel!
    
    

    @IBOutlet weak var vistaConjuntos: VistaConjuntos!
    @IBOutlet weak var numConjuntosSegment: UISegmentedControl!
    @IBOutlet weak var unionInterSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if numConjuntosSegment.selectedSegmentIndex == 0 {
            vistaConjuntos.numConjuntos = 3
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 3)
            setLabels(0, tipo: 0)
        } else {
            vistaConjuntos.numConjuntos = 2
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 2)
        }
        
        vistaConjuntos.diagrama.calculaDiagrama()
        setLabels(numConjuntosSegment.selectedSegmentIndex, tipo: unionInterSegment.selectedSegmentIndex)
        
    }
    
    @IBAction func cambiaNumSegment(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            vistaConjuntos.numConjuntos = 3
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 3)
        } else {
            vistaConjuntos.numConjuntos = 2
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 2)
        }
        vistaConjuntos.diagrama.calculaDiagrama()
        setLabels(numConjuntosSegment.selectedSegmentIndex, tipo: unionInterSegment.selectedSegmentIndex)
        vistaConjuntos.setNeedsDisplay()
    }
    
    func setLabels(num: Int, tipo: Int) {
        if num == 0 && tipo == 0 {
            ALabel.text = "A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[0].datos) + "}"
            BLabel.text = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
            CLabel.text = "C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[2].datos) + "}"
            
            rightOneLabel.text = "A∩B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters12) + "}"
            rightTwoLabel.text = "A∩C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters13) + "}"
            rightThreeLabel.text = "B∩C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters23) + "}"
            rightFourLabel.text = "A∩B∩C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters123) + "}"
        } else if num == 1 && tipo == 0 {
            ALabel.text = "A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[0].datos) + "}"
            BLabel.text = ""
            CLabel.text = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
            
            rightOneLabel.text = ""
            rightTwoLabel.text = "A∩B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters12) + "}"
            rightThreeLabel.text = "B∩A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters12) + "}"
            rightFourLabel.text = ""
            
            
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

