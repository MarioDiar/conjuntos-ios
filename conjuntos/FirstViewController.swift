/*
* Clase FirstViewController. Creada por Mario Diaz 12/04/2016
*
* Controlador para la pantalla de pruebas.
*/

import UIKit

class FirstViewController: UIViewController, UIPopoverPresentationControllerDelegate, CambiaElementosDelegate {
    
    @IBOutlet weak var AButtonLabel: UIButton!
    @IBOutlet weak var BButtonLabel: UIButton!
    @IBOutlet weak var CButtonLabel: UIButton!
    
    @IBOutlet weak var RightOneButtonLabel: UIButton!
    @IBOutlet weak var RightTwoButtonLabel: UIButton!
    @IBOutlet weak var RightThreeButtonLabel: UIButton!
    @IBOutlet weak var RightFourButtonLabel: UIButton!
    
    @IBOutlet weak var vistaConjuntos: VistaConjuntos!
    @IBOutlet weak var numConjuntosSegment: UISegmentedControl!
    @IBOutlet weak var unionInterSegment: UISegmentedControl!
    
    //Funcion que carga el diagrama en la aplicacion cada que se carga esta vista
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
    }
    
    func reload() {
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
        vistaConjuntos.setNeedsDisplay()
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
        //3 conjuntos y tipo interseccion
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
            RightTwoButtonLabel.backgroundColor = UIColor(red: 158/255, green: 174/255, blue: 179/255, alpha: 1)
            
            stringTemp = "B∩C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters23) + "}"
            RightThreeButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            RightThreeButtonLabel.backgroundColor = UIColor(red: 158/255, green: 174/255, blue: 179/255, alpha: 1)
            
            stringTemp = "A∩B∩C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters123) + "}"
            RightFourButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            RightFourButtonLabel.backgroundColor = UIColor(red: 73/255, green: 123/255, blue: 111/255, alpha: 1)
        //2 conjuntos y tipo interseccion
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
            RightTwoButtonLabel.backgroundColor = UIColor(red: 73/255, green: 123/255, blue: 111/255, alpha: 1)
            
            
            stringTemp = "B∩A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters12) + "}"
            RightThreeButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            RightThreeButtonLabel.backgroundColor = UIColor(red: 73/255, green: 123/255, blue: 111/255, alpha: 1)
            
            stringTemp = " "
            RightFourButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            RightFourButtonLabel.backgroundColor = UIColor(red: 158/255, green: 174/255, blue: 179/255, alpha: 1)
            
        //3 conjuntos y union
        } else if num == 0 && tipo == 1 {
            var stringTemp = "A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[0].datos) + "}"
            AButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
            BButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[2].datos) + "}"
            CButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "AuB = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.union12) + "}"
            RightOneButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            
            stringTemp = "AuC = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.union13) + "}"
            RightTwoButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            RightTwoButtonLabel.backgroundColor = UIColor(red: 158/255, green: 174/255, blue: 179/255, alpha: 1)
            
            stringTemp = "BuC = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.union23) + "}"
            RightThreeButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            RightThreeButtonLabel.backgroundColor = UIColor(red: 158/255, green: 174/255, blue: 179/255, alpha: 1)
            
            stringTemp = "AuBuC = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.union123) + "}"
            RightFourButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            RightFourButtonLabel.backgroundColor = UIColor(red: 73/255, green: 123/255, blue: 111/255, alpha: 1)
        //2 conjuntos y union
        } else if num == 1 && tipo == 1 {
            var stringTemp = "A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[0].datos) + "}"
            AButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = " "
            BButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
            CButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = " "
            RightOneButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            
            stringTemp = "AuB = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.union12) + "}"
            RightTwoButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            RightTwoButtonLabel.backgroundColor = UIColor(red: 73/255, green: 123/255, blue: 111/255, alpha: 1)
            
            
            stringTemp = "BuA = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.union12) + "}"
            RightThreeButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            RightThreeButtonLabel.backgroundColor = UIColor(red: 73/255, green: 123/255, blue: 111/255, alpha: 1)
            
            stringTemp = " "
            RightFourButtonLabel.setAttributedTitle(NSAttributedString(string: stringTemp), forState: UIControlState.Normal)
            RightFourButtonLabel.backgroundColor = UIColor(red: 158/255, green: 174/255, blue: 179/255, alpha: 1)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let popoverViewController = segue.destinationViewController as! PopoverController
        popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
        popoverViewController.popoverPresentationController!.delegate = self
        popoverViewController.cambiaElementosDelegate = self
        
        popoverViewController.popoverPresentationController?.sourceView = self.view
        popoverViewController.popoverPresentationController?.sourceRect = CGRectMake(137,104,0,0)
        
        
        if segue.identifier == "a" {
            popoverViewController.numConjuntos = vistaConjuntos.diagrama.conjuntos[0].datos.count
            
            popoverViewController.numDeConjunto = 0
            
        } else if segue.identifier == "b" {
            popoverViewController.numConjuntos = vistaConjuntos.diagrama.conjuntos[1].datos.count
            popoverViewController.numDeConjunto = 1
            
        } else if segue.identifier == "c" {
            popoverViewController.numConjuntos = vistaConjuntos.diagrama.conjuntos[2].datos.count
            popoverViewController.numDeConjunto = 2
            
        }
    }
    
    func cambiaElementos(num: Int, conj: Int) {
        var datos = [Int?]()
        print(num)
        var ranNum = 0
        if conj == 0 {
            ranNum = vistaConjuntos.diagrama.ranOne
        } else if conj == 1 {
            ranNum = vistaConjuntos.diagrama.ranTwo
        } else if conj == 2 {
            ranNum = vistaConjuntos.diagrama.ranTwo
        }
        
        if num != 0 {
            for i in 1...num {
                datos.append(i + ranNum)
            }
        }
        
        vistaConjuntos.diagrama.conjuntos[conj].datos = datos
        vistaConjuntos.diagrama.calculaDiagrama()
        setLabels(numConjuntosSegment.selectedSegmentIndex, tipo: unionInterSegment.selectedSegmentIndex)
        vistaConjuntos.setNeedsDisplay()
    }

    @IBAction func clickReload(sender: UIButton) {
        reload()
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

