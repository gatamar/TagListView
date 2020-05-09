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
    
    private func setupViewsManually() {
        let simpleView = UIView(frame: view.bounds)
        simpleView.backgroundColor = .white
        view.addSubview(simpleView)
        
        let tagView = TagListView(frame: CGRect(x: 0, y: simpleView.bounds.height/2, width: simpleView.bounds.width, height: simpleView.bounds.height/2))
        simpleView.addSubview(tagView)
        
        tagView.backgroundColor = .blue
        
        tagView.delegate = self
        tagView.textFont = .systemFont(ofSize: 15)
        tagView.shadowRadius = 2
        tagView.shadowOpacity = 0.4
        tagView.shadowColor = UIColor.black
        tagView.shadowOffset = CGSize(width: 1, height: 1)
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
        
        tagView.alignment = .leading
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

