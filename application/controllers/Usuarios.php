<?php

defined('BASEPATH') or exit('Ação não permitida');

class Usuarios extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();

        if (!$this->ion_auth->logged_in()) {
            redirect('login');
        }
    }

    public function index()
    {

        if (!$this->ion_auth->is_admin()) {
            $this->session->set_flashdata('info', 'Você não tem permissão para acessar esse Menu!');
            redirect('/');
        }

        $data = array(
            'titulo' => 'Usuários cadastrados',
            'sub_titulo' => 'Chegou a hora de listar os usuários cadastrados no banco de dados',

            'styles' => array(
                'plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css',
            ),

            'scripts' => array(
                'plugins/datatables.net/js/jquery.dataTables.min.js',
                'plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js',
                'plugins/datatables.net/js/traducaodatatables.js',
            ),

            'usuarios' => $this->ion_auth->users()->result(), //get all users
        );

        $this->load->view('layout/header', $data);
        $this->load->view('usuarios/index');
        $this->load->view('layout/footer');
    }

    public function core($usuario_id = NULL)
    {

        if (!$usuario_id) {

            if (!$this->ion_auth->is_admin()) {

                $this->session->set_flashdata('info', 'Você não tem permissão para acessar esse Menu!');
                redirect('/');
            }

            //Cadastro de novo usuario

            $this->form_validation->set_rules('first_name', 'Nome', 'trim|required|min_length[4]|max_length[20]');
            $this->form_validation->set_rules('last_name', 'sobrenome', 'trim|required|min_length[5]|max_length[20]');
            $this->form_validation->set_rules('username', 'Usuário', 'trim|required|min_length[4]|max_length[30]|is_unique[users.username]');
            $this->form_validation->set_rules('email', 'E-mail', 'trim|valid_email|required|min_length[5]|max_length[200]|is_unique[users.email]');
            $this->form_validation->set_rules('password', 'Senha', 'trim|required|min_length[8]');
            $this->form_validation->set_rules('confirmacao', 'Confirmação', 'trim|matches[password]');

            if ($this->form_validation->run()) {

                $username = html_escape($this->input->post('username'));
                $password = html_escape($this->input->post('password'));
                $email = html_escape($this->input->post('email'));

                $additional_data = array(
                    'first_name' => $this->input->post('first_name'),
                    'last_name' => $this->input->post('last_name'),
                    'active' => $this->input->post('active'),
                );
                $group = array($this->input->post('perfil'));

                $additional_data = html_escape($additional_data);

                if ($this->ion_auth->register($username, $password, $email, $additional_data, $group)) {
                    $this->session->set_flashdata('sucesso', 'Dados salvos com sucesso!');
                } else {
                    $this->session->set_flashdata('error', 'Erro ao salvar dados!');
                }

                redirect($this->router->fetch_class());
            } else {

                //Erro de validação

                $data = array(
                    'titulo' => 'Cadastrar usuário',
                    'sub_titulo' => 'Chegou a hora de cadastrar um novo usuário',

                    'icone_view' => 'ik ik-user',
                );

                $this->load->view('layout/header', $data);
                $this->load->view('usuarios/core');
                $this->load->view('layout/footer');
            }
        } else {

            //Edita o usuario

            if (!$this->ion_auth->user($usuario_id)->row()) {
                exit('Usuário não existe');
            } else {

                //Editar usuário

                if ($this->session->userdata('user_id') != $usuario_id && !$this->ion_auth->is_admin()) {
                    $this->session->set_flashdata('error', 'Você não pode editar um usuário diferente do seu. Suas ações estão sendo monitoradas!');
                    redirect('/');
                }

                $perfil_atual = $this->ion_auth->get_users_groups($usuario_id)->row();

                $this->form_validation->set_rules('first_name', 'Nome', 'trim|required|min_length[4]|max_length[20]');
                $this->form_validation->set_rules('last_name', 'sobrenome', 'trim|required|min_length[4]|max_length[20]');
                $this->form_validation->set_rules('username', 'Usuário', 'trim|required|min_length[5]|max_length[30]|callback_username_check');
                $this->form_validation->set_rules('email', 'E-mail', 'trim|valid_email|required|min_length[5]|max_length[200]|callback_email_check');
                $this->form_validation->set_rules('password', 'Senha', 'trim|min_length[8]');
                $this->form_validation->set_rules('confirmacao', 'Confirmação', 'trim|required|matches[password]');

                if ($this->form_validation->run()) {

                    $data = elements(
                        array(
                            'first_name',
                            'last_name',
                            'username',
                            'email',
                            'password',
                            'active',
                        ),
                        $this->input->post()
                    );

                    if (!$this->ion_auth->is_admin()) {
                        unset($data['active']);
                    }

                    $password = $this->input->post('password');

                    //Não atualiza a senha
                    if (!$password) {
                        unset($data['pasword']);
                    }

                    $data = html_escape($data);

                    // echo'<pre>';
                    // print_r($this->input->post());
                    // exit();

                    if ($this->ion_auth->update($usuario_id, $data)) {


                        $perfil_post = $this->input->post('perfil');

                        //se foi passado o 'perfil', entao é admin
                        if ($perfil_post) {

                            //se for diferente atualiza o grupo
                            if ($perfil_atual != $perfil_post) {

                                $this->ion_auth->remove_from_group($perfil_atual->id, $usuario_id);
                                $this->ion_auth->add_to_group($perfil_post, $usuario_id);
                            }
                        }

                        $this->session->set_flashdata('sucesso', 'Dados atualizados com sucesso!');
                        //redirect('usuarios'); redireciona para a pagina de usuarios
                    } else {

                        $this->session->set_flashdata('error', 'Não foi possível atualizar os dados');
                        //redirect('usuarios'); redireciona para a pagina de usuarios
                    }

                    if (!$this->ion_auth->is_admin()) {
                        redirect('/');
                    } else {
                        redirect($this->router->fetch_class());
                    }
                } else {
                    //erro de validação

                    $data = array(
                        'titulo' => 'Editar usuário',
                        'sub_titulo' => 'Chegou a hora de editar o usuário',
                        'icone_view' => 'ik ik-user',
                        'usuario' => $this->ion_auth->user($usuario_id)->row(), //get all users
                        'perfil_usuario' => $this->ion_auth->get_users_groups($usuario_id)->row(),
                    );

                    // echo '<pre>';
                    // print_r($data['usuario']);
                    // exit();

                    $this->load->view('layout/header', $data);
                    $this->load->view('usuarios/core');
                    $this->load->view('layout/footer');
                }
            }
        }
    }

    public function username_check($username)
    {

        $usuario_id = $this->input->post('usuario_id');

        if ($this->core_model->get_by_id('users', array('username' => $username, 'id !=' => $usuario_id))) {
            $this->form_validation->set_message('username_check', 'Esse usuario já existe!');
            return false;
        } else {
            return true;
        }
    }

    public function email_check($email)
    {

        $usuario_id = $this->input->post('usuario_id');

        if ($this->core_model->get_by_id('users', array('email' => $email, 'id !=' => $usuario_id))) {
            $this->form_validation->set_message('username_check', 'Esse e-mail já existe!');
            return false;
        } else {
            return true;
        }
    }

    public function del($usuario_id = NULL)
    {

        if (!$this->ion_auth->is_admin()) {
            $this->session->set_flashdata('error', 'Você não tem permissão para acessar esse menu!');
            redirect('/');
        }

        if (!$usuario_id || !$this->core_model->get_by_id('users', array('id' => $usuario_id))) {
            $this->session->set_flashdata('error', 'Usuário não encontrado');
            ($this->redirect->router->fetch_class());
        } else {

            //Deleta

            if ($this->ion_auth->is_admin($usuario_id)) {
                $this->session->set_flashdata('error', 'Administrador não pode ser excluido!');
                redirect($this->router->fetch_class());
            }
            if ($this->ion_auth->delete_user($usuario_id)) {
                $this->session->set_flashdata('sucesso', 'Registro excluído com sucesso!');
            } else {
                $this->session->set_flashdata('error', 'Não foi possível excluir o registro!');
            }


            redirect($this->router->fetch_class());
        }
    }
}
