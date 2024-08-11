% rebase('base.tpl',title="create")
    <h1 class="mt-5 ml-2">CREAR</h1>
    <form action="/create" class='form mt-4 container-sm' method="post">
        <label for="name" class='fw-semibold mt-2'>Nombre:</label>
        <input class='form-control w-50' type="text" id="name" name="name" required>
        <button type="submit" class='btn btn-primary mt-3 px-5'>Agregar</button>
    </form>
