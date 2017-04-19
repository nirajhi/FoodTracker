//
//  MealViewController.swift
//  FoodTracker
//
//  Created by admin on 4/12/17.
//  Copyright © 2017 nirajhirachan. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var meal: Meal?

    @IBOutlet weak var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }



    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

    }

    // on image view tap
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {

        //Hide the keyboard
        nameTextField.resignFirstResponder()

        let ipCtrl = UIImagePickerController()
        // Only allow photos to be picked, not taken.

        ipCtrl.sourceType = .photoLibrary

        // Make sure ViewController is notified when the user picks an image.
        ipCtrl.delegate = self

        present(ipCtrl, animated: true, completion: nil)
    }

    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else{
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage

        //dismiss picker
        dismiss(animated: true, completion: nil)
    }


}

