package lviewer.components.filters
{
	import flash.events.MouseEvent;
	
	import lviewer.components.FilterItem;

	public class SingleSelectionFilter extends FilterPanelBase
	{
		private var lastSelectedFilterItem:FilterItem;
		
		public function SingleSelectionFilter()
		{
			super();
		}
		
		override public function setValues(values:Vector.<String>):void {
			lastSelectedFilterItem = null;
			super.setValues(values);
		}
		
		override public function filterClicked(filterItem:FilterItem):void {
			var i:int;
			if(filterItem == lastSelectedFilterItem && numSelected() == 1) {
				delete _values[lastSelectedFilterItem.getName()];
				lastSelectedFilterItem = null;
				
				for(i = 0; i<childContainer.numElements; i++) {
					var child:FilterItem = childContainer.getElementAt(i) as FilterItem;
					child.setState("default");
				}
				_numSelected = 0;
			}
			else if(filterItem != lastSelectedFilterItem && numSelected() == 0){
				lastSelectedFilterItem = filterItem;
				
				_values[lastSelectedFilterItem.getName()] = lastSelectedFilterItem;

				for(i = 0; i<childContainer.numElements; i++) {
					var item:FilterItem = childContainer.getElementAt(i) as FilterItem;
					var state:String = (item == lastSelectedFilterItem) ?
						"selected" : "deselected";
					item.setState( state );
				}
				_numSelected = 1;
			}
			if(container != null) {
				container.filterClicked(this);
			}
		}
	}
}