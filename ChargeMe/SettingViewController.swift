//
//  SettingViewController.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/02/27.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

class SettingViewController: UIPageViewController {
    var pageControl: UIPageControl!
    var allViewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        // Do any additional setup after loading the view.
        pageControl = UIPageControl(frame: CGRect(x:0, y:self.view.frame.height - 100, width:self.view.frame.width, height:50))
        pageControl.backgroundColor = .orange
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        self.view.addSubview(pageControl)
        let first = self.storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! SettingSleepViewController
        let second = storyboard!.instantiateViewController(withIdentifier: "SecondsViewController") as! SettingBatteryViewController
        self.allViewControllers = [first, second]
        self.setViewControllers([first], direction: .forward, animated: true, completion: nil)
    }

}

extension SettingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: SettingBatteryViewController.self) {
            pageControl.currentPage = 1
            return self.allViewControllers[0]
        } else if viewController.isKind(of: SettingSleepViewController.self) {
            pageControl.currentPage = 0
            return self.allViewControllers[1]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: SettingBatteryViewController.self) {
            pageControl.currentPage = 1
            return self.allViewControllers[0]
        } else if viewController.isKind(of: SettingSleepViewController.self) {
            pageControl.currentPage = 0
            return self.allViewControllers[1]
        } else {
             return nil
            
        }
    }
}
