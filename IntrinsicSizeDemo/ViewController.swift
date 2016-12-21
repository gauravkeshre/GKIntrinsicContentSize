//
//  ViewController.swift
//  IntrinsicSizeDemo
//
//  Created by Gaurav Keshre on 21/12/16.
//  Copyright © 2016 GauravKeshre. All rights reserved.
//

import UIKit

let Phone = "+91 9977151111"
let Message = "All happy families are alike; each unhappy family is unhappy in its own way."
let Para = "The only people for me are the mad ones, the ones who are mad to live, mad to talk, mad to be saved, desirous of everything at the same time, the ones who never yawn or say a commonplace thing, but burn, burn, burn like fabulous yellow roman candles exploding like spiders across the stars.” – Jack Kerouac, On The Road"

let Essay = "A green hunting cap squeezed the top of the fleshy balloon of a head. The green earflaps, full of large ears and uncut hair and the fine bristles that grew in the ears themselves, stuck out on either side like turn signals indicating two directions at once. Full, pursed lips protruded beneath the bushy black moustache and, at their corners, sank into little folds filled with disapproval and potato chip crumbs. In the shadow under the green visor of the cap Ignatius J. Reilly’s supercilious blue and yellow eyes looked down upon the other people waiting under the clock at the D.H. Holmes department store, studying the crowd of people for signs of bad taste in dress. Several of the outfits, Ignatius noticed, were new enough and expensive enough to be properly considered offenses against taste and decency. Possession of anything new or expensive only reflected a person’s lack of theology and geometry; it could even cast doubts upon one’s soul."

class ViewController: UIViewController {

    @IBOutlet weak var containerView    : UIView!
    let texts = [Phone, Message, Para, Essay]
    weak var infoView: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let cv = CustomView.fromNib()
        cv.bounds = self.containerView.bounds
        containerView.addSubview(cv)
        cv.addFullViewConstraints(containerView)
        infoView = cv
        self.handleValueChange(sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleValueChange(sender: UISegmentedControl?){
        let ind = sender?.selectedSegmentIndex ?? 0
        let data  = texts[ind]
        infoView.setData(text: data)
        infoView.setNeedsLayout()
    }

}

