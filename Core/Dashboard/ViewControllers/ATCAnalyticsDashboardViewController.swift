import UIKit


class ATCAnalyticsDashboardViewController: ATCGenericCollectionViewController {
    static func vc(uiConfig: ATCUIGenericConfigurationProtocol) -> ATCAnalyticsDashboardViewController {
        let layout = ATCLiquidCollectionViewLayout()
        let homeConfig = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: true,
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
        let vc = ATCAnalyticsDashboardViewController(configuration: homeConfig)
        vc.title = "Analytics"

        let objects: [ATCGenericBaseModel] = [
            ATCLineChart(numbers: ATCDashboardMockStore.chartLineNumbers, name: "Revenue"),
            ATCLineChart(numbers: ATCDashboardMockStore.costsLineNumbers, name: "Costs"),
            ATCDashboardMockStore.acquisitionChart,
            ATCDashboardMockStore.pieChart,
            ATCDivider("Quarterly Revenue by Country"),
            ATCDashboardMockStore.barChart,
        ]
        let dataSource = ATCGenericLocalHeteroDataSource(items: objects)
        vc.genericDataSource = dataSource

        vc.use(adapter: ATCPieChartAdapter(uiConfig: uiConfig), for: "ATCPieChart")
        vc.use(adapter: ATCBarChartAdapter(uiConfig: uiConfig), for: "ATCBarChart")

        let chartConfig = ATCLineChartConfiguration(circleHoleColor: uiConfig.mainThemeForegroundColor,
                                                    gradientStartColor: UIColor(hexString: "#3068CC"),
                                                    gradientEndColor: UIColor(hexString: "#3068CC", alpha: 0.5),
                                                    lineColor: UIColor(hexString: "#3068CC"),
                                                    leftAxisColor: uiConfig.mainThemeForegroundColor,
                                                    backgroundColor: uiConfig.mainThemeBackgroundColor,
                                                    descriptionFont: uiConfig.regularLargeFont,
                                                    descriptionColor: uiConfig.mainThemeForegroundColor)
        vc.use(adapter: ATCLineChartAdapter(config: chartConfig), for: "ATCLineChart")
        vc.use(adapter: ATCDividerRowAdapter(titleFont: uiConfig.boldLargeFont, minHeight: 30, titleColor: uiConfig.mainTextColor), for: "ATCDivider")
        return vc
    }
}
