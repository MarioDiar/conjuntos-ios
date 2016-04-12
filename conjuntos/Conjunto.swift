//
//  Conjunto.swift
//  conjuntos
//
//  Created by Mario Díaz on 4/5/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

class Conjunto: NSObject {
    var dato: Int? = nil
    var datos = [Int?]()
    
    override init() {
        for _ in 0...4 {
            datos.append(dato)
        }
        
    }
}



