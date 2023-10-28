var url = window.location.pathname;
var parts = url.split("/");
var link = parts[parts.length - 1];

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
			"processing": false,
			"serverSide": true,
			"autoWidth": false,
			"scrollCollapse": true,
			"info": false,
			"lengthChange": true,
			"scrollY": "400px",
			"ajax": {
				"url": link + "/serverside",
				"type": "POST"
			},
			"columnDefs": columnDefsVal,
		});
	},
});

function calloption(id = "", name = "", tipe = "") {
	$.ajax({
		url: link + "/call_option",
		type: "POST",
		data: {
			id: id,
			name: name,
			tipe: tipe,
		},
		dataType: "json",
		success: function (response) {
			$("#call-option").html(response.data);
			$(".select2-purple").select2();
			$(".select2bs4").select2({
				theme: "bootstrap4",
			});
		},
	});
}

$(function () {
	$(".select2-purple").select2();
	$(".select2bs4").select2({
		theme: "bootstrap4",
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
			if (response.option) {
				calloption(id, "", "edit");
			}
		},
	});

});

$("#example1").on("click", ".btn_permission", function () {
	var id = $(this).attr("data-id");
	$.ajax({
		url: link + "/permissionModal",
		type: "POST",
		data: {
			id: id
		},
		dataType: "json",
		success: function (response) {
			$("#permissionModal").modal("show");
			$("#form-field-permission").html(response.data);
		},
	});
});


$("#btn_add").on("click", function () {
	$.ajax({
		url: link + "/addModal",
		type: "POST",
		dataType: "json",
		success: function (response) {
			$("#addModal").modal("show");
			$("#form-field-add").html(response.data);
		},
	});
});

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

$("#tipe").change(function () {
	calloption($(this).val(), "tipe", "change");
});
