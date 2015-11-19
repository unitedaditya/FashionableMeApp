//
//  MainScreenViewController.swift
//  FashionableMe
//
//  Created by adi on 18/11/15.
//
//

import UIKit

class MainScreenViewController: UIViewController {
    @IBOutlet weak var tshirtRandomImage: UIImageView!

    
    @IBOutlet weak var torsoRandomImage: UIImageView!
    
    var randomTorsoGenerated : UIImage!
    var randomTshirtGenerated : UIImage!
    
    var Tshirt1 : UIImage!
    var Tshirt2 : UIImage!
    var Tshirt3 : UIImage!
    
    var Torso1 : UIImage!
    var Torso2 : UIImage!
    var Torso3 : UIImage!
    
    var shareImage : UIImage!
    
    
    
    var tshirtArray = [UIImage]()
    var torsoArray = [UIImage]()
    
    
    @IBAction func dislikeButton(sender: AnyObject) {
    
        
       let randomIndex = Int(arc4random_uniform(UInt32(tshirtArray.count)))
       randomTshirtGenerated = tshirtArray[randomIndex]
        self.tshirtRandomImage.image = randomTshirtGenerated
        let randomIndex1 = Int(arc4random_uniform(UInt32(torsoArray.count)))
        randomTorsoGenerated = torsoArray[randomIndex]
        self.torsoRandomImage.image = randomTorsoGenerated
        
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
   
  
        
        tshirtRandomImage.layer.borderWidth = 2
        tshirtRandomImage.layer.masksToBounds = false
        tshirtRandomImage.layer.borderColor = UIColor.blackColor().CGColor
        tshirtRandomImage.layer.cornerRadius = tshirtRandomImage.frame.height/2
        tshirtRandomImage.clipsToBounds = true
        
        torsoRandomImage.layer.borderWidth = 2
        torsoRandomImage.layer.masksToBounds = false
        torsoRandomImage.layer.borderColor = UIColor.blackColor().CGColor
        torsoRandomImage.layer.cornerRadius = torsoRandomImage.frame.height/2
        torsoRandomImage.clipsToBounds = true
        tshirtArray.append(Tshirt1)
         tshirtArray.append(Tshirt2)
         tshirtArray.append(Tshirt3)
        
        torsoArray.append(Torso1)
        torsoArray.append(Torso2)
        torsoArray.append(Torso3)
        
        
      self.tshirtRandomImage.image = Tshirt3
        self.torsoRandomImage.image = Torso3

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            dislikeButton(self)
        }
    }
    
    
    @IBAction func screenShot() {
        
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //self.shareImage = image
        let alert = UIAlertController(title: "Success",
            message: "Image saved in Photo Gallery",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancelAction = UIAlertAction(title: "OK",
            style: .Cancel, handler: nil)
        
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true,
            completion: nil)

      
       
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
      
    }
 
    func airDropHelper(){
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.shareImage = image
        
        
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
    }
   
    @IBAction func shareAirDrop(sender: AnyObject) {
   
        
        airDropHelper()
        let image = shareImage
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        controller.excludedActivityTypes = [UIActivityTypePostToWeibo, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypePostToFlickr, UIActivityTypePostToTencentWeibo, UIActivityTypeMail]
        
        
        self.presentViewController(controller, animated: true, completion: nil)
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            
            
            
        
    }
 
}

