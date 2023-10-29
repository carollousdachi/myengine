<?php
defined('BASEPATH') or exit('No direct script access allowed');
class engine extends CI_Controller
{
    public $data;
    public $master;
    public $main;
    public $viewpage = "";

    public function __construct($path = "", $database = "")
    {
        parent::__construct();
        $this->data = $_POST;
        $this->data['cssFile'] = "";
        $this->data['jsFile'] = "";
        $this->data['hTable'] = "";
        $this->data['bTable'] = "";
        $this->data['edit_form'] = "";
        $this->data['addButtons'] = [];
        $this->data['test_input'] = "";
        $this->hiddenColumn = ['creator', 'create_date', 'status'];
        $this->data['change_data'] = ['tipe'];
        $this->data['option'] = [];
        $this->data['join_table'] = array();
        $this->data['session_validation'] = "";
        $this->main = $path;
        if (!empty($database)) {
            $this->load->model($this->main . '_sql', 'master');
        } else {
            $this->master = "";
        }

        !empty($_SESSION['id']) ? $this->data['session_user'] = $this->user->get(['id' => $_SESSION['id']]) : $this->data['session_user'] = "";
    }

    public function index()
    {
        $this->data['getMenu'] = $this->main;
        $this->data['sidebar'] = "";
        foreach ($this->navigation->gets() as $key => $value) {
            $this->main == $value->link ? $active = "active" : $active = "";
            $this->data['sidebar'] .= "<li class='nav-item'>";
            $this->data['sidebar'] .= "<a href='" . $value->link . "' class='nav-link " . $active . "'>";
            $this->data['sidebar'] .= "<i class='nav-icon " . $value->icon . "'></i>";
            $this->data['sidebar'] .= "<p>" . $value->name . "</p></a>";
            $this->data['sidebar'] .= "</li>";
        }
        $this->load->view('element/template', $this->data);
    }

    public function serverside()
    {

        if (!empty($this->master)) {
            $results = $this->master->getDataTable();
            $data = [];
            $no = $_POST['start'];
            foreach ($results as $key => $value) {
                $row = array();
                foreach ($this->master->get_field_original() as $k => $val) {
                    if (in_array($val, $this->data['change_data'])) {
                        $row[] = $this->master->change_data($val, $value->$val);
                    } else {
                        if (in_array($val, $this->data['join_table'])) {
                            $join_result = $this->$val->get(['id' => $value->$val]);
                            $row[] = $join_result->name;
                        } else {
                            if ($val == 'action') {
                                $row[] = $this->master->actionButton($value->id);
                            } else {
                                if ($val == 'id') {
                                    $row[] = ++$no;
                                } else {
                                    $row[] = $value->$val;
                                }
                            }
                        }
                    }
                }
                $data[] = $row;
            }

            $output = array(
                "draw" => $_POST['draw'],
                "recordsTotal" => $this->master->count_all_data(),
                "recordsFiltered" => $this->master->Count_filtered_data(),
                "data" => $data
            );
        } else {
            $output = array(
                "data" => ""
            );
        }
        echo json_encode($output);
    }

    public function add()
    {
        $data = [];
        foreach ($this->input->post() as $key => $value) {
            $data[$key] = $value;
        }

        if (!empty($data['password'])) {
            $timeTarget = 0.350;
            $cost = 10;
            do {
                $cost++;
                $start = microtime(true);
                $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT, ["cost" => $cost]);
                $end = microtime(true);
            } while (($end - $start) < $timeTarget);
        }

        $id = str_split($this->main, 4);
        $id = strtoupper($id[0]);
        $data['id'] = $this->master->getLastId(0, $id);
        $data['creator'] = 'carollousdc';

        $data = $this->master->add($data);

        $output = array(
            "response" => 'success'
        );

        echo json_encode($output);
    }


    public function addModal()
    {

        $data = $this->master->add_form();
        $result = array(
            'data' => $data,
        );
        echo json_encode($result);
    }

    public function show_root()
    {
        $search = "";
        if (!empty($_GET['searchTerm'])) $search = $_GET['searchTerm'];
        $get_tipe = $_GET['tipe'];
        $sql = $this->navigation->gets(['tipe' => 0]);
        $json = [];
        if ($get_tipe == 1) {
            foreach ($sql as $key => $value) {
                if (!empty($search)) {
                    if (strpos($value->name, $search) !== false) {
                        $json[] = ['id' => $value->id, 'text' => $value->name];
                    }
                } else {
                    $json[] = ['id' => $value->id, 'text' => $value->name];
                }
            }
        }
        echo json_encode($json);
    }

    public function editModal()
    {
        $data = $this->master->edit_form($this->input->post('id'));
        $id = $this->master->get(['id' => $this->input->post('id')]);
        $result = array(
            'data' => $data,
            'data_main' => $id
        );
        echo json_encode($result);
    }

    public function call_data_select()
    {
        $search = "";
        if (!empty($_GET['searchTerm'])) $search = $_GET['searchTerm'];
        $name = ['satu', 'dua', 'tiga'];
        $json = [];
        foreach ($name as $key => $value) {
            if (!empty($search)) {
                if (strpos($value, $search) !== false) {
                    $json[] = ['id' => $key, 'text' => $value];
                }
            } else {
                if ($value == 'tiga') {
                    $json[] = ['id' => $key, 'text' => $value];
                } else   $json[] = ['id' => $key, 'text' => $value];
            }
        }

        echo json_encode($json);
    }

    public function permissionModal()
    {

        $html = '<div class="col-md-6"><div class="form-group">';
        $permission = $this->permission->gets();
        foreach ($permission as $key => $value) {
            $html .= '<div class="custom-control custom-checkbox">';
            $html .= '<input class="form-check-input" type="checkbox" name="' . $value->name . '" value="' . $value->id . '">';
            $html .= '<label for="customCheckbox1" class="form-check-label">' . $value->name . '</label></div>';
        }
        $html .= '</div></div>';

        $data = $html;
        $result = array(
            "data" => $data
        );
        echo json_encode($result);
    }

    public function dataTablesCss()
    {
        $dt = $this->master->dataTablesCss();

        $result = array(
            "width" => $dt,
        );

        echo json_encode($result);
    }

    public function test_input()
    {
        $data = '';
        $result = array(
            'test' => $data
        );
        echo json_encode($result);
    }
}
