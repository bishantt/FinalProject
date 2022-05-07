//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/15/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore


class HomeViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectCollectionViewCell", for: indexPath) as! SubjectCollectionViewCell
        
        cell.setup(with: subjects[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let subjectClass = ["ScienceViewController","HistoryViewController","ComputerScienceViewController"]
//        ,"FilmViewController","C++ViewController"]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: subjectClass[indexPath.row])
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true)
        self.show(vc, sender: nil)
        
        print(indexPath.row)
       
    }
}
