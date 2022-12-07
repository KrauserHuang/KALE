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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureLayout())
        collectionView.register(MapStoreCell.self, forCellWithReuseIdentifier: MapStoreCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    typealias DataSource    = UICollectionViewDiffableDataSource<Section, Store>
    typealias Snapshot      = NSDiffableDataSourceSnapshot<Section, Store>
    
    private lazy var dataSource = configureDataSource()
    
    let stores: [Store] = [
        Store(icon: "123", name: "123", rate: 123, comment: "123", openTime: "123", type: "123", costLevel: "123"),
        Store(icon: "456", name: "456", rate: 456, comment: "456", openTime: "456", type: "456", costLevel: "456"),
        Store(icon: "789", name: "789", rate: 789, comment: "789", openTime: "789", type: "789", costLevel: "789"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubviews(mapView, collectionView)
        mapView.frame = view.bounds
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        updateSnapshot()
        initLocation()
    }
    
    private func initLocation() {
        let initialLocation = CLLocation(latitude: 25.0330, longitude: 121.5654) //設定初始位置(台北市座標)
        let centerLocation = CLLocation(latitude: 25.0520, longitude: 121.5331) //設定中心位置(松江南京捷運站座標)
        let region = MKCoordinateRegion(center: centerLocation.coordinate, latitudinalMeters: 5000, longitudinalMeters: 6000)
        let boundary = MKMapView.CameraBoundary(coordinateRegion: region)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 50000)
        
        mapView.centerToLocation(initialLocation)
        mapView.setCameraBoundary(boundary, animated: true)
        mapView.setCameraZoomRange(zoomRange, animated: true)
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
    
    private func updateSnapshot(animated: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(stores, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: animated)
    }
    
    private func configureLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
