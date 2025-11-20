//
//  ViewController.swift
//  sdunson_MAPGPS
//
//  Created by Shavaughn Dunson on 11/18/25.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var mapSwitch: UISwitch!
    @IBOutlet weak var mapSlider: UISlider!
    
    let locationManager = CLLocationManager() //to read GPS info
    
    var pathAnnotations: [MKPointAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Map Setup
        map.delegate = self
        map.mapType = .hybrid
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        
        //SR Collins: 30.097656715773226, -95.98974066364983
        //Apple: 37.335343786280774, -122.00926165086685
        let tmpRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33534, longitude: -122.00926),  latitudinalMeters: 500, longitudinalMeters: 500)
        map.setRegion(tmpRegion, animated: true)
        
        //Controls Setup
        mapSwitch.setOn(true, animated: true)
        mapSlider.minimumValue = 0.0
        mapSlider.maximumValue = 3.0
        mapSlider.setValue(1.05, animated: true)
        
        //initialize GPS
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //popup for user permissions
        
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("GPS Restricted")
            exit(0)
        case .denied:
            print("GPS Denied")
            exit(0)
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    
    //put current lo onna map
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = manager.location!.coordinate
        let myLocation = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
        
        map.removeAnnotations(map.annotations)
        let myCurrentLocationAnnotation = MKPointAnnotation()
        myCurrentLocationAnnotation.coordinate = myLocation
        map.addAnnotation(myCurrentLocationAnnotation)
        
        pathAnnotations.append(myCurrentLocationAnnotation)
        map.addAnnotations(pathAnnotations)
    }
    
    
    @IBAction func changeMapType(_ sender: Any) {
        if mapSwitch.isOn {
            map.mapType = .hybrid
        } else {
            map.mapType = .standard
        }
    }
    
    @IBAction func zoomMap(_ sender: Any) {
        let miles = Double(self.mapSlider.value)
        let delta = miles / 69.0
        
        var currentRegion = map.region
        currentRegion.span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        
        map.region = currentRegion
        
    }
    

}

