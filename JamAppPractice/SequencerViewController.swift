//
//  SequencerViewController.swift
//  JamAppPractice
//
//  Created by Patrick O'Leary on 3/31/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit
import AudioKit

private let reuseIdentifier = "sequencerCell"

class SequencerViewController: UICollectionViewController, SequencerCellDelegate{
    
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
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SequencerCell
        cell.itemNum = indexPath.item
        cell.delegate = self
        return cell
    }
    
    func buttonChange(key: Int, noteOn: Bool, noteValue: Int?) {
        let noteValue = noteValue ?? 60
        print("Telling sequencet to update with key \(key) note on: \(noteOn) and note value: \(noteValue)")
        oscSequencer.changeNote(key: key, noteOn: noteOn, noteValue: noteValue)

    }

}
