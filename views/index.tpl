% rebase('base.tpl', title="home")
    <a class="btn bg-primary text-bg-primary mt-5" href="/create">Agregar nuevo cliente</a>
    <table class="table mt-3 text-center">
        <thead>
            <tr class="table-dark p-4">
                <th class="fw-bold" scope="col">codigo</th>
                <th class="fw-bold" scope="col">nombre</th>
                <th class="fw-bold" scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody>
            %for item in items:
            <tr class="align-items-center">
                <td class="align-middle" scope="row">{{item['id']}}</td>
                <td class="align-middle">{{item['name']}}</td>
                <td class="align-middle">
                    <a href="/details/{{item['id']}}" class="btn btn-primary fw-semibold">Ver</a>
                    <a href="/delete/{{item['id']}}" class="btn btn-danger fw-semibold" id="btn_Delete">Borrar</a>
                    <a href="/update/{{item['id']}}" class="btn btn-warning fw-semibold text-white">Editar</a>
                </td>
            </tr>
        %end
        </tbody>
    </table>
    %if not(len(items)):
        <h1 class="align-middle">Esta vacio</h1>
    %end
