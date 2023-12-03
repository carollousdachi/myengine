<section class="content">
    <!-- <div class="container-fluid"> -->
    <div class="row">
        <div class="col-12">
            <div class="body">
                <button class="btn btn-sm btn-success" id="btn_add" type="button">Add <?= ucfirst($getMenu) ?></button>
                <hr />
                <table id="example1" class="table table-bordered table-striped">
                    <?= $hTable; ?>
                </table>

                <div class="modal fade" id="addModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">
                                    Add Data <?= ucfirst($getMenu) ?>
                                </h4>
                                <button class="close" data-dismiss="modal" type="button">
                                    ×
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="form-add" method="post">
                                    <div id="form-field-add"></div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-success" id="btn_submit" type="button">
                                    Submit
                                </button>
                                <button class="btn btn-default" data-dismiss="modal" type="button">
                                    Close
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="editModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">
                                    Edit Data <?= ucfirst($getMenu) ?>
                                </h4>
                                <button class="close" data-dismiss="modal" type="button">
                                    ×
                                </button>
                            </div>
                            <form id="form-edit" method="post">
                                <div id="form-field-edit"></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- </div> -->
</section>