Class Production.ProductionCommande Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Production.ProductionCommande" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Catalogue" Category="" ClassName="BO.Catalogue" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Voiture" Category="" ClassName="BO.Voiture" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ServiceCatalogue" Category="" ClassName="BS.ServiceCatalogue" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="File" Category="" ClassName="BO.File" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/tmp/</Setting>
  </Item>
  <Item Name="BO.Plaque" Category="" ClassName="BO.Plaque" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ProcessCommande" Category="" ClassName="BP.ProcessCommande" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ServiceVoiture" Category="" ClassName="BS.ServiceVoiture" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
