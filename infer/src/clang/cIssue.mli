(*
 * Copyright (c) 2016 - present Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *)

type issue =
  | Assign_pointer_warning
  | Strong_delegate_warning
  | Global_variable_initialized_with_function_or_method_call
  | Direct_atomic_property_access
  | Cxx_reference_captured_in_objc_block
  | Registered_observer_being_deallocated

val to_string : issue -> string

val severity_of_issue : issue -> Exceptions.err_kind

type issue_desc = {
  issue : issue; (* issue *)
  description : string; (* Description in the error message *)
  suggestion : string option; (* an optional suggestion or correction *)
  loc : Location.t; (* location in the code *)
}
