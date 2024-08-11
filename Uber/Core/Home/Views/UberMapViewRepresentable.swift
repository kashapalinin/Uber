//
//  UberViewMapRepresentable.swift
//  Uber
//
//  Created by Павел Калинин on 03.03.2024.
//

import SwiftUI
import MapKit

struct UberMapViewRepresentable: UIViewRepresentable{
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        switch mapState {
        case .noInput:
            context.coordinator.clearMapView()
            break
        case .searchingForLocation:

            break
        case .locationSelected:
            context.coordinator.clearMapView()
            if let selectedLocationCoordinate = locationViewModel.selectedLocationCoordinate{
                print(selectedLocationCoordinate)
                context.coordinator.addAndSelectAnnotation(coordinate: selectedLocationCoordinate)
                context.coordinator.configurePolyline(coordinate: selectedLocationCoordinate)
            }
        }
    }
    
    func makeCoordinator() -> MapCoordinator{
        return MapCoordinator(parent: self)
    }
}

extension UberMapViewRepresentable{
    
    class MapCoordinator: NSObject, MKMapViewDelegate{
        let parent: UberMapViewRepresentable
        var userLocation: CLLocationCoordinate2D?
        var currentRegion: MKCoordinateRegion?
        init(parent: UberMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation){
            self.userLocation = userLocation.coordinate
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            self.currentRegion = region
            parent.mapView.setRegion(region, animated: true)
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            var over = MKPolylineRenderer(overlay: overlay)
            over.strokeColor = .systemPink
            over.lineWidth = 6
            return over
        }
        
        func addAndSelectAnnotation(coordinate: CLLocationCoordinate2D){
            
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            self.parent.mapView.addAnnotation(anno)
            self.parent.mapView.selectAnnotation(anno, animated: true)
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
        }
        
        func configurePolyline(coordinate: CLLocationCoordinate2D){
            guard let userLocation = self.userLocation else {return}
            getDestinationRoute(from: userLocation, to: coordinate) { route in
                self.parent.mapView.addOverlay(route.polyline)
                let rect = self.parent.mapView.mapRectThatFits(route.polyline.boundingMapRect, edgePadding: .init(top: 64, left: 32, bottom: 500, right: 32))
                self.parent.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
        
        func getDestinationRoute(from userLocation: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping(MKRoute) -> Void){
            let userPlacemark = MKPlacemark(coordinate: userLocation)
            let destPlacemark = MKPlacemark(coordinate: destination)
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: userPlacemark)
            request.destination = MKMapItem(placemark: destPlacemark)
            let direction = MKDirections(request: request)
            direction.calculate { response, error in
                if error != nil{
                    return
                }
                guard let route = response?.routes.first else { return }
                completion(route)
            }
        }
        
        func clearMapView(){
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            parent.mapView.removeOverlays(parent.mapView.overlays)
            if let currenrRegion = currentRegion{
                parent.mapView.setRegion(currenrRegion, animated: true)
            }
        }
        
    }
}
