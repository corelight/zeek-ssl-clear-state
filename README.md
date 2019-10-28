ssl-clear-state
===============

This package uses the `SSL::ssl_finishing` hook to delete `c$ssl$cert_chain`
and `c$ssl$client_cert_chain` after the SSL handshake completes, instead of
waiting for the connection to complete.  This does not affect any of the log
files.  The only situation in which this could cause an issue is if any scripts
are handling the `connection_state_remove` event and trying to access either of
those fields.

This package may not be needed in future versions of zeek.
