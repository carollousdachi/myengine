<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/my_api.php';
class dashboard_api extends my_api
{
    public function __construct()
    {
        parent::__construct(pathinfo(__FILE__, PATHINFO_FILENAME));
    }

    public function index()
    {
        parent::index();
    }
}
