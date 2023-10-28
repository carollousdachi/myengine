<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/engine.php';
class Functions extends engine
{
    public function __construct()
    {
        parent::__construct(pathinfo(__FILE__, PATHINFO_FILENAME), "functions");
    }

    public function index()
    {
        $this->data['hTable'] = $this->master->getHeaderName();
        parent::index();
    }
}
