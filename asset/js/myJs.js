var url = window.location.pathname;
var parts = url.split("/");
var link = parts[parts.length - 1];


$(function () {
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
				callTest(response.data_main.root);
				callRoot(0);
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

});

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
});


function callRoot(tipe) {
	if (tipe == 1) {
		text_placeholder = "Search root";
	} else {
		text_placeholder = "No Root";
	}
	$('#root').select2({
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

function callTest(id = "") {
	$("#tipe").change(function () {
		if ($("#tipe").val() == 1) {
			callRoot(1);
			if (id !== null) {
				$("#root").val(id).trigger('change');
			}
		} else {
			callRoot(0);
			$("#root").val('').trigger('change');
		}
	});
};


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
