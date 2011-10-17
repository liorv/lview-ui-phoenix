package lviewer.components
{
	import flash.events.Event;
	
	public class FilterSelectionChangedEvent extends Event
	{
		public static const FILTER_SELECTION_CHANGED:String = "filterSelectionChanged";
		
		public var filterList:FilterList;
		
		public function FilterSelectionChangedEvent(flist:FilterList)
		{
			super(FILTER_SELECTION_CHANGED);
			filterList = flist;
		}
		
		override public function clone():Event {
			return new FilterSelectionChangedEvent(filterList);
		}
 
	}
}