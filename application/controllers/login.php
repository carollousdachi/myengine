<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller
{
    public $data;

    public function index()
    {
        $this->load->view('login', $this->data);
    }

    public function login_validation()
    {
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $cekLogin = $this->user->doLogin($username, $password);
        if (!empty($cekLogin)) {
            header("location:" . base_url() . "");
        } else {
            header("location: ../login");
        }
    }
}
