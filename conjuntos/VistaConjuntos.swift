/*
* Clase VistaConjuntos. Creada por Mario Diaz 12/04/2016
* Esta clase dibuja el diagrama de venn dependiendo los parametros que se mandan del ViewController.
*/

import UIKit

class VistaConjuntos: UIView {
    
    var diagrama : Diagrama!
    var numConjuntos = 0
    
    //Funcion que dibuja el diagrama de venn
    override func drawRect(rect: CGRect) {        
        //Contexto donde se dibujara
        let contexto = UIGraphicsGetCurrentContext()
        
        //Colores transparentes
        let orangeTrans = CGColorCreateCopyWithAlpha(UIColor.orangeColor().CGColor, 0.5)
        let magentaTrans = CGColorCreateCopyWithAlpha(UIColor.magentaColor().CGColor, 0.5)
        let cyanTrans = CGColorCreateCopyWithAlpha(UIColor.cyanColor().CGColor, 0.5)
        let transparent = CGColorCreateCopyWithAlpha(UIColor.clearColor().CGColor, 0.0)
        
        //Nombre de los conjuntos
        let nameConj1 = "A"
        let nameConj2 = "B"
        let nameConj3 = "C"
        
        //Definiendo el font que se utilizara para escribir en el diagrama de venn
        let font = UIFont(name: "Helvetica Bold", size: 14.0)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Center
        
        let textFontAttributes : [String : AnyObject] = [ NSFontAttributeName: font!, NSParagraphStyleAttributeName: paragraphStyle ]
        
        //Definiendo el ancho de la linea
        CGContextSetLineWidth(contexto, 1.0)
        CGContextSetStrokeColorWithColor(contexto, UIColor.blackColor().CGColor)

        
        //Checando cuantos conjuntos hay en el diagrama, para dibujar el diagrama acorde a esto.
        if numConjuntos == 2 {
            //Dibujando las elipses cuando el diagrama tiene dos conjuntos
            //DIBUJANDO ELIPSES
            CGContextSetFillColorWithColor(contexto, cyanTrans)
            
            let theRect: CGRect = CGRectMake(100, 50, 150, 150)
            CGContextFillEllipseInRect(contexto, theRect)
            CGContextStrokeEllipseInRect(contexto, theRect)
            
            //Setting new colors to stroke and fill
            CGContextSetFillColorWithColor(contexto, orangeTrans)
            
            //Elipse
            let elipse: CGRect = CGRectMake(25, 50, 150, 150)
            CGContextFillEllipseInRect(contexto, elipse)
            CGContextStrokeEllipseInRect(contexto, elipse)
            
            //DRAWING INVIS RECTANGLE TO DRAW TEXT ON
            CGContextSetFillColorWithColor(contexto, transparent)
            
            //botright rectangulo
            let botRightConj = CGRectMake(177, 122, 60, 50)
            CGContextFillRect(contexto, botRightConj)
            
            let nameBotRightConj = CGRectMake(220, 49, 15, 15)
            CGContextFillRect(contexto, nameBotRightConj)
            
            //botleft rectangulo
            let botLeftCon = CGRectMake(38, 120, 60, 50)
            CGContextFillRect(contexto, botLeftCon)
            
            let nameBotLeftConj = CGRectMake(40, 49, 15, 15)
            CGContextFillRect(contexto, nameBotLeftConj)
            
            //intersection
            let inter = CGRectMake(117, 116, 44, 44)
            CGContextFillRect(contexto, inter)
            
            //DRAWING DATA ON RECTANGLES
            (diagrama.arrayToString(diagrama.conj1) as NSString).drawInRect(botLeftCon, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.conj2) as NSString).drawInRect(botRightConj, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.inters12) as NSString).drawInRect(inter, withAttributes: textFontAttributes)
            
