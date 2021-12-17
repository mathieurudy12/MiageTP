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
    set sql = "select plaque from data.Voiture where categorie = '"_pRequest.categorie_"' and plaque not in ("
    set sql = sql_" SELECT voiture->plaque FROM data.Reservation where voiture->categorie = '"_pRequest.categorie_"'"
    set sql = sql_" and ((dateDebut >= '"_pRequest.dateDebut_"' and dateDebut <= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateDebut >= '"_pRequest.dateDebut_"' and dateFin <= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateDebut <= '"_pRequest.dateDebut_"' and dateFin >= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateFin >= '"_pRequest.dateDebut_"' and dateFin <= '"_pRequest.dateFin_"' ))) "
    set statement=##class(%SQL.Statement).%New() 
	do statement.%Prepare(sql)
	set SQLrequest = statement.%Execute()
    do SQLrequest.%Next()
    set plaque = SQLrequest.%Get("plaque")

    
    
    if (##class(data.Voiture).consulterParPlaqueExists(plaque, .idVoiture)){
        set voiture = ##class(data.Voiture).%OpenId(idVoiture)
        set reservation = ##class(data.Reservation).%New()
        set reservation.dateDebut = pRequest.dateDebut
        set reservation.dateFin = pRequest.dateFin
        set reservation.voiture = voiture
        set tsc = reservation.%Save()
        if (tsc){
            set pResponse.codeRetour = "OK"
        }
        else {
            set pResponse.codeRetour = "KO 1"_plaque
        }
    } 
    else {
        set pResponse.codeRetour = "KO 2"_plaque
    }
    
    
    
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
