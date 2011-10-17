package lviewer.components.filters
{
	import flash.events.MouseEvent;
	import lviewer.components.FilterItem;

	public class MultipleSelectionFilter extends FilterPanelBase
	{
		public function MultipleSelectionFilter()
		{
			super();
			addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
			addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
		}
		
		override public function filterClicked(filterItem:FilterItem):void {
			var filterClicked:String = filterItem.getName();
			if(_values[filterClicked] != null) {
				_numSelected--;
				delete _values[filterClicked];
				filterItem.setState("default");
			}
			else {
				_numSelected++;
				_values[filterClicked] = filterItem;
				filterItem.setState("selected");
			}
			if(container != null) {
				container.filterClicked(this);
			}
		}
		
		protected function mouseOverHandler(event:MouseEvent):void
		{
			for(var i:int = 0; i<childContainer.numElements; i++) {
				var child:FilterItem = childContainer.getElementAt(i) as FilterItem;
				if(child.getState() == "deselected") {
					child.setState("default");
				}
			}
		}
		
		protected function mouseOutHandler(event:MouseEvent):void
		{
			if(_numSelected == 0) {
				return;
			}
			for(var i:int = 0; i<childContainer.numElements; i++) {
				var child:FilterItem = childContainer.getElementAt(i) as FilterItem;
				if(child.getState() == "default") {
					child.setState("deselected");
				}
			}
		}

	}
}