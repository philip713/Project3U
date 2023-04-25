//
//  ViewController.swift
//  StormViewer
//
//  Created by Philip Janzel Paradeza on 2022-08-09.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items{
            if(item.hasPrefix("nssl")){
                pictures.append(item)
            }
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareApp))
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.stormImg = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    @objc func shareApp(){
        let vc = UIActivityViewController(activityItems: ["Share this app to your friends"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

//    func getSongs(_ folderPath : String) -> [String]{
//        let enumerator = FileManager.default.enumerator(atPath: folderPath)
//        let filePaths = enumerator?.allObjects as! [String]
//        var txtFilePaths = filePaths.filter{$0.contains(".mp3")}
//        var i=0
//        while(i < txtFilePaths.count)
//        {
//            txtFilePaths[i] = (txtFilePaths[i] as NSString).deletingPathExtension
//            print(txtFilePaths[i])
//            i += 1
//        }
//        return txtFilePaths
//    }
}

