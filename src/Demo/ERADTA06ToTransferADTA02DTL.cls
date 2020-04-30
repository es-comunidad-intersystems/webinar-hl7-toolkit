Class Demo.ERADTA06ToTransferADTA02DTL Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.3.1:ADT_A06' targetDocType='2.3.1:ADT_A02' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='source.{EVN}' property='target.{EVN}' action='set' />
<assign value='source.{PID}' property='target.{PID}' action='set' />
<assign value='source.{PD1}' property='target.{PD1}' action='set' />
<assign value='source.{PV1}' property='target.{PV1}' action='set' />
<assign value='source.{PV2}' property='target.{PV2}' action='set' />
<assign value='source.{DB1()}' property='target.{DB1()}' action='set' />
<assign value='source.{OBX()}' property='target.{OBX()}' action='set' />
<assign value='"A02"' property='target.{MSH:MessageType.triggerevent}' action='set' />
<assign value='"A02"' property='target.{EVN:EventTypeCode}' action='set' />
<assign value='"NONE"' property='target.{MSH:Security}' action='set' />
<assign value='source.{PID:PatientIdentifierList().ID}' property='target.{PID:AlternatePatientIDPID().ID}' action='set' />
<if condition='source.{PID:PrimaryLanguage.identifier}=""' >
<true>
<assign value='"UNKNOWN"' property='target.{PID:PrimaryLanguage.identifier}' action='set' />
</true>
</if>
<assign value='"I"' property='target.{PV1:PatientClass}' action='set' />
</transform>
}

}
