<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Mata_pelajaran_sql extends My_model
{
    public function __construct()
    {
        parent::__construct();
        $CI = &get_instance();
        $this->table = "mata_pelajaran";
        $this->column_order = ['tingkat'];
    }
}
