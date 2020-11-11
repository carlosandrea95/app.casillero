<?php
/**
 *
 */
class RecaptchaValidator
{
  private $secret;
  public function __construct($secret)
  {
    $this->secret=$secret;
  }
  public function validate($response_recaptcha)
  {
    if($response_recaptcha<>null){
      $ip=$_SERVER['REMOTE_ADDR'];
      $validate=file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$this->secret.'&response='.$response_recaptcha.'&remoteip='.$ip);
      $response=json_decode($validate);
      $response_array= (array) $response;
      return $response_array['success'];
    }
  }
}
