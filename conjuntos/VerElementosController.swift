//
//  VerElementosController.swift
//  conjuntos
//
//  Created by Mario Díaz on 5/1/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

class VerElementosController: UIViewController {
    
    var stringDatos = " "

    @IBOutlet weak var datosLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datosLabel.text = stringDatos
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
