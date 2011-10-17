package lviewer.common
{
	import lviewer.components.Filter;
	import lviewer.components.FilterList;
	
	import mx.utils.ObjectUtil;

	public class RecordUtils
	{
		public static function merge(flist:FilterList,
									 expected:Vector.<Object>, 
									 actual:Vector.<Object>)
			:Vector.<Object> 
		{
			var retval:Vector.<Object> = new Vector.<Object>();

			var marker:Object = new Object();
			
			for each (var o:Object in expected) {
				var k:String = keyObject(flist, o);
				marker[k] = o;
			}
			
			for each (o in actual) {
				k = keyObject(flist, o);
				marker[k] = o;
			}
			
			for(k in marker)
				retval.push(marker[k]);

			return retval;
		}
		
		private static function keyObject(flist:FilterList, o:Object):String {
			var retval:Vector.<String> = new Vector.<String>();
			
			for(var i:int=0; i<flist.numFilters(); i++) {
				var filter:Filter = flist.getFilter(i);
				retval.push(o[filter.getName()]);
			}
			
			return retval.toString();
		} 
		
		public static function getSelectedPaths(flist:FilterList, template:Object):Vector.<Object> {
			var retval:Vector.<Object> = new Vector.<Object>();
			
			// construct tree
			var paths:Vector.<TreeNode> = new Vector.<TreeNode>();
			var rootNode:TreeNode = new TreeNode(null, null);
			
			createTree(rootNode, flist, 0);			
			
			addPaths(retval, rootNode, clone(template));
			
			return retval;
		}
		
		public static function clone(o:Object):Object {
			var retval:Object = new Object();
			for(var k:String in o) {
				retval[k] = o[k];
			}
			return retval;
		}
		
		private static function addPaths(expectedRecords:Vector.<Object>, node:TreeNode, p:Object):void {
			if(node.numChildren() == 0) {
				expectedRecords.push(p);
				return;
			}				
			
			for(var i:int=0; i<node.numChildren(); i++) {
				var child:TreeNode = node.getChild(i);
				var childPath:Object = clone(p);
				childPath[child.getType()] = child.getName();
				addPaths(expectedRecords, child, childPath);
			}
		}
		
		private static function createTree(node:TreeNode, flist:FilterList, fidx:int):void {
			if(fidx == flist.numFilters())
				return;
			
			var filter:Filter = flist.getFilter(fidx);
			var childNode:TreeNode;
			
			if(filter.numSelected() > 0) {
				var selectedValues:Object = filter.getSelectedValues();
				for(var o:String in selectedValues) {
					childNode = node.addChild(filter.getName(), o);
					createTree(childNode, flist, fidx+1);
				} 
			}
			else {
				var vals:Vector.<String> = filter.getAllValues();
				for(var i:int=0; i<vals.length; i++) {
					childNode = node.addChild(filter.getName(), vals[i]);
					createTree(childNode, flist, fidx+1);
				}
			}			
		}
	}
}