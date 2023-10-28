<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/engine.php';
class Logout extends Engine
{

    public function index()
    {
        session_destroy();
        header("Location: login");
    }
}
