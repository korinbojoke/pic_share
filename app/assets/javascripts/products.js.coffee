$ ->
    console.log("Hello world")
    $('#products')
        .on 'click', '.edit, .cancel',(event) ->
            toggleEditor $(this).closest('.product')

toggleEditor = ($container) ->
    $container.find('.viewer, .editor').toggle()

    $bodyField = $container.find('.editor .name')
    if $bodyField.is(':visible')
        $bodyField
            .val($container.find('.viewer .name'.text()))
            .select()
