//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Philip Janzel Paradeza on 2022-08-09.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    var stormImg : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = stormImg
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let imageToLoad = stormImg {
            img.image  = UIImage(named: imageToLoad)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped(){
        guard let image = img.image?.jpegData(compressionQuality: 0.8) else{
            print("No Image Found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, stormImg], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
