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
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
<<<<<<< HEAD
    
    
        let mapa = self.childViewControllers[0] as? MapaViewController
        print(mapa?.prueba)
=======
        
    }

    @IBOutlet weak var LabelTiempo: UILabel!
    
    
    @IBAction func StartButton(_ sender: UIButton) {
        timer.invalidate() // Por si se pulsa multiples veces
        
        // Arrancar Contador
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func StopButton(_ sender: UIButton) {
        timer.invalidate()
        
       // var counterSalvado = counter  //Por Si se usa mas tarde para guardar los tiempos
        counter = 0
    }
    
    
    @IBAction func PauseButton(_ sender: UIButton) {
        timer.invalidate()
    }
    
    func timerAction() {
        counter += 1
        LabelTiempo.text = "\(counter)s"
>>>>>>> origin/master
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
