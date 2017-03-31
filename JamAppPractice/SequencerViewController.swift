//
//  SequencerViewController.swift
//  JamAppPractice
//
//  Created by Patrick O'Leary on 3/31/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

private let reuseIdentifier = "sequencerCell"

class SequencerViewController: UICollectionViewController {
    
    let oscSequencer = OscSequencer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.black
        oscSequencer.setUpSequencer()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SequencerCell
        
        
    
        return cell
    }
    
    func reportCellChange() {
        print(collectionView?.indexPathsForSelectedItems)
    }
    



}
