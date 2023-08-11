import UIKit

class ATCGenericLocalHeteroDataSource: ATCGenericCollectionViewControllerDataSource {
    weak var delegate: ATCGenericCollectionViewControllerDataSourceDelegate?

    var items: [ATCGenericBaseModel]

    
    init(items: [ATCGenericBaseModel]) {
        self.items = items
    }

    func object(at index: Int) -> ATCGenericBaseModel? {
        if index < items.count {
            return items[index]
        }
        return nil
    }

    func numberOfObjects() -> Int {
        return items.count
    }

    func loadFirst() {
        self.delegate?.genericCollectionViewControllerDataSource(self, didLoadFirst: items)
    }

    func loadBottom() {
    }

    func loadTop() {
    }
    
    func update(items: [ATCGenericBaseModel]) {
        self.items = items
        self.delegate?.genericCollectionViewControllerDataSource(self, didLoadFirst: items)
    }
}
