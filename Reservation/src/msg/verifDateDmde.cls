Class msg.verifDateDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property categorie As %String;

Property dateDebut As %Date;

Property dateFin As %Date;

Storage Default
{
<Data name="verifDateDmdeDefaultData">
<Subscript>"verifDateDmde"</Subscript>
<Value name="1">
<Value>categorie</Value>
</Value>
<Value name="2">
<Value>dateDebut</Value>
</Value>
<Value name="3">
<Value>dateFin</Value>
</Value>
<Value name="4">
<Value>dateFin</Value>
</Value>
</Data>
<DefaultData>verifDateDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
