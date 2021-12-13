Class msg.reservationRpse Extends msg.basic.reponse
{

Property voiture As data.Voiture;

Storage Default
{
<Data name="reservationRpseDefaultData">
<Subscript>"reservationRpse"</Subscript>
<Value name="1">
<Value>voiture</Value>
</Value>
</Data>
<DefaultData>reservationRpseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
