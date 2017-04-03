//
//  KeyboardView.swift
//  JamAppPractice
//
//  Created by Patrick O'Leary on 4/1/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class KeyboardView: UIView {

    var allKeys = [KeyView]()
    @IBOutlet weak var cKey: KeyView!
    @IBOutlet weak var dKey: KeyView!
    @IBOutlet weak var eKey: KeyView!
    @IBOutlet weak var fKey: KeyView!
    @IBOutlet weak var gKey: KeyView!
    @IBOutlet weak var aKey: KeyView!
    @IBOutlet weak var bKey: KeyView!
    @IBOutlet weak var c2Key: KeyView!
    @IBOutlet weak var cSharpKey: KeyView!
    @IBOutlet weak var dSharpKey: KeyView!
    @IBOutlet weak var fSharpKey: KeyView!
    @IBOutlet weak var gSharpKey: KeyView!
    @IBOutlet weak var aSharpKey: KeyView!
    
    @IBOutlet var contentView: UIView!
    
    weak var delegate: KeyboardViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("KeyboardView", owner: self, options: nil)
        setupView()
        allKeys = [cKey, cSharpKey, dKey, dSharpKey, eKey, fKey, fSharpKey, gKey, gSharpKey, aKey, aSharpKey, bKey, c2Key]
        setupKeyViews()
    }
    
    func setupView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    func setupKeyViews() {
        for keyView in allKeys {
            keyView.layer.borderWidth = 2
            keyView.layer.cornerRadius = keyView.frame.width/2
            let newGesture = UITapGestureRecognizer(target: self, action: #selector(keyPressed))
            keyView.addGestureRecognizer(newGesture)
        }
        cKey.setNoteValue(to: 60)
        cSharpKey.setNoteValue(to: 61)
        dKey.setNoteValue(to: 62)
        dSharpKey.setNoteValue(to: 63)
        eKey.setNoteValue(to: 64)
        fKey.setNoteValue(to: 65)
        fSharpKey.setNoteValue(to: 66)
        gKey.setNoteValue(to: 67)
        gSharpKey.setNoteValue(to: 68)
        aKey.setNoteValue(to: 69)
        aSharpKey.setNoteValue(to: 70)
        bKey.setNoteValue(to: 71)
        c2Key.setNoteValue(to: 72)
    }
    
    func keyPressed(recognizer: UITapGestureRecognizer, completion: (Int) -> Void){
        print("KEY PRESSED")
        let associatedView = recognizer.view as? KeyView
        print(associatedView?.noteValue ?? "No note value")
        guard let noteValue = associatedView?.noteValue else {return} //TODO handle this error better
        self.isHidden = true
        delegate?.noteOn(noteValue: noteValue)
    }
}

protocol KeyboardViewDelegate: class {
    
    func noteOn(noteValue: Int)
    
}

