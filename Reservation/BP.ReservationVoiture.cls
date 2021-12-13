/// 
Class BP.ReservationVoiture Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.reservationDmde' response='msg.reservationRpse' height='2000' width='2000' >
<context>
<property name='Voiture' type='data.Voiture' instantiate='0' />
</context>
<sequence xend='200' yend='700' >
<call name='verifDateDispo' target='Reservation' async='0' xpos='200' ypos='250' >
<request type='msg.verifDateDmde' >
<assign property="callrequest.categorie" value="request.categorie" action="set" />
<assign property="callrequest.dateDebut" value="request.dateDebut" action="set" />
<assign property="callrequest.dateFin" value="request.dateFin" action="set" />
</request>
<response type='msg.verifDateRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<if condition='response.codeRetour = "OK"' xpos='200' ypos='350' xend='200' yend='600' >
<true>
<call name='reserverVoiture' target='Reservation' async='0' xpos='335' ypos='500' >
<request type='msg.reserverVoitureDmde' >
<assign property="callrequest.categorie" value="request.categorie" action="set" />
<assign property="callrequest.dateDebut" value="request.dateDebut" action="set" />
<assign property="callrequest.dateFin" value="request.dateFin" action="set" />
</request>
<response type='msg.reserverVoitureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.Voiture" value="callresponse.voiture" action="set" />
</response>
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
