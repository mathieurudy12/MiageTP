/// 
Class Transform.ProcessCommande Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<sequence xend='200' yend='1000' >
<call name='verifVoitureCatalogue' target='Catalogue' async='1' xpos='200' ypos='250' >
<request type='msg.consulterVoitureCatalogueDmde' />
<response type='msg.consulterVoitureCatalogueRpse' />
</call>
<if condition='response' xpos='200' ypos='350' xend='200' yend='900' >
<true>
<call name='getPlaque' target='BO.Plaque' async='0' xpos='335' ypos='500' >
<request type='msg.generationPlaqueDmde' />
<response type='msg.generationPlaqueRpse' />
</call>
<transform name='catalogueToCommande' class='Transform.CatalogueToVoiture' source='request' target='response' xpos='335' ypos='600' />
<call name='addVoitureToBase' target='Voiture' async='0' xpos='335' ypos='700' >
<request type='msg.creerVoitureDmde' />
<response type='msg.creerVoitureRpse' />
</call>
<call name='addFichier' target='File' async='0' xpos='335' ypos='800' >
<request type='msg.pushVoitureFileDmde' />
<response type='msg.pushVoitureFileRpse' />
</call>
</true>
</if>
</sequence>
</process>
}

}
