package lviewer.components
{
	import lviewer.common.TreeNode;
	import lviewer.components.containers.DataPanel;
	import lviewer.components.filteritems.BasicFilterItem;
	import lviewer.components.filteritems.BasicWithEffectsFilterItem;
	import lviewer.components.filteritems.LiteFilterItem;
	import lviewer.components.filterlists.BasicFilterList;
	import lviewer.components.filterlists.ComponentViewFilterList;
	import lviewer.components.filters.FilterPanelBase;
	import lviewer.components.filters.LiteMultipleSelectionFilter;
	import lviewer.components.filters.MultipleSelectionFilter;
	import lviewer.components.filters.SingleSelectionFilter;
	
	import mx.collections.ArrayCollection;
	import mx.controls.DataGrid;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.core.UIComponent;
	import mx.olap.aggregators.CountAggregator;
	import mx.utils.ObjectUtil;
	
	import spark.components.Group;
	import spark.components.Panel;
	import spark.components.Scroller;
	import spark.components.VGroup;
	import spark.core.IViewport;
	
	import valueObjects.*;

	public class ComponentFactory
	{
		public static var allowMultipleSelection:Boolean = true;
		
		public static function createDataPanel(title:String):DataPanel {
			var p:DataPanel = new DataPanel();
			p.title = title;
			p.percentHeight=100;
			return p;
		}
		
		public static function createComponentViewFilterList(crr:ComponentReportResult):BasicFilterList 
		{
			var flist:ComponentViewFilterList = new ComponentViewFilterList(crr);
						
			// create the filter
			var valueArr:Vector.<String>;
			var emptyVec:Vector.<String> = new Vector.<String>();
			
			for each(var fieldName:String in crr.fields) {
				var filter:Filter = createFilter(fieldName == "build");
				flist.addElement(filter as UIComponent);
				filter.setFilterList(flist);				
				filter.setName(fieldName);
				
				if(fieldName == "component") {
					valueArr = arrayCollectionToStringVector(crr.components);
					filter.setValues(valueArr);
				}
			}
			
			// component filter clicked forced update of all values
			flist.filterClicked(flist.getFilter(0)); 			
			return flist;
		}
		
		private static function arrayCollectionToStringVector(ac:ArrayCollection):Vector.<String> {
			var retval:Vector.<String> = new Vector.<String>();
			for(var i:int=0; i<ac.length; i++) {
				retval.push(ac[i] as String);
			}
			return retval;
		}
		
		public static function createFilter(asList:Boolean) : Filter 
		{
			var vg:VGroup = new VGroup();
			vg.gap = 0;
			
			var asFilter:Filter;
			var asPanel:Panel;
			
			if(asList) {
				asPanel = new LiteMultipleSelectionFilter();
				asFilter = asPanel as Filter;
			}
			else {				
				var fpanel:FilterPanelBase = (allowMultipleSelection) ?
					new MultipleSelectionFilter() : new SingleSelectionFilter();
				fpanel.addElement(scroller(vg));				
				fpanel.childContainer = vg;
				asPanel = fpanel;
				asFilter = asPanel as Filter;
			}
			asPanel.height=170;			
			return asFilter;
		}
		
		public static function createFilterItem(val:String):BasicFilterItem {
			var filterItem:BasicFilterItem = new BasicFilterItem();
			filterItem.filterItemName = val;
			return filterItem;
		}
		
		public static function createLiteFilterItem(val:String):LiteFilterItem {
			return new LiteFilterItem(val)
		}
		
		public static function createFXFilterItem(val:String):BasicWithEffectsFilterItem {
			var filterItem:BasicWithEffectsFilterItem = new BasicWithEffectsFilterItem();
			filterItem.filterItemName = val;
			return filterItem;
		}
		
		private static function scroller(vg:IViewport):Scroller {
			// the scroller
			var scroll:Scroller = new Scroller();
			scroll.percentHeight = 100;
			scroll.percentWidth = 100;
			scroll.hasFocusableChildren = true;
			scroll.viewport = vg;
			return scroll;
		}
		
		private static function stdGroup(valueArr:Vector.<String>):Group 
		{
			// the vgroup of filter items
			var vg:VGroup = new VGroup();
			vg.gap = 0;
			var val:String;
			
			for(var j:int=0; j<valueArr.length; j++) {
				val = valueArr[j] as String;
				if(valueArr.length < 6)
					vg.addElement(createFXFilterItem(val));
				else
					vg.addElement(createFilterItem(val));
			}
			
			return vg;
		}		
		
	} // end class
} // end package


