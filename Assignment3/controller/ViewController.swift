//
//  ViewController.swift
//  Assignment3
//
//  Created by user202327 on 11/12/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, AddingPictureProtocol{

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgName: UIPickerView!
    
    var manager:imageManager = imageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manager.getImageList().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return manager.getImageList()[row].imageName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let queue = DispatchQueue.init(label: "1")
        queue.async {
            let data = try? Data(contentsOf: URL(string: self.manager.getImageList()[row].imageUrl)!)
            DispatchQueue.main.async {
                self.imgView.image = UIImage(data: data!)
            }
        }
    }
    
    func controllerDidFinishWithNewPicture(p: image) {
        manager.addNewImage(i: p)
        imgName.reloadAllComponents()
    }
    
    func controllerDidCancel() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let apvc = segue.destination as!imageViewController
        apvc.delegate = self
    }
    
}

