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
    var bouces: Bool = true
    private var currentPageIndex = 0

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

        if !self.bouces {
            // scrollviewを取り出し、delegateを自身にする
            let scrollView = vc.view.subviews.compactMap { $0 as? UIScrollView }.first
            scrollView?.delegate = self
        }

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
        let direction: UIPageViewController.NavigationDirection = (currentPageIndex < index) ? .forward : .reverse

        currentPageIndex = index
        pageViewController?.setViewControllers([controllers[index]], direction: direction
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

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }

        guard let targetViewControllers = pageViewController.viewControllers,
            let targetViewController = targetViewControllers.last,
            let index = controllers.firstIndex(of: targetViewController) else { return }

        currentPageIndex = index
    }
}

extension MyPageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (currentPageIndex == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0);
        } else if (currentPageIndex == controllers.count - 1 && scrollView.contentOffset.x > scrollView.bounds.size.width) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0);
        }
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if (currentPageIndex == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width) {
            targetContentOffset.pointee = CGPoint(x: scrollView.bounds.size.width, y: 0);
        } else if (currentPageIndex == controllers.count - 1 && scrollView.contentOffset.x > scrollView.bounds.size.width) {
            targetContentOffset.pointee = CGPoint(x: scrollView.bounds.size.width, y: 0);
        }
    }
}
