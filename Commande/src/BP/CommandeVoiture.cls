/// 
Class BP.CommandeVoiture Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.commandeDmde' response='msg.commandeRpse' height='2000' width='2000' >
<context>
<property name='Voiture' type='webObjet.wsVoiture' instantiate='0' />
<property name='Catalogue' type='webObjet.wsCatalogue' instantiate='0' />
<property name='plaque' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1000' >
<call name='verifVoitureCatalogue' target='Catalogue' async='0' xpos='200' ypos='250' >
<request type='msg.consulterVoitureCatalogueDmde' >
<assign property="callrequest.marque" value="request.marque" action="set" />
<assign property="callrequest.modele" value="request.modele" action="set" />
</request>
<response type='msg.consulterVoitureCatalogueRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.Catalogue" value="callresponse.voiture" action="set" />
</response>
</call>
<if condition='response.codeRetour = "OK"' xpos='200' ypos='350' xend='200' yend='900' >
<true>
<call name='getPlaque' target='BO.Plaque' async='0' xpos='335' ypos='500' >
<request type='msg.generationPlaqueDmde' />
<response type='msg.generationPlaqueRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.plaque" value="callresponse.plaque" action="set" />
</response>
</call>
<transform name='catalogueToCommande' class='Transform.CatalogueToVoiture' source='context.Catalogue' target='context.Voiture' xpos='335' ypos='600' />
<call name='addVoitureToBase' target='Voiture' async='0' xpos='335' ypos='700' >
<request type='msg.creerVoitureDmde' >
<assign property="callrequest.voiture.marque" value="request.marque" action="set" />
<assign property="callrequest.voiture.modele" value="request.modele" action="set" />
<assign property="callrequest.voiture.couleur" value="request.couleur" action="set" />
<assign property="callrequest.voiture.plaque" value="context.plaque" action="set" />
<assign property="callrequest.voiture.categorie" value="context.Voiture.categorie" action="set" />
<assign property="callrequest.voiture.nbPlaces" value="context.Voiture.nbPlaces" action="set" />
</request>
<response type='msg.creerVoitureRpse' />
</call>
<call name='addFichier' target='File' async='0' xpos='335' ypos='800' >
<request type='msg.ajouterVoitureFichierDmde' >
<assign property="callrequest.voiture.marque" value="request.marque" action="set" />
<assign property="callrequest.voiture.modele" value="request.modele" action="set" />
<assign property="callrequest.voiture.couleur" value="request.couleur" action="set" />
<assign property="callrequest.voiture.plaque" value="context.plaque" action="set" />
<assign property="callrequest.voiture.categorie" value="context.Voiture.categorie" action="set" />
<assign property="callrequest.voiture.nbPlaces" value="context.Voiture.nbPlaces" action="set" />
</request>
<response type='msg.ajouterVoitureFichierRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
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
