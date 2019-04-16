//
//  GeoViewController.swift
//  Collection
//
//  Created by ijk on 4/11/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit
import CoreLocation

class GeoViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager:CLLocationManager!

    @IBOutlet weak var editLat: UITextField!
    @IBOutlet weak var editLng: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("sdc")
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        determineMyCurrentLocation()
    }
    
    
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        editLat.text = String(userLocation.coordinate.latitude)
        editLng.text = String(userLocation.coordinate.longitude)
        
    }
    



}
