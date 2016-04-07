//
//  VistaDibujos.swift
//  quartz
//
//  Created by Mario Díaz on 3/15/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.


//TODO: PUT INVISIBLE LAYERS WHERE THE TEXT WILL GO
//TODO: PRINT STUFF IN THE CORRECT PLACE
//TODO: PROCESS DATA OF CONJUNTOS
//TODO: DRAW DATA OF CONJUNTOS

import UIKit

class VistaConjuntos: UIView {
    
    var conjuntos = [Conjunto]()
    
    var testString = "your text"
    
    var number = 8
    
    var s: NSString = "Whereof we cannot speak, thereof we must remain silent."
    
    //Drawing function
    override func drawRect(rect: CGRect) {
        
        //Contexto donde se dibujara
        let contexto = UIGraphicsGetCurrentContext()
        //Colores transparentes
        let negroTrans = CGColorCreateCopyWithAlpha(UIColor.orangeColor().CGColor, 0.5)
        let magentaTrans = CGColorCreateCopyWithAlpha(UIColor.magentaColor().CGColor, 0.5)
        let blancoTrans = CGColorCreateCopyWithAlpha(UIColor.cyanColor().CGColor, 0.5)
        
        
        //Capa para mostrar los elementos de los conjuntos
        let capaElementos = CGLayerCreateWithContext(contexto, self.frame.size, nil)
        let contextoElementos = CGLayerGetContext(capaElementos)
        
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

        }
    }
}

