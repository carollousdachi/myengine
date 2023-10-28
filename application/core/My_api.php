<?php
defined('BASEPATH') or exit('No direct script access allowed');
class My_api extends CI_Controller
{
    protected $tabel_model;
    protected $change_data = [];
    protected $change_code = [];
    protected $system_fill = [];
    protected $unset_fill = [];
    protected $change_keyArrData = [];
    protected $id_keyArrData = [];
    protected $tabel_arr_model = [];
    protected $option_format = [];
    protected $required = [];
    protected $can_empty = [];
    protected $validFileType = array("image/jpeg", "image/jpg", "image/png", "image/bmp");

    function __construct()
    {
        // Construct the parent class
        parent::__construct();
    }
}
