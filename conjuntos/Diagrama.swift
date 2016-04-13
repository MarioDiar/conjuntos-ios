//
//  Diagrama.swift
//  conjuntos
//
//  Created by Mario Díaz on 4/12/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

class Diagrama: NSObject {
    var conjuntos = [Conjunto]()
    var inters12 = [Int?]()
    var inters13 = [Int?]()
    var inters23 = [Int?]()
    var inters123 = [Int?]()
    var conj1 = [Int?]()
    var conj2 = [Int?]()
    var conj3 = [Int?]()
    
    init(numConjuntos num: Int) {
        let c1 : Conjunto = Conjunto()
        let c2 : Conjunto = Conjunto()
        let c3 : Conjunto = Conjunto()
        
        for i in 0...4 {
            c1.datos[i] = i
            c2.datos[i] = i+1
            c3.datos[i] = i*2
        }
        
        if num == 2 {
            conjuntos.append(c1)
            conjuntos.append(c2)
        } else {
            conjuntos.append(c1)
            conjuntos.append(c2)
            conjuntos.append(c3)
        }
    }
    
    //Function to convert Int Arrays to String
    func arrayToString(datos: Array<Int?>) -> String {
        var s = ""
        if datos.count != 0 {
            for i in 0...(datos.count - 1) {
                if datos[i] != nil {
                    let intAux = datos[i]!
                    if i == 0 {
                        s += String(intAux)
                    } else {
                        s += " " + String(intAux)
                    }
                }
            }
        }
        return s
    }
    
    //Intersection function, it returns an array with the items that intersect
    private func interseccion(elemA: Array<Int?>, elemB: Array<Int?>) -> Array<Int?> {
        var inters = [Int?]()
        
        for i in 0...(elemA.count - 1) {
            for x in 0...(elemA.count - 1) {
                if elemA[i] == elemB[x] && elemA[i] != nil {
                    inters.append(elemA[i]!)
                }
            }
        }
        return inters
    }
    
    //Calculates all the data for the diagram depending on how many conjuntos it has
    func calculaDiagrama() -> Void {
        if conjuntos.count == 2 {
            self.inters12 = calculaDoble(conjuntos[0].datos, elemB: conjuntos[1].datos)
            self.conj1 = eliminaRepetidos(conjuntos[0].datos, repetidos: inters12)
            self.conj2 = eliminaRepetidos(conjuntos[1].datos, repetidos: inters12)
        } else {
            self.inters123 = calculaTri()
            self.inters12 = calculaDoble(conjuntos[0].datos, elemB: conjuntos[1].datos)
            self.inters13 = calculaDoble(conjuntos[0].datos, elemB: conjuntos[2].datos)
            self.inters23 = calculaDoble(conjuntos[1].datos, elemB: conjuntos[2].datos)
            self.conj1 = calculaSingle(conjuntos[0].datos, repetidos1: inters12, repetidos2: inters13)
            self.conj2 = calculaSingle(conjuntos[1].datos, repetidos1: inters12, repetidos2: inters23)
            self.conj3 = calculaSingle(conjuntos[2].datos, repetidos1: inters13, repetidos2: inters23)
        }
    }
    
    private func eliminaRepetidos(elemA: Array<Int?>, repetidos: Array<Int?>) -> Array<Int?> {
        var res = [Int?]()
        var flag = true
        
        if repetidos.count != 0 {
            for i in 0...(elemA.count - 1) {
                flag = true
                for x in 0...(repetidos.count - 1) {
                    if elemA[i] == repetidos[x] {
                        flag = false
                    }
                }
                if flag {
                    res.append(elemA[i])
                }
            }
        } else {
            res = elemA
        }
        return res
    }
    
    //Calculates the duo intersection between 2 conjuntos excluding the elements in the triIntersection
    private func calculaDoble(elemA: Array<Int?>, elemB: Array<Int?>) -> Array<Int?> {
        let inters : Array<Int?> = interseccion(elemA, elemB: elemB)
        return eliminaRepetidos(inters, repetidos: inters123)
    }
    
    //Eliminates all elements from conjunto that intersects with any other element from other conjunto
    private func calculaSingle(elemA: Array<Int?>, repetidos1: Array<Int?>, repetidos2: Array<Int?>) -> Array<Int?> {
        var res : Array<Int?> = eliminaRepetidos(elemA, repetidos: inters123)
        res = eliminaRepetidos(res, repetidos: repetidos1)
        return eliminaRepetidos(res, repetidos: repetidos2)
    }
    
    //calculates the tri intersection and saves it in the inters123 value of the diagram
    private func calculaTri() -> Array<Int?> {
        let inters : Array<Int?> = interseccion(conjuntos[0].datos, elemB: conjuntos[1].datos)
        return interseccion(inters, elemB: conjuntos[2].datos)
        
    }
    
    
}

