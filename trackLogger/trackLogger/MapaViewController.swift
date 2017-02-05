//
//  MapaViewController.swift
//  trackLogger
//
//  Created by Iñaki Diaz on 5/2/17.
//  Copyright © 2017 Iñaki Diaz. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps


class MapaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let posicion:Localizacion = Localizacion()
        GMSServices.provideAPIKey("AIzaSyAcAS32jXy0BTQjCOe_Rnts2pbwAX6eqy4")

        // Do any additional setup after loading the view.
        
        //Mapas
        
        let camera = GMSCameraPosition.camera(withLatitude: (posicion.coordenadas?.latitude)!,
                                              longitude: (posicion.coordenadas?.longitude)!, zoom: 17)
        let mapView = GMSMapView.map(withFrame: CGRect(x: 100, y: 100, width: 200, height: 200), camera: camera)
       
        mapView.isMyLocationEnabled = true
        self.view=mapView
        
  

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
