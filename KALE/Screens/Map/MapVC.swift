//
//  MapVC.swift
//  KALE
//
//  Created by Tai Chin Huang on 2022/12/2.
//

import MapKit
import UIKit

class MapVC: UIViewController {
    
    enum Section {
        case main
    }
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    typealias DataSource    = UICollectionViewDiffableDataSource<Section, Store>
    typealias Snapshot      = NSDiffableDataSourceSnapshot<Section, Store>
    
    private lazy var dataSource = configureDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
        mapView.frame = view.bounds
    }
}

extension MapVC {
    private func configureDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapStoreCell.reuseIdentifier, for: indexPath) as! MapStoreCell
            
            cell.set(with: itemIdentifier)
            
            return cell
        }
        return dataSource
    }
}
