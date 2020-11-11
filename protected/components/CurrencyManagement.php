<?php
class CurrencyManagement
{

  public static function USD_BSS($monto)
  {
    $data = file_get_contents("http://s3.amazonaws.com/dolartoday/data.json");
    $products = json_decode(utf8_decode($data), true);
    echo $monto*$products['USD']['transferencia'];
  }
  public static function USD_EUR($monto)
  {
    $data = file_get_contents("https://api.cambio.today/v1/quotes/USD/EUR/json?quantity=1&key=265|tMvLJvEk43FAK7FC~xTxqBdJSFhCoXt9");
    $products = json_decode($data, true);
    echo $monto*$products['result']['value'];
  }
  public static function USD_MXN($monto)
  {
    $data = file_get_contents("https://api.cambio.today/v1/quotes/USD/MXN/json?quantity=1&key=265|tMvLJvEk43FAK7FC~xTxqBdJSFhCoXt9");
    $products = json_decode($data, true);
    echo $monto*$products['result']['value'];
  }

}
