//
//  Copyright © 2019 An Tran. All rights reserved.
//

import ReactiveSwift
import UIKit

class ImageListCoordinator: BaseCoordinator<Void> {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> SignalProducer<Void, Never> {
        let pixelBayService = PixelBayService()
        let viewControllerContext = ViewControllerContext(pixelBayService: pixelBayService)
        let imageListViewController = ImageListViewController(context: viewControllerContext)
        let navigationViewController = UINavigationController(rootViewController: imageListViewController)

        imageListViewController.viewModel.selectedImage.signal.observeValues { [unowned self] image in
            guard let image = image else { return }
            self.showDetail(withImage: image, andContext: viewControllerContext, in: navigationViewController)
        }

        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()

        return SignalProducer(value: ())
    }

    // MARK: Private helpers

    private func showDetail(withImage image: Image, andContext viewControllerContext: ViewControllerContext, in navigationController: UINavigationController) {
        let detailViewController = ImageDetailViewController(context: viewControllerContext, image: image)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
