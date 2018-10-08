$url = "file:///C:/Users/mhajduk1/Desktop/forecast.json"



$Response = Invoke-WebRequest  -Uri $url 

$sitedata = ConvertFrom-JSON $Response
$currentTemp = $sitedata.list[0].main.temp
$currentPressure = $sitedata.list[0].main.pressure
$currentHumidity = $sitedata.list[0].main.humidity

$currentWeatherIcon = $sitedata.list[0].weather.main
#$weatherIcon = $sitedata.list[0].weather.description


#Daty
#$sitedata.list.dt_txt
$tomorrowDate = [datetime]::Today.AddDays(1).ToString('yyyy-MM-dd 06:00:00')


$tomorrow = $sitedata.list | where {$_.dt_txt -eq $tomorrowDate} 
$tomorrowTemp = $tomorrow.main.temp
$tomorrowPressure = $tomorrow.main.pressure
$tomorrowHumidity = $tomorrow.main.humidity
$tomorrowweatherIcon = $tomorrow.weather.main


$currentTemp
$currentPressure
$currentHumidity
$currentWeatherIcon

echo "TOMORROW:"

$tomorrowTemp 
$tomorrowPressure  
$tomorrowHumidity 
$tomorrowweatherIcon
