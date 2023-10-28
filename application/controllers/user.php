<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/engine.php';
class user extends engine
{
    public function __construct()
    {
        parent::__construct(pathinfo(__FILE__, PATHINFO_FILENAME), "user");
        $this->data['join_table'] = ['role'];
    }

    public function index()
    {
        $this->data['hTable'] = $this->master->getHeaderName();
        parent::index();
    }
} //End
