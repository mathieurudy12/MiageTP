/// Description
Class BO.Reservation Extends (Ens.BusinessService, EnsLib.REST.Operation)
{

Property Adapter As Ens.InboundAdapter;

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
    
    Return $$$ERROR($$$NotImplemented)
}

}
