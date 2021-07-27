param(
    [Parameter(Mandatory=$true)]$InstanceID,
    $FilterName,
    $FilterValue
)
function GetEC2MetaData($InstanceID, $FilterName, $FilterValue){
    if ($FilterName -and $FilterValue){
        &aws ec2 describe-instances --instance-ids $InstanceID --filters Name=$FilterName,Values=$FilterValue --output json
    }
    else{
        &aws ec2 describe-instances --instance-ids $InstanceID --output json
    }
}
GetEC2MetaData -InstanceID $InstanceID -FilterName $FilterName -FilterValue $FilterValue