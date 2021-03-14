//
//  ViewController.swift
//  Asynchronous Programming
//
//  Created by Seunghun Yang on 2021/03/14.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBActions
    @IBAction func touchUpDownloadButton(_ sender: Any) {
        guard let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/LARGE_elevation.jpg/1600px-LARGE_elevation.jpg") else {
            return
        }
        
        OperationQueue.main.addOperation {
            do {
                let imageData = try Data.init(contentsOf: imageURL)
                guard let image: UIImage = UIImage(data: imageData) else {
                    return
                }
                self.imageView.image = image
                print("다됐어유")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

