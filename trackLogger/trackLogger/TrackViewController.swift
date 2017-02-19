//
//  TrackViewController.swift
//  trackLogger
//
//  Created by Iñaki Diaz on 5/2/17.
//  Copyright © 2017 Iñaki Diaz. All rights reserved.
//

import UIKit

class TrackViewController: UIViewController {
    
    var counter = 0
    var minutos = 0
    var horas = 0
    var timer = Timer()
    var posicion:Localizacion! = nil
    var tipoRuta = 0 // 0 fitness 1 vehiculo 2 otro
    let stop = "\u{23F9}"
    let play = "\u{23FA}"
    let pausa = "\u{23F8}"
    var pausaPulsada = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("tipo de ruta del trackVIewer")
        print(tipoRuta)
        
        let mapa = self.childViewControllers[0] as? MapaViewController
        posicion = mapa?.posicion
        botonStart.setTitle(play, for: .normal)
         botonStop.setTitle(stop, for: .normal)
         botonPausa.setTitle(pausa, for: .normal)

    }
    	
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet weak var altura: UILabel!
    
    @IBAction func BotonStart(_ sender: UIButton) {
        timer.invalidate() // Por si se pulsa multiples veces
        
        // Arrancar Contador
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        posicion.iniciarRuta(iniciar: true)
    }
    
    @IBOutlet weak var botonStart: UIButton!
    @IBAction func BotonPausa(_ sender: UIButton) {
        timer.invalidate()
        if pausaPulsada {
        pausaPulsada = false
        posicion.iniciarRuta(iniciar: true)
            
        }else{
             pausaPulsada = true
        posicion.iniciarRuta(iniciar: false)
           
        }
        
    }
    
    @IBOutlet weak var botonPausa: UIButton!
    @IBAction func BotonStop(_ sender: UIButton) {
        timer.invalidate()
        
        // var counterSalvado = counter  //Por Si se usa mas tarde para guardar los tiempos
        counter = 0
        
        posicion.iniciarRuta(iniciar: false)
    }
    
    
    @IBOutlet weak var botonStop: UIButton!
    func timerAction() {
        counter += 1
        if counter==60 {
            counter=0
            minutos = minutos+1
        }
        if minutos==60 {
            minutos=0
            horas = horas+1
        }
        let time=String(format: "%02d:%02d:%02d", horas, minutos, counter)
        TimerLabel.text = time
        altura.text=posicion.altitud
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="segueMapa"{
            let destino = segue.destination as! MapaViewController	;
            destino.tipoRuta = tipoRuta
            
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
            
        }
        
        
    }
}
