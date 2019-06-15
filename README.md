# これはなに

## TopView -> Tab MyPageViewController button.

PageViewControllerを使い、スクロール可能な画面を作成。
（PageViewControllerのTransition Styleはscroll）

tabを画面上部に設置し、タップしてそのページに移動できる。

[![Image from Gyazo](https://i.gyazo.com/c3df1290eb3eb2dfdd763cf1547706ec.gif)](https://gyazo.com/c3df1290eb3eb2dfdd763cf1547706ec)

## TopView -> Tab withoutBounces(bug) button.
PageViewControllerのdelegateを奪い、無理やりbouncesを止めると、PageViewControllerのsetViewControllersがおかしくなる。

[![Image from Gyazo](https://i.gyazo.com/49475ea0f501243792c91b11b03b9fda.gif)](https://gyazo.com/49475ea0f501243792c91b11b03b9fda)

### 環境

Xcode: 10.2.1
Target: iOS 12.2
