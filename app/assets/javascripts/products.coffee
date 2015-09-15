# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    $('#products')
        .on 'click', '.edit, .cancel',(event) ->
            toggleEditor $(this).closest('.product')
        .on 'ajax:complete', '.edit_product', (event, ajax, status) ->
            timestamp = new Date().getTime()
            response =  $.parseJSON(ajax.responseText)
            name = response.data.name
            image = response.data.image
            $container = $(this).closest('.product')
            # console.log timestam
            $container.find('.viewer .name').text name
            $container.find('img').attr('src',image.url)
            toggleEditor $container
        .on 'ajax:complete', '.delete_product', (event, ajax, status) ->
            $(this).closest('.product').remove()
    $('#new_product')
        .on 'ajax:complete', (event, ajax, status) ->
            response = $.parseJSON(ajax.responseText)
            html = response.html
            #画面に追加
            $('#products').append html
            $(this)[0].reset()

toggleEditor = ($container) ->
    $container.find('.viewer, .editor').toggle()

    $bodyField = $container.find('.editor .name')
    if $bodyField.is(':visible')
        $bodyField
            .val($container.find('.viewer .name'.text()))
            .select()
