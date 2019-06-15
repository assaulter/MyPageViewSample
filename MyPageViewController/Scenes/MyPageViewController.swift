//
//  MyPageViewController.swift
//  MyPageViewController
//
//  Created by Kazuki Kubo on 2019/06/14.
//  Copyright © 2019 Kazuki Kubo. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController, StoryBoardInstantiatable {

    @IBOutlet private weak var tabView: TabView!

    private lazy var controllers: [UIViewController] = {
        return [UIColor.blue, .yellow, .green].map({ (color) -> UIViewController in
            let vc = UIViewController()
            vc.view.backgroundColor = color
            return vc
        })
    }()

    private lazy var pageViewController: UIPageViewController? = {
        guard let vc = self.children.first as? UIPageViewController else { return nil }
        vc.delegate = self
        vc.dataSource = self
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "MyPageView"
        tabView.delegate = self

        // set first page ViewController.
        pageViewController?.setViewControllers([controllers[0]], direction: .forward, animated: false)
    }
}

extension MyPageViewController: TabViewDelegate {
    func selected(index: Int) {
        pageViewController?.setViewControllers([controllers[index]], direction: .forward
            , animated: true)
    }
}

extension MyPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController) else { return nil }
        if index == 0 { return nil }

        return controllers[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController) else { return nil }
        if index == controllers.count - 1 { return nil }

        return controllers[index + 1]
    }
}
