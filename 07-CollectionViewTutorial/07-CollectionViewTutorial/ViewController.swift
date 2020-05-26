//
//  ViewController.swift
//  07-CollectionViewTutorial
//
//  Created by Atalay Aşa on 17.05.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

struct PhotoAlbum {
    var image: String
    var text: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let categories = ["Doğa", "Manzara", "İnsan", "Bilgisayar", "Kültür", "Ekonomi"]
    var photoAlbum = [PhotoAlbum]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
        for photo in 1...37 {
            photoAlbum.append(PhotoAlbum(image: "\(photo)", text: categories.randomElement()!))
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
        return CGSize(width:widthPerItem, height:300)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoAlbum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        let photo = photoAlbum[indexPath.row]
        // 2
        cell.cellImageView.image = UIImage(named: "\(photo.image)")
        // 3
        cell.cellLbl.text = photo.text
        // 4
        return cell
    }
    

}
