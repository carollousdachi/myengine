<?php
defined('BASEPATH') or exit('No direct script access allowed');

class My_model extends CI_Model
{

    public $table = "";
    public $table_prefix = "";
    public $changeHeaderName = ['id' => 'No', 'create_date' => "Tanggal"];
    public $changeColumnValue = array();
    public $changeColumnFunctions = array();
    public $tipe = ['Master', 'Root', 'Single'];
    public $hiddenColumn = ['creator', 'create_date', 'status'];
    public $column_serch = ["name"];
    public $column_order = [];
    public $changeOption = ["tipe", "root"];
    public $file = [];
    public $disable = [];
    public $buttons = [];
    public $form_html = "";

    public function add($data)
    {
        return $this->db->insert($this->table, $data);
    }

    public function insert_batch($data)
    {
        return $this->db->insert_batch($this->table, $data);
    }

    public function gets($where = "", $order = "", $group = "")
    {
        if (empty($where)) {
            $where = array("m.status" => 0);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        }

        if (!empty($group)) {
            $this->db->group_by($group);
        }

        $query = $this->db->get_where($this->table . " m", $where);
        return $query->result();
    }
    public function get($where = "", $order = "")
    {
        if (empty($where)) {
            $where = array("status" => 0);
        }

        if (!empty($order)) {
            $this->db->order_by($order, 'DESC');
        }

        return $this->db->get_where($this->table . " m", $where)->row();
    }

    public function getLastId($count = 0, $code = "")
    {
        if (empty($code)) {
            if (empty($this->table_prefix)) {
                $get_uniq = $this->navigation->gets(['link' => $this->table]);
                $this->table_prefix = strtoupper(substr($this->table, 0, 4)) . substr($get_uniq[0]->id, -3);
            }
            $code = $this->table_prefix . date('Ymd');
        }
        $this->db->select_max('id');
        $this->db->like('id', $code);
        $res1 = $this->db->get($this->table);
        $id = $res1->row()->id;
        $id = intval(substr($id, strlen($code), strlen($id) + 5));
        if (empty($count)) {
            $id++;
        } else {
            $id += $count + 1;
        }

        $id = "00000" . $id;
        return $code . substr($id, strlen($id) - 5);
    }

    public function edit($data, $where)
    {
        return $this->db->update($this->table, $data, $where);
    }

    public function delete($where, $delete_db = 1)
    {
        if (empty($delete_db)) {
            return $this->db->update($this->table, ['status' => 1], $where);
        } else {
            return $this->db->delete($this->table, $where);
        }
    }

    public function get_field_data()
    {
        $allfield = $this->db->list_fields($this->table);
        $res = ['no'];
        $res = array_merge($res, $allfield);
        $res = array_reverse(array_reverse(array_diff($res, ["id", "creator", "create_date"])));
        return $res;
    }

    public function get_field_original()
    {
        $allfield = $this->db->list_fields($this->table);
        $res = ['action'];
        $res = array_merge($allfield, $res);
        $disable = array_merge($this->disable, ["id", "creator", "create_date", "status"]);
        $res = array_reverse(array_reverse(array_diff($res, $disable)));
        return $res;
    }

    public function changeColumnValues($column_name, $value)
    {
        if (!empty($this->changeColumnValue[$column_name])) {
            if (strpos($value, 'NAVI') !== false) {
                $table = $this->changeColumnValue[$column_name];
                $result = $this->$table->get(['id' => $value])->name;
            } else {
                $result = $value;
            }
        } else {
            if (!empty($this->changeColumnFunctions[$column_name])) {
                $table = $this->changeColumnFunctions[$column_name];
                if (!empty($this->functions_detail->get(['hash' => $value]))) {
                    $result = $this->functions_detail->get(['hash' => $value])->name;
                }
            } else {
                $result = $value;
            }
        }

        if (empty($result)) $result = "-";
        return $result;
    }

