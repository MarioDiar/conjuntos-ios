//
//  VistaDibujos.swift
//  quartz
//
//  Created by Mario Díaz on 3/15/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.

//TODO: Fix the view of 2 conjuntos 

//var s: NSString=NSString(string: "SUGUS");
//var iTextPositionX:Int = 100;
//var iTextPositionY:Int = 100;
//
//let fieldColor: UIColor = UIColor.darkGrayColor()
//let fieldFont = UIFont(name: "Helvetica Neue", size: 12)
//var paraStyle = NSMutableParagraphStyle()
//
//paraStyle.lineSpacing = 6.0
//paraStyle.alignment = NSTextAlignment.Center;// <---
//var skew = 0.1
//
//let attributes = [
//    NSForegroundColorAttributeName: fieldColor,
//    NSParagraphStyleAttributeName: paraStyle,
//    NSObliquenessAttributeName: skew,
//    //NSTextAlignment: textalign,
//    NSFontAttributeName: fieldFont!
//]
//
//var Textpoint:CGPoint=CGPoint(x: iTextPositionX, y: iTextPositionY);
//s.drawAtPoint(Textpoint, withAttributes: attributes);


import UIKit

class VistaConjuntos: UIView {
    
    var diagrama : Diagrama!
    var numConjuntos = 0
    
    //Drawing function
    override func drawRect(rect: CGRect) {
        diagrama.calculaDiagrama()
        //Contexto donde se dibujara
        let contexto = UIGraphicsGetCurrentContext()
        //Colores transparentes
        let negroTrans = CGColorCreateCopyWithAlpha(UIColor.orangeColor().CGColor, 0.5)
        let magentaTrans = CGColorCreateCopyWithAlpha(UIColor.magentaColor().CGColor, 0.5)
        let blancoTrans = CGColorCreateCopyWithAlpha(UIColor.cyanColor().CGColor, 0.5)
        let negro = CGColorCreateCopyWithAlpha(UIColor.blackColor().CGColor, 0.0)
        
        //setting font attributes
        let font = UIFont(name: "Helvetica Bold", size: 14.0)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Center
        
        let textFontAttributes : [String : AnyObject] = [ NSFontAttributeName: font!, NSParagraphStyleAttributeName: paragraphStyle ]

        
        //Capa para mostrar los elementos de los conjuntos
        //let capaElementos = CGLayerCreateWithContext(contexto, self.frame.size, nil)
        //let contextoElementos = CGLayerGetContext(capaElementos)
        
        //Setting linewidth and stroke color
        CGContextSetLineWidth(contexto, 1.0)
        CGContextSetStrokeColorWithColor(contexto, UIColor.blackColor().CGColor)

        
        if numConjuntos == 2 {
            //DRAWING ELLIPSES
            //Elipse-setting elipse stroke and fill color
            
            CGContextSetFillColorWithColor(contexto, negroTrans)
            
            let theRect: CGRect = CGRectMake(65, 15, 150, 150)
            CGContextFillEllipseInRect(contexto, theRect)
            CGContextStrokeEllipseInRect(contexto, theRect)
            
            //Setting new colors to stroke and fill
            CGContextSetFillColorWithColor(contexto, magentaTrans)
            
            //Elipse
            let elipse: CGRect = CGRectMake(25, 85, 150, 150)
            CGContextFillEllipseInRect(contexto, elipse)
            CGContextStrokeEllipseInRect(contexto, elipse)
            
            //DRAWING INVIS RECTANGLE TO DRAW TEXT ON
        
            
            
        } else if numConjuntos == 3 {
            //DRAWING ELLIPSES
            //Elipse-setting elipse stroke and fill color
            CGContextSetFillColorWithColor(contexto, negroTrans)
            
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
            CGContextSetFillColorWithColor(contexto, blancoTrans)
            
            //Elipse
            let elipseTwo: CGRect = CGRectMake(100, 85, 150, 150)
            CGContextFillEllipseInRect(contexto, elipseTwo)
            CGContextStrokeEllipseInRect(contexto, elipseTwo)
            
            //Setting new colors to stroke and fill
            CGContextSetFillColorWithColor(contexto, negro)
            
        
            
            //DRAWING INVIS RECTANGLES AND THE DIAGRAM TEXT ABOVE IT
            //y, x
            
            //top rectangulo
            let topConj: CGRect = CGRectMake(115, 30, 60, 50)
            CGContextFillRect(contexto, topConj)
            
            //botright rectangulo
            let botRightConj = CGRectMake(177, 157, 60, 50)
            CGContextFillRect(contexto, botRightConj)
            
            //botleft rectangulo
            let botLeftCon = CGRectMake(38, 155, 60, 50)
            CGContextFillRect(contexto, botLeftCon)
            
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
            
            //DRAWING TEXT ON RECTANGLES
            (diagrama.arrayToString(diagrama.conj1) as NSString).drawInRect(topConj, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.conj2) as NSString).drawInRect(botRightConj, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.conj3) as NSString).drawInRect(botLeftCon, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.inters12) as NSString).drawInRect(interRight, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.inters13) as NSString).drawInRect(interLeft, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.inters23) as NSString).drawInRect(interBottom, withAttributes: textFontAttributes)
            (diagrama.arrayToString(diagrama.inters123) as NSString).drawInRect(interTri, withAttributes: textFontAttributes)

            print("DATOS CONJ 1: ")
            print(diagrama.conjuntos[0].datos)
            print("DATOS CONJ 2: ")
            print(diagrama.conjuntos[1].datos)
            print("DATOS CONJ 3: ")
            print(diagrama.conjuntos[2].datos)
            
            print("||||||||||||||||||||||||||")
            
            print("inters 1 2")
            print(diagrama.inters12)
            print("inters 1 3")
            print(diagrama.inters13)
            print("inters 2 3")
            print(diagrama.inters23)
            print("inters 1 2 3")
            print(diagrama.inters123)
            print("conj 1")
            print(diagrama.conj1)
            print("conj 2")
            print(diagrama.conj2)
            print("conj 3")
            print(diagrama.conj3)
            
            
        }

    }
}

