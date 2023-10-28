<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/engine.php';
class navigation extends engine
{
    public function __construct()
    {
        parent::__construct(pathinfo(__FILE__, PATHINFO_FILENAME), "user");
        $this->data['option'] = ['tipe'];
    }

    public function index()
    {
        $this->data['hTable'] = $this->master->getHeaderName();
        parent::index();
    }
}
