var url = window.location.pathname;
var parts = url.split("/");
var link = parts[parts.length - 1];
$(function () {

	$("#btn_add").on("click", function () {
		$.ajax({
			url: link + "/addModal",
			type: "POST",
			dataType: "json",
			success: function (response) {
				$("#addModal").modal("show");
				$("#form-field-add").html(response.data);
				$(".select2-purple").select2();
				$(".select2bs4").select2({
					theme: "bootstrap4",
				});
				callTest();
				callRoot(0);
				date_time_picker();
			},
		});
	});

	$("#example1").on("click", ".btn_edit", function () {
		var id = $(this).attr("data-id");
		$.ajax({
			url: link + "/editModal",
			type: "POST",
			data: {
				id: id
			},
			dataType: "json",
			success: function (response) {
				$("#editModal").modal("show");
				$("#form-field-edit").html(response.data);
				$(".select2-purple").select2();
				$(".select2bs4").select2({
					theme: "bootstrap4",
				});
				callTest(response.data_main.root, '_edit');
				callRoot(response.data_main.tipe, '_edit');
				updateData();
			},
		});
	});

	$("#example1").on("click", ".btn_detail", function () {
		var id = $(this).attr("data-id");
		$.ajax({
			url: link + "/detailModal",
			type: "POST",
			data: {
				id: id
			},
			dataType: "json",
			success: function (response) {
				$("#detailModal").modal("show");
				$("#form-field-detail").html(response.data);
				detailData();
				$("#functions").select2({
					theme: "bootstrap4",
					tags: true,
				});
			},
		});
	});
});

$(function () {
	submitData();
	deleteData();
	showDataTables();
});


// End Method Modal
function submitData() {
	$("#btn_submit").on("click", function () {
		var data = $("#form-add").serialize();
		$.ajax({
			url: link + "/add",
			type: "POST",
			dataType: "json",
			data: data,
			success: function (response) {
				$("#addModal").modal("hide");
				$("#example1").DataTable().ajax.reload(null, false);
			},
		});
	});
};

function updateData() {
	$("#btn_update_data").on("click", function () {
		formData = {
			data: $("#form-edit").serializeArray(),
			id: $(this).attr("data-id")
		};
		$.ajax({
			url: link + "/edit",
			type: "POST",
			dataType: "json",
			data: formData,
			success: function (response) {
				$("#editModal").modal("hide");
				$("#example1").DataTable().ajax.reload(null, false);
			},
		});
	});
}

function detailData() {
	$("#btn_detail_data").on("click", function () {
		formData = {
			data: $("#form-detail").serializeArray(),
			id: $(this).attr("data-id")
		};
		$.ajax({
			url: link + "/action_detail",
			type: "POST",
			dataType: "json",
			data: formData,
			success: function (response) {
				if (response) {
					$("#detailModal").modal("hide");
					$("#example1").DataTable().ajax.reload(null, false);
				}
				// alert(response.result);
			},
		});
	});
}

function deleteData() {
	$("#example1").on("click", ".btn_delete", function () {
		var id = $(this).attr("data-id");
		$.ajax({
			url: link + "/delete",
			type: "POST",
			dataType: "json",
			data: {
				id: id,
			},
			success: function (response) {
				$("#example1").DataTable().ajax.reload(null, false);
			},
		});
	});
};

function callRoot(tipe, key = "") {
	if (tipe == 1) {
		text_placeholder = "Search root";
	} else {
		text_placeholder = "No Root";
	}
	$('#root' + key).select2({
		ajax: {
			url: link + "/show_root",
			dataType: 'json',
			delay: 250,
			data: function (data) {
				return {
					searchTerm: data.term,
					tipe: tipe,
				};
			},
			processResults: function (response) {
				return {
					results: response
				};
			},
			cache: false,
		},
		theme: "bootstrap4",
		placeholder: text_placeholder
	});
}

function callTest(id = "", key = "") {
	$("#tipe" + key).change(function () {
		if ($("#tipe" + key).val() == 1) {
			callRoot(1, key);
			if (id !== null) {
				$("#root" + key).val(id).trigger('change');
			}
		} else {
			callRoot(0, key);
			$("#root" + key).val('').trigger('change');
		}
	});
};

function showDataTables() {
	$.ajax({
		url: link + "/dataTablesCss",
		type: "POST",
		dataType: "json",
		success: function (response) {
			var columnDefsVal = [{
				orderable: false,
				targets: [-1],
				width: response.width,
			}];
			$('#example1').DataTable({
				"scrollY": 300,
				"scrollX": true,
				"fixedColumns": true,
				"fixedHeaders": true,
				"processing": true,
				"serverSide": true,
				"autoWidth": false,
				"responsive": false,
				"scrollCollapse": true,
				"info": true,
				"orderable": true,
				"lengthChange": true,
				"ajax": {
					"url": link + "/serverside",
					"type": "POST"
				},
				"columnDefs": columnDefsVal,
			});
		},
	});
};

function date_time_picker() {
	//Date picker
	$('#reservationdate').datetimepicker({
		format: 'L'
	});
}
