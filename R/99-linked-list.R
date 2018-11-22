llist <- function(head, tail = NULL) {
  if (is.null(tail)) {
    tail <- structure(list(), class = "linked_list")
  }
  structure(
    list(
      head = head,
      tail = tail
    ),
    class = "linked_list"
  )
} 


llist(5, list(4))

toString.linked_list <- function(x, ...) {
  if (!is.null(x)) {
    paste(x$head, toString(x$tail))
  }
}

print.linked_list <- function(x, ...) {
  cat(toString(x))
}

head.linked_list <- function(x, ...) {
  x$head
}

tail.linked_list <- function(x, ...) {
  x$tail
}

is.linked_list <- function(x) {
  class(x) == "linked_list"
}

insert <- function(llist, value) {
  stopifnot(is.linked_list(llist))
  llist(value, llist)
}

sum.linked_list <- function(llist, ...) {
  stopifnot(is.linked_list(llist))
  if (!is.null(llist)) {
    head(llist) + sum(tail(llist))
  }
}

foreach <- function(llist, fun) {
  stopifnot(is.linked_list(llist))
  
  foreach_iter <- function(x) {
    stopifnot()
  }
  
  if (!is.null(llist)) {
    insert(
      foreach(tail(llist), fun),
      fun(head(llist))
    )
  }
}


llist(5) %>%
  insert(6) %>% 
  insert(9) %>% 
  insert(15) %>% 
  insert(1) %>% 
  foreach(function(x) x - 1)
