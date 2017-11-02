//
//  ViewController.swift
//  SimpleWeatherApp
//
//  Created by Marina Butovich on 11/2/17.
//  Copyright © 2017 Marinochka. All rights reserved.
//

import UIKit
import MapKit

protocol MapControllerDelegate: class {
    func userTappedOnLocation(coordinate: CLLocationCoordinate2D)
}

class MapViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    weak var delegate: MapControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.showsUserLocation = true
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        tapRecognizer.numberOfTapsRequired = 1
        self.mapView.addGestureRecognizer(tapRecognizer)
        
        mapView.delegate = self
    }

    @objc dynamic func handleTap(recongnizer: UITapGestureRecognizer) {
        if recongnizer.state != .ended {
            return
        }
        
        let touchPoint = recongnizer.location(in: self.mapView)
        let mapCoordinate = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        self.delegate?.userTappedOnLocation(coordinate: mapCoordinate)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        guard let location = userLocation.location else { return }
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
    }
}

