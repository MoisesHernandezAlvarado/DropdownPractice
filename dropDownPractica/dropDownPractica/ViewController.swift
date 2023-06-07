//
//  ViewController.swift
//  dropDownPractica
//
//  Created by ISSC_412_2023 on 25/05/23.
//

import Cocoa

class ViewController: NSViewController, NSComboBoxDelegate, NSComboBoxDataSource {
    
    var titulos = ["Goat", "Boxing", "Peace"]
    var colores = ["Verde", "Naranja", "Morado"]
    var imagenes = ["Berserk", "miketyson", "chimaev"]
    
    var tituloSeleccionado:String = ""
    var colorSeleccionado:NSColor?
    var imagenSeleccionada:String = ""

    @IBOutlet weak var comboTitulo: NSComboBox!
    @IBOutlet weak var comboColor: NSComboBox!
    @IBOutlet weak var comboImagen: NSComboBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comboTitulo.delegate = self
        comboColor.delegate = self
        comboImagen.delegate = self

        for titulo in titulos{
            comboTitulo.addItem(withObjectValue: titulo)
        }
        
        for color in colores {
            comboColor.addItem(withObjectValue: color)
        }
        
        for imagen in imagenes {
            comboImagen.addItem(withObjectValue: imagen)
        }
    }

    @IBAction func setearValores(_ sender: Any) {
        tituloSeleccionado = comboTitulo.stringValue
        asignarColor(comboColor.stringValue)
        imagenSeleccionada = comboImagen.stringValue
        performSegue(withIdentifier: "cambiar", sender: self)
    }
    
    func asignarColor(_ color:String){
        switch color {
        case "Verde":
            colorSeleccionado = NSColor.green
        case "Naranja":
            colorSeleccionado = NSColor.orange
        case "Morado":
            colorSeleccionado = NSColor.purple
        default:
            break
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if(segue.identifier == "cambiar"){
            let destination = segue.destinationController as! otroViewController
            destination.titulo = tituloSeleccionado
            destination.color = colorSeleccionado
            destination.imagen = imagenSeleccionada
        }
    }
}

