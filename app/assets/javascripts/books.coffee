@ChapterUtils =
  hideNewChapterForm: ->
    $("#new-chapter-form").hide()
    $("#new-chapter-form-trigger").show()
  bindNewChapterCancelLink: ->
    $("#cancel-new-chapter-form-trigger").click ->
      ChapterUtils.hideNewChapterForm()
$ ->
  $("#new-chapter-form").hide()
  $("#new-chapter-form-trigger").click ->
    $("#new-chapter-form").show()
    $(@).hide()
  ChapterUtils.bindNewChapterCancelLink()

$ ->
  $('#book #sidebar #chapters-list .chapter .chapter-title').click (ev) ->
    ev.preventDefault()
    $(@).parents('.chapter').toggleClass('expanded')

$ ->
  $('#chapters-list').sortable
    handle: ".fa-bars"
    items: "> .chapter"
    placeholder: "sortable-placeholder"
    update: ->
      $.ajax ->
        method: "PUT",
        url: "/books/#{$('#book')[0].dataset.bookId}/chapters/sort",
        dataType: "script"
        data: { chapter_ids: orderedChapterIds }
  # orderedChapterIds = $("#chapters-list").sortable("toArray").map (eleID) ->
  #   eleID.split("_")[1]
