import UIKit

enum MainTabBarItem: Int {
    case main
    case forecast
}

protocol TababbleCoordinator: BaseCoordinator {
    var onTabBarItemNeedsToBeChanged: ((_ toTabBarItem: MainTabBarItem) -> Void)? { get set }
}

protocol TabBarPresentable {
    func setViewControllers(_ viewControllers: [UIViewController])
    func changeSelectedTabBarItem(_ tabBarItem: MainTabBarItem, completion: Callback?)
}

final class TabBarController: UITabBarController, TabBarPresentable {
    
    func setViewControllers(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
    
    func changeSelectedTabBarItem(_ tabBarItem: MainTabBarItem, completion: Callback?) {
        guard let viewController = viewControllers?[tabBarItem.rawValue] else { return }
        selectedViewController = viewController
        completion?()
    }
    
    
}
