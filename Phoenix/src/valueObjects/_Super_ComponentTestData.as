/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - ComponentTestData.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;
import valueObjects.TestResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_ComponentTestData extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("lior.lview.fxdata.ComponentTestData") == null)
            {
                flash.net.registerClassAlias("lior.lview.fxdata.ComponentTestData", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("lior.lview.fxdata.ComponentTestData", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        valueObjects.TestResult.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _ComponentTestDataEntityMetadata;

    /**
     * properties
     */
    private var _internal_builds : ArrayCollection;
    private var _internal_component : String;
    private var _internal_testResults : ArrayCollection;
    model_internal var _internal_testResults_leaf:valueObjects.TestResult;
    private var _internal_platforms : ArrayCollection;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_ComponentTestData()
    {
        _model = new _ComponentTestDataEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get builds() : ArrayCollection
    {
        return _internal_builds;
    }

    [Bindable(event="propertyChange")]
    public function get component() : String
    {
        return _internal_component;
    }

    [Bindable(event="propertyChange")]
    public function get testResults() : ArrayCollection
    {
        return _internal_testResults;
    }

    [Bindable(event="propertyChange")]
    public function get platforms() : ArrayCollection
    {
        return _internal_platforms;
    }

    /**
     * data property setters
     */

    public function set builds(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_builds;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_builds = value;
            }
            else if (value is Array)
            {
                _internal_builds = new ArrayCollection(value);
            }
            else
            {
                throw new Error("value of builds must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "builds", oldValue, _internal_builds));
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

    public function set testResults(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_testResults;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_testResults = value;
            }
            else if (value is Array)
            {
                _internal_testResults = new ArrayCollection(value);
            }
            else
            {
                throw new Error("value of testResults must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "testResults", oldValue, _internal_testResults));
        }
    }

    public function set platforms(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_platforms;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_platforms = value;
            }
            else if (value is Array)
            {
                _internal_platforms = new ArrayCollection(value);
            }
            else
            {
                throw new Error("value of platforms must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "platforms", oldValue, _internal_platforms));
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
    public function get _model() : _ComponentTestDataEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _ComponentTestDataEntityMetadata) : void
    {
        var oldValue : _ComponentTestDataEntityMetadata = model_internal::_dminternal_model;
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
