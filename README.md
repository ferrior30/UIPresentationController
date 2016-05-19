# Custom View Controller Presentations
## 类 UIViewController 、 UIPresentationController 、
## 协议 UIViewControllerTransitionDelegeta 、 UIViewControllerAnimatedDelegate
##
* 转场对象创建完成后才有contentView,在这之前（init方法中为nil）。初始化值由presentingViewController的frame决定的，就是那个UI层次图上的那个UITransitonView的frame。可以重写此属性方法改变。系统的UIModerPresenationStyle返回的基本是全屏的。
##  基本调用顺序
```
[SecondViewController viewDidLoad]
[PresentationController containerView]
[PresentationController presentationTransitionWillBegin]
[PresentationController frameOfPresentedViewInContainerView]
2016-05-19 22:26:05.388 [PresentationController containerViewWillLayoutSubviews]
```

## 
* containView的尺寸决定了UITransitionView的尺寸
* frameOfChild方法返回content的frame，即presentedView的frame。
