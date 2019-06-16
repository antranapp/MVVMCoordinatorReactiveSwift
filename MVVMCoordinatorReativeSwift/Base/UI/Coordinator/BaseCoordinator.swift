//
//  Copyright © 2019 An Tran. All rights reserved.
//

import ReactiveSwift

class BaseCoordinator<ResultType>: ClassNameDerivable {

    // MARK: Properties

    // Private

    private var childCoordinators = [String: BaseCoordinator?]()

    // MARK: Public APIs

    func coordinate(to coordinator: BaseCoordinator) -> SignalProducer<ResultType, Never> {
        store(coordinator: coordinator)
        return coordinator.start().on(value: { [weak self] _ in
            self?.free(coordinator: coordinator)
        })
    }

    /// Starts the coordinator
    ///
    /// - Returns: Result of coordinator
    func start() -> SignalProducer<ResultType, Never> {
        fatalError("Start method ")
    }

    // MARK: Private helpers

    private func store(coordinator: BaseCoordinator) {
        childCoordinators[name] = coordinator
    }

    private func free(coordinator: BaseCoordinator) {
        childCoordinators[name] = nil
    }
}
