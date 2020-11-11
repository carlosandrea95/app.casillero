<?php
$configs['main'] = require_once WebRoot.'protected'.DS.'config'.DS.'main.php';
$configs['db'] = require_once WebRoot.'protected'.DS.'config'.DS.'db.php';
// -------- baseUrl
// if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
//   $protocolo='https';
// }else {
//   $protocolo='http';
// }
// $server_name=$_SERVER['SERVER_NAME'];
// $path=$configs['defaultConfig']['path'];
// $usePath=$configs['defaultConfig']['usePath'];
// if($usePath==true){
//     define('baseUrl', $protocolo.'://'.$server_name.'/'.$path.'/');
// }else{
//     define('baseUrl', $protocolo.'://'.$server_name.'/');
// }

// -------- Application
define('AppName', $configs["main"]['application']['Name']);
define('AppSlogan', $configs["main"]['application']['Slogan']);
define('AppCompany', $configs["main"]['application']['Company']);
define('AppVersion', $configs["main"]['application']['Version']);
// -------- DEFAULT CONFIG
define('DEFAULT_CONTROLLER', $configs["main"]['defaultConfig']['defaultController']);
define('DEFAULT_METHOD', $configs["main"]['defaultConfig']['defaultMethod']);
define('DEFAULT_LAYOUT', $configs["main"]['defaultConfig']['defaultLayout']);
// -------- BASE DE DATOS
define('DB_HOST', $configs['db']['hostname']);
define('DB_USER', $configs['db']['username']);
define('DB_PASS', $configs['db']['password']);
define('DB_NAME', $configs['db']['database']);
define('DB_CSET', $configs['db']['charset']);

// -------- MODULOS
define('APP_MODULOS',$configs["main"]['modules']);
// -------- FUNCIONES
function zerofill($valor, $longitud){
 $res = str_pad($valor, $longitud, '0', STR_PAD_LEFT);
 return $res;
}
function unzerofill($zerofill)
{
  return preg_replace('/^0+/', '', $zerofill);
}
function num_format_pdf($num,$type='money',$decimales=0)
{
  if ($type='money') {
    $a=',';
    $b='.';
  }elseif ($type='numeric') {
    $a='';
    $b='.';
  }
  $num=round($num,$decimales);
  return number_format($num,$decimales,$a,$b);
}
function num_format($num,$decimales=0,$type)
{
  if ($type=='BSS') {
    $a=',';
    $b='.';
  }elseif ($type=='numeric') {
    $a='';
    $b='.';
  }elseif ($type=='USD') {
    $a='.';
    $b=',';
  }
  echo number_format($num,$decimales,$a,$b);
}
function compararFechas($primera, $segunda)
 {
  $valoresPrimera = explode ("/", $primera);
  $valoresSegunda = explode ("/", $segunda);

  $diaPrimera    = $valoresPrimera[0];
  $mesPrimera  = $valoresPrimera[1];
  $anyoPrimera   = $valoresPrimera[2];

  $diaSegunda   = $valoresSegunda[0];
  $mesSegunda = $valoresSegunda[1];
  $anyoSegunda  = $valoresSegunda[2];

  $diasPrimeraJuliano = gregoriantojd($mesPrimera, $diaPrimera, $anyoPrimera);
  $diasSegundaJuliano = gregoriantojd($mesSegunda, $diaSegunda, $anyoSegunda);

  if(!checkdate($mesPrimera, $diaPrimera, $anyoPrimera)){
    // "La fecha ".$primera." no es v&aacute;lida";
    return 0;
  }elseif(!checkdate($mesSegunda, $diaSegunda, $anyoSegunda)){
    // "La fecha ".$segunda." no es v&aacute;lida";
    return 0;
  }else{
    return  $diasSegundaJuliano - $diasPrimeraJuliano .' dias';
  }

}
function limitar_palabras($string, $length = 50, $ellipsis = "...")
{
    $words = explode(' ', $string);
    if (count($words) > $length)
    {
            return implode(' ', array_slice($words, 0, $length)) ." ". $ellipsis;
    }
    else
    {
            return $string;
    }
}
