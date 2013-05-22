<?php

function hexstr($hexstr) {
    $hexstr = str_replace(' ', '', $hexstr);
    $hexstr = str_replace('\x', '', $hexstr);
    $retstr = pack('H*', $hexstr);
    return $retstr;
}

function strhex($string) {
    $hexstr = unpack('H*', $string);
    return array_shift($hexstr);
}

function crypter($cle, $chaine) {
    $td = mcrypt_module_open('cast-256', '', 'ecb', '');
    $iv = mcrypt_create_iv(mcrypt_enc_get_iv_size($td), MCRYPT_RAND);
    mcrypt_generic_init($td, $cle, $iv);
    $donnees_cryptees = mcrypt_generic($td, $chaine);
    mcrypt_generic_deinit($td);
    mcrypt_module_close($td);
    return strhex(base64_encode($donnees_cryptees));
}

function decrypter($cle, $chaine) {
    $donnees_decryptees = base64_decode(hexstr($chaine));
    $td = mcrypt_module_open('cast-256', '', 'ecb', '');
    $iv = mcrypt_create_iv(mcrypt_enc_get_iv_size($td), MCRYPT_RAND);
    mcrypt_generic_init($td, $cle, $iv);
    $chaine_decryptee = mdecrypt_generic($td, $donnees_decryptees);
    mcrypt_generic_deinit($td);
    mcrypt_module_close($td);
    return rtrim($chaine_decryptee);
}

?>