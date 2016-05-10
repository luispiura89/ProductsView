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
    
    func centerMapWithLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, radiusRegion, radiusRegion)
        findUsMapView.setRegion(coordinateRegion, animated: true)
        let mapAnnotation = MKPointAnnotation()
        mapAnnotation.coordinate = location.coordinate
        
        findUsMapView.addAnnotation(mapAnnotation)
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { (placemarks : [CLPlacemark]?, error: NSError?) in
            
            if let placemarks = placemarks{
                if let placemark = placemarks.last{
                    let geoCoderDescription = "\(placemark.locality!), \(placemark.country!)"
                    self.geoCoderLabel.text = geoCoderDescription
                }
            }
            
        }
    }
    
    //MARK: - MapView Delegate
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView()
        
        let pinImage = productImage//UIImage(named: "iPad4.jpeg")
        let size = CGSize(width: 50, height: 50)
        UIGraphicsBeginImageContext(size)
        pinImage!.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        annotationView.image = resizedImage
        annotationView.layer.cornerRadius = 20
        annotationView.layer.masksToBounds = true
        
        UIView.animateKeyframesWithDuration(2.0, delay: 0.0, options: UIViewKeyframeAnimationOptions.Repeat, animations: {
            
            let duration = 2.0
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration:duration / 4, animations: {
                annotationView.transform = CGAffineTransformMakeScale(1.2, 1.2)
                
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: duration / 4, animations: {
                annotationView.transform = CGAffineTransformMakeScale(0.8, 0.8)
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(1, relativeDuration: duration / 4, animations: {
                annotationView.transform = CGAffineTransformIdentity
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(1.5, relativeDuration: duration / 4, animations: {
                annotationView.transform = CGAffineTransformMakeScale(0.8, 0.8)
            })
            
            
        }) { (complete: Bool) in
            
        }
        
        return annotationView
    }
    
}
