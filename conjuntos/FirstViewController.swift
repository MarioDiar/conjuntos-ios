/*
* Clase FirstViewController. Creada por Mario Diaz 12/04/2016
*
* Controlador para la pantalla de pruebas.
*/

import UIKit

class FirstViewController: UIViewController {
    
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
            ALabel.text = "A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[0].datos) + "}"
            BLabel.text = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
            CLabel.text = "C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[2].datos) + "}"
            
            rightOneLabel.text = "A∩B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters12) + "}"
            rightTwoLabel.text = "A∩C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters13) + "}"
            rightThreeLabel.text = "B∩C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters23) + "}"
            rightFourLabel.text = "A∩B∩C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters123) + "}"
        } else if num == 1 && tipo == 0 {
            ALabel.text = "A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[0].datos) + "}"
            BLabel.text = ""
            CLabel.text = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
            
            rightOneLabel.text = ""
            rightTwoLabel.text = "A∩B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters12) + "}"
            rightThreeLabel.text = "B∩A = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.inters12) + "}"
            rightFourLabel.text = ""
        } else if num == 0 && tipo == 1 {
            ALabel.text = "A = {" + "}"
            BLabel.text = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
            CLabel.text = "C = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[2].datos) + "}"
            
        } else if num == 1 && tipo == 1 {
            ALabel.text = "A = {"+"}"
            BLabel.text = ""
            CLabel.text = "B = {" + vistaConjuntos.diagrama.arrayToString(vistaConjuntos.diagrama.conjuntos[1].datos) + "}"
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

