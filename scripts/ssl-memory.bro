event clear_ssl(c: connection)
{
        if (c$ssl?$cert_chain)
                c$ssl$cert_chain = vector();
        if (c$ssl?$client_cert_chain)
                c$ssl$client_cert_chain = vector();
}

event ssl_established(c: connection) &priority=200
{
        schedule 5secs { clear_ssl(c) } ;
}
