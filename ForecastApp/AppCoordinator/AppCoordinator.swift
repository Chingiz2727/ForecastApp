
final class AppCoordinator: BaseCoordinator {
    override init(router: Router) {
        super.init(router: router)
    }
    
    override func start() {
        let coordinator = MainCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }
    
}

