/*
* Clase Conjunto. Creada por Mario Diaz 12/04/2016
* Representa un conjunto, que tiene un arreglo de enteros, que representan los elementos del conjunto.
*/

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



