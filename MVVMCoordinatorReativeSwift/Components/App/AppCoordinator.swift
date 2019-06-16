//
//  Copyright © 2019 An Tran. All rights reserved.
//

import ReactiveSwift
import UIKit

class AppCoordinator: BaseCoordinator<Void> {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> SignalProducer<Void, Never> {
        let imageListCoordinator = ImageListCoordinator(window: window)
        return coordinate(to: imageListCoordinator)
    }
}

