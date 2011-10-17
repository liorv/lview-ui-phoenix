package lviewer.common
{
	import flashx.textLayout.operations.CopyOperation;
	
	import lviewer.components.Filter;
	import lviewer.components.FilterList;
	
	import mx.collections.ArrayCollection;
	import mx.messaging.channels.StreamingConnectionHandler;
	import mx.utils.ObjectUtil;

	public class StatMap
	{
		public static var FUNCTION_SUM:String = "SUM";
		public static var FUNCTION_MEAN:String = "MEAN";
		
		private var selectedFilters:Vector.<String>;
		
		private var key2summaryObject:Object = new Object();
		private var key2length:Object = new Object();
		private var key2records:Object = new Object();
		
		private var functions:Vector.<String> = new Vector.<String>();
		private var attributes:Vector.<String> = new Vector.<String>();
		
		public function StatMap(selectedFilters:Vector.<String>)
		{
			this.selectedFilters = selectedFilters;
			this.attributes = attributes;
			this.functions = functions;
		}
		
		public function addStat(attr:String, fn:String):void {
			attributes.push(attr);
			functions.push(fn);
		}
		
		public function contains(key:Vector.<String>):Boolean {
			var v:Object = key2summaryObject[ key.toString() ];
			return (v != null);
		}
		
		public function put(key:Vector.<String>, value:Object):void {
			var k:String = key.toString();
			var summary:Object = key2summaryObject[k];
			if(summary == null) {
				summary = new Object();
				for(var i:int=0; i<selectedFilters.length; i++) {
					var fname:String = selectedFilters[i];				
					summary[ fname ] = key[i];
				}
				key2length[k] = new Number(0.0);
				key2summaryObject[k] = summary;
			}
			
			for(i=0; i<attributes.length; i++) {
				var attr:String = attributes[i];
				var val:Number = parseFloat(value[attr]);
				if(isNaN(val))
					val = 0.0;
				summary[attr] = val + (summary[attr] as Number);
			}
			key2length[k]++;
		}
		
		public function getStats():Vector.<Object> {
			var retval:Vector.<Object> = new Vector.<Object>();
			for(var k:String in key2summaryObject) {
				var copy:Object = ObjectUtil.copy(key2summaryObject[k]);
				for(var i:int=0; i<attributes.length; i++) {
					var attr:String = attributes[i];
					var fn:String = functions[i];
					
					if(fn == FUNCTION_MEAN) {
						copy[attr] /= key2length[k];
					}
				}
				
				retval.push( copy );
			}
			return retval;
		}
	}
}