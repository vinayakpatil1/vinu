#change below path as you per your input file filenames.txt
$fileData = Get-Content -Path C:\Users\vinay\OneDrive\Desktop\Data\filenames.txt
$ReconDate = Read-Host "Please Enter Date YYYY-MM-DD format :"
$xmlfileName = $ReconDate -replace "-" -replace ""
$ReconDate = $ReconDate+'T00:00:00'
$xmlfileName = 'Recon_'+$xmlfileName
#change below path where you want output file.
$xmlWriter = New-Object System.XMl.XmlTextWriter("C:\Users\vinay\OneDrive\Desktop\Data\$xmlfileName.xml",$Null)

$xmlWriter.Formatting = 'Indented'
$xmlWriter.Indentation = 1
$XmlWriter.IndentChar = "`t"
$xmlWriter.WriteStartDocument()
$xmlWriter.WriteStartElement('ReconFile')
$xmlWriter.WriteElementString('Date',$ReconDate)
$xmlWriter.WriteElementString('Count',$fileData.count)
$xmlWriter.WriteElementString('StartTime','')
$xmlWriter.WriteElementString('EndTime','')
$xmlWriter.WriteStartElement('Transcripts')
foreach ( $recordingid in $fileData)
{
	$xmlWriter.WriteStartElement('Transcript')
	$xmlWriter.WriteElementString('RecordingId', $recordingid)
	$xmlWriter.WriteElementString('Filename', '')
	$xmlWriter.WriteElementString('UserIdentifier', '')
	$xmlWriter.WriteEndElement()
}
$xmlWriter.WriteEndElement()
$xmlWriter.WriteEndElement()
$xmlWriter.WriteEndDocument()
$xmlWriter.Flush()
$xmlWriter.Close()