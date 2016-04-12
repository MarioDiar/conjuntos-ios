//
//  VistaDibujos.swift
//  quartz
//
//  Created by Mario Díaz on 3/15/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.

//TODO: Fix the view of 2 conjuntos 


import UIKit

class VistaConjuntos: UIView {
    
    var conjuntos = [Conjunto]()
    
    var operacion = Operacion()
    
    var testString = ""
    
    var number = 8
    
    //Drawing function
    override func drawRect(rect: CGRect) {
        
        //Contexto donde se dibujara
        let contexto = UIGraphicsGetCurrentContext()
        //Colores transparentes
        let negroTrans = CGColorCreateCopyWithAlpha(UIColor.orangeColor().CGColor, 0.5)
        let magentaTrans = CGColorCreateCopyWithAlpha(UIColor.magentaColor().CGColor, 0.5)
        let blancoTrans = CGColorCreateCopyWithAlpha(UIColor.cyanColor().CGColor, 0.5)
        let negro = CGColorCreateCopyWithAlpha(UIColor.blackColor().CGColor, 0.0)
        
        
        //Capa para mostrar los elementos de los conjuntos
        //let capaElementos = CGLayerCreateWithContext(contexto, self.frame.size, nil)
        //let contextoElementos = CGLayerGetContext(capaElementos)
        
        //Setting linewidth and stroke color
        CGContextSetLineWidth(contexto, 1.0)
        CGContextSetStrokeColorWithColor(contexto, UIColor.blackColor().CGColor)

        
        if conjuntos.count == 2 {
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
        
            
            
        } else if conjuntos.count == 3 {
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
            
        
            
            //DRAWING INVIS RECTANGLES TO DRAW ELEMENTS
            //y, x

            //top rectangulo
            var rectanguloTexto: CGRect = CGRectMake(115, 30, 60, 50)
            CGContextFillRect(contexto, rectanguloTexto)
            
            //botleft rectangulo
            rectanguloTexto = CGRectMake(38, 155, 60, 50)
            CGContextFillRect(contexto, rectanguloTexto)
            //botright rectangulo
            rectanguloTexto = CGRectMake(177, 157, 60, 50)
            CGContextFillRect(contexto, rectanguloTexto)
            
            //inter left
            rectanguloTexto = CGRectMake(73, 90, 40, 40)
            CGContextFillRect(contexto, rectanguloTexto)
            //inter right
            rectanguloTexto = CGRectMake(165, 90, 40, 40)
            CGContextFillRect(contexto, rectanguloTexto)
            //inter bottom
            rectanguloTexto = CGRectMake(118, 165, 44, 44)
            CGContextFillRect(contexto, rectanguloTexto)
            
            //tri conjunto
            rectanguloTexto = CGRectMake(117, 116, 44, 44)
            CGContextFillRect(contexto, rectanguloTexto)
            
            //DRAWING TEXT ON CONTEXT
            let font = UIFont(name: "Helvetica Bold", size: 14.0)
            
            let textFontAttributes : [String : AnyObject] = [ NSFontAttributeName: font! ]
            
            (operacion.arrayToString(conjuntos[1].datos) as NSString).drawInRect(rectanguloTexto, withAttributes: textFontAttributes)
            
        }
        
    }
}

