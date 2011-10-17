package lviewer.components
{
	import mx.collections.ArrayCollection;

	public interface FilterList
	{
		function numFilters():int;
		function getFilter(idx:int):Filter;
		
		function filterClicked(filter:Filter):void;
	}
}