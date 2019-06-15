//
//  ViewController.swift
//  MyPageViewController
//
//  Created by Kazuki Kubo on 2019/06/14.
//  Copyright © 2019 Kazuki Kubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, StoryBoardInstantiatable {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "TopView"
    }

    @IBAction func pushMyPageView(_ sender: Any) {
        navigationController?.pushViewController(MyPageViewController.instantiate(), animated: true)
    }

    @IBAction func pushWithoutBounces(_ sender: Any) {
        let vc = MyPageViewController.instantiate()
        vc.bouces = false
        navigationController?.pushViewController(vc, animated: true)

    }
}

