//
//  ViewController.swift
//  scrollLoop
//
//  Created by D_ttang on 15/12/1.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    var pageOne: UIView!
    var pageTwo: UIView!
    var pageThree: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.delegate = self
//        scrollView.frame.origin.x = 0
        print(self.view.frame.width)
        scrollView.contentSize.width = self.view.frame.width * 3
        pageOne = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.scrollView.frame.height))
        pageTwo = UIView(frame: CGRect(x:self.view.frame.width, y: 0, width: self.view.frame.width, height: self.scrollView.frame.height))
        pageThree = UIView(frame: CGRect(x: self.view.frame.width * 2, y: 0, width: self.view.frame.width, height: self.scrollView.frame.height))
        
        pageOne.backgroundColor = UIColor.redColor()
        pageTwo.backgroundColor = UIColor.blueColor()
        pageThree.backgroundColor = UIColor.brownColor()
        
//        let MonthStoryboard = UIStoryboard(name: "Month", bundle: nil)
        // let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        // let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let MonthC =  MonthStoryboard.instantiateInitialViewController()
//        pageOne.addSubview(MonthC!.view)
        scrollView.addSubview(pageOne)
        scrollView.addSubview(pageTwo)
        scrollView.addSubview(pageThree)
        
        self.scrollView.setContentOffset(CGPointMake(self.view.frame.size.width, 0), animated: false)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let currentPage = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        
        if (currentPage == 0) {
            
            let tmpView = self.pageThree
            self.pageThree = self.pageTwo
            self.pageTwo = self.pageOne
            self.pageOne = tmpView;
        }
        
        if (currentPage == 2){

            let tmpView = self.pageOne
            self.pageOne = self.pageTwo
            self.pageTwo = self.pageThree
            self.pageThree = tmpView;
        }
        
        self.pageOne.frame.origin.x = 0
        self.pageTwo.frame.origin.x = self.view.frame.width
        self.pageThree.frame.origin.x = self.view.frame.width * 2
//        self.readCannelScrollView.contentOffset = CGPointMake(320, 0);
        self.scrollView.setContentOffset(CGPointMake(self.view.frame.size.width, 0), animated: false)
    }
}

