import UIKit


class ATCDashboardItemsViewController: ATCGenericCollectionViewController {
    static func customersVC(uiConfig: ATCUIGenericConfigurationProtocol) -> ATCDashboardItemsViewController {
        let dataSource = ATCGenericLocalHeteroDataSource(items: ATCDashboardMockStore.customers)
        return vc(uiConfig: uiConfig, title: "Customers", dataSource: dataSource)
    }

    static func productsVC(uiConfig: ATCUIGenericConfigurationProtocol) -> ATCDashboardItemsViewController {
        let dataSource = ATCGenericLocalHeteroDataSource(items: ATCDashboardMockStore.products)
        return vc(uiConfig: uiConfig, title: "Products", dataSource: dataSource)
    }

    static func tasksVC(uiConfig: ATCUIGenericConfigurationProtocol) -> ATCDashboardItemsViewController {
        let dataSource = ATCGenericLocalHeteroDataSource(items: ATCDashboardMockStore.tasks)
        return vc(uiConfig: uiConfig, title: "Tasks", dataSource: dataSource)
    }

    private static func vc(uiConfig: ATCUIGenericConfigurationProtocol,
                           title: String,
                           dataSource: ATCGenericCollectionViewControllerDataSource) -> ATCDashboardItemsViewController {
        let config = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: true,
                                                                     pullToRefreshTintColor: .white,
                                                                     collectionViewBackgroundColor: uiConfig.mainThemeBackgroundColor,
                                                                     collectionViewLayout: ATCLiquidCollectionViewLayout(),
                                                                     collectionPagingEnabled: false,
                                                                     hideScrollIndicators: true,
                                                                     hidesNavigationBar: false,
                                                                     headerNibName: nil,
                                                                     scrollEnabled: true,
                                                                     uiConfig: uiConfig,
                                                                     emptyViewModel: nil)
        let vc = ATCDashboardItemsViewController(configuration: config)
        vc.title = title

        vc.genericDataSource = dataSource
        vc.use(adapter: ATCDashboardItemAdapter(uiConfig: uiConfig), for: "ATCDashboardItem")
        vc.selectionBlock = { (navController, object, indexPath) in
            if let item = object as? ATCDashboardItem {
                let vc = ATCDashboardItemDetailsViewController.vc(uiConfig: uiConfig, item: item)
                navController?.pushViewController(vc, animated: true)
            }
        }

        return vc
    }
}
