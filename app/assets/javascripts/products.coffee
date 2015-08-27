# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    $('#products')
        .on 'click', '.edit, .cancel',(event) ->
            toggleEditor $(this).closest('.product')
        .on 'ajax:complete', '.edit_product', (event, ajax, status) ->
            resoponse =  $.parseJSON(ajax.responseText)
            name = resoponse.data.name
            $container = $(this).closest('.product')
            $container.find('.viewer .name').text name
            toggleEditor $container

toggleEditor = ($container) ->
    $container.find('.viewer, .editor').toggle()

    $bodyField = $container.find('.editor .name')
    if $bodyField.is(':visible')
        $bodyField
            .val($container.find('.viewer .name'.text()))
            .select()
