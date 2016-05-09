ChapterSorter =
  orderedChapterIds: ->
    $('#chapters-list').sortable('toArray').map (eleId) ->
      eleId.split("_")[1]
  saveNewSortOrder: ->
    $.ajax
      method: "PUT"
      url: "#{$('#book')[0].dataset.bookId}/chapters/sort",
      dataType: "script"
      data: { chapter_ids: ChapterSorter.orderedChapterIds() }

  init: ->
    $('#chapters-list').sortable
      handle: '.fa-bars'
      items: '> .chapter'
      placeholder: 'sortable-placeholder'
      update: ->
        ChapterSorter.saveNewSortOrder()

$ ->
  $('#book #sidebar #chapters-list .chapter .chapter-title').click (ev) ->
    ev.preventDefault()
    $(@).parents('.chapter').toggleClass('expanded')

  ChapterSorter.init()
