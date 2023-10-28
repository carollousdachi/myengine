<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/engine.php';
class dashboard extends engine
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
