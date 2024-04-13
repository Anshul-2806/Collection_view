//
//  ShowViewController.swift
//  collectionview to collectionview
//
//  Created by macbook pro on 17/05/23.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var imag = ""
    var lbll=""
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl.text = lbll
        img.image = UIImage(named: imag)
    }
    

    
}
