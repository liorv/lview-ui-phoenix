/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - ComponentReportResult.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;
import valueObjects.ComponentReport;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_ComponentReportResult extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("lior.lview.fxdata.ComponentReportResult") == null)
            {
                flash.net.registerClassAlias("lior.lview.fxdata.ComponentReportResult", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("lior.lview.fxdata.ComponentReportResult", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        valueObjects.ComponentReport.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _ComponentReportResultEntityMetadata;

    /**
     * properties
     */
    private var _internal_reports : ArrayCollection;
    model_internal var _internal_reports_leaf:valueObjects.ComponentReport;
    private var _internal_c2data : Object;
    private var _internal_components : ArrayCollection;
    private var _internal_fields : ArrayCollection;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_ComponentReportResult()
    {
        _model = new _ComponentReportResultEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get reports() : ArrayCollection
    {
        return _internal_reports;
    }

    [Bindable(event="propertyChange")]
    public function get c2data() : Object
    {
        return _internal_c2data;
    }

    [Bindable(event="propertyChange")]
    public function get components() : ArrayCollection
    {
        return _internal_components;
    }

    [Bindable(event="propertyChange")]
    public function get fields() : ArrayCollection
    {
        return _internal_fields;
    }

    /**
     * data property setters
     */

    public function set reports(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_reports;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_reports = value;
            }
            else if (value is Array)
            {
                _internal_reports = new ArrayCollection(value);
            }
            else
            {
                throw new Error("value of reports must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "reports", oldValue, _internal_reports));
        }
    }

    public function set c2data(value:Object) : void
    {
        var oldValue:Object = _internal_c2data;
        if (oldValue !== value)
        {
            _internal_c2data = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "c2data", oldValue, _internal_c2data));
        }
    }

    public function set components(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_components;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_components = value;
            }
            else if (value is Array)
            {
                _internal_components = new ArrayCollection(value);
            }
            else
            {
                throw new Error("value of components must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "components", oldValue, _internal_components));
        }
    }

    public function set fields(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_fields;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_fields = value;
            }
            else if (value is Array)
            {
                _internal_fields = new ArrayCollection(value);
            }
            else
            {
                throw new Error("value of fields must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fields", oldValue, _internal_fields));
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
    public function get _model() : _ComponentReportResultEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _ComponentReportResultEntityMetadata) : void
    {
        var oldValue : _ComponentReportResultEntityMetadata = model_internal::_dminternal_model;
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
