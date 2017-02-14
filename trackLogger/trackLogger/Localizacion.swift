//
//  Localizacion.swift
//  trackLogger
//
//  Created by Iñaki Diaz on 5/2/17.
//  Copyright © 2017 Iñaki Diaz. All rights reserved.
//

import CoreLocation

var arrayPosiciones=[CLLocationCoordinate2D]()


class Localizacion:NSObject, CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    var altitud:String = ""
    var longitud:String = ""
    var latitud:String = ""
    var coordenadas = CLLocationManager().location?.coordinate
    var viewMapa:MapaViewController!
    
    override init() {
        super.init()
        
    }
    
    func activarLocalizacion(tipoRuta: Int){

        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate=self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            switch tipoRuta {
            case 0:
                locationManager.activityType = .fitness
            case 1:
                locationManager.activityType = .automotiveNavigation
            case 2:
                locationManager.activityType = .other
            default:
                print("Tipo de ruta mal")
            }
            
            print("tipo de ruta:")
            print(tipoRuta)
            locationManager.startUpdatingLocation()
            
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        coordenadas=locValue
        arrayPosiciones.append(locValue)
        altitud = "\(manager.location!.altitude)"
        print("locations = \(locValue.latitude) \(locValue.longitude) \(altitud)")
        longitud = "\(locValue.longitude)"
        latitud = "\(locValue.latitude)"
        rellenarPath(coordenada: locValue)
    }
    
    func rellenarPath(coordenada: CLLocationCoordinate2D){
        viewMapa.path.add(coordenada)
        viewMapa.refrescarMapa()
    }
}
