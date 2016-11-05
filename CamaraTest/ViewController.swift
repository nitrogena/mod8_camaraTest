//
//  ViewController.swift
//  CamaraTest
//
//  Created by Invitado on 21/10/16.
//  Copyright © 2016 Invitado. All rights reserved.
//
import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    override func viewDidLoad() {
        //CREAMOS BOTON CON CODIGO
        super.viewDidLoad()
        let aButton = UIButton()
        aButton.setTitle("Galería", forState:
            .Normal)
        aButton.setTitleColor(UIColor.blueColor(),
                              forState: .Normal)
        aButton.frame = CGRectMake(120, 50, 80, 30)
        //OBJETO BUTTON CON OBJETO AL QUE LE AISA CUANDO SUCEDE EL EVENTO .TOUCHUPINSIDE
        aButton.addTarget(self, action:
            "creaFotoGalleryPicker", forControlEvents:
            .TouchUpInside)
        self.view.addSubview(aButton)
    }
    
    func creaFotoGalleryPicker () {
        
        let imagePickerController: UIImagePickerController=UIImagePickerController()
        imagePickerController.modalPresentationStyle
            = .CurrentContext
        //para la galeria con .photolibrary
        //imagePickerController.sourceType = .PhotoLibrary
        
        //para la camara
        imagePickerController.sourceType = .Camera
        
        imagePickerController.delegate = self
        //permiso para editar
        imagePickerController.allowsEditing = true
        //este es como el allert controller
        self.presentViewController(
            imagePickerController, animated:true,
            completion:nil)
    }
    
    //se cierra el picker y me dice que foto tomo el usuario dela camara o galeria
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image:UIImage =
            info[UIImagePickerControllerOriginalImage]
                as! UIImage
        let selectedFoto:UIImageView =
            UIImageView(image: image)
        selectedFoto.frame = CGRectMake(16, 100, 288, 192);
        
        //selectedFoto.frame = CGRectMake(16, 100, image.size.width, image.size.height);
        
        //lo coloco en la vista
        self.view.addSubview(selectedFoto)
        self.dismissViewControllerAnimated(true,
                                           completion:nil)
    }
    
    //hace clic en el cancel
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true,
                                           completion:nil)
    }
    
    
}

