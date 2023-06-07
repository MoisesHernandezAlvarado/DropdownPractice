//
//  otroViewController.swift
//  dropDownPractica
//
//  Created by ISSC_412_2023 on 25/05/23.
//

import Cocoa

class otroViewController: NSViewController {
    var titulo:String?
    var color:NSColor?
    var imagen:String?
    
    @IBOutlet weak var lblTitulo: NSTextField!
    @IBOutlet var fondo: NSView!
    @IBOutlet weak var imgSeleccionada: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitulo.stringValue = titulo!
        fondo.wantsLayer = true
        fondo.layer?.backgroundColor = color?.cgColor
        imgSeleccionada.image = NSImage(named: imagen!)
    }
    
}
