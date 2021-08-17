import UIKit

struct TabableDeliveryControllerAndCoordinatorContainer {
    var viewController: UIViewController
}

final class MainCoordinator: BaseCoordinator {
    private var tabRootContainers: [TabableDeliveryControllerAndCoordinatorContainer] = []
    private let tabBarController: TabBarController
    
    override init(router: Router) {
        tabBarController = TabBarController()
        super.init(router: router)
    }

    override func start() {
        makeCurrentWeatherModule()
        makeMainModule()
        let viewController = tabRootContainers.map { $0.viewController }
        tabBarController.setViewControllers(viewController)
        router.setRootModule(tabBarController, isNavigationBarHidden: true)
    }
    
    private func makeMainModule() {
        let module = MainModuleBuilder.build()
        guard let controller = module.toPresent() else {
            return
        }
        controller.tabBarItem.title = "Main"
        tabRootContainers.append(.init(viewController: controller))
    }
    
    private func makeCurrentWeatherModule() {
        let module = CurrentWeatherBuilder.build()
        guard let controller = module.toPresent() else {
            return
        }
        controller.tabBarItem = UITabBarItem(title: "Current", image: nil, tag: 0)
        tabRootContainers.append(.init(viewController: controller))
    }
}
