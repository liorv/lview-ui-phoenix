/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - TestResult.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import mx.events.PropertyChangeEvent;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_TestResult extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("lior.lview.data.TestResult") == null)
            {
                flash.net.registerClassAlias("lior.lview.data.TestResult", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("lior.lview.data.TestResult", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _TestResultEntityMetadata;

    /**
     * properties
     */
    private var _internal_id : String;
    private var _internal_platform : String;
    private var _internal_db : String;
    private var _internal_time : Number;
    private var _internal_status : String;
    private var _internal_component : String;
    private var _internal_reason : String;
    private var _internal_build : String;
    private var _internal_version : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_TestResult()
    {
        _model = new _TestResultEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get id() : String
    {
        return _internal_id;
    }

    [Bindable(event="propertyChange")]
    public function get platform() : String
    {
        return _internal_platform;
    }

    [Bindable(event="propertyChange")]
    public function get db() : String
    {
        return _internal_db;
    }

    [Bindable(event="propertyChange")]
    public function get time() : Number
    {
        return _internal_time;
    }

    [Bindable(event="propertyChange")]
    public function get status() : String
    {
        return _internal_status;
    }

    [Bindable(event="propertyChange")]
    public function get component() : String
    {
        return _internal_component;
    }

    [Bindable(event="propertyChange")]
    public function get reason() : String
    {
        return _internal_reason;
    }

    [Bindable(event="propertyChange")]
    public function get build() : String
    {
        return _internal_build;
    }

    [Bindable(event="propertyChange")]
    public function get version() : String
    {
        return _internal_version;
    }

    /**
     * data property setters
     */

    public function set id(value:String) : void
    {
        var oldValue:String = _internal_id;
        if (oldValue !== value)
        {
            _internal_id = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "id", oldValue, _internal_id));
        }
    }

    public function set platform(value:String) : void
    {
        var oldValue:String = _internal_platform;
        if (oldValue !== value)
        {
            _internal_platform = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "platform", oldValue, _internal_platform));
        }
    }

    public function set db(value:String) : void
    {
        var oldValue:String = _internal_db;
        if (oldValue !== value)
        {
            _internal_db = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "db", oldValue, _internal_db));
        }
    }

    public function set time(value:Number) : void
    {
        var oldValue:Number = _internal_time;
        if (oldValue !== value)
        {
            _internal_time = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "time", oldValue, _internal_time));
        }
    }

    public function set status(value:String) : void
    {
        var oldValue:String = _internal_status;
        if (oldValue !== value)
        {
            _internal_status = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "status", oldValue, _internal_status));
        }
    }

    public function set component(value:String) : void
    {
        var oldValue:String = _internal_component;
        if (oldValue !== value)
        {
            _internal_component = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "component", oldValue, _internal_component));
        }
    }

    public function set reason(value:String) : void
    {
        var oldValue:String = _internal_reason;
        if (oldValue !== value)
        {
            _internal_reason = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "reason", oldValue, _internal_reason));
        }
    }

    public function set build(value:String) : void
    {
        var oldValue:String = _internal_build;
        if (oldValue !== value)
        {
            _internal_build = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "build", oldValue, _internal_build));
        }
    }

    public function set version(value:String) : void
    {
        var oldValue:String = _internal_version;
        if (oldValue !== value)
        {
            _internal_version = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "version", oldValue, _internal_version));
        }
    }

    /**
     * Data property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _TestResultEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _TestResultEntityMetadata) : void
    {
        var oldValue : _TestResultEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }


}

}
