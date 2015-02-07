//The following php code retrieves time series overall employment data for each of the 50 states plus Washington, D.C.
//Because BLS limits API calls to 25 series at a time, I had to write 3 separate API calls in php. States are not called in order

//Call 1 - series 1-25
<?php
$url = 'http://api.bls.gov/publicAPI/v1/timeseries/data/';
        $method = 'POST';
        $query = array(
                'seriesid'  => array("SMU01000000000000001", "SMU02000000000000001", "SMU04000000000000001", "SMU05000000000000001", "SMU06000000000000001", "SMU08000000000000001", "SMU09000000000000001", "SMU10000000000000001", "SMU11000000000000001", "SMU12000000000000001", "SMU13000000000000001", "SMU15000000000000001", "SMU16000000000000001", "SMU17000000000000001", "SMU18000000000000001", "SMU19000000000000001", "SMU20000000000000001", "SMU21000000000000001", "SMU22000000000000001", "SMU23000000000000001", "SMU24000000000000001", "SMU25000000000000001", "SMU26000000000000001", "SMU27000000000000001", "SMU28000000000000001"),
                'startyear' => '2007',
                'endyear'   => '2014'
        );
        $pd = json_encode($query);
        $contentType = 'Content-Type: application/json';
        $contentLength = 'Content-Length: ' . strlen($pd);

        $result = file_get_contents(
                $url, null, stream_context_create(
                        array(
                                'http' => array(
                                        'method' => $method,
                                        'header' => $contentType . "\r\n" . $contentLength . "\r\n",
                                        'content' => $pd
                                ),
                        )
                )
        );

        var_dump($http_response_header);
        var_dump($result);
?>

//Call 2 - Api call for states 26-50

<?php
$url = 'http://api.bls.gov/publicAPI/v1/timeseries/data/';
        $method = 'POST';
        $query = array(
                'seriesid'  => array("SMU29000000000000001", "SMU30000000000000001", "SMU31000000000000001", "SMU32000000000000001", "SMU33000000000000001", "SMU34000000000000001", "SMU35000000000000001", "SMU36000000000000001", "SMU37000000000000001", "SMU38000000000000001", "SMU39000000000000001", "SMU40000000000000001", "SMU41000000000000001", "SMU42000000000000001", "SMU44000000000000001", "SMU45000000000000001", "SMU46000000000000001", "SMU47000000000000001", "SMU48000000000000001", "SMU49000000000000001", "SMU50000000000000001", "SMU51000000000000001", "SMU53000000000000001", "SMU54000000000000001"),
                'startyear' => '2007',
                'endyear'   => '2014'
        );
        $pd = json_encode($query);
        $contentType = 'Content-Type: application/json';
        $contentLength = 'Content-Length: ' . strlen($pd);

        $result = file_get_contents(
                $url, null, stream_context_create(
                        array(
                                'http' => array(
                                        'method' => $method,
                                        'header' => $contentType . "\r\n" . $contentLength . "\r\n",
                                        'content' => $pd
                                ),
                        )
                )
        );

        var_dump($http_response_header);
        var_dump($result);
?>

//API call 3 - last 2 states

<?php
$url = 'http://api.bls.gov/publicAPI/v1/timeseries/data/';
        $method = 'POST';
        $query = array(
                'seriesid'  => array("SMU55000000000000001", "SMU56000000000000001"),
                'startyear' => '2007',
                'endyear'   => '2014'
        );
        $pd = json_encode($query);
        $contentType = 'Content-Type: application/json';
        $contentLength = 'Content-Length: ' . strlen($pd);

        $result = file_get_contents(
                $url, null, stream_context_create(
                        array(
                                'http' => array(
                                        'method' => $method,
                                        'header' => $contentType . "\r\n" . $contentLength . "\r\n",
                                        'content' => $pd
                                ),
                        )
                )
        );

        var_dump($http_response_header);
        var_dump($result);
?>

/* these api calls will return json formatted state data, see other files for reading JSON into a more workable array*/
