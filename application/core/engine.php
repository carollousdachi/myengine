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
        $this->data['table_prefix'] = "";
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
        $tipe = [1 => 'Root', 0 => 'Master', 2 => 'Single'];
        $array = [];
        foreach ($this->navigation->gets(['tipe' => 1]) as $key => $value) {
            if (!in_array($value->root, $array)) {
                $array[] = $value->root;
            }
        }

        foreach ($this->navigation->gets(['tipe !=' => 1]) as $key => $value) {
            $this->main == $value->link ? $active = "active" : $active = "";
            if (!in_array($value->id, $array)) {
                $this->data['sidebar'] .= "<li class='nav-item'>";
                $this->data['sidebar'] .= "<a href='" . $value->link . "' class='nav-link " . $active . "'>";
                $this->data['sidebar'] .= "<i class='nav-icon " . $value->icon . "'></i>";
                $this->data['sidebar'] .= "<p>" . $value->name . "</p></a>";
                $this->data['sidebar'] .= "</li>";
            }
        }
        foreach ($array as $k => $val) {
            $sql = $this->navigation->get(['id' => $val]);
            $this->data['sidebar'] .= "<li class='nav-item'>";
            $this->data['sidebar'] .= "<a href='" . $sql->link . "' class='nav-link " . $active . "'>";
            $this->data['sidebar'] .= "<i class='nav-icon " . $sql->icon . "'></i>";
            $this->data['sidebar'] .= "<p>" . $sql->name . "<i class='fas fa-angle-left right'></i></p></a>";
            $this->data['sidebar'] .= '<ul class="nav nav-treeview">';
            foreach ($this->navigation->gets(['root' => $val]) as $key => $value) {
                $this->main == $value->link ? $active = "active" : $active = "";
                $this->data['sidebar'] .= "<li class='nav-item'>";
                $this->data['sidebar'] .= "<a href='" . $value->link . "' class='nav-link " . $active . "'>";
                $this->data['sidebar'] .= "<i class='nav-icon " . $value->icon . "'></i>";
                $this->data['sidebar'] .= "<p>" . $value->name . "</p></a>";
                $this->data['sidebar'] .= "</li>";
            }
            $this->data['sidebar'] .= "</ul></li>";
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
                                    $row[] = $this->master->changeColumnValues($val, $value->$val);
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


        $data['id'] = $this->master->getLastId(0);
        $data['creator'] = $this->user->get(['id' => $_SESSION['id']])->username;
        print_r($data);
        die();
        // $data = $this->master->add($data);

        $output = array(
            "response" => 'success'
        );

        echo json_encode($output);
    }

    public function edit()
    {
        $where = ['id' => $this->input->post('id')];
        foreach ($this->input->post('data') as $key => $value) {
            $input_name = explode('_edit', $value['name']);
            foreach ($value as $k => $val) {
                $data[$input_name[0]] = $val;
            }
        }

        if (isset($data['root']) && empty($data['root'])) $data['root'] = 0;
        $data['creator'] = $this->user->get(['id' => $_SESSION['id']])->username;
        $result = $this->master->edit($data, $where);
        echo json_encode($result);
    }

    public function delete()
    {
        $id = $this->input->post('id');
        $data = $this->master->delete(['id' => $id]);
        echo json_encode($data);
    }

    public function action_detail()
    {
        $table_detail = $this->main . '_detail';
        $result = "";
        $i = 1;
        foreach ($this->input->post('data') as $key => $value) {
            foreach ($value as $k => $val) {
                if ($k == 'value') {
                    if (!empty($this->$table_detail->get(['hash' => $val]))) {
                        $sql = $this->$table_detail->get(['hash' => $val]);
                        $data[] = array(
                            'id' => $sql->id,
                            'functions' => $this->input->post('id'),
                            'name' => $sql->name,
                            'hash' => $sql->hash,
                            'creator' => $this->user->get(['id' => $_SESSION['id']])->username
                        );
                    } else {
                        $data[] = array(
                            'id' => $this->$table_detail->getLastId($i),
                            'functions' => $this->input->post('id'),
                            'name' => $val,
                            'hash' => sprintf("%u", crc32($this->$table_detail->getLastId($i))),
                            'creator' => $this->user->get(['id' => $_SESSION['id']])->username
                        );
                        $i++;
                    }
                }
            }
        }

        if (!empty($data)) {
            if (!empty($this->$table_detail->gets(['functions' => $this->input->post('id')]))) {
                $this->$table_detail->delete(['functions' => $this->input->post('id')]);
            }
            $result = $this->$table_detail->insert_batch($data);
        }


        $output = array(
            'result' => $result,
        );

        echo json_encode($output);
    }

    public function addModal()
    {

        $data = $this->master->add_form($this->data['join_table']);
        $result = array(
            'data' => $data,
        );
        echo json_encode($result);
    }


    public function editModal()
    {
        $data = $this->master->edit_form($this->input->post('id'), $this->data['join_table']);
        $id = $this->master->get(['id' => $this->input->post('id')]);
        $result = array(
            'data' => $data,
            'data_main' => $id
        );
        echo json_encode($result);
    }
    public function detailModal()
    {

        $data = $this->master->detail_form($this->input->post('id'), 'functions_detail');
        $result = array(
            'data' => $data,
        );
        echo json_encode($result);
    }

    public function permissionModal()
    {

        $html = '';

        $data = $html;
        $result = array(
            "data" => $data
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

    public function dataTablesCss()
    {
        $dt = $this->master->dataTablesCss();

        $result = array(
            "width" => $dt,
        );

        echo json_encode($result);
    }
}
