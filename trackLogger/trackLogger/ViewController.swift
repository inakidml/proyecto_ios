//
//  ViewController.swift
//  trackLogger
//
//  Created by Iñaki Diaz on 5/2/17.
//  Copyright © 2017 Iñaki Diaz. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var botonFitness: UIButton!
    
    @IBOutlet weak var botonMoto: UIButton!
    
    @IBOutlet weak var botonBarco: UIButton!
    
    func setIcons(){
    
    
    }
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        switch segue.identifier!{
        case "segueFitness":
            let destino = segue.destination as! TrackViewController;
            destino.tipoRuta = 0
        case "segueCar":
            let destino = segue.destination as! TrackViewController;
            destino.tipoRuta = 1
        case "segueOther":
            let destino = segue.destination as! TrackViewController;
            destino.tipoRuta = 2
        default:
            print("ruta erronea")
        }
        
        
     }
    

}

