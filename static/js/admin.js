$(document).ready(function () {
	console.log('ready admin')
	$('#tbl-books').DataTable({
        "ajax": {
			"url" : '/admin/includes/admin_functions.php',
			"type": 'post',
			"data": {"function":"getBooks"},
		},
        "columns": [
            { "data": 'id' },
            { "data": 'name' },
        ],
    });
});
