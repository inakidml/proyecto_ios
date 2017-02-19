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
    var totalDistance = 0
    var posicionAnterior = CLLocationManager().location
    var posicionActual = CLLocationManager().location
    var inicioRuta = false
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
                print("fitness")
                locationManager.activityType = .fitness
            case 1:
                print("coche")
                locationManager.activityType = .automotiveNavigation
            case 2:
                print("barco")
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
        if inicioRuta {
            rellenarPath(coordenada: locValue)
            calcularDistancia()
        }else{
            //para que no siga contando metros mienteras pause
            posicionActual = CLLocation(latitude: (coordenadas?.latitude)!, longitude: (coordenadas?.longitude)!) // user's current location
            posicionAnterior = posicionActual
        }
    }
    
    func iniciarRuta(iniciar: Bool){
        inicioRuta = iniciar
    }
    
    
    
    func rellenarPath(coordenada: CLLocationCoordinate2D){
        viewMapa.path.add(coordenada)
        viewMapa.refrescarMapa()
        
    }
    
    func calcularDistancia(){
        //cálculo de distancia
        posicionActual = CLLocation(latitude: (coordenadas?.latitude)!, longitude: (coordenadas?.longitude)!) // user's current location
        let distanceInMeters : CLLocationDistance = posicionAnterior!.distance(from: posicionActual!) // distance in meters
        print("distancia= \(distanceInMeters)")
        totalDistance += Int(distanceInMeters)
        print("distancia total =  \(totalDistance)")
        posicionAnterior = posicionActual
        
    }
}
