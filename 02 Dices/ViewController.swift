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
    
    // Declaración de variables
    var valorDadoIzquierdo : Int = 0
    var valorDadoDerecho : Int = 0
    let imagenesDados : [String]
    let numeroCaras : UInt32
    
    required init?(coder aDecoder: NSCoder) { // Inicializador
        imagenesDados = ["dado1", "dado2", "dado3", "dado4", "dado5", "dado6"]
        numeroCaras = UInt32(imagenesDados.count)
        super.init(coder: aDecoder)
    }
    
    // Métodos del ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        generarDadosAleatorios()
    }

    // Métodos propios
    @IBAction func jugarPulsado(_ sender: UIButton) {
        generarDadosAleatorios()
    }
    
    // Función que genera los dados aleatorios
    func generarDadosAleatorios(){
        // Dado Izquierdo
        valorDadoIzquierdo = Int(arc4random_uniform(numeroCaras))
        
        // Dado Derecho
        valorDadoDerecho = Int(arc4random_uniform(numeroCaras))
        
        // Animación
        UIView.animate(withDuration: 0.3, // duracion de la animación
                       delay: 0.1, // tiempo que tarda en arrancar desde que pulsamos
                       options: UIView.AnimationOptions.curveEaseIn, //tipo de animación
                       animations: { // codigo de animación en si
                        self.imageViewDadoDerecha.transform =
                            CGAffineTransform(scaleX: 0.9, y: 0.9) .                          concatenating(CGAffineTransform(rotationAngle: CGFloat.pi)) .
                                concatenating(CGAffineTransform(translationX: 0, y: 20))
                        self.imageViewDadoIzquierda.transform =
                            CGAffineTransform(scaleX: 0.9, y: 0.9) .                          concatenating(CGAffineTransform(rotationAngle: CGFloat.pi)) .
                                concatenating(CGAffineTransform(translationX: 0, y: 20))
                        
                        
        }) {(completed) in // cuando acaba
            self.imageViewDadoDerecha.image = UIImage(named: self.imagenesDados[self.valorDadoDerecho])
            self.imageViewDadoIzquierda.image = UIImage(named: self.imagenesDados[self.valorDadoIzquierdo])
            self.imageViewDadoDerecha.transform = CGAffineTransform.identity // vuelve al estado original
            self.imageViewDadoIzquierda.transform = CGAffineTransform.identity // vuelve al estado original
        }
        
    }
    
}
