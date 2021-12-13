Class msg.reserverVoitureRpse Extends msg.basic.reponse
{

Property voiture As data.Voiture;

Storage Default
{
<Data name="reserverVoitureRpseDefaultData">
<Subscript>"reserverVoitureRpse"</Subscript>
<Value name="1">
<Value>voiture</Value>
</Value>
</Data>
<DefaultData>reserverVoitureRpseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
