package lviewer.components.containers
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.registerClassAlias;
	
	import lviewer.common.RecordUtils;
	import lviewer.common.StatMap;
	import lviewer.components.ComponentFactory;
	import lviewer.components.Filter;
	import lviewer.components.FilterList;
	import lviewer.components.FilterSelectionChangedEvent;
	import lviewer.components.filterlists.BasicFilterList;
	import lviewer.components.filterlists.ComponentViewFilterList;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ItemResponder;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.controls.DataGrid;
	import mx.events.ItemClickEvent;
	import mx.events.ListEvent;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import services.LView;
	
	import valueObjects.ComponentReport;
	import valueObjects.ComponentReportResult;
	import valueObjects.TestResult;

	public class ComponentView extends Dashboard
	{
		public function ComponentView()
		{
			super();
			
			trace(">>>>>>>>>>>>>>>>>>> ComponentView() -- registerClassAlias!!!!!!!!!!!!!!!!!!!!!");
			//registerClassAlias("lior.lview.fxdata.ComponentReportData", valueObjects.ComponentReportData);
			registerClassAlias("lior.lview.fxdata.ComponentReportResult", valueObjects.ComponentReportResult);
			//registerClassAlias("lior.lview.data.Test", valueObjects.Test);
			registerClassAlias("lior.lview.data.TestResult", valueObjects.TestResult);
			//registerClassAlias("lior.lview.data.Component", valueObjects.Component);
			registerClassAlias("lior.lview.data.ComponentReport", valueObjects.ComponentReport);
			
			createFilterList();
		}
		
		private var _comp2latestVer:Object;
		private var _comp2latestBuild:Object;
		
		private var comCount:int = 0;
		
		private var _filterList:ComponentViewFilterList;
		private var _crr:ComponentReportResult;
		private var _mergedCRs:Vector.<Object>
		private var _summaryGrid:DataPanel;
		private var _detailsGrid:DataPanel;
		
		protected function createFilterList():void
		{
			var lv:LView = new LView();				
			var token:AsyncToken = lv.collectComponentReportData()
			var tresponder:ItemResponder = 
				new ItemResponder(
					this.resultHandler_collectComponentReportData,
					this.onFault);
			token.addResponder(tresponder);
		}
		
		private function resultHandler_getTestData(event:ResultEvent, token:AsyncToken):void 
		{
			var testResults:ArrayCollection = event.result["testResults"] as ArrayCollection;

			_detailsGrid.table.dataProvider = testResults;
		}
		
		private function resultHandler_collectComponentReportData(event:ResultEvent, token:AsyncToken):void 
		{
			_crr = event.result as ComponentReportResult;
			
			_filterList = ComponentFactory.createComponentViewFilterList(_crr) as ComponentViewFilterList;
			_summaryGrid = ComponentFactory.createDataPanel("Summary");
			_detailsGrid = ComponentFactory.createDataPanel("Details");
			
			_summaryGrid.minimizeButton.addEventListener(MouseEvent.CLICK, minimizeSummary);
			_summaryGrid.maximizeButton.addEventListener(MouseEvent.CLICK, maximizeSummary);
			
			_detailsGrid.minimizeButton.addEventListener(MouseEvent.CLICK, minimizeDetails);
			_detailsGrid.maximizeButton.addEventListener(MouseEvent.CLICK, maximizeDetails);
			
			filterListGroup.addElement(_filterList);
			summaryGroup.addElement(_summaryGrid);
			detailsGroup.addElement(_detailsGrid);
			
			_filterList.addEventListener(
				FilterSelectionChangedEvent.FILTER_SELECTION_CHANGED, 
				onFilterSelectionChanged);
			
			_comp2latestVer = component2latestVersion(_crr.reports);
			_comp2latestBuild = component2latestBuild(_crr.reports);
			onFilterSelectionChanged(new FilterSelectionChangedEvent(_filterList));			
		}
		
		private function component2latestVersion(crArr:ArrayCollection):Object {
			var retval:Object = new Object();
			
			for each(var cr:ComponentReport in crArr) {
				if(retval[cr.component] == null || retval[cr.version] < cr.build)
					retval[cr.component] = cr.version;
			}
			return retval;
		}
		
		private function component2latestBuild(crArr:ArrayCollection):Object {
			var retval:Object = new Object();
			
			for each(var cr:ComponentReport in crArr) {
				if(retval[cr.component] == null || retval[cr.component] < cr.build)
					retval[cr.component] = cr.build;
			}
			return retval;
		}
		
		private function onFilterSelectionChanged(e:FilterSelectionChangedEvent):void {
			var flist:ComponentViewFilterList = e.filterList as ComponentViewFilterList;
			
			// loop over records
			var crArr:ArrayCollection = _crr.reports; 
			
			var selectedFilters:Vector.<String> = getSelectedFilters(flist);
			var expectedCRs:Vector.<Object> = RecordUtils.getSelectedPaths(flist, new ComponentReport());			
			var selectedCRs:Vector.<Object> = getSelected(crArr);
			_mergedCRs = RecordUtils.merge(flist, expectedCRs, selectedCRs);
			
			if(selectedFilters.length == flist.numFilters()) {
				// no averages, simply show selected records
				_summaryGrid.initCols(getColumnNames(flist), _mergedCRs);
			}
			else {
				_summaryGrid.initCols(getColumnNames(flist), 
					getStatistics(selectedFilters, _mergedCRs));
			}
			
			// only 1 component, get test details
			if(flist.numComponents == 1) {
				var lv:LView = new LView();
				
				var selectedComponents:Object = flist.findChildFilter("component").getSelectedValues();
				var component:String = flist.firstValue(selectedComponents);
				
				var selectedBuilds:Object = flist.findChildFilter("build").getSelectedValues();
				var builds:ArrayCollection = new ArrayCollection();
				for(var o:String in selectedBuilds) {
					builds.addItem(o);
				}
				
				var selectedPlatforms:Object = flist.findChildFilter("platform").getSelectedValues();
				var platforms:ArrayCollection = new ArrayCollection();
				for(var o2:String in selectedPlatforms) {
					platforms.addItem(o);
				}
				
				/* Create the SortField object for the "data" field in the ArrayCollection object, and make sure we do a numeric sort. */
				//var dataSortField:SortField = new SortField();
				//dataSortField.numeric = true;
				
				/* Create the Sort object and add the SortField object created earlier to the array of fields to sort on. */
				//var numericDataSort:Sort = new Sort();
				//numericDataSort.fields = [dataSortField];
				
				/* Set the ArrayCollection object's sort property to our custom sort, and refresh the ArrayCollection. */
				//builds.sort = numericDataSort;
				//builds.refresh();
				
				trace("component = "+component);
				trace("builds = "+builds);
				trace("platforms = "+platforms);
				
				var token:AsyncToken = lv.getTestData(component, builds, platforms);
				var tresponder:ItemResponder = 
					new ItemResponder(
						this.resultHandler_getTestData,
						this.onFault);
				token.addResponder(tresponder);	
			}
		}
		
		private function getColumnNames(flist:FilterList):Vector.<String> {
			var colNames:Vector.<String> = new Vector.<String>();
			
			for(var i:int=0; i<flist.numFilters(); i++) {
				var filter:Filter = flist.getFilter(i);
				colNames.push( filter.getName() );
			}
			colNames.push("passRate");
			colNames.push("totalTime");	
			return colNames;
		}
		
		private function getSelectedFilters(flist:FilterList):Vector.<String> {
			var selectedFilters:Vector.<String> = new Vector.<String>();
			
			// figure out non-empty columns
			for(var i:int=0; i<flist.numFilters(); i++) {
				var filter:Filter = flist.getFilter(i);
				if(filter.numSelected() > 0 || filter.getAllValues().length == 1) 
					selectedFilters.push( filter.getName() );
			}
			return selectedFilters;
		}
		
		private function getStatistics(selectedFilters:Vector.<String>, 
									   objArr:Vector.<Object>)
			: Vector.<Object> 
		{
			var map:StatMap = new StatMap(selectedFilters);
			map.addStat("totalTime", StatMap.FUNCTION_SUM);
			map.addStat("passRate", StatMap.FUNCTION_MEAN);
			
			for each (var cr:Object in objArr) {
				if(isSelected(cr)) {
					var key:Vector.<String> = new Vector.<String>();
					for each(var k:String in selectedFilters)
					key.push(cr[k]);
					map.put(key, cr);
				}
			}		
			
			return map.getStats();
		}
		
		private function getSelected(objArr:ArrayCollection):Vector.<Object> {
			var retval:Vector.<Object> = new Vector.<Object>;
			var filterIdx:int;
			var filter:Filter;
			
			for each (var cr:Object in objArr) {
				if(isSelected(cr)) {
					retval.push(cr);
				}
			}
			return retval;
		}
		
		private function isSelected(obj:Object):Boolean {
			var retval:Boolean = true;
			var cname:String = obj["component"] as String;
			if(cname == null) {
				trace("BUG: got a ComponentReport with no component name");
				return false;
			}
			
			for(var filterIdx:int=0; filterIdx < _filterList.numFilters() && retval; filterIdx++) {
				var filter:Filter = _filterList.getFilter(filterIdx);
				var fname:String = filter.getName();
				var fvals:Object = filter.getSelectedValues();
				
				if(filter.numSelected() == 0 && filter.getAllValues().length > 1) 
					continue;
				
				var objVal:String = obj[fname];
				
				if(objVal == "Latest") {
					var c2latest:Object = (fname == "version") ? _comp2latestVer : _comp2latestBuild;
					
					// restore original version of component
					objVal = c2latest[cname];
					obj[fname] = objVal;
				}
				
				if(filter.getSelectedValues()[objVal] != null)
					continue;
				
				if(filter.getSelectedValues()["Latest"] != null) {
					var c1:Boolean = fname=="version" && _comp2latestVer[cname]==objVal;
					var c2:Boolean = fname=="build" && _comp2latestBuild[cname]==objVal;					
					if(c1 || c2) {
						obj[fname] = "Latest";
						continue;
					}					
				}
				retval = false
			}
			return retval;
		}
		
		private function onFault(event:FaultEvent, token:AsyncToken):void {
			Alert.show(event.fault.faultString);
			trace("LIOR>>> "+event.fault.faultString,event.fault.faultCode);
		}
	}
}