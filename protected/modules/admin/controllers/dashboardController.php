<?php
/**
 *
 */
class dashboardController extends CController
{

  function __construct()
  {
    parent::__construct();
    $this->layout='dashboard';
  }
  public function index()
  {
    $this->render('index');
  }
}
