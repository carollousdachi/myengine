<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Tingkat_sql extends My_model
{
    public function __construct()
    {
        parent::__construct();
        $CI = &get_instance();
        $this->table = "tingkat";
        $this->column_order = ['urutan'];
    }
}
