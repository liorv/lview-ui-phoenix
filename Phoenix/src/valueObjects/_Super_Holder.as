/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Holder.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import mx.events.PropertyChangeEvent;
import valueObjects.ComponentReport;
import valueObjects.Test1;
import valueObjects.Test2;
import valueObjects.TestResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_Holder extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("lior.lview.fxdata.Holder") == null)
            {
                flash.net.registerClassAlias("lior.lview.fxdata.Holder", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("lior.lview.fxdata.Holder", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        valueObjects.Test2.initRemoteClassAliasSingleChild();
        valueObjects.ComponentReport.initRemoteClassAliasSingleChild();
        valueObjects.Test1.initRemoteClassAliasSingleChild();
        valueObjects.TestResult.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _HolderEntityMetadata;

    /**
     * properties
     */
    private var _internal_t2 : valueObjects.Test2;
    private var _internal_cr : valueObjects.ComponentReport;
    private var _internal_t1 : valueObjects.Test1;
    private var _internal_tr : valueObjects.TestResult;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_Holder()
    {
        _model = new _HolderEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get t2() : valueObjects.Test2
    {
        return _internal_t2;
    }

    [Bindable(event="propertyChange")]
    public function get cr() : valueObjects.ComponentReport
    {
        return _internal_cr;
    }

    [Bindable(event="propertyChange")]
    public function get t1() : valueObjects.Test1
    {
        return _internal_t1;
    }

    [Bindable(event="propertyChange")]
    public function get tr() : valueObjects.TestResult
    {
        return _internal_tr;
    }

    /**
     * data property setters
     */

    public function set t2(value:valueObjects.Test2) : void
    {
        var oldValue:valueObjects.Test2 = _internal_t2;
        if (oldValue !== value)
        {
            _internal_t2 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "t2", oldValue, _internal_t2));
        }
    }

    public function set cr(value:valueObjects.ComponentReport) : void
    {
        var oldValue:valueObjects.ComponentReport = _internal_cr;
        if (oldValue !== value)
        {
            _internal_cr = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "cr", oldValue, _internal_cr));
        }
    }

    public function set t1(value:valueObjects.Test1) : void
    {
        var oldValue:valueObjects.Test1 = _internal_t1;
        if (oldValue !== value)
        {
            _internal_t1 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "t1", oldValue, _internal_t1));
        }
    }

    public function set tr(value:valueObjects.TestResult) : void
    {
        var oldValue:valueObjects.TestResult = _internal_tr;
        if (oldValue !== value)
        {
            _internal_tr = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tr", oldValue, _internal_tr));
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
    public function get _model() : _HolderEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _HolderEntityMetadata) : void
    {
        var oldValue : _HolderEntityMetadata = model_internal::_dminternal_model;
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
