//
//  VistaDibujos.swift
//  quartz
//
//  Created by Mario Díaz on 3/15/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

class VistaConjuntos: UIView {
    
    var conjuntos = [Conjunto]()
    
    //Drawing function
    override func drawRect(rect: CGRect) {
        
        //Contexto donde se dibujara
        let contexto = UIGraphicsGetCurrentContext()
        
        //Colores transparentes
        let negroTrans = CGColorCreateCopyWithAlpha(UIColor.blackColor().CGColor, 0.5)
        let magentaTrans = CGColorCreateCopyWithAlpha(UIColor.magentaColor().CGColor, 0.5)
        let blancoTrans = CGColorCreateCopyWithAlpha(UIColor.whiteColor().CGColor, 0.5)
        
        //Setting linewidth
        CGContextSetLineWidth(contexto, 2.0)
        
        if conjuntos.count == 2 {
            //Elipse-setting elipse stroke and fill color
            CGContextSetStrokeColorWithColor(contexto, UIColor.blackColor().CGColor)
            CGContextSetFillColorWithColor(contexto, negroTrans)
            
            let theRect: CGRect = CGRectMake(65, 15, 150, 150)
            CGContextFillEllipseInRect(contexto, theRect)
            CGContextStrokeEllipseInRect(contexto, theRect)
            
            //Setting new colors to stroke and fill
            CGContextSetStrokeColorWithColor(contexto, UIColor.whiteColor().CGColor)
            CGContextSetFillColorWithColor(contexto, magentaTrans)
            
            //Elipse
            let elipse: CGRect = CGRectMake(25, 85, 150, 150)
            CGContextFillEllipseInRect(contexto, elipse)
            CGContextStrokeEllipseInRect(contexto, elipse)
            
        } else if conjuntos.count == 3 {
            //Elipse-setting elipse stroke and fill color
            CGContextSetStrokeColorWithColor(contexto, UIColor.blackColor().CGColor)
            CGContextSetFillColorWithColor(contexto, negroTrans)
            
            let theRect: CGRect = CGRectMake(65, 15, 150, 150)
            CGContextFillEllipseInRect(contexto, theRect)
            CGContextStrokeEllipseInRect(contexto, theRect)
            
            //Setting new colors to stroke and fill
            CGContextSetStrokeColorWithColor(contexto, UIColor.whiteColor().CGColor)
            CGContextSetFillColorWithColor(contexto, magentaTrans)
            
            //Elipse
            let elipse: CGRect = CGRectMake(25, 85, 150, 150)
            CGContextFillEllipseInRect(contexto, elipse)
            CGContextStrokeEllipseInRect(contexto, elipse)
            
            
            //Setting new colors to stroke and fill
            CGContextSetStrokeColorWithColor(contexto, UIColor.grayColor().CGColor)
            CGContextSetFillColorWithColor(contexto, blancoTrans)
            
            //Elipse
            let elipseTwo: CGRect = CGRectMake(100, 85, 150, 150)
            CGContextFillEllipseInRect(contexto, elipseTwo)
            CGContextStrokeEllipseInRect(contexto, elipseTwo)

        }
    }
    
}

