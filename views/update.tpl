% rebase('base.tpl', title="update")

    <h1 class='mt-5'>ACTUALIZAR</h1>
    <form class='form mt-4 container-sm' action="/update/{{item['id']}}" method="post">
        <label class='fw-semibold mt-2' for="name">Nombre:</label>
        <input class='form-control w-50' type="text" id="name" name="name" value="{{item['name']}}" required>
        <button class='btn btn-primary mt-3 px-5' type="submit" id='btn_Update'>Actualizar</button>
    </form>

