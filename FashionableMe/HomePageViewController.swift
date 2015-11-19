//
//  HomePageViewController.swift
//  FashionableMe
//
//  Created by adi on 17/11/15.
//
//
import MobileCoreServices
import UIKit


class HomePageViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var nextButton: DesignableButton!
    @IBOutlet weak var chooseTshirtsLabel: SpringLabel!
    @IBOutlet weak var minimumTshirtWarning: SpringLabel!
    @IBOutlet weak var weWillMatchLabel: UILabel!
        var Tshirt1 : UIImage?
        var Tshirt2 : UIImage?
        var Tshirt3 : UIImage?
    @IBAction func nextButton(sender: AnyObject) {
        
        Tshirt1 = tShirtArray[0]
        Tshirt2 = tShirtArray[1]
        Tshirt3 = tShirtArray[2]
        
        
    }
    
    
    var tShirtArray = [UIImage]()  // ARRAY TO STORE THE TSHIRTS.
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    var  photo : Bool?
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBAction func useCameraRoll(sender: AnyObject) {
       
        self.chooseTshirtsLabel.hidden = true
        self.weWillMatchLabel.hidden = true
        self.minimumTshirtWarning.hidden = false
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.SavedPhotosAlbum) {
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType =
                    UIImagePickerControllerSourceType.PhotoLibrary
                imagePicker.mediaTypes = [kUTTypeImage as String]
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true,
                    completion: nil)
                photo = false
            
        }
    }
    

    @IBAction func useCameraButton(sender: AnyObject) {
        self.chooseTshirtsLabel.hidden = true
        self.weWillMatchLabel.hidden = true
        self.minimumTshirtWarning.hidden = false//use the camera
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.mediaTypes =  [ kUTTypeImage as  String]
            imagePicker.allowsEditing = false
            photo = true
            self.presentViewController(imagePicker , animated : true , completion : nil)
    }
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        self.dismissViewControllerAnimated(true, completion: nil)
        
        if mediaType.isEqual(kUTTypeImage as! String){
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            if imageView.image == nil {
            self.imageView.image = image
                tShirtArray.append(image)
            
           
            
            } else if  imageView2.image == nil{
                self.imageView2.image = image
                tShirtArray.append(image)
            }else{
                self.imageView3.image = image
                tShirtArray.append(image)
                self.nextButton.hidden = false
                
            }
            
            if(photo == true){
                UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo:", nil)
            }
            
        
            
            
        }
    }
    
    
    func image(image : UIImage , didFinishSavingWithError error : NSErrorPointer , contextInfo : UnsafePointer<Void>){
        if error != nil {
            let alert = UIAlertController(title: "Save Failed",
                message: "Failed to save image",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                style: .Cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true,
                completion: nil)
        } else {
            var testAlert = UIAlertController(title: "Save Succeeded", message: "good", preferredStyle: .Alert)
        }
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.minimumTshirtWarning.hidden = true
        self.nextButton.hidden = true
        
        imageView.layer.borderWidth = 0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.grayColor().CGColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        
        imageView2.layer.borderWidth = 0
        imageView2.layer.masksToBounds = false
        imageView2.layer.borderColor = UIColor.grayColor().CGColor
        imageView2.layer.cornerRadius = imageView.frame.height/2
        imageView2.clipsToBounds = true
        
        imageView3.layer.borderWidth = 0
        imageView3.layer.masksToBounds = false
        imageView3.layer.borderColor = UIColor.grayColor().CGColor
        imageView3.layer.cornerRadius = imageView.frame.height/2
        imageView3.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toTorsoView"{
           var  destinationController = segue.destinationViewController as! TorsoViewController
            destinationController.Tshirt1 = Tshirt1
            destinationController.Tshirt2 = Tshirt2
            destinationController.Tshirt3 = Tshirt3
            
     
            
         
        }
        
       
    }


}
