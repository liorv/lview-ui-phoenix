package lview.components
{
	import flash.events.MouseEvent;
	import lviewer.components.filters.FilterPanelBase;
	import lviewer.components.FilterItem;

	public class SingleSelectionFilter extends FilterPanelBase
	{
		private var lastSelectedFilterItem:FilterItem;
		
		public function SingleSelectionFilter()
		{
			super();
		}
		
		override public function filterClicked(filterItem:FilterItem):void {
			var i:int;
			if(filterItem == lastSelectedFilterItem && numSelected() == 1) {
				lastSelectedFilterItem = null;
				
				for(i = 0; i<childContainer.numElements; i++) {
					var child:FilterItem = childContainer.getElementAt(i) as FilterItem;
					child.setState("default");
				}
				_numSelected = 0;
			}
			else if(filterItem != lastSelectedFilterItem && numSelected() == 0){
				lastSelectedFilterItem = filterItem;

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