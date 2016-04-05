//
//  VistaDibujos.swift
//  quartz
//
//  Created by Mario Díaz on 3/15/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

class VistaConjuntos: UIView {
    
    
    var printLayer: Bool = true
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        let contexto = UIGraphicsGetCurrentContext()
        var color = UIColor.blackColor()
        
        //Nueva Capa
        let capa = CGLayerCreateWithContext(contexto, self.frame.size, nil)
        //CGContextDrawLayerInRect(contexto, self.frame, capa)
        
        CGContextSetLineWidth(contexto, 2.0)
        CGContextSetStrokeColorWithColor(contexto, UIColor.blackColor().CGColor)
        CGContextSetFillColorWithColor(contexto, color.CGColor)
        
        //Elipse
        let theRect: CGRect = CGRectMake(65, 15, 150, 150)
        CGContextFillEllipseInRect(contexto, theRect)
        CGContextStrokeEllipseInRect(contexto, theRect)
        
        //Nuevos Colores
        color = UIColor.whiteColor()
        CGContextSetStrokeColorWithColor(contexto, UIColor.whiteColor().CGColor)
        CGContextSetFillColorWithColor(contexto, color.CGColor)
        
        //Elipse
        let elipse: CGRect = CGRectMake(25, 85, 150, 150)
        CGContextFillEllipseInRect(contexto, elipse)
        CGContextStrokeEllipseInRect(contexto, elipse)
        
        
        //Nuevos Colores
        color = UIColor.grayColor()
        CGContextSetStrokeColorWithColor(contexto, UIColor.grayColor().CGColor)
        CGContextSetFillColorWithColor(contexto, color.CGColor)
        
        
        //Elipse
        let elipseTwo: CGRect = CGRectMake(100, 85, 150, 150)
        CGContextFillEllipseInRect(contexto, elipseTwo)
        CGContextStrokeEllipseInRect(contexto, elipseTwo)
        
        
        
        if(printLayer){
            CGContextDrawLayerInRect(contexto, self.frame, capa)
        }
        
    }
    
    
}

