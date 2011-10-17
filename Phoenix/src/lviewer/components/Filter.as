package lviewer.components
{
	public interface Filter
	{
		function setFilterList(filterList:FilterList):void;
				
		function setName(name:String):void;
		function getName():String;
		
		function getSelectedValues():Object;
		function getAllValues():Vector.<String>;
		
		function setValues(values:Vector.<String>):void;
		function setSelected(selectedValues:Object):void;
		
		function numSelected():int;
		
		function filterClicked(filterItem:FilterItem):void;		
	}
}