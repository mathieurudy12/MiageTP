Class BO.File Extends Ens.BusinessOperation
{

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method ajouterVoitureFichier(pRequest As msg.ajouterVoitureFichierDmde, Output pResponse As msg.ajouterVoitureFichierRpse) As %Status
{
    set pResponse = ##class(msg.ajouterVoitureFichierRpse).%New()
    
    set stream = ##class(%Library.FileBinaryStream).%New()
    set sc = stream.WriteLine(pRequest.voiture.marque_";"_pRequest.voiture.modele_";"_pRequest.voiture.categorie_";"_pRequest.voiture.plaque_";"_pRequest.voiture.couleur_";"_pRequest.voiture.nbPlaces)
    set ps = ..Adapter.PutStream("fichierVoiture"_$TR($TR($ZDT($ZDTH($ZTS,-3),3,9),":/-","")," ","_")_".csv", stream)
    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.ajouterVoitureFichierDmde">
        <Method>ajouterVoitureFichier</Method>
    </MapItem>
</MapItems>
}

}
