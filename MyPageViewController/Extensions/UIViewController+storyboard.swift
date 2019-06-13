//
//  UIViewController+storyboard.swift
//  MyPageViewController
//
//  Created by Kazuki Kubo on 2019/06/14.
//  Copyright © 2019 Kazuki Kubo. All rights reserved.
//

import Foundation
import UIKit

public protocol StoryBoardInstantiatable {}

public extension StoryBoardInstantiatable where Self: UIViewController {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)

        return storyboard.instantiateInitialViewController() as! Self
    }
}
