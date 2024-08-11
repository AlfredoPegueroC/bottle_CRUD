% rebase('base.tpl', title='details')

<h1 class="mt-5 ml-2">Detalle</h1>

<table class="table mt-3 text-center">
        <thead>
            <tr class="table-dark p-4">
                <th class="fw-bold" scope="col">codigo</th>
                <th class="fw-bold" scope="col">nombre</th>
                <th class="fw-bold" scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody>
            <tr class="align-items-center">
                <td class="align-middle" scope="row">{{item['id']}}</td>
                <td class="align-middle">{{item['name']}}</td>
                <td class="align-middle">
                    <a href="/delete/{{item['id']}}" class="btn btn-danger fw-semibold" id='btn_Delete'>Borrar</a>
                    <a href="/update/{{item['id']}}" class="btn btn-warning fw-semibold text-white" id='btn_Update'>Editar</a>
                </td>
            </tr>
        </tbody>
    </table>
    
    <a href="/" class="btn btn-primary fw-semibold">Vover al inicio</a>