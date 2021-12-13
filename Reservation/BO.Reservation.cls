Class BO.Reservation Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method verifDateReservation(pRequest As msg.verifDateDmde, Output pResponse As msg.verifDateDmde) As %Status
{
    set pResponse = ##class(msg.verifDateRpse).%New()
    set sql = "select count(*) from data.Reservation where voiture not in (select voiture from data.Reservation where  (dateDebut between "_pRequest.dateDebut_" and "_pRequest.dateFin_") or (dateFin between "_pRequest.dateDebut_" and "_pRequest.dateFin_") or ("_pRequest.dateDebut_" between dateDebut and dateFin)"

    set statement=##class(%SQL.Statement).%New() 
	do statement.%Prepare(sql)
	set SQLrequest = statement.%Execute()
    set count = SQLrequest.%Next()
    if count = 0{
        set pResponse.codeRetour = "OK"
    }
    else {
        set pResponse.codeRetour = "KO"
        set pResponse.libErreur = "Pas de réservations dispo à ces dates"
    }

    Quit $$$OK
}

Method reserverVoiture(pRequest As msg.reserverVoitureDmde, Output pResponse As msg.reserverVoitureRpse) As %Status
{
    set pResponse = ##class(msg.reserverVoitureRpse).%New()
    set reservation = ##class(data.Reservation).%New()
    set sql = "select nom, plaque from data.Voiture limit 1"

    set statement=##class(%SQL.Statement).%New() 
	do statement.%Prepare(sql)
	set SQLrequest = statement.%Execute()
    While SQLrequest.%Next(){
        set item = ##class(data.Voiture).%New()
        set item.nom = SQLrequest.%Get("nom")
        set item.categorie = pRequest.categorie
        set item.plaque = SQLrequest.%Get("plaque")
        do pResponse.voiture.Insert(item)
        set reservation.voiture = item
    }
    set reservation.dateDebut = pRequest.dateDebut
    set reservation.dateFin = pRequest.dateFin
    set tsc = reservation.%Save()

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.verifDateDmde">
        <Method>verifDateReservation</Method>
    </MapItem>
    <MapItem MessageType="msg.reserverVoitureDmde">
        <Method>reserverVoiture</Method>
    </MapItem>
</MapItems>
}

}
