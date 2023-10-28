<?php
defined('BASEPATH') or exit('No direct script access allowed');

class My_model extends CI_Model
{

    public $table = "";
    public $table_prefix = "";
    public $changeHeaderName = ['id' => 'No', 'create_date' => "Tanggal"];
    public $tipe = ['Master', 'Root', 'Single'];
    public $hiddenColumn = ['creator', 'create_date', 'status'];
    public $column_serch = ["name"];
    public $changeOption = ["tipe", "root"];
    public $disable = [];
    public $buttons = [];
    public $form_html = "";

    public function add($data)
    {
        return $this->db->insert($this->table, $data);
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
                $this->table_prefix = substr($this->table, 0, 1);
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
        $res = array_reverse(array_reverse(array_diff($res, ["creator", "create_date", "status"])));
        return $res;
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
            if (!in_array($value, $this->hiddenColumn)) {
                if (!empty($this->changeHeaderName[$value])) {
                    $order[] = $value;
                } else {
                    $order[] = $value;
                }
            }
        }

        if (isset($_POST['order']) && !empty($order[$_POST['order']['0']['column']])) {
            $this->db->order_by($order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
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
        foreach ($array as $key => $value) {
            $result .= '<button data-id="' . $id . '" class="btn btn-' . $value . ' btn_' . $key . '" style="margin-left: 5px;">' . ucfirst($key) . '</button>';
        }
        return $result;
    }

    public function getFormField($name, $type, $validate = "")
    {
        if ($type !== 'tinyint') {
            $validate['where'] = "";
            $validate['must'] = "";
        }
    }

    public function callOption($id = "", $name = "", $value = "")
    {

        $option_root = "";
        $option_tipe = "";
        foreach ($this->changeOption as $k => $val) {
            if ($name == 'tipe' && $name == $val) {
                $sql = $this->navigation->get(['id' => $id]);
                $option_tipe .= '<label>' . ucfirst($val) . '</label>';
                $option_tipe .= '<select id="' . $val . '" name="' . $val . '" class="form-control select2bs4" value="' . $sql->tipe . '">';
                foreach ($this->tipe as $k => $val) {
                    !empty($sql->tipe) && $sql->tipe == $k ? $selected = " selected" : $selected = "";
                    $option_tipe .= '<option value="' . $k . '"' . $selected . '>' . $val . '</option>';
                }
                $option_tipe .= '</select>';
                if ($sql->tipe == 1) {
                    $option_root .= '<label>' . ucfirst('root') . '</label>';
                    $option_root .= '<select id="root" name="root" class="form-control select2bs4" value="' . $sql->root . '">';
                    foreach ($this->navigation->gets(['tipe' => 0]) as $k => $val) {
                        !empty($sql->id) && $sql->root == $val->id ? $selected = " selected" : $selected = "";
                        $option_root .= '<option value="' . $val->id . '"' . $selected . '>' . $val->name . '</option>';
                    }
                    $option_root .= '</select>';
                }
            }
        }

        $result = $option_tipe . $option_root;

        return $result;
    }

    public function add_form()
    {
        $sql = array_diff($this->master->get_field_original(), ['id', 'action']);
        foreach ($sql as $key => $value) {
            if ($value == 'password') {
                $this->form_html .= '<label>' . ucfirst($value) . '</label>';
                $this->form_html .= '<input id="' . $value . '" name="' . $value . '" class="form-control" type="password">';
            } else {
                $this->form_html .= '<label>' . ucfirst($value) . '</label>';
                $this->form_html .= '<input id="' . $value . '" name="' . $value . '" class="form-control" type="text">';
            }
        }

        $result = $this->form_html;
        return $result;
    }

    public function edit_form($id)
    {
        $sql = $this->master->get(['id' => $id]);
        $validate = array_merge($this->disable, $this->hiddenColumn);
        foreach ($sql as $key => $value) {
            if (!in_array($key, $validate)) {

                if (in_array($key, $this->changeOption)) {
                    $this->form_html .= '<div id="call-option-' . $key . '"></div>';
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
            $width = "250px";
        } else $width = "150px";

        return $width;
    }
}
