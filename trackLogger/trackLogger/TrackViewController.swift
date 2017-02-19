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
    var stopPulsado = false
    var mapa:MapaViewController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("tipo de ruta del trackVIewer")
        print(tipoRuta)
        
        mapa = (self.childViewControllers[0] as? MapaViewController)!
        
        posicion = mapa?.posicion
        TimerLabel.text = "00:00:00"
        altura.text="\(posicion.altitud) metros"
        distancia.text = "0"
        latitud.text = "0"
        longitud.text = "0"
        
        /*
         botonStart.setTitle(play, for: .normal)
         botonStop.setTitle(stop, for: .normal)
         botonPausa.setTitle(pausa, for: .normal)
         */
    }
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet weak var altura: UILabel!
    
    @IBOutlet weak var distancia: UILabel!
    
    
    @IBOutlet weak var longitud: UILabel!
    
    @IBOutlet weak var latitud: UILabel!
    
    @IBAction func BotonStart(_ sender: UIButton) {
        if pausaPulsada{
            mapa?.path.removeAllCoordinates()
        }
        
        if stopPulsado{
            mapa?.path.removeAllCoordinates()
            posicion.totalDistance = 0
        }
        timer.invalidate() // Por si se pulsa multiples veces
        
        // Arrancar Contador
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        posicion.iniciarRuta(iniciar: true)
        
        stopPulsado = false
        pausaPulsada = false
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
        stopPulsado = true
        timer.invalidate()
        
        // var counterSalvado = counter  //Por Si se usa mas tarde para guardar los tiempos
        counter = 0
        minutos=0
        horas = 0
        
        
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
        distancia.text = "\(posicion.totalDistance) metros"
        altura.text="\(posicion.altitud) metros"
        latitud.text = posicion.latitud
        longitud.text = posicion.longitud
        
        
        
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
