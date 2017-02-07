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
    
    
    let posicion = Localizacion()
    let path = GMSMutablePath()
    var camera:GMSCameraPosition!
    var mapView:GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
               GMSServices.provideAPIKey("AIzaSyAcAS32jXy0BTQjCOe_Rnts2pbwAX6eqy4")
        posicion.viewMapa=self
        // Do any additional setup after loading the view.
        
        //Mapas
        
       dibujarMapa()
    }
    
    func dibujarMapa(){
        camera = GMSCameraPosition.camera(withLatitude: (posicion.coordenadas?.latitude)!,
        longitude: (posicion.coordenadas?.longitude)!, zoom: 16)
        mapView = GMSMapView.map(withFrame: CGRect(x: 100, y: 100, width: 200, height: 200), camera: camera)

        mapView.animate(toViewingAngle: 45)

        mapView.isMyLocationEnabled = true
             self.view=mapView
      
    }
    
    func refrescarMapa(){
        let nuevaPosicion = GMSCameraPosition.camera(withLatitude: (posicion.coordenadas?.latitude)!,
                                                     longitude: (posicion.coordenadas?.longitude)!, zoom: 16)
        mapView.camera = nuevaPosicion
        
        let polilinea = GMSPolyline(path: path)
        polilinea.map = mapView


        
    
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
