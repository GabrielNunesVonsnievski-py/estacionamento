<?php $this->load->view('layout/navbar'); ?>
<div class="page-wrap">
    <?php $this->load->view('layout/sidebar') ?>
    <div class="main-content">
        <div class="container-fluid">
            <div class="page-header">
                <div class="row align-items-end">
                    <div class="col-lg-8">
                        <div class="page-header-title">
                            <i class="<?php echo $icone_view; ?> bg-blue"></i>  
                            <div class="d-inline">
                                <h5><?php echo $titulo ?></h5>
                                <span><?php echo $sub_titulo; ?></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <nav class="breadcrumb-container" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a data-toggle="tooltip" data-placement="bottom" title="Home" href="<?php echo base_url('/') ?>"><i class="ik ik-home"></i></a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a data-toggle="tooltip" data-placement="bottom" title="Listar" href="<?php echo base_url($this->router->fetch_class()); ?>">Listar &nbsp; </a>
                                </li>
                                <li data-toggle="tooltip" data-placement="bottom" class="breadcrumb-item active" aria-current="page"><?php echo $titulo; ?></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header"><?php echo (isset($forma) ? '<i class="ik ik-calendar ik-2x"></i>Data da última alteração ' . formata_data_banco_com_hora($forma->forma_pagamento_data_alteracao) : ''); ?></div>
                        <div class="card-body">
                            <form class="forms-sample" name="form_core" method="POST">
                                <div class="form-group row">
                                    <div class="col-md-8 mg-20">
                                        <label>Nome</label>
                                        <input type="text" class="form-control" name="forma_pagamento_nome" value="<?php echo (isset($forma) ? $forma->forma_pagamento_nome : set_value('forma_pagamento_nome')); ?>">
                                        <?php echo form_error('forma_pagamento_nome','<div class="text-danger">','</div>'); ?> 
                                    </div>
                                    <div class="col-md-4 mg-20">
                                        <label>Ativa</label>
                                        <select class="form-control" name="forma_pagamento_ativa">
                                            <?php if(isset($forma)): ?>
                                                <option value="0" <?php echo ($forma->forma_pagamento_ativa == 0 ? 'selected' : '') ?>> Não </option>
                                                <option value="1" <?php echo ($forma->forma_pagamento_ativa == 1 ? 'selected' : '') ?>> Sim </option>       
                                            <?php else: ?>  
                                                <option value="0">Não</option>
                                                <option value="1">Sim</option>
                                            <?php endif; ?>
                                        </select>
                                    </div>
                                    <?php if(isset($forma)): ?>
                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <input type="hidden" class="form-control" name="forma_pagamento_id" value="<?php echo $forma->forma_pagamento_id; ?>">
                                            </div>
                                        </div>
                                    <?php endif; ?>    
                                </div> 
                                <div>
                                    <button type="submit" class="btn btn-primary mr-2" >Salvar</button>
                                    <a class="btn btn-info" href="<?php echo base_url($this->router->fetch_class()); ?>">Voltar</a>   
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <div class="w-100 clearfix">
            <span class="text-center text-sm-left d-md-inline-block">Copyright © <?php echo date('Y') ?> ThemeKit v2.0. All Rights Reserved.</span>
            <span class="float-none float-sm-right mt-1 mt-sm-0 text-center">Customizado <i class="fas fa-code text-dark"></i> by <a href="javascript:void" class="text-dark">Gabriel Nunes Vonsnievski</a></span>
        </div>
    </footer>

</div>