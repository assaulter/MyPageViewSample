//
//  TabView.swift
//  MyPageViewController
//
//  Created by Kazuki Kubo on 2019/06/14.
//  Copyright © 2019 Kazuki Kubo. All rights reserved.
//

import UIKit

final class TabView: UIView {

    @IBOutlet private weak var collectionView: UICollectionView!
    private let tabItems = ["tab1", "tab2", "tab3"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXib()
    }

    override func layoutSubviews() {
        setupCollectionView()
    }

    // MARK: - private

    private func loadXib() {
        let view = Bundle.main.loadNibNamed(String(describing: TabView.self), owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }

    private func setupCollectionView() {
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: self.frame.width / 3, height: self.frame.height)
        collectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: TabCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self    }
}

extension TabView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TabCollectionViewCell.self), for: indexPath) as! TabCollectionViewCell
        cell.title = tabItems[indexPath.row]

        return cell
    }
}
