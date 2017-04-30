//
//  HomeMainViewController.swift
//  Rewardago
//
//  Created by Hassanain Anver on 4/17/17.
//  Copyright © 2017 BeZingo Media. All rights reserved.
//

import UIKit

    



//Assigning of Delegates

class HomeMainViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {

    @IBOutlet weak var voucherViewCollectionView: UICollectionView!
    
    var titleArray = [String]()
    var longtitleArray = [String]()
    var imageURLArray = [String]()
    var logoURLArray = [String]()
    
    // Calling Web service
    
    final let urlString = "http://rewardago.com/cron/json.php"
    
    // Vouchers list view calling
    
     //var imagesmall = ["voucher1" , "voucher2" , "voucher3" , "voucher4"]
    
    // Calling Webservice to get List View Voucher Data
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.downloadJsonWithURL()
        
        
    
        
        //Collection View Displaying Vouchers

        voucherViewCollectionView.delegate = self
        voucherViewCollectionView.dataSource = self
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    
        
        //Download data from URL
    }
    
    func downloadJsonWithURL() {
        
        
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            print(data)

            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey:"Coupon"))
                
                //converting Arrays to NSDictionary
                
                
                if let couponArray = jsonObj!.value(forKey: "Coupon") as? NSArray {
                    for Coupon in couponArray{
                    if let couponDict = Coupon as? NSDictionary {
                        if let title = couponDict.value(forKey: "title") {
                            self.titleArray.append(title as! String)
                        }
                        if let sub_title = couponDict.value(forKey: "Sub_Title") {
                            self.longtitleArray.append(sub_title as! String)
                        }

                        if let main_image = couponDict.value(forKey: "image") {
                            self.imageURLArray.append(main_image as! String)
                        }

                        if let logo = couponDict.value(forKey: "Store_logo") {
                            self.logoURLArray.append(logo as! String)
                        }
                        
                    }
                }
                    self.voucherViewCollectionView.reloadData()

            }
                
            
        }
    }).resume()
    }

    // Placing data into collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return titleArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VoucherViewCell", for: indexPath) as! VoucherViewCell
        cell.voucherTitle.text = titleArray[indexPath.row]
        cell.voucherLongTitle.text = longtitleArray[indexPath.row]
        
        let imageURL = NSURL(string: imageURLArray[indexPath.row])
        
        if imageURL != nil {
         let data = NSData(contentsOf: (imageURL as? URL)!)
        
        
        
        cell.voucherImageSmall.image = UIImage(data: data! as Data)
        }
        
        let logoURL = NSURL(string: logoURLArray[indexPath.row])
        
        if logoURL != nil {
            let data = NSData(contentsOf: (logoURL as? URL)!)
            
            cell.voucherLogo.image = UIImage(data: data! as Data)
        }
        
        return cell
        
        
    }


}
