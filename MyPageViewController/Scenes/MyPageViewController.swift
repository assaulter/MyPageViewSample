//
//  MyPageViewController.swift
//  MyPageViewController
//
//  Created by Kazuki Kubo on 2019/06/14.
//  Copyright © 2019 Kazuki Kubo. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController, StoryBoardInstantiatable {

    @IBOutlet weak var tabView: TabView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "MyPageView"
    }
}
