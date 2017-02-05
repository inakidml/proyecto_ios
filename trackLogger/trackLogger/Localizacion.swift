//
//  Localizacion.swift
//  trackLogger
//
//  Created by Iñaki Diaz on 5/2/17.
//  Copyright © 2017 Iñaki Diaz. All rights reserved.
//

import CoreLocation


class Localizacion:NSObject, CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    var altitud:String = ""
    var longitud:String = ""
    var latitud:String = ""
    var coordenadas = CLLocationManager().location?.coordinate
    
    override init() {
        super.init()
        activarLocalizacion()
        
    }
    
    func activarLocalizacion(){
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate=self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        altitud = "\(manager.location!.altitude)"
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        longitud = "\(locValue.longitude)"
        latitud = "\(locValue.latitude)"
    }
}
