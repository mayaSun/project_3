$(document).on("ready page:load", function($) {
  jQuery('select#choosen_book').on('change', function(event) {
    var book, select_wrapper, url;
    select_wrapper = jQuery('#books_chapters_wrapper');
    jQuery('select', select_wrapper).attr('disabled', true);
    book = jQuery(this).val();
    url = "/chapter_select?book=" + book;
    return select_wrapper.load(url);
  });
  return jQuery('select#locale').change(function(event) {
    return jQuery(this).closest('form').submit();
  });
}); 
