//
//  SecondViewController.swift
//  collectionview to collectionview
//
//  Created by macbook pro on 17/05/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var coll: UICollectionView!
    
    var arrList:foodModels = foodModels(foodModelNames: [""], foodModelImage: [""])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   

}

extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrList.foodModelNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let c = coll.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyTwoCollectionViewCell
        c.img1.image = UIImage(named: arrList.foodModelImage[indexPath.row])
        c.lbl.text = arrList.foodModelNames[indexPath.row]
        c.layer.borderWidth = 2
        c.layer.borderColor = UIColor.red.cgColor
        return c
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ShowViewController") as! ShowViewController
        vc.imag = arrList.foodModelImage[indexPath.row]
        vc.lbll = arrList.foodModelNames[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
