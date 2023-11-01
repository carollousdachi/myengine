<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Guru_sql extends My_model
{
    public function __construct()
    {
        parent::__construct();
        $CI = &get_instance();
        $this->table = "guru";
        $this->disable = ['id'];
        $this->changeColumnFunctions = ['sp' => 'functions'];
        $this->changeOption = ['sp'];
    }
}
