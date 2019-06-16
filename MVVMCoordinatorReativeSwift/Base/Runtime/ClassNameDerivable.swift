//
//  Copyright © 2019 An Tran. All rights reserved.
//

protocol ClassNameDerivable: class {
    var name: String { get }
}

extension ClassNameDerivable {
    var name: String {
        return "\(Self.self)"
    }
}
