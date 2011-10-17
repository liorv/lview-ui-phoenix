package lviewer.components.filteritems
{
	import lviewer.components.Filter;
	import lviewer.components.FilterItem;

	public class LiteFilterItem implements FilterItem
	{
		private var _name:String;
		private var _filter:Filter;
		
		public function LiteFilterItem(name:String)
		{
			_name = name;
		}
		
		public function setFilter(filter:Filter):void
		{
			_filter = filter;
		}
		
		public function getName():String
		{
			return _name;
		}
		
		public function getNumMatching():int
		{
			return 0;
		}
		
		public function getState():String
		{
			throw new Error("Unexpected code path [LiteFilterItem::getState]");
			return null;
		}
		
		public function toString():String {
			return _name;
		}
		
		public function setState(state:String):void
		{
			throw new Error("Unexpected code path [LiteFilterItem::setState]");
		}
	}
}