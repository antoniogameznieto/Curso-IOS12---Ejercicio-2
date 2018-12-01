//
//  ViewController.swift
//  02 Dices
//
//  Created by antoniogamez on 1/12/18.
//  Copyright © 2018 Adhoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Propiedades
    
    @IBOutlet weak var imageViewDadoIzquierda: UIImageView!
    @IBOutlet weak var imageViewDadoDerecha: UIImageView!
    @IBOutlet weak var buttonJugar: UIButton!
    
    var valorDado1 = Int.random(in: 1 ..< 7)
    var valorDado2 = Int.random(in: 1 ..< 7)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imageViewDadoIzquierda.image = UIImage(named: "dado\(valorDado1)")
        self.imageViewDadoDerecha.image = UIImage(named: "dado\(valorDado2)")
    }

    // Métodos
    @IBAction func jugarPulsado(_ sender: UIButton) {
        valorDado1 = Int.random(in: 1 ..< 7)
        valorDado2 = Int.random(in: 1 ..< 7)
        self.imageViewDadoIzquierda.image = UIImage(named: "dado\(valorDado1)")
        self.imageViewDadoDerecha.image = UIImage(named: "dado\(valorDado2)")
    }
    
    
    
}

