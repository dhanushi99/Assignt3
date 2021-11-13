//
//  imageViewController.swift
//  Assignment3
//
//  Created by user202327 on 11/12/21.
//

import UIKit

protocol AddingPictureProtocol {
    func controllerDidFinishWithNewPicture(p:image)
    func controllerDidCancel()
}

    
class imageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var delegate:AddingPictureProtocol?
    @IBOutlet weak var imageName: UITextField!
    @IBOutlet weak var imageUrl: UITextField!
    
    //adding imgae when button  is pressedgg
    @IBAction func BtnAddImageClicked(_ sender: Any) {
        if let imgName = imageName.text{
            if let imgUrl = imageUrl.text{
                if !imgName.isEmpty && !imgUrl.isEmpty{
                    let newImage = image(a: imgName, b: imgUrl)
                    delegate?.controllerDidFinishWithNewPicture(p: newImage)
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func CancelClicked(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }
    
}

