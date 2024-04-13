//
//  ViewController.swift
//  collectionview to collectionview
//
//  Created by macbook pro on 17/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var col: UICollectionView!
    
    var arr = [foodData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillData()
    }
    
    func fillData(){
        let foodMod1 = foodModels(foodModelNames: ["Frech Fries","Noodle","Veg Lolipop","Chowmein","Noodles"], foodModelImage: ["frenchfries","noodle","veglolipop","chowmein","noodle"])
        let food1 = foodData(foodCat: "chinesefood", foodModel: foodMod1)
        arr.append(food1)
        
        let foodMod2 = foodModels(foodModelNames: ["Vadapav","HotDog","Pizza","Chowmein","Sandwich"], foodModelImage: ["vadapav","hotdog","pizza","chowmein","sandwich"])
        let food2 = foodData(foodCat: "fastfood", foodModel: foodMod2)
        arr.append(food2)
        
        let foodMod3 = foodModels(foodModelNames: ["Pasta","Pasta","Pizza","Pizza","Pasta"], foodModelImage: ["pasta","pasta","pizza","pizza","pasta"])
        let food3 = foodData(foodCat: "italianfood", foodModel: foodMod3)
        arr.append(food3)
        
        let foodMod4 = foodModels(foodModelNames: ["Vada","Uttapam","Veg Salad","Uttapam","Vada"], foodModelImage: ["vada","uttapam","vegsalad","uttapam","vada"])
        let food4 = foodData(foodCat: "southfood", foodModel: foodMod4)
        arr.append(food4)
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let c = col.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        c.imgview.image = UIImage(named: arr[indexPath.row].foodCat)
        c.layer.borderColor = UIColor.red.cgColor
        c.layer.borderWidth = 2
        return c
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let s = (collectionView.frame.size.width)/2
        return CGSize(width: s, height: s)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        vc?.arrList = arr[indexPath.row].foodModel
        vc?.title = "Food Models of \(arr[indexPath.row].foodCat)"
        navigationController?.pushViewController(vc!, animated: true)
    }
}
