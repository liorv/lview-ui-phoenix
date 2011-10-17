package lviewer.components
{	
	public interface FilterItem
	{	
		function setFilter(filter:Filter):void;
		
		function getName():String;
		function getNumMatching():int;
		
		function getState():String;
		function setState(state:String):void;
	}
}