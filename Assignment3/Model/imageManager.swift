//
//  imageManager.swift
//  Assignment3
//
//  Created by user202327 on 11/12/21.
//
import Foundation

class imageManager
{
    private var imageList = [image]()
    //appending new image in the list
    func addNewImage(i:image)
    {
        imageList.append(i)
    }
    //get all the added image.
    func getImageList()->[image]{
        return imageList
    }
}
