//
//  ViewController.swift
//  sdunson_MapRoute
//
//  Created by Shavaughn Dunson on 11/20/25.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    let pointA = CLLocationCoordinate2D(latitude: 30.097533601, longitude: -95.990065)
    let pointB = CLLocationCoordinate2D(latitude: 30.092069, longitude: -95.985845)
    
    func getDirections() {
        let sourceLocation = pointA
        let destinationLocation = pointB
        
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.coordinate = sourceLocation
        sourceAnnotation.title = "SR Collins"
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.coordinate = destinationLocation
        destinationAnnotation.title = "Architecture"
        
        map.showAnnotations([sourceAnnotation, destinationAnnotation], animated: true)
        
        //Request directions
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let destinationRequest = MKDirections.Request()
        destinationRequest.source = sourceMapItem
        destinationRequest.destination = destinationMapItem
        destinationRequest.transportType = .walking
        
        let directions = MKDirections(request: destinationRequest)
        directions.calculate { (response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            let route = response.routes[0]
            self.map.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.map.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .purple
        renderer.lineWidth = 6.0
        return renderer
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        map.delegate = self
        map.mapType = .hybrid
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        
        getDirections()//future: Allow user input for point A and B
    }


}
