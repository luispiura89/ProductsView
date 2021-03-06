//
//  FindUsViewController.swift
//  ProductsView
//
//  Created by Luis Francisco Piura Mejia on 9/5/16.
//  Copyright © 2016 Luis Francisco Piura Mejia. All rights reserved.
//

import UIKit
import MapKit

class FindUsViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var geoCoderLabel: UILabel!
    @IBOutlet weak var findUsMapView: MKMapView!
    let radiusRegion = 4000.0
    var productImage: UIImage!
    var productLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        findUsMapView.delegate = self
        geoCoderLabel.text = ""
        // Do any additional setup after loading the view.
        //let location = CLLocation(latitude: 14.063383, longitude: -87.186829)
        
        centerMapWithLocation(productLocation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func centerMapWithLocation(_ location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, radiusRegion, radiusRegion)
        findUsMapView.setRegion(coordinateRegion, animated: true)
        let mapAnnotation = MKPointAnnotation()
        mapAnnotation.coordinate = location.coordinate
        
        findUsMapView.addAnnotation(mapAnnotation)
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { (placemarks : [CLPlacemark]?, error: Error?) in
            
            if let placemarks = placemarks{
                if let placemark = placemarks.last{
                    let geoCoderDescription = "\(placemark.locality!), \(placemark.country!)"
                    self.geoCoderLabel.text = geoCoderDescription
                }
            }
            
        }
    }
    
    //MARK: - MapView Delegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        let annotationView = MKAnnotationView()
        

        

        
        //view.layer.addSublayer(shapeLayer)
        
        let pinImage = productImage
        let size = CGSize(width: 50, height: 50)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(size)
        pinImage!.draw(in: rect)
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
    
        annotationView.layer.masksToBounds = true
        annotationView.image = resizedImage
        annotationView.layer.cornerRadius = annotationView.frame.width / 2
        
        

        
        
        UIView.animateKeyframes(withDuration: 2.0, delay: 0.0, options: UIViewKeyframeAnimationOptions.repeat, animations: {
            
            let duration = 2.0
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration:duration / 4, animations: {
                annotationView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: duration / 4, animations: {
                annotationView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            })
            
            
            UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: duration / 4, animations: {
                annotationView.transform = CGAffineTransform.identity
            })
            
            
            UIView.addKeyframe(withRelativeStartTime: 1.5, relativeDuration: duration / 4, animations: {
                annotationView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            })
            
            
        }) { (complete: Bool) in
            
        }
        
     
        
        return annotationView
    }
    
}
