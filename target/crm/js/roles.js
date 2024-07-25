$(document).ready(function () {

    $("#btn-update-role").prop("disabled", true);

    function tableRoles() {
        $.ajax({
            method: "GET",
            url: "http://localhost:8080/crm/api/roles",
            data: {}
        }).done(function (data) {

            var items = data.data;
            var tableBody = $('#roles-table-body');

            items.forEach(function (item, index, arr) {

                var row = $('<tr>', {
                    class: 'rowtr',
                });

                row.append($('<th>', {
                    scope: 'row'
                }).text(index + 1));
                row.append($('<td>').text(item.roleName));
                row.append($('<td>').text(item.description));
                row.append($('<td>').append(
                    $('<div>', {
                        style: 'display: flex; justify-content: space-between;'
                    }).append($('<a>', {
                            class: 'btn-edit',
                            href: '#!',
                            'data-role-id': item.id,
                            'data-role-name': item.roleName,
                            'data-role-description': item.description
                        }).append($('<svg xmlns = "http://www.w3.org/2000/svg"\n' +
                            '                                             width = "16"\n' +
                            '                                             height = "16"\n' +
                            '                                             fill = "green"\n' +
                            '                                             class = "bi bi-pencil-square"\n' +
                            '                                             viewBox = "0 0 16 16">\n' +
                            '                                            <path d = "M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />\n' +
                            '                                            <path fill-rule = "evenodd"\n' +
                            '                                                  d = "M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />\n' +
                            '                                        </svg>')),
                        $('<a>', {
                            class: 'btn-delete',
                            href: '#!',
                            'data-role-id': item.id
                        }).append($('<svg xmlns = "http://www.w3.org/2000/svg"\n' +
                            '                                                    width = "16"\n' +
                            '                                                    height = "16"\n' +
                            '                                                    fill = "red"\n' +
                            '                                                    class = "bi bi-trash3-fill"\n' +
                            '                                                    viewBox = "0 0 16 16">\n' +
                            '                                            <path d = "M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5" />\n' +
                            '                                        </svg>')))
                ));
                tableBody.append(row);
            });

            $('.btn-delete').on('click', function () {
                var id = $(this).attr('data-role-id');
                var row = $(this).closest('tr');

                $.ajax({
                    method: "POST",
                    url: "http://localhost:8080/crm/api/roles/delete",
                    data: {id: id}
                })
                    .done(function (data) {
                        if (data.isSuccess) {
                            row.remove();
                        } else {
                            alert("Xóa thất bại! " + data);
                        }
                    });
            });

            $('.btn-edit').on('click', function () {
                var id = $(this).attr('data-role-id');
                var name = $(this).attr('data-role-name');
                var description = $(this).attr('data-role-description');

                $('#name').val(name);
                $('#description').val(description);
                $('#id').val(id);

                $("#btn-update-role").prop("disabled", false);
                $("#btn-add-role").prop("disabled", true);
            });

            $('#btn-update-role').click(function (e) {
                e.preventDefault();

                var id = $('#id').val();
                var name = $('#name').val();
                var description = $('#description').val();

                $.ajax({
                    method: "POST",
                    url: "http://localhost:8080/crm/api/roles/update",
                    data: {name: name, description: description, id: id}
                })
                    .done(function (data) {
                        $('#roles-table-body').empty();
                        tableRoles();
                    });

                $('#myForm')[0].reset();
                $("#btn-add-role").prop("disabled", false);
                $("#btn-update-role").prop("disabled", true);
            });
        });
    }

    $('#btn-add-role').click(function (e) {
        e.preventDefault();

        var name = $("#name").val();
        var description = $("#description").val();

        $.ajax({
            method: "POST",
            url: "http://localhost:8080/crm/api/roles/add",
            data: {name: name, description: description}
        }).done(function (data) {
            $('#roles-table-body').empty();
            tableRoles();
        });
        $('#myForm')[0].reset();
    });

    $('#btn-reset-form').click(function (e) {
        e.preventDefault();
        $('#myForm')[0].reset();
    });

    $('#myForm').validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        rules: {
            "name": {
                required: true,
                maxLength: 20
            },
            "description": {
                maxLength: 100
            }
        }
    });

    tableRoles();
});