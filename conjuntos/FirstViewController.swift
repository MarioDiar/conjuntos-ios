/*
* Clase FirstViewController. Creada por Mario Diaz 12/04/2016
*
* Controlador para la pantalla de pruebas.
*/

import UIKit

class FirstViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var AButtonLabel: UIButton!
    @IBOutlet weak var BButtonLabel: UIButton!
    @IBOutlet weak var CButtonLabel: UIButton!
    
    @IBOutlet weak var RightOneButtonLabel: UIButton!
    @IBOutlet weak var RightTwoButtonLabel: UIButton!
    @IBOutlet weak var RightThreeButtonLabel: UIButton!
    @IBOutlet weak var RightFourButtonLabel: UIButton!
    
    
    @IBOutlet weak var ALabel: UILabel!
    @IBOutlet weak var BLabel: UILabel!
    @IBOutlet weak var CLabel: UILabel!
    
    @IBOutlet weak var rightOneLabel: UILabel!
    @IBOutlet weak var rightTwoLabel: UILabel!
    @IBOutlet weak var rightThreeLabel: UILabel!
    @IBOutlet weak var rightFourLabel: UILabel!
    
    
    @IBOutlet weak var vistaConjuntos: VistaConjuntos!
    @IBOutlet weak var numConjuntosSegment: UISegmentedControl!
    @IBOutlet weak var unionInterSegment: UISegmentedControl!
    
    //Funcion que carga el diagrama en la aplicacion cada que se carga esta vista
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if numConjuntosSegment.selectedSegmentIndex == 0 {
            vistaConjuntos.numConjuntos = 3
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 3)
            setLabels(0, tipo: 0)
        } else {
            vistaConjuntos.numConjuntos = 2
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 2)
        }
        
        vistaConjuntos.diagrama.calculaDiagrama()
        setLabels(numConjuntosSegment.selectedSegmentIndex, tipo: unionInterSegment.selectedSegmentIndex)
        
    }
    
    //Funcion que detecta cuando se cambian el numero de conjuntos y vuelve a cargar el diagrama dependiendo el num. de conjuntos
    //que pide el usuario
    @IBAction func cambiaNumSegment(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            vistaConjuntos.numConjuntos = 3
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 3)
        } else {
            vistaConjuntos.numConjuntos = 2
            vistaConjuntos.diagrama = Diagrama(numConjuntos: 2)
        }
        vistaConjuntos.diagrama.calculaDiagrama()
        setLabels(numConjuntosSegment.selectedSegmentIndex, tipo: unionInterSegment.selectedSegmentIndex)
        vistaConjuntos.setNeedsDisplay()
    }
    
    @IBAction func cambiaOperacion(sender: UISegmentedControl) {
        setLabels(numConjuntosSegment.selectedSegmentIndex, tipo: unionInterSegment.selectedSegmentIndex)
    }
    
    //Funcion que despliega los elementos del conjuntos y su interseccion/union en formato de texto
    func setLabels(num: Int, tipo: Int) {
        if num == 0 && tipo == 0 {
            
            var stringTemp = "A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[0].datos) + "}"
            AButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
            BButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            
            stringTemp = "C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[2].datos) + "}"
            CButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            
            stringTemp = "A∩B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters12) + "}"
            RightOneButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            
            stringTemp = "A∩C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters13) + "}"
            RightTwoButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            
            stringTemp = "B∩C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters23) + "}"
            RightThreeButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "A∩B∩C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters123) + "}"
            RightFourButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
        } else if num == 1 && tipo == 0 {
            var stringTemp = "A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[0].datos) + "}"
            AButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = " "
            BButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
            CButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            
            stringTemp = " "
            RightOneButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "A∩B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters12) + "}"
            RightTwoButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            
            stringTemp = "B∩A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters12) + "}"
            RightThreeButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = " "
            RightFourButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
        } else if num == 0 && tipo == 1 {
            var stringTemp = "A = {" + "}"
            AButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
            BButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[2].datos) + "}"
            CButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
        } else if num == 1 && tipo == 1 {
            var stringTemp = "A = {"+"}"
            AButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = " "
            BButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
            CButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let popoverViewController = segue.destinationViewController as! PopoverController
        popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
        popoverViewController.popoverPresentationController!.delegate = self
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Popover function
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }


}