    private function _get_data_query()
    {
        $this->db->from($this->table);
        if (isset($_POST['search']['value'])) {
            foreach ($this->column_serch as $key => $value) {
                if ($key == 0) {
                    $this->db->like($value, $_POST['search']['value']);
                } else {
                    $this->db->or_like($value, $_POST['search']['value']);
                }
            }
        }

        $fieldName = $this->get_field_original();
        foreach ($fieldName as $key => $value) {
            if (!empty($this->changeHeaderName[$value])) {
                $order[] = $value;
            } else {
                $order[] = $value;
            }
        }

        if (isset($_POST['order']) && !empty($order[$_POST['order']['0']['column']])) {
            if (!empty($this->column_order)) {
                foreach ($this->column_order as $value) {
                    if ($order[$_POST['order']['0']['column']] == $value) {
                        $this->db->order_by($value, $_POST['order']['0']['dir']);
                    }
                }
            } else {
                $this->db->order_by($order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
            }
        } else {
            $this->db->order_by('name', 'ASC');
        }
    }

    public function getDataTable()
    {
        $this->_get_data_query();
        if ($_POST['length'] !== -1) {
            $this->db->limit($_POST['length'], $_POST['start']);
        }
        $query = $this->db->get();
        return $query->result();
    }

    public function Count_filtered_data()
    {
        $this->_get_data_query();
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function count_all_data()
    {
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    public function getHeaderName()
    {
        $TableHeader = "<thead><tr>";
        $fieldName = $this->get_field_original();
        foreach ($fieldName as $key => $value) {
            if (!in_array($value, $this->hiddenColumn)) {
                if (!empty($this->changeHeaderName[$value])) {
                    $TableHeader .= "<th>" . $this->changeHeaderName[$value] . "</th>";
                } else {
                    $TableHeader .= "<th>" . ucwords($value) . "</th>";
                }
            }
        }
        $TableHeader .= "</tr></thead>";
        return $TableHeader;
    }

    public function call_icon($data)
    {
        return $result = "<i class='nav-icon " . $data . "'></i> " . $data;
    }

    public function change_data($key, $value)
    {
        $output = "";
        $tipe = [0 => 'Master', 1 => 'Root', 2 => 'Single'];

        if ($key == 'tipe') {
            $output = $tipe[$value];
        }
        return $output;
    }

    public function actionButton($id)
    {
        $result = "";
        $array = ['edit' => 'primary', 'delete' => 'danger'];
        if (!empty($this->buttons)) $array = array_merge($array, $this->buttons);
        // $result .= '<div class="form-group" style="width:150px;">';
        foreach ($array as $key => $value) {
            $result .= '<button data-id="' . $id . '" class="btn btn-' . $value . ' btn_' . $key . ' form-control" style="margin-left: 5px;">' . ucfirst($key) . '</button>';
        }
        // $result .= '</div>';
        return $result;
    }

    public function call_date($value = "")
    {
        $html = '';
        $html .= '<div class="input-group date" id="reservationdate" data-target-input="nearest">';
        $html .= '<input type="text" class="form-control datetimepicker-input" data-target="#reservationdate" / value="' . $value . '">';
        $html .= '<div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">';
        $html .= '<div class="input-group-text"><i class="fa fa-calendar"></i></div>';
        $html .= '</div></div>';
        return $html;
    }

    public function call_file()
    {
        $html = "";
        $html .= '<div class="input-group">
        <div class="custom-file">
          <input type="file" class="custom-file-input" id="exampleInputFile">
          <label class="custom-file-label" for="exampleInputFile">Choose file</label>
        </div>
        <div class="input-group-append">
          <span class="input-group-text">Upload</span>
        </div>
      </div>';

        return $html;
    }

    public function option($name = "", $value = "", $where = "", $type = "", $join = "")
    {
        $option = "";
        if (empty($value)) $value = "";
        $option .= '<label>' . ucfirst($name) . '</label>';
        $option .= '<select id="' . $name . $type . '" name="' . $name  . $type . '" class="select2bs4" value="' . $value . '">';
        if ($name == "tipe") {
            foreach ($this->tipe as $k => $val) {
                $value == $k ? $selected = " selected" : $selected = "";
                $option .= '<option value="' . $k . '"' . $selected . '>' . $val . '</option>';
            }
        } else {
            if (!empty($this->functions->get(['kode' => $name]))) {
                $id = $this->functions->get(['kode' => $name]);
                $call_option_other_table = $this->functions_detail->gets(['functions' => $id->id]);
                foreach ($call_option_other_table as $k => $val) {
                    $value == $val->hash ? $selected = " selected" : $selected = "";
                    $option .= '<option value="' . $val->hash . '"' . $selected . '>' . $val->name . '</option>';
                }
            } else {
                if ($name == $join) {
                    $call_option_other_table = $this->$name->gets();
                    foreach ($call_option_other_table as $k => $val) {
                        $value == $val->id ? $selected = " selected" : $selected = "";
                        $option .= '<option value="' . $val->id . '"' . $selected . '>' . $val->name . '</option>';
                    }
                }
            }
        }


        $option .= '</select>';

        return $option;
    }



    public function root_option($name = "", $value = "", $where = "", $type = "")
    {
        $option = "";

        $option .= '<label>' . ucfirst($name) . '</label>';
        $option .= '<select id="' . $name  . $type . '" name="' . $name  . $type . '" class="select2bs4" value="' . $value . '" style="width:100%;">';
        if (!empty($where)) {
            $sql = $this->navigation->get(['id' => $where]);
            if ($sql->tipe == 1) {
                foreach ($this->navigation->gets(['tipe' => 0]) as $k => $val) {
                    $value == $val->id ? $selected = " selected" : $selected = "";
                    $option .= '<option value="' . $val->id . '"' . $selected . '>' . $val->name . '</option>';
                }
            }
        }
        $option .= '</select>';

        return $option;
    }

    public function callOption($name = "", $value = "", $where = "", $type = "", $join = "")
    {
        $option = "";
        if ($name == 'root') {
            $option .= $this->navigation->root_option($name, $value, $where, $type);
        } else {
            $option .= $this->master->option($name, $value, $where, $type, $join);
        }

        $result = $option;
        return $result;
    }

    public function detail_option($pk = "", $name = "", $join = "")
    {
        $option = "";
        $option .= '<label>' . ucfirst($name) . '</label>';
        $option .= '<select id="' . $name . '" name="' . $name  . '" class="select2bs4" style="width:100%;"  multiple="multiple">';
        $call_option_other_table = $this->$join->gets(['functions' => $pk]);
        if (!empty($call_option_other_table)) {
            foreach ($call_option_other_table as $k => $val) {
                $option .= '<option value="' . $val->hash . '" selected="selected">' . $val->name . '</option>';
            }
        }
        $option .= '</select>';

        return $option;
    }

    public function add_form($join = array())
    {
        $validate_option = array_merge($this->changeOption, $join);
        $sql = $this->master->get_field_original();
        $fields = $this->db->field_data($this->table);
        foreach ($fields as $key => $value) {
            if (in_array($value->name, $sql)) {
                if ($value->name !== 'action') {
                    if (in_array($value->name, $validate_option)) {
                        $this->form_html .= $this->master->callOption($value->name, "", "", "", $value->name);
                    } else {
                        if (in_array($value->name, $this->file)) {
                            $this->form_html .= '<label>' . ucfirst($value->name) . '</label>';
                            $this->form_html .= $this->master->call_file();
                        } else {
                            if ($value->type == 'date') {
                                $this->form_html .= '<label>' . ucfirst($value->name) . '</label>';
                                $this->form_html .= $this->master->call_date();
                            } else {
                                if ($value->type == 'int') {
                                    empty($this->master->gets()) ? $count = 1 : $count = count($this->master->gets()) + 1;
                                    $this->form_html .= '<label>' . ucfirst($value->name) . '</label>';
                                    $this->form_html .= '<input id="' . $value->name . '" name="' . $value->name . '" class="form-control" type="number" min="' . $count . '" value=' . $count . '>';
                                } else {
                                    if ($value->name == 'password') {
                                        $this->form_html .= '<label>' . ucfirst($value->type) . '</label>';
                                        $this->form_html .= '<input id="' . $value->name . '" name="' . $value->name . '" class="form-control" type="password">';
                                    } else {
                                        $this->form_html .= '<label>' . ucfirst($value->name) . '</label>';
                                        $this->form_html .= '<input id="' . $value->name . '" name="' . $value->name . '" class="form-control" type="text">';
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        $result = $this->form_html;
        return $result;
    }

    public function edit_form($id, $join = array())
    {
        $sql = $this->master->get(['id' => $id]);
        $validate_option = array_merge($this->changeOption, $join);
        $validate = $this->master->get_field_original();
        $this->form_html .= '<div class="modal-body">';
        foreach ($sql as $key => $value) {
            if (in_array($key, $validate)) {
                if (in_array($key, $validate_option)) {
                    $this->form_html .= $this->master->callOption($key, $value, $id, '_edit', $key);
                } else {
                    $this->form_html .= '<label>' . ucfirst($key) . '</label>';
                    if ($key == 'password') {
                        $this->form_html .= '<input id="' . $key . '" name="' . $key . '" class="form-control" type="password" value="' . $value . '">';
                    } else {
                        $this->form_html .= '<input id="' . $key . '" name="' . $key . '" class="form-control" type="text" value="' . $value . '">';
                    }
                }
            }
        }
        $this->form_html .= '</div>';
        $this->form_html .= '<div class="modal-footer">';
        $this->form_html .= '<button data-id="' . $id . '" class="btn btn-success btn_update" id="btn_update_data" type="button">Update</button>';
        $this->form_html .= '<button class="btn btn-default" data-dismiss="modal" type="button">Close</button>';
        $this->form_html .= '</div>';
        $result = $this->form_html;
        return $result;
    }

    public function detail_form($id, $table_detail)
    {

        $this->form_html .= '<div class="modal-body">';
        $this->form_html .= $this->master->detail_option($id, 'functions', $table_detail);
        $this->form_html .= '</div>';
        $this->form_html .= '<div class="modal-footer">';
        $this->form_html .= '<button data-id="' . $id . '" class="btn btn-success btn_detail" id="btn_detail_data" type="button">Update</button>';
        $this->form_html .= '<button class="btn btn-default" data-dismiss="modal" type="button">Close</button>';
        $this->form_html .= '</div>';
        $result = $this->form_html;
        return $result;
    }

    public function doLogin($username, $password)
    {
        $user = $this->db->get_where($this->table . " m", ['username' => $username])->row();
        // jika user terdaftar
        if ($user) {
            // periksa password-nya
            $isPasswordTrue = password_verify($password, $user->password);
            // periksa role-nya
            // $isAdmin = $user->role = 1;
            // jika password benar dan dia admin
            if ($isPasswordTrue) {
                // login sukses yay!
                $this->session->set_userdata('id', $user->id);
                return true;
            }
        }
        // login gagal
        return false;
    }

    public function dataTablesCss()
    {
        if (!empty($this->buttons)) {
            $width = "150px";
        } else $width = "150px";

        return $width;
    }
}
