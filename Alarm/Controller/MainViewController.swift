//
//  MainViewController.swift
//  Alarm
//
//  Created by ShinSheungmin on 12/19/15.
//  Copyright © 2015 HappyEngineer. All rights reserved.
//

import UIKit

private let reuseIdentifier = "AlarmCollectionViewCell"

class MainViewController: UICollectionViewController {
    let alarmManagerInstance = AlarmManager.sharedInstance
    let marginValue: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        registerCollectionViewCell()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSizeMake(CGRectGetWidth(self.view.frame) - marginValue * 2, 70)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}


// MARK: - UICollectionViewDataSource

extension MainViewController {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return alarmManagerInstance.numberOfSectionsInMainCollectionView
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alarmManagerInstance.totalAlarmItems
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: marginValue, left: 0, bottom: marginValue, right: 0)
    }
}


// MARK: - private method

extension MainViewController {
    func registerCollectionViewCell() {
        collectionView!.registerNib(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
}
