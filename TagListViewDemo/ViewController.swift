//
//  ViewController.swift
//  TagListViewDemo
//
//  Created by Dongyuan Liu on 2015-05-09.
//  Copyright (c) 2015 Ela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TagListViewDelegate {

    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var biggerTagListView: TagListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupStoryboardViews()
        setupViewsManually()
    }
    
    private var removeButton: UIButton!
    private var tagView: TagListView!
    private var simpleView: UIView!
    
    private func addRemoveButton() {
        removeButton = UIButton(type: .custom)
        removeButton.frame = CGRect(x: 0, y: 0, width: simpleView.bounds.width, height: simpleView.bounds.height/2)
        removeButton.layer.cornerRadius = 10
        removeButton.clipsToBounds = true
        removeButton.layer.backgroundColor = UIColor.blue.cgColor
        removeButton.addTarget(self, action: #selector(removeButtonPressed), for: .touchUpInside)
        
        simpleView.addSubview(removeButton)
    }
    
    @objc func removeButtonPressed() {
        tagView.enableRemoveButton = !tagView.enableRemoveButton
    }
    
    private func setupViewsManually() {
        simpleView = UIView(frame: view.bounds)
        simpleView.backgroundColor = .white
        view.addSubview(simpleView)
        
        tagView = TagListView(frame: CGRect(x: 0, y: simpleView.bounds.height/2, width: simpleView.bounds.width, height: simpleView.bounds.height/2))
        simpleView.addSubview(tagView)
        
        addRemoveButton()
        
        tagView.backgroundColor = .blue
        
        tagView.addTag("Inboard")
        tagView.addTag("A lot of text... \n Multiline text... \n Event more Multiline text ")
        tagView.addTag("Pomotodo")
        tagView.addTag("A lot of text... \n Multiline text... \n Event more Multiline text ")
        tagView.addTag("Halo Word")
        tagView.addTag("A lot of text... \n Multiline text... \n Event more Multiline text ")
        tagView.addTag("123123312")
        tagView.addTag("2")
        tagView.addTag("123312")
        tagView.addTag("12")
        tagView.addTag("12")
        
        tagView.delegate = self
        tagView.textFont = .systemFont(ofSize: 40)
        tagView.shadowRadius = 2
        tagView.shadowOpacity = 0.4
        tagView.shadowColor = UIColor.black
        tagView.shadowOffset = CGSize(width: 1, height: 1)
        
        tagView.tagBackgroundColor = .orange
        tagView.borderColor = .red
        tagView.marginX = 10
        tagView.marginY = 10
        tagView.cornerRadius = 10
        tagView.alignment = .left
        tagView.removeIconLineColor = .green
        tagView.removeIconLineWidth = 3
        
        tagView.selectedTextColor = .red
        tagView.selectedBorderColor = .white
        tagView.tagSelectedBackgroundColor = .yellow
    }
    
    private func setupStoryboardViews() {
        tagListView.delegate = self
        tagListView.addTag("TagListView")
        tagListView.addTag("A lot of text... \n Multiline text... \n Event more Multiline text ")
        tagListView.addTag("TEAChart")
        tagListView.addTag("A lot of text... \n Multiline text... \n Event more Multiline text ")
        tagListView.addTag("To Be Removed")
        tagListView.addTag("A lot of text... \n Multiline text... \n Event more Multiline text ")
        tagListView.addTag("To Be Removed")
        tagListView.addTag("Quark Shell")
        tagListView.addTag("A lot of text... \n Multiline text... \n Event more Multiline text ")
        
        
        tagListView.removeTag("To Be Removed")
        tagListView.addTag("On tap will be removed").onTap = { [weak self] tagView in
            self?.tagListView.removeTagView(tagView)
        }
        
        let tagView = tagListView.addTag("gray")
        tagView.tagBackgroundColor = UIColor.gray
        tagView.onTap = { tagView in
            print("Don’t tap me!")
        }

        tagListView.insertTag("This should be the third tag", at: 2)
        
        biggerTagListView.delegate = self
        biggerTagListView.textFont = .systemFont(ofSize: 15)
        biggerTagListView.shadowRadius = 2
        biggerTagListView.shadowOpacity = 0.4
        biggerTagListView.shadowColor = UIColor.black
        biggerTagListView.shadowOffset = CGSize(width: 1, height: 1)
        biggerTagListView.addTag("Inboard")
        biggerTagListView.addTag("A lot of text... \n Multiline text... \n Event more Multiline text ")
        biggerTagListView.addTag("Pomotodo")
        biggerTagListView.addTag("A lot of text... \n Multiline text... \n Event more Multiline text ")
        biggerTagListView.addTag("Halo Word")
        biggerTagListView.addTag("A lot of text... \n Multiline text... \n Event more Multiline text ")
        biggerTagListView.alignment = .leading
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: TagListViewDelegate
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag pressed: \(title), \(sender)")
        tagView.isSelected = !tagView.isSelected
    }
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag Remove pressed: \(title), \(sender)")
        sender.removeTagView(tagView)
    }
}

