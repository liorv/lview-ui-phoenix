package lviewer.components.filterlists
{
	import lviewer.components.Filter;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.TextArea;
	
	import valueObjects.ComponentReportResult;
	

	public class ComponentViewFilterList extends BasicFilterList
	{
		public var numComponents:int = 0;
		
		private static var COMPONENT_LIST:String = "components";
		
		private var _crr:ComponentReportResult;
		private var _txt:TextArea;
		
		public function ComponentViewFilterList(crr:ComponentReportResult)
		{
			super();
			_crr = crr;
			
			for(var i:int = 0; i<numChildren; i++) {
				var child:Filter = getChildAt(i) as Filter;
				child.setFilterList(this);
			}
		}
		
		override public function filterClicked(filter:Filter):void {
			updateAffectedColumns(filter);
			super.filterClicked(filter);
		}
		
		private function updateAffectedColumns(filter:Filter):void {
			var componentFilter	:Filter 	= findChildFilter("component");			
			var versionFilter	:Filter 	= findChildFilter("version");
			var platformFilter	:Filter 	= findChildFilter("platform");
			var buildFilter		:Filter 	= findChildFilter("build");
			
			var versionVals:Vector.<String> = latest();
			var buildVals:Vector.<String> = latest();
			var platformVals:Vector.<String> = getComponentPlatforms("PCRE", version("PCRE", "Latest"));
			
			numComponents = componentFilter.numSelected();
			
			if(componentFilter.numSelected() == 1) {
				// ONE COMPONENT SELECTED
				var cname:String = firstValue(componentFilter.getSelectedValues());
				versionVals = getComponentVersions(cname);
				
				if(versionFilter.numSelected() == 1) {
					// ALSO, ONE VERSION SELECTED
					var verStr:String = version(cname, firstValue(versionFilter.getSelectedValues()));
					platformVals = getComponentPlatforms(cname, verStr);
					buildVals = getComponentBuilds(cname, verStr);
				}	
			}
			
			if(filter.getName() == "component") {
				versionFilter.setValues( versionVals );
			}				
			if(filter.getName() == "version" || filter.getName() == "component") {
				platformFilter.setValues( platformVals );
				buildFilter.setValues( buildVals );
			}
		}
		
		private function version(cname:String, ver:String):String {
			if(ver == "Latest") {
				return _crr.c2data[cname]["versions"][0];
			}
			return ver;
		}
		
		public function firstValue(o:Object):String {			
			for(var e:String in o) {
				return e;
			}
			return null;
		}
		
		public function findChildFilter(fname:String):Filter {
			for(var i:int=0; i<numFilters(); i++) {
				if(getFilter(i).getName() == fname) {
					return getElementAt(i) as Filter;
				}
			}
			throw new Error("unable to find filter ["+fname+"]");
		}
		
		private function getComponentVersions(cname:String):Vector.<String> {
			var retval:Vector.<String> = new Vector.<String>();
			var values:ArrayCollection = _crr.c2data[cname]["versions"];
			for each(var v:String in values) {
				retval.push(v);
			}
			return retval;
		}
		
		private function getComponentBuilds(cname:String, version:String):Vector.<String> {
			var retval:Vector.<String> = new Vector.<String>();
			var values:ArrayCollection = _crr.c2data[cname]["ver2builds"][version];
			for each(var v:String in values) {
				retval.push(v);
			}
			return retval;
		}
		
		private function getComponentPlatforms(cname:String, version:String):Vector.<String> {
			var retval:Vector.<String> = new Vector.<String>();
			var values:ArrayCollection = _crr.c2data[cname]["ver2platforms"][version];
			for each(var v:String in values) {
				retval.push(v);
			}
			return retval;
		}
		
		private function latest():Vector.<String> {
			var v:Vector.<String> = new Vector.<String>();
			v.push("Latest");
			return v;
		}		
	}
}