
/*
 * Clase Diagrama. Creada por Mario Diaz 12/04/2016
 * Esta clase representa el diagama de Venn que se despliega en la aplicacion.
 * Genera un diagrama de manera aleatoria al momento de inicializar.
 * Realiza todos los calculos necesarios para que sea representado de manera correcta en el diagrama de Venn.
 */
import UIKit

class Diagrama: NSObject {
    var conjuntos = [Conjunto]()
    var inters12 = [Int?]()
    var inters13 = [Int?]()
    var inters23 = [Int?]()
    var inters123 = [Int?]()
    var union12 = [Int?]()
    var union13 = [Int?]()
    var union23 = [Int?]()
    var union123 = [Int?]()
    var conj1 = [Int?]()
    var conj2 = [Int?]()
    var conj3 = [Int?]()
    
    init(numConjuntos num: Int) {
        let c1 : Conjunto = Conjunto()
        let c2 : Conjunto = Conjunto()
        let c3 : Conjunto = Conjunto()
        
        for i in 0...4 {
            c1.datos[i] = i
            c2.datos[i] = i+3
            c3.datos[i] = i+1
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
    
    //Calcula todos los datos para el diagrama dependiendo cuantos conjuntos tiene
    func calculaDiagrama() -> Void {
        if conjuntos.count == 2 {
            self.inters12 = calculaDoble(conjuntos[0].datos, elemB: conjuntos[1].datos)
            self.conj1 = eliminaRepetidos(conjuntos[0].datos, repetidos: inters12)
            self.conj2 = eliminaRepetidos(conjuntos[1].datos, repetidos: inters12)
            self.union12 = calculaUnion(conjuntos[0].datos, elemB: conjuntos[1].datos)
        } else {
            self.inters123 = calculaTri()
            self.inters12 = calculaDoble(conjuntos[0].datos, elemB: conjuntos[1].datos)
            self.inters13 = calculaDoble(conjuntos[0].datos, elemB: conjuntos[2].datos)
            self.inters23 = calculaDoble(conjuntos[1].datos, elemB: conjuntos[2].datos)
            self.conj1 = calculaSingle(conjuntos[0].datos, repetidos1: inters12, repetidos2: inters13)
            self.conj2 = calculaSingle(conjuntos[1].datos, repetidos1: inters12, repetidos2: inters23)
            self.conj3 = calculaSingle(conjuntos[2].datos, repetidos1: inters13, repetidos2: inters23)
            self.union12 = calculaUnion(conjuntos[0].datos, elemB: conjuntos[1].datos)
            self.union13 = calculaUnion(conjuntos[0].datos, elemB: conjuntos[2].datos)
            self.union23 = calculaUnion(conjuntos[1].datos, elemB: conjuntos[2].datos)
            self.union123 = calculaUnion(union12, elemB: conj3)
        }
    }
    
    //Funcion que convierte un array de enteros opcionales a un string
    func arrayToString(datos: Array<Int?>) -> String {
        var s = ""
        if datos.count != 0 {
            for i in 0...(datos.count - 1) {
                if datos[i] != nil {
                    let intAux = datos[i]!
                    if i == 0 && datos.count == 1 {
                        s += String(intAux)
                    } else if i == 0{
                        s += String(intAux)+","
                    } else if i == datos.count-1  {
                        s += " " + String(intAux)
                    } else {
                        s += " " + String(intAux)+","
                    }
                }
            }
        }
        return s
    }
    
    //Funcion de interseccion, regresa un arreglo con los items que intersectan entre dos conjuntos
    private func interseccion(elemA: Array<Int?>, elemB: Array<Int?>) -> Array<Int?> {
        var inters = [Int?]()
        if(elemA.count != 0 && elemB.count != 0) {
            for i in 0...(elemA.count - 1) {
                for x in 0...(elemB.count - 1) {
                    if elemA[i] == elemB[x]{
                        inters.append(elemA[i]!)
                    }
                }
            }
        }
        
        return inters
    }
    
    //Elimina elementos repetidos de un arreglo, esto para poder hacer los calculos de las intersecciones en el diagrama
    //sin que aparezcan repetidos
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
    
    //Calcula los la interseccion entre dos conjuntos que aparecera en el diagrama,
    //eliminando los repetidos que aparecen en la interseccion triple
    private func calculaDoble(elemA: Array<Int?>, elemB: Array<Int?>) -> Array<Int?> {
        let inters : Array<Int?> = interseccion(elemA, elemB: elemB)
        return eliminaRepetidos(inters, repetidos: inters123)
    }
    
    //Calcula los valores de un conjunto que no intersecta con ningun otro
    private func calculaSingle(elemA: Array<Int?>, repetidos1: Array<Int?>, repetidos2: Array<Int?>) -> Array<Int?> {
        var res : Array<Int?> = eliminaRepetidos(elemA, repetidos: inters123)
        res = eliminaRepetidos(res, repetidos: repetidos1)
        return eliminaRepetidos(res, repetidos: repetidos2)
    }
    
    //Calcula los valores de los conjuntos que intersectan con todos
    private func calculaTri() -> Array<Int?> {
        let inters : Array<Int?> = interseccion(conjuntos[0].datos, elemB: conjuntos[1].datos)
        return interseccion(conjuntos[2].datos, elemB: inters)
        
    }
    
    //Calcula la union entre dos conjuntos dados
    private func calculaUnion(elemA: Array<Int?>, elemB: Array<Int?>) -> Array<Int?> {
        let inters : Array<Int?> = interseccion(elemA, elemB: elemB)
        
        return elemA + eliminaRepetidos(elemB, repetidos: inters)
    }
    
    //Calcula la union entre dos conjuntos dados
    private func calculaUnionTriple(elemA: Array<Int?>, elemB: Array<Int?>) -> Array<Int?> {
        return elemA + elemB
    }
    
    
}

