import UIKit


class ATCDashboardCategoriesViewController: ATCGenericCollectionViewController {
    static func categoriesViewController(uiConfig: ATCUIGenericConfigurationProtocol) -> ATCDashboardCategoriesViewController {
        let layout = ATCLiquidCollectionViewLayout(cellPadding: 10.0)
        let categoriesConfig = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: true,
                                                                               pullToRefreshTintColor: .white,
                                                                               collectionViewBackgroundColor: UIColor(hexString: "#FDFDFD").darkModed,
                                                                               collectionViewLayout: layout,
                                                                               collectionPagingEnabled: false,
                                                                               hideScrollIndicators: true,
                                                                               hidesNavigationBar: false,
                                                                               headerNibName: nil,
                                                                               scrollEnabled: true,
                                                                               uiConfig: uiConfig,
                                                                               emptyViewModel: nil)
        let categoriesVC = ATCDashboardCategoriesViewController(configuration: categoriesConfig)
        categoriesVC.title = "Dashboard"

        let dataSource = ATCGenericLocalHeteroDataSource(items: ATCDashboardMockStore.categories)
        categoriesVC.genericDataSource = dataSource

        categoriesVC.use(adapter: ATCDashboardCategoryAdapter(uiConfig: uiConfig), for: "ATCDashboardCategory")

        categoriesVC.selectionBlock = ATCDashboardCategoriesViewController.selectionBlock(uiConfig: uiConfig)

        return categoriesVC
    }

    static func selectionBlock(uiConfig: ATCUIGenericConfigurationProtocol) -> ATCollectionViewSelectionBlock {
        return {(navController, object, indexPath) in
            if let category = object as? ATCDashboardCategory {
                var vc: ATCGenericCollectionViewController?
                if category.name == "Orders" || category.name == "Sales"{
                    vc = ATCDashboardOrdersViewController.ordersViewController(uiConfig: uiConfig)
                } else if category.name == "Customers" {
                    vc = ATCDashboardItemsViewController.customersVC(uiConfig: uiConfig)
                } else if category.name == "Analytics" {
                    vc = ATCAnalyticsDashboardViewController.vc(uiConfig: uiConfig)
                } else if category.name == "Products" {
                    vc = ATCDashboardItemsViewController.productsVC(uiConfig: uiConfig)
                } else if category.name == "Tasks" {
                    vc = ATCDashboardItemsViewController.tasksVC(uiConfig: uiConfig)
                }
                if let vc = vc {
                    navController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
}
