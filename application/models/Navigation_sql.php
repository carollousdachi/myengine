<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Navigation_sql extends My_model
{
    public function __construct()
    {
        parent::__construct();
        $CI = &get_instance();
        $this->table = "navigation";
        $this->disable = ['id', 'action'];
    }
}
