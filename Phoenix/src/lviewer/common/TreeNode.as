package lviewer.common
{
	public class TreeNode
	{
		private var _nodeName:String;
		private var _nodeType:String;
		
		private var _childNodes:Vector.<TreeNode>;
		
		public function TreeNode(type:String, name:String)
		{
			this._nodeType = type;
			this._nodeName = name;
			this._childNodes = new Vector.<TreeNode>()
		}
		
		public function getName():String {
			return this._nodeName;
		}
		
		public function getType():String {
			return this._nodeType;
		}
		
		public function numChildren():int {
			return _childNodes.length;
		}
		
		public function getChild(idx:int):TreeNode {
			return _childNodes[idx];
		}
		
		public function getChildrenNames():Vector.<String> {
			var retval:Vector.<String> = new Vector.<String>();
			for(var i:int=0; i<retval.length; i++)
				retval.push(_childNodes[i]._nodeName);
			return retval;
		}
		
		public function addChild(childType:String, childName:String):TreeNode {
			var node:TreeNode = new TreeNode(childType, childName);
			_childNodes.push(node);
			return node;
		}
	}
}