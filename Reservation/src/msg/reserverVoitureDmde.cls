Class msg.reserverVoitureDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property categorie As %String;

Property dateDebut As %String;

Property dateFin As %String;

Storage Default
{
<Data name="reserverVoitureDmdeDefaultData">
<Subscript>"reserverVoitureDmde"</Subscript>
<Value name="1">
<Value>categorie</Value>
</Value>
<Value name="2">
<Value>dateDebut</Value>
</Value>
<Value name="3">
<Value>dateFin</Value>
</Value>
</Data>
<DefaultData>reserverVoitureDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