            //DRAWING NAMES OF CONJUNTOS
            (nameConj1 as NSString).drawInRect(nameBotLeftConj, withAttributes: textFontAttributes)
            (nameConj2 as NSString).drawInRect(nameBotRightConj, withAttributes: textFontAttributes)
        
        } else if numConjuntos == 3 {
            //Dibujando las elipses cuando el diagrama tiene dos conjuntos
            
            //DIBUJANDO ELIPSES
            //Elipse-setting elipse stroke and fill color
            CGContextSetFillColorWithColor(contexto, orangeTrans)
            
            let theRect: CGRect = CGRectMake(65, 15, 150, 150)
            CGContextFillEllipseInRect(contexto, theRect)
            CGContextStrokeEllipseInRect(contexto, theRect)
            
            //Setting new colors to stroke and fill
            CGContextSetFillColorWithColor(contexto, magentaTrans)
            
            //Elipse
            let elipse: CGRect = CGRectMake(25, 85, 150, 150)
            CGContextFillEllipseInRect(contexto, elipse)
            CGContextStrokeEllipseInRect(contexto, elipse)
            
            //Setting new colors to stroke and fill
            CGContextSetFillColorWithColor(contexto, cyanTrans)
            
            //Elipse
            let elipseTwo: CGRect = CGRectMake(100, 85, 150, 150)
            CGContextFillEllipseInRect(contexto, elipseTwo)
            CGContextStrokeEllipseInRect(contexto, elipseTwo)
            
            //DIBUJANDO RECTANGULOS INVISIBLES EN LAS INTERSECCIONES, PARA ESCRIBIR TEXTO EN ELLOS
            //y, x
            CGContextSetFillColorWithColor(contexto, transparent)
            
            //top rectangulo
            let topConj: CGRect = CGRectMake(115, 30, 60, 50)
            CGContextFillRect(contexto, topConj)
            
            let nameTopConj = CGRectMake(95, 5, 15, 15)
            CGContextFillRect(contexto, nameTopConj)
            
            //botright rectangulo
            let botRightConj = CGRectMake(177, 157, 60, 50)
            CGContextFillRect(contexto, botRightConj)
            
            let nameBotRightConj = CGRectMake(220, 219, 15, 15)
            CGContextFillRect(contexto, nameBotRightConj)
            
            //botleft rectangulo
            let botLeftConj = CGRectMake(38, 155, 60, 50)
            CGContextFillRect(contexto, botLeftConj)
            
            let nameBotLeftConj = CGRectMake(40, 219, 15, 15)
            CGContextFillRect(contexto, nameBotLeftConj)
            
            //inter right
            let interRight = CGRectMake(165, 90, 40, 40)
            CGContextFillRect(contexto, interRight)
            
            //inter left
            let interLeft = CGRectMake(73, 90, 40, 40)
            CGContextFillRect(contexto, interLeft)
            
            //inter bottom
            let interBottom = CGRectMake(118, 165, 44, 44)
            CGContextFillRect(contexto, interBottom)
            
            //tri conjunto
            let interTri = CGRectMake(117, 116, 44, 44)
            CGContextFillRect(contexto, interTri)
            
            //DIBUJANDO LOS DATOS DEL DIAGRAMA EN LOS RECTANGULOS INVISIBLES
            (diagrama.arrayToString(diagrama.conj1) as NSString).drawInRect(topConj, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.conj2) as NSString).drawInRect(botRightConj, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.conj3) as NSString).drawInRect(botLeftConj, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.inters12) as NSString).drawInRect(interRight, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.inters13) as NSString).drawInRect(interLeft, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.inters23) as NSString).drawInRect(interBottom, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.inters123) as NSString).drawInRect(interTri, withAttributes: textFontAttributes)
            
            //DIBUJANDO LOS NOMBRES DE CADA CONJUNTO
            (nameConj1 as NSString).drawInRect(nameTopConj, withAttributes: textFontAttributes)
            (nameConj2 as NSString).drawInRect(nameBotRightConj, withAttributes: textFontAttributes)
            (nameConj3 as NSString).drawInRect(nameBotLeftConj, withAttributes: textFontAttributes)
        }
    }
}



//DEBUGGING
//            print("DATOS CONJ 1: ")
//            print(diagrama.conjuntos[0].datos)
//            print("DATOS CONJ 2: ")
//            print(diagrama.conjuntos[1].datos)
//            print("DATOS CONJ 3: ")
//            print(diagrama.conjuntos[2].datos)
//
//            print("||||||||||||||||||||||||||")
//
//            print("inters 1 2")
//            print(diagrama.inters12)
//            print("inters 1 3")
//            print(diagrama.inters13)
//            print("inters 2 3")
//            print(diagrama.inters23)
//            print("inters 1 2 3")
//            print(diagrama.inters123)
//            print("conj 1")
//            print(diagrama.conj1)
//            print("conj 2")
//            print(diagrama.conj2)
//            print("conj 3")
//            print(diagrama.conj3)

