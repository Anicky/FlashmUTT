<?php

include "phpqrcode/qrlib.php";
 
$content= 'http://www.flashmut.com/restaurant1';
$filename = 'qrcode.png';
$errorCorrectionLevel = 'H';
$matrixPointSize = 25;
 
QRcode::png($content, $filename,
            $errorCorrectionLevel, $matrixPointSize, 2);
 
echo '<img src="qrcode.png" alt="image" />';

?>