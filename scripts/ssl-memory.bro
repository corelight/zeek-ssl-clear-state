event clear_ssl(c: connection)
{
        if (c$ssl?$cert_chain)
                delete c$ssl$cert_chain;
        if (c$ssl?$client_cert_chain)
                delete c$ssl$client_cert_chain;
}

event ssl_established(c: connection) &priority=-200
{
        schedule 5secs { clear_ssl(c) } ;
}
