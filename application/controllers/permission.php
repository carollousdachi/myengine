<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/engine.php';
class Permission extends engine
{
    public function __construct()
    {
        parent::__construct(pathinfo(__FILE__, PATHINFO_FILENAME), 'permission');
    }

    public function index()
    {
        $this->data['hTable'] = $this->master->getHeaderName();
        parent::index();
    }
} //End
