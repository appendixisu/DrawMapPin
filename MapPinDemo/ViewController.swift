//
//  ViewController.swift
//  MapPinDemo
//
//  Created by Andy on 2017/3/30.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let map = MKMapView(frame: view.bounds)
        map.delegate = self
        map.mapType = .standard
        view.addSubview(map)
        
        let annotaion = MKPointAnnotation()
        annotaion.coordinate.latitude = 25.033493
        annotaion.coordinate.longitude = 121.564101
        annotaion.title = "Taipei 101"
        
        map.setRegion(MKCoordinateRegion(center: annotaion.coordinate,
                                         span: MKCoordinateSpan(latitudeDelta: 0.05,
                                                                longitudeDelta: 0.05)),
                      animated: true)
        
        map.addAnnotation(annotaion)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        view.image = UIImage(named: "ic_archery_white")?.addMapPin(UIColor.black)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.image = UIImage(named: "ic_archery_white")?.addMapPin(UIColor.blue)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotaionView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        annotaionView.canShowCallout = true
        annotaionView.image = UIImage(named: "ic_archery_white")?.addMapPin(UIColor.blue)
        return annotaionView
    }
}
