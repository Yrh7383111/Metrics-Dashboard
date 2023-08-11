import UIKit


class ATCDashboardHomeViewController: ATCGenericCollectionViewController, CalendarDateRangePickerViewControllerDelegate {
    static let dateRangeModel = ATCDateRangeModel(title: "Overview", dateRangeText: "Today")

    
    static func homeViewController(uiConfig: ATCUIGenericConfigurationProtocol) -> ATCDashboardHomeViewController {
        let layout = ATCLiquidCollectionViewLayout()
        let homeConfig = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: true,
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
        let homeVC = ATCDashboardHomeViewController(configuration: homeConfig)
        homeVC.selectionBlock = { (navController, object, indexPath) in
            if let _ = object as? ATCDateRangeModel {
                homeVC.showDateRangeActionSheet()
            } else if let item = object as? ATCDashboardItem {
                let vc = ATCDashboardItemDetailsViewController.vc(uiConfig: uiConfig, item: item)
                navController?.pushViewController(vc, animated: true)
            }
        }
        homeVC.title = "Home"

        let storiesVC = self.storiesViewController(stories: ATCDashboardMockStore.categories,
                                                   uiConfig: uiConfig,
                                                   minimumInteritemSpacing: 10,
                                                   selectionBlock: ATCDashboardCategoriesViewController.selectionBlock(uiConfig: uiConfig))
        let storiesCarousel = ATCCarouselViewModel(title: nil,
                                                   viewController: storiesVC,
                                                   cellHeight: 105)
        storiesCarousel.parentViewController = homeVC

        let totalCardsViewModel = ATCDashboardHomeViewController.carouselViewModel(uiConfig: uiConfig, parentVC: homeVC)

        let chart = ATCLineChart(numbers: ATCDashboardMockStore.chartLineNumbers, name: "Revenue")
        var objects: [ATCGenericBaseModel] = [storiesCarousel,
                                              ATCDashboardHomeViewController.dateRangeModel,
                                              chart,
                                              totalCardsViewModel]
        objects.append(ATCDivider("Recent Orders"))
        objects.append(contentsOf: Array(ATCDashboardMockStore.orders.prefix(5)))
//        objects.append(ATCDashboardMockStore.pieChart)

        let dataSource = ATCGenericLocalHeteroDataSource(items: objects)
        homeVC.genericDataSource = dataSource

        let chartConfig = ATCLineChartConfiguration(circleHoleColor: uiConfig.mainThemeForegroundColor,
                                                    gradientStartColor: UIColor(hexString: "#3068CC"),
                                                    gradientEndColor: UIColor(hexString: "#3068CC", alpha: 0.5),
                                                    lineColor: UIColor(hexString: "#3068CC"),
                                                    leftAxisColor: uiConfig.mainThemeForegroundColor,
                                                    backgroundColor: uiConfig.mainThemeBackgroundColor,
                                                    descriptionFont: uiConfig.regularLargeFont,
                                                    descriptionColor: uiConfig.mainThemeForegroundColor)
        homeVC.use(adapter: ATCLineChartAdapter(config: chartConfig), for: "ATCLineChart")
        homeVC.use(adapter: ATCDateRangeAdapter(uiConfig: uiConfig), for: "ATCDateRangeModel")
        homeVC.use(adapter: ATCCarouselAdapter(uiConfig: uiConfig), for: "ATCCarouselViewModel")
        homeVC.use(adapter: ATCPieChartAdapter(uiConfig: uiConfig), for: "ATCPieChart")
        homeVC.use(adapter: ATCDividerRowAdapter(titleFont: uiConfig.boldLargeFont, minHeight: 30, titleColor: uiConfig.mainTextColor), for: "ATCDivider")
        homeVC.use(adapter: ATCOrderAdapter(uiConfig: uiConfig), for: "ATCOrder")
        return homeVC
    }

    func didCancelPickingDateRange() {
        self.navigationController?.popViewController(animated: true)
    }

    func didPickDateRange(startDate: Date!, endDate: Date!) {
        self.navigationController?.popViewController(animated: true)
        ATCDashboardHomeViewController.dateRangeModel.currentDateRange = ATCDateRange(title: "Custom Range", startDate: startDate, endDate: endDate, isCustomRange: true)
        self.collectionView?.reloadData()
    }

    func showDateRangeActionSheet() {
        let alertVC = UIAlertController(title: "Select Date Range", message: nil, preferredStyle: .actionSheet)
        ATCDashboardHomeViewController.dateRangeModel.ranges.forEach { (dateRange) in
            let action = UIAlertAction(title: dateRange.title, style: .default, handler: { (alertAction) in
                ATCDashboardHomeViewController.dateRangeModel.currentDateRange = dateRange
                if dateRange.isCustomRange {
                    let calendarVC = CalendarDateRangePickerViewController(collectionViewLayout: UICollectionViewFlowLayout())
                    calendarVC.delegate = self
                    calendarVC.minimumDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
                    self.navigationController?.pushViewController(calendarVC, animated: true)
                } else {
                    self.collectionView?.reloadData()
                }
            })
            alertVC.addAction(action)
        }
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
        }))

        self.navigationController?.present(alertVC, animated: true, completion: nil)
    }

    static func carouselViewModel(uiConfig: ATCUIGenericConfigurationProtocol, parentVC: UIViewController) -> ATCCarouselViewModel {
        let layout = ATCCollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let configuration = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: false,
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
        let vc = ATCGenericCollectionViewController(configuration: configuration) { (nav, obj, indexPath) in
        }
        vc.genericDataSource = ATCGenericLocalDataSource(items: ATCDashboardMockStore.cards)
        vc.use(adapter: ATCTotalCardAdapter(uiConfig: uiConfig), for: "ATCTotalCard")

        let carouselVM = ATCCarouselViewModel(title: nil, viewController: vc, cellHeight: 100)
        carouselVM.parentViewController = parentVC
        return carouselVM
    }

    static func storiesViewController(stories: [ATCDashboardCategory],
                                      uiConfig: ATCUIGenericConfigurationProtocol,
                                      minimumInteritemSpacing: CGFloat = 0,
                                      selectionBlock: ATCollectionViewSelectionBlock?) -> ATCGenericCollectionViewController {
        let layout = ATCCollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = minimumInteritemSpacing
        let configuration = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: false,
                                                                            pullToRefreshTintColor: .white,
                                                                            collectionViewBackgroundColor: uiConfig.mainThemeBackgroundColor,
                                                                            collectionViewLayout: layout,
                                                                            collectionPagingEnabled: false,
                                                                            hideScrollIndicators: true,
                                                                            hidesNavigationBar: false,
                                                                            headerNibName: nil,
                                                                            scrollEnabled: true,
                                                                            uiConfig: uiConfig,
                                                                            emptyViewModel: nil)
        let vc = ATCGenericCollectionViewController(configuration: configuration, selectionBlock: selectionBlock)
        vc.genericDataSource = ATCGenericLocalDataSource<ATCDashboardCategory>(items: stories)
        vc.use(adapter: ATCDashboardStoryAdapter(uiConfig: uiConfig), for: "ATCDashboardCategory")
        return vc
    }
}
