<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Config_sql extends My_model
{
    public function __construct()
    {
        parent::__construct();
        $CI = &get_instance();
        $this->table = "config";
        $this->table_prefix = "CFG";
        $this->file = ['sk_pendirian'];
        $this->column_order = ['name'];
    }
}
