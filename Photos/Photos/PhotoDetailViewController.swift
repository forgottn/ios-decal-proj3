//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Peter Duong on 11/13/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photo: Photo!

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        photoImageView.layer.borderColor = UIColor.blackColor().CGColor
        photoImageView.layer.borderWidth = 1.0
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let url = NSURL(string: photo.url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {
            (data, response, error) -> Void in
            if error == nil {
                let img = UIImage(data: data!)
                imageView.image = img
            }
        })
        task.resume()
    }
    
    func setupView() {
        photoImageView.image = UIImage(named: "insta.png")
        loadImageForCell(self.photo, imageView: photoImageView)
        usernameLabel.text = self.photo.username
        likesLabel.text = "\(self.photo.likes) Likes"
        dateLabel.text = self.photo.date
        
    }
    
    @IBAction func likePressed(sender: AnyObject) {
        if likeButton.currentTitle == "💙" {
            likeButton.setTitle("❤️", forState: UIControlState.Normal)
            photo.likes = photo.likes + 1
            likesLabel.text = "\(self.photo.likes) Likes"
        } else {
            likeButton.setTitle("💙", forState: UIControlState.Normal)
            photo.likes = photo.likes - 1
            likesLabel.text = "\(self.photo.likes) Likes"
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
