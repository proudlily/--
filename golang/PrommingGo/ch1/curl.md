curl(1)                                    Curl Manual                                    curl(1)



[1mNAME[0m
       curl - transfer a URL

[1mSYNOPSIS[0m
       [1mcurl [options] [4m[22m[URL...][0m

[1mDESCRIPTION[0m
       [1mcurl  [22mis a tool to transfer data from or to a server, using one of the supported protocols
       (DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S,  RTMP,
       RTSP, SCP, SFTP, SMB, SMBS, SMTP, SMTPS, TELNET and TFTP). The command is designed to work
       without user interaction.

       curl offers a busload of useful  tricks  like  proxy  support,  user  authentication,  FTP
       upload,  HTTP post, SSL connections, cookies, file transfer resume, Metalink, and more. As
       you will see below, the number of features will make your head spin!

       curl is powered by libcurl for all transfer-related features. See [1mlibcurl[22m(3) for details.

[1mURL[0m
       The URL syntax is protocol-dependent. You'll find a detailed description in RFC 3986.

       You can specify multiple URLs or parts of URLs by writing part sets within braces as in:

         http://site.{one,two,three}.com

       or you can get sequences of alphanumeric series by using [] as in:

         ftp://ftp.numericals.com/file[1-100].txt

         ftp://ftp.numericals.com/file[001-100].txt    (with leading zeros)

         ftp://ftp.letters.com/file[a-z].txt

       Nested sequences are not supported, but you can use several ones next to each other:

         http://any.org/archive[1996-1999]/vol[1-4]/part{a,b,c}.html

       You can specify any amount of URLs on the command line. They will be fetched in a  sequen-
       tial manner in the specified order.

       You can specify a step counter for the ranges to get every Nth number or letter:

         http://www.numericals.com/file[1-100:10].txt

         http://www.letters.com/file[a-z:2].txt

       When  using  [] or {} sequences when invoked from a command line prompt, you probably have
       to put the full URL within double quotes to avoid the shell from interfering with it. This
       also goes for other characters treated special, like for example '&', '?' and '*'.

       Provide  the  IPv6 zone index in the URL with an escaped percentage sign and the interface
       name. Like in

         http://[fe80::3%25eth0]/

       If you specify URL without protocol:// prefix, curl will attempt to  guess  what  protocol
       you  might  want. It will then default to HTTP but try other protocols based on often-used
       host name prefixes. For example, for host names starting with "ftp." curl will assume  you
       want to speak FTP.

       curl will do its best to use what you pass to it as a URL. It is not trying to validate it
       as a syntactically correct URL by any means but is  instead  [1mvery  [22mliberal  with  what  it
       accepts.

       curl  will attempt to re-use connections for multiple file transfers, so that getting many
       files from the same server will not do  multiple  connects  /  handshakes.  This  improves
       speed.  Of course this is only done on files specified on a single command line and cannot
       be used between separate curl invokes.

[1mPROGRESS METER[0m
       curl normally displays a progress meter during operations, indicating the amount of trans-
       ferred data, transfer speeds and estimated time left, etc.

       curl  displays this data to the terminal by default, so if you invoke curl to do an opera-
       tion and it is about to write data to the terminal, it [4mdisables[24m the progress meter as oth-
       erwise it would mess up the output mixing progress meter and response data.

       If  you  want  a  progress  meter  for HTTP POST or PUT requests, you need to redirect the
       response output to a file, using shell redirect (>), -o [file] or similar.

       It is not the same case for FTP upload as that operation does not spit  out  any  response
       data to the terminal.

       If you prefer a progress "bar" instead of the regular meter, [4m-#[24m is your friend.

[1mOPTIONS[0m
       Options start with one or two dashes. Many of the options require an additional value next
       to them.

       The short "single-dash" form of the options, -d for example, may be used with or without a
       space  between  it  and  its  value, although a space is a recommended separator. The long
       "double-dash" form, --data for example, requires a space between it and its value.

       Short version options that don't need any additional values can be used  immediately  next
       to  each  other, like for example you can specify all the options -O, -L and -v at once as
       -OLv.

       In general, all boolean options are enabled with --[1moption  [22mand  yet  again  disabled  with
       --[1mno-[22moption.  That  is,  you use the exact same option name but prefix it with "no-". How-
       ever, in this list we mostly only list and show the --option version of them.  (This  con-
       cept with --no options was added in 7.19.0. Previously most options were toggled on/off on
       repeated use of the same command line option.)

       -#, --progress-bar
              Make curl display progress as a simple progress bar instead of the  standard,  more
              informational, meter.

       -:, --next
              Tells  curl  to  use  a  separate  operation  for  the following URL and associated
              options. This allows you to send several URL requests, each with their own specific
              options,  for  example,  such  as different user names or custom requests for each.
              (Added in 7.36.0)

       -0, --http1.0
              (HTTP) Tells curl to use HTTP version 1.0 instead  of  using  its  internally  pre-
              ferred: HTTP 1.1.

       --http1.1
              (HTTP)  Tells  curl  to use HTTP version 1.1. This is the internal default version.
              (Added in 7.33.0)

       --http2
              (HTTP) Tells curl to issue its requests using HTTP 2. This requires that the under-
              lying libcurl was built to support it. (Added in 7.33.0)

       --no-npn
              Disable  the NPN TLS extension. NPN is enabled by default if libcurl was built with
              an SSL library that supports NPN. NPN is used by a libcurl that supports HTTP 2  to
              negotiate HTTP 2 support with the server during https sessions.

              (Added in 7.36.0)

       --no-alpn
              Disable  the  ALPN  TLS  extension. ALPN is enabled by default if libcurl was built
              with an SSL library that supports ALPN. ALPN is used by  a  libcurl  that  supports
              HTTP 2 to negotiate HTTP 2 support with the server during https sessions.

              (Added in 7.36.0)

       -1, --tlsv1
              (SSL) Forces curl to use TLS version 1.x when negotiating with a remote TLS server.
              You can use options [4m--tlsv1.0[24m, [4m--tlsv1.1[24m, and [4m--tlsv1.2[24m to control the TLS  version
              more precisely (if the SSL backend in use supports such a level of control).

       -2, --sslv2
              (SSL)  Forces  curl to use SSL version 2 when negotiating with a remote SSL server.
              Sometimes curl is built without SSLv2 support. SSLv2 is widely considered insecure.

       -3, --sslv3
              (SSL) Forces curl to use SSL version 3 when negotiating with a remote  SSL  server.
              Sometimes curl is built without SSLv3 support.

       -4, --ipv4
              This option tells curl to resolve names to IPv4 addresses only, and not for example
              try IPv6.

       -6, --ipv6
              This option tells curl to resolve names to IPv6 addresses only, and not for example
              try IPv4.

       -a, --append
              (FTP/SFTP)  When  used  in  an  upload,  this  makes curl append to the target file
              instead of overwriting it. If the remote file doesn't exist, it  will  be  created.
              Note that this flag is ignored by some SFTP servers (including OpenSSH).

       -A, --user-agent <agent string>
              (HTTP)  Specify  the  User-Agent string to send to the HTTP server. Some badly done
              CGIs fail if this field isn't set to "Mozilla/4.0". To encode blanks in the string,
              surround  the  string  with  single  quote marks. This can also be set with the [4m-H,[0m
              [4m--header[24m option of course.

              If this option is used several times, the last one will be used.

       --anyauth
              (HTTP) Tells curl to figure out authentication method by itself, and use  the  most
              secure one the remote site claims to support. This is done by first doing a request
              and checking the response-headers, thus possibly inducing an extra  network  round-
              trip.  This  is used instead of setting a specific authentication method, which you
              can do with [4m--basic[24m, [4m--digest[24m, [4m--ntlm[24m, and [4m--negotiate[24m.

              Note that using --anyauth is not recommended if you do uploads from stdin, since it
              may  require  data  to be sent twice and then the client must be able to rewind. If
              the need should arise when uploading from stdin, the upload operation will fail.

       -b, --cookie <name=data>
              (HTTP) Pass the data to the HTTP server as a cookie. It is supposedly the data pre-
              viously  received  from  the server in a "Set-Cookie:" line.  The data should be in
              the format "NAME1=VALUE1; NAME2=VALUE2".

              If no '=' symbol is used in the line, it is treated as a filename to  use  to  read
              previously  stored  cookie lines from, which should be used in this session if they
              match. Using this method also activates the "cookie parser" which  will  make  curl
              record incoming cookies too, which may be handy if you're using this in combination
              with the [4m-L,[24m [4m--location[24m option. The file format of the file to  read  cookies  from
              should be plain HTTP headers or the Netscape/Mozilla cookie file format.

              The  file  specified  with  [4m-b,[24m  [4m--cookie[24m is only used as input. No cookies will be
              written to the file. To store cookies, use the [4m-c,[24m [4m--cookie-jar[24m option.

              If this option is used several times, the last one will be used.

       -B, --use-ascii
              (FTP/LDAP) Enable ASCII transfer. For FTP, this can also be enforced  by  using  an
              URL  that ends with ";type=A". This option causes data sent to stdout to be in text
              mode for win32 systems.

       --basic
              (HTTP) Tells curl to use HTTP Basic authentication with the remote  host.  This  is
              the  default  and this option is usually pointless, unless you use it to override a
              previously set option that sets a different authentication method (such as  [4m--ntlm[24m,
              [4m--digest[24m, or [4m--negotiate[24m).

              Used together with [4m-u,[24m [4m--user[24m and [4m-x,[24m [4m--proxy[24m.

              See also [4m--proxy-basic[24m.

       -c, --cookie-jar <file name>
              (HTTP)  Specify  to which file you want curl to write all cookies after a completed
              operation. Curl writes all cookies previously read from a specified file as well as
              all  cookies  received from remote server(s). If no cookies are known, no data will
              be written. The file will be written using the Netscape cookie file format. If  you
              set the file name to a single dash, "-", the cookies will be written to stdout.

              This command line option will activate the cookie engine that makes curl record and
              use cookies. Another way to activate it is to use the [4m-b,[24m [4m--cookie[24m option.

              If the cookie jar can't be created or written to, the whole  curl  operation  won't
              fail  or  even  report an error clearly. Using -v will get a warning displayed, but
              that is the only visible feedback you get about this possibly lethal situation.

              If this option is used several times, the last specified file name will be used.

       -C, --continue-at <offset>
              Continue/Resume a previous file transfer at the given offset. The given  offset  is
              the  exact number of bytes that will be skipped, counting from the beginning of the
              source file before it is transferred to the destination.  If used with uploads, the
              FTP server command SIZE will not be used by curl.

              Use "-C -" to tell curl to automatically find out where/how to resume the transfer.
              It then uses the given output/input files to figure that out.

              If this option is used several times, the last one will be used.

       --ciphers <list of ciphers>
              (SSL) Specifies which ciphers to use in the connection. The list  of  ciphers  must
              specify   valid  ciphers.  Read  up  on  SSL  cipher  list  details  on  this  URL:
              [4mhttp://www.openssl.org/docs/apps/ciphers.html[0m

              NSS ciphers are done differently than OpenSSL and GnuTLS.  The  full  list  of  NSS
              ciphers   is   in   the   NSSCipherSuite  entry  at  this  URL:  [4mhttp://git.fedora-[0m
              [4mhosted.org/cgit/mod_nss.git/plain/docs/mod_nss.html#Directives[0m

              If this option is used several times, the last one will be used.

       --compressed
              (HTTP) Request a compressed response using one of the algorithms curl supports, and
              save  the  uncompressed  document.   If this option is used and the server sends an
              unsupported encoding, curl will report an error.

       --connect-timeout <seconds>
              Maximum time in seconds that you allow curl's connection to take.  This only limits
              the  connection phase, so if curl connects within the given period it will continue
              - if not it will exit.  Since version 7.32.0, this option accepts decimal values.

              See also the [4m-m,[24m [4m--max-time[24m option.

              If this option is used several times, the last one will be used.

       --create-dirs
              When used in conjunction with the [4m-o[24m option, curl will create the  necessary  local
              directory  hierarchy  as needed. This option creates the dirs mentioned with the [4m-o[0m
              option, nothing else. If the [4m-o[24m file name uses no dir or if the  dirs  it  mentions
              already exist, no dir will be created.

              To create remote directories when using FTP or SFTP, try [4m--ftp-create-dirs[24m.

       --crlf Convert LF to CRLF in upload. Useful for MVS (OS/390).

              (SMTP added in 7.40.0)

       --crlfile <file>
              (HTTPS/FTPS)  Provide  a  file  using PEM format with a Certificate Revocation List
              that may specify peer certificates that are to be considered revoked.

              If this option is used several times, the last one will be used.

              (Added in 7.19.7)

       -d, --data <data>
              (HTTP) Sends the specified data in a POST request to the HTTP server, in  the  same
              way that a browser does when a user has filled in an HTML form and presses the sub-
              mit button. This will cause curl to pass the data to the server using the  content-
              type application/x-www-form-urlencoded.  Compare to [4m-F,[24m [4m--form[24m.

              [4m-d,[24m  [4m--data[24m  is  the  same  as [4m--data-ascii[24m. To post data purely binary, you should
              instead use the [4m--data-binary[24m option. To URL-encode the value of a form  field  you
              may use [4m--data-urlencode[24m.

              If  any  of these options is used more than once on the same command line, the data
              pieces specified will be merged together with a separating  &-symbol.  Thus,  using
              '-d  name=daniel  -d  skill=lousy'  would  generate  a  post  chunk that looks like
              'name=daniel&skill=lousy'.

              If you start the data with the letter @, the rest should be a file name to read the
              data  from,  or  - if you want curl to read the data from stdin. Multiple files can
              also be specified. Posting data from a file named 'foobar' would thus be done  with
              [4m--data[24m @foobar. When --data is told to read from a file like that, carriage returns
              and newlines will be stripped out.

       -D, --dump-header <file>
              Write the protocol headers to the specified file.

              This option is handy to use when you want to store the headers that  an  HTTP  site
              sends  to you. Cookies from the headers could then be read in a second curl invoca-
              tion by using the [4m-b,[24m [4m--cookie[24m option! The [4m-c,[24m [4m--cookie-jar[24m option is a better  way
              to store cookies.

              When  used in FTP, the FTP server response lines are considered being "headers" and
              thus are saved there.

              If this option is used several times, the last one will be used.

       --data-ascii <data>
              See [4m-d,[24m [4m--data[24m.

       --data-binary <data>
              (HTTP) This posts data exactly as specified with no extra processing whatsoever.

              If you start the data with the letter @, the rest should be a  filename.   Data  is
              posted  in a similar manner as [4m--data-ascii[24m does, except that newlines and carriage
              returns are preserved and conversions are never done.

              If this option is used several times, the ones following the first will append data
              as described in [4m-d,[24m [4m--data[24m.

       --data-urlencode <data>
              (HTTP) This posts data, similar to the other --data options with the exception that
              this performs URL-encoding. (Added in 7.18.0)

              To be CGI-compliant, the <data> part should begin with a [4mname[24m followed by a separa-
              tor and a content specification. The <data> part can be passed to curl using one of
              the following syntaxes:

              content
                     This will make curl URL-encode the content and pass that on. Just be careful
                     so  that  the  content doesn't contain any = or @ symbols, as that will then
                     make the syntax match one of the other cases below!

              =content
                     This will make curl URL-encode the content and pass that on. The preceding =
                     symbol is not included in the data.

              name=content
                     This  will make curl URL-encode the content part and pass that on. Note that
                     the name part is expected to be URL-encoded already.

              @filename
                     This will make curl load data from the given file (including any  newlines),
                     URL-encode that data and pass it on in the POST.

              name@filename
                     This  will make curl load data from the given file (including any newlines),
                     URL-encode that data and pass it on in the POST. The name part gets an equal
                     sign appended, resulting in [4mname=urlencoded-file-content[24m. Note that the name
                     is expected to be URL-encoded already.

       --delegation LEVEL
              Set [4mLEVEL[24m to tell the server what it is allowed to delegate when it comes  to  user
              credentials. Used with GSS/kerberos.

              none   Don't allow any delegation.

              policy Delegates if and only if the OK-AS-DELEGATE flag is set in the Kerberos ser-
                     vice ticket, which is a matter of realm policy.

              always Unconditionally allow the server to delegate.

       --digest
              (HTTP) Enables HTTP Digest authentication. This is an  authentication  scheme  that
              prevents the password from being sent over the wire in clear text. Use this in com-
              bination with the normal [4m-u,[24m [4m--user[24m option to set user name and password. See  also
              [4m--ntlm[24m, [4m--negotiate[24m and [4m--anyauth[24m for related options.

              If this option is used several times, only the first one is used.

       --disable-eprt
              (FTP)  Tell curl to disable the use of the EPRT and LPRT commands when doing active
              FTP transfers. Curl will normally always first  attempt  to  use  EPRT,  then  LPRT
              before using PORT, but with this option, it will use PORT right away. EPRT and LPRT
              are extensions to the original FTP protocol, and may not work on all  servers,  but
              they enable more functionality in a better way than the traditional PORT command.

              [1m--eprt  [22mcan  be  used to explicitly enable EPRT again and [1m--no-eprt [22mis an alias for
              [1m--disable-eprt[22m.

              Disabling EPRT only changes the active behavior. If you want to switch  to  passive
              mode you need to not use [4m-P,[24m [4m--ftp-port[24m or force it with [4m--ftp-pasv[24m.

       --disable-epsv
              (FTP)  Tell  curl  to  disable  the  use of the EPSV command when doing passive FTP
              transfers. Curl will normally always first attempt to use  EPSV  before  PASV,  but
              with this option, it will not try using EPSV.

              [1m--epsv  [22mcan  be  used to explicitly enable EPSV again and [1m--no-epsv [22mis an alias for
              [1m--disable-epsv[22m.

              Disabling EPSV only changes the passive behavior. If you want to switch  to  active
              mode you need to use [4m-P,[24m [4m--ftp-port[24m.

       --dns-interface <interface>
              Tell curl to send outgoing DNS requests through <interface>. This option is a coun-
              terpart to [4m--interface[24m (which does not affect DNS). The supplied string must be  an
              interface name (not an address).

              This  option  requires that libcurl was built with a resolver backend that supports
              this operation. The c-ares backend is the only such one. (Added in 7.33.0)

       --dns-ipv4-addr <ip-address>
              Tell curl to bind to <ip-address> when making IPv4 DNS requests, so  that  the  DNS
              requests originate from this address. The argument should be a single IPv4 address.

              This  option  requires that libcurl was built with a resolver backend that supports
              this operation. The c-ares backend is the only such one.  (Added in 7.33.0)

       --dns-ipv6-addr <ip-address>
              Tell curl to bind to <ip-address> when making IPv6 DNS requests, so  that  the  DNS
              requests originate from this address. The argument should be a single IPv6 address.

              This  option  requires that libcurl was built with a resolver backend that supports
              this operation. The c-ares backend is the only such one.  (Added in 7.33.0)

       --dns-servers <ip-address,ip-address>
              Set the list of DNS servers to be used instead of the system default.  The list  of
              IP  addresses  should be separated with commas. Port numbers may also optionally be
              given as [4m:<port-number>[24m after each IP address.

              This option requires that libcurl was built with a resolver backend  that  supports
              this operation. The c-ares backend is the only such one.  (Added in 7.33.0)

       -e, --referer <URL>
              (HTTP)  Sends  the "Referrer Page" information to the HTTP server. This can also be
              set with the [4m-H,[24m [4m--header[24m flag of course.  When used with [4m-L,[24m  [4m--location[24m  you  can
              append ";auto" to the --referer URL to make curl automatically set the previous URL
              when it follows a Location: header. The ";auto" string can be used alone,  even  if
              you don't set an initial --referer.

              If this option is used several times, the last one will be used.

       -E, --cert <certificate[:password]>
              (SSL)  Tells  curl to use the specified client certificate file when getting a file
              with HTTPS, FTPS or another SSL-based protocol. The certificate must be in  PKCS#12
              format  if using Secure Transport, or PEM format if using any other engine.  If the
              optional password isn't specified, it will be queried for  on  the  terminal.  Note
              that  this option assumes a "certificate" file that is the private key and the pri-
              vate certificate concatenated! See [4m--cert[24m and [4m--key[24m to specify them independently.

              If curl is built against the NSS SSL library then this option  can  tell  curl  the
              nickname  of the certificate to use within the NSS database defined by the environ-
              ment variable SSL_DIR (or by default /etc/pki/nssdb). If the NSS PEM PKCS#11 module
              (libnsspem.so) is available then PEM files may be loaded. If you want to use a file
              from the current directory, please precede it with "./" prefix, in order  to  avoid
              confusion  with  a nickname.  If the nickname contains ":", it needs to be preceded
              by "\" so that it is not recognized as password delimiter.  If  the  nickname  con-
              tains "\", it needs to be escaped as "\\" so that it is not recognized as an escape
              character.

              (iOS and Mac OS X only) If curl is built against Secure Transport,  then  the  cer-
              tificate  string  can either be the name of a certificate/private key in the system
              or user keychain, or the path to a PKCS#12-encoded certificate and private key.  If
              you want to use a file from the current directory, please precede it with "./" pre-
              fix, in order to avoid confusion with a nickname.

              If this option is used several times, the last one will be used.

       --engine <name>
              Select the OpenSSL crypto engine to use for cipher operations. Use [4m--engine[24m [4mlist[24m to
              print  a  list  of build-time supported engines. Note that not all (or none) of the
              engines may be available at run-time.

       --environment
              (RISC OS ONLY) Sets a range of environment variables, using the names the [4m-w[24m option
              supports, to allow easier extraction of useful information after having run curl.

       --egd-file <file>
              (SSL)  Specify  the path name to the Entropy Gathering Daemon socket. The socket is
              used to seed the random engine for SSL  connections.  See  also  the  [4m--random-file[0m
              option.

       --cert-type <type>
              (SSL) Tells curl what certificate type the provided certificate is in. PEM, DER and
              ENG are recognized types.  If not specified, PEM is assumed.

              If this option is used several times, the last one will be used.

       --cacert <CA certificate>
              (SSL) Tells curl to use the specified certificate file to verify the peer. The file
              may  contain  multiple  CA  certificates. The certificate(s) must be in PEM format.
              Normally curl is built to use a default file for this, so this option is  typically
              used to alter that default file.

              curl  recognizes  the environment variable named 'CURL_CA_BUNDLE' if it is set, and
              uses the given path as a path to a CA cert bundle. This option overrides that vari-
              able.

              The  windows  version  of  curl  will  automatically look for a CA certs file named
              ´curl-ca-bundle.crt´, either in the same directory as curl.exe, or in  the  Current
              Working Directory, or in any folder along your PATH.

              If  curl  is  built  against  the NSS SSL library, the NSS PEM PKCS#11 module (lib-
              nsspem.so) needs to be available for this option to work properly.

              If this option is used several times, the last one will be used.

       --capath <CA certificate directory>
              (SSL) Tells curl to use the specified certificate directory  to  verify  the  peer.
              Multiple   paths   can   be   provided   by   separating   them   with   ":"  (e.g.
              "path1:path2:path3"). The certificates must be in PEM format, and if curl is  built
              against  OpenSSL, the directory must have been processed using the c_rehash utility
              supplied with OpenSSL. Using [4m--capath[24m can allow OpenSSL-powered curl to  make  SSL-
              connections much more efficiently than using [4m--cacert[24m if the [4m--cacert[24m file contains
              many CA certificates.

              If this option is set, the default capath value will be ignored, and if it is  used
              several times, the last one will be used.

       --pinnedpubkey <pinned public key>
              (SSL)  Tells curl to use the specified public key file to verify the peer. The file
              must contain a single public key in PEM or DER format.

              When negotiating a TLS or SSL connection, the server sends a certificate indicating
              its  identity.  A  public key is extracted from this certificate and if it does not
              exactly match the public key provided to this option, curl will abort  the  connec-
              tion before sending or receiving any data.

              This is currently only implemented in the OpenSSL, GnuTLS and GSKit backends.

              If this option is used several times, the last one will be used.  (Added in 7.39.0)

       --cert-status
              (SSL)  Tells  curl to verify the status of the server certificate by using the Cer-
              tificate Status Request (aka. OCSP stapling) TLS extension.

              If this option is enabled and the server sends an invalid (e.g. expired)  response,
              if  the  response  suggests  that  the  server  certificate has been revoked, or no
              response at all is received, the verification fails.

              This is currently only implemented in the OpenSSL, GnuTLS and NSS backends.  (Added
              in 7.41.0)

       --false-start

              (SSL) Tells curl to use false start during the TLS handshake. False start is a mode
              where a TLS client  will  start  sending  application  data  before  verifying  the
              server's  Finished  message,  thus saving a round trip when performing a full hand-
              shake.

              This is currently only implemented in the NSS and Secure Transport (on iOS  7.0  or
              later, or OS X 10.9 or later) backends.  (Added in 7.42.0)

       -f, --fail
              (HTTP)  Fail  silently  (no output at all) on server errors. This is mostly done to
              better enable scripts etc to better deal with failed attempts. In normal cases when
              an  HTTP server fails to deliver a document, it returns an HTML document stating so
              (which often also describes why and more). This flag will prevent  curl  from  out-
              putting that and return error 22.

              This  method is not fail-safe and there are occasions where non-successful response
              codes will slip through, especially when authentication is involved (response codes
              401 and 407).

       -F, --form <name=content>
              (HTTP) This lets curl emulate a filled-in form in which a user has pressed the sub-
              mit button. This causes curl to POST data using  the  Content-Type  multipart/form-
              data  according  to  RFC 2388. This enables uploading of binary files etc. To force
              the 'content' part to be a file, prefix the file name with an @ sign. To  just  get
              the  content  part from a file, prefix the file name with the symbol <. The differ-
              ence between @ and < is then that @ makes a file get attached in the post as a file
              upload,  while  the  <  makes  a text field and just get the contents for that text
              field from a file.

              Example, to send your password file to the server, where 'password' is the name  of
              the form-field to which /etc/passwd will be the input:

              [1mcurl [22m-F password=@/etc/passwd www.mypasswords.com

              To  read content from stdin instead of a file, use - as the filename. This goes for
              both @ and < constructs.

              You can also tell curl what Content-Type to use by using 'type=', in a manner simi-
              lar to:

              [1mcurl [22m-F "web=@index.html;type=text/html" url.com

              or

              [1mcurl [22m-F "name=daniel;type=text/foo" url.com

              You  can  also  explicitly  change  the name field of a file upload part by setting
              filename=, like this:

              [1mcurl [22m-F "file=@localfile;filename=nameinpost" url.com

              If filename/path contains ',' or ';', it must be quoted by double-quotes like:

              [1mcurl [22m-F "file=@\"localfile\";filename=\"nameinpost\"" url.com

              or

              [1mcurl [22m-F 'file=@"localfile";filename="nameinpost"' url.com

              Note that if a filename/path is quoted by double-quotes, any double-quote or  back-
              slash within the filename must be escaped by backslash.

              See further examples and details in the MANUAL.

              This option can be used multiple times.

       --ftp-account [data]
              (FTP)  When  an FTP server asks for "account data" after user name and password has
              been provided, this data is sent off using the ACCT command. (Added in 7.13.0)

              If this option is used several times, the last one will be used.

       --ftp-alternative-to-user <command>
              (FTP) If authenticating with the USER and PASS commands fails, send  this  command.
              When  connecting  to  Tumbleweed's Secure Transport server over FTPS using a client
              certificate, using "SITE AUTH" will tell the server to retrieve the  username  from
              the certificate. (Added in 7.15.5)

       --ftp-create-dirs
              (FTP/SFTP)  When  an  FTP  or SFTP URL/operation uses a path that doesn't currently
              exist on the server, the standard behavior of curl is to fail. Using  this  option,
              curl will instead attempt to create missing directories.

       --ftp-method [method]
              (FTP)  Control what method curl should use to reach a file on an FTP(S) server. The
              method argument should be one of the following alternatives:

              multicwd
                     curl does a single CWD operation for each path part in the  given  URL.  For
                     deep hierarchies this means very many commands. This is how RFC 1738 says it
                     should be done. This is the default but the slowest behavior.

              nocwd  curl does no CWD at all. curl will do SIZE, RETR, STOR etc and give  a  full
                     path to the server for all these commands. This is the fastest behavior.

              singlecwd
                     curl  does  one  CWD with the full target directory and then operates on the
                     file "normally" (like in the multicwd case). This is somewhat more standards
                     compliant than 'nocwd' but without the full penalty of 'multicwd'.
       (Added in 7.15.1)

       --ftp-pasv
              (FTP)  Use  passive  mode  for the data connection. Passive is the internal default
              behavior, but using this option can be used to  override  a  previous  [4m-P/-ftp-port[0m
              option. (Added in 7.11.0)

              If  this  option  is  used  several  times,  only the first one is used. Undoing an
              enforced passive really isn't doable but you must then instead enforce the  correct
              [4m-P,[24m [4m--ftp-port[24m again.

              Passive  mode means that curl will try the EPSV command first and then PASV, unless
              [4m--disable-epsv[24m is used.

       --ftp-skip-pasv-ip
              (FTP) Tell curl to not use the IP address the server suggests in  its  response  to
              curl's  PASV  command when curl connects the data connection. Instead curl will re-
              use the same IP address it already uses  for  the  control  connection.  (Added  in
              7.14.2)

              This option has no effect if PORT, EPRT or EPSV is used instead of PASV.

       --ftp-pret
              (FTP) Tell curl to send a PRET command before PASV (and EPSV). Certain FTP servers,
              mainly drftpd, require this non-standard command for directory listings as well  as
              up and downloads in PASV mode.  (Added in 7.20.x)

       --ftp-ssl-ccc
              (FTP)  Use CCC (Clear Command Channel) Shuts down the SSL/TLS layer after authenti-
              cating. The rest of the control channel communication  will  be  unencrypted.  This
              allows  NAT routers to follow the FTP transaction. The default mode is passive. See
              [4m--ftp-ssl-ccc-mode[24m for other modes.  (Added in 7.16.1)

       --ftp-ssl-ccc-mode [active/passive]
              (FTP) Use CCC (Clear Command Channel) Sets the CCC mode. The passive mode will  not
              initiate the shutdown, but instead wait for the server to do it, and will not reply
              to the shutdown from the server. The active mode initiates the shutdown  and  waits
              for a reply from the server.  (Added in 7.16.2)

       --ftp-ssl-control
              (FTP) Require SSL/TLS for the FTP login, clear for transfer.  Allows secure authen-
              tication, but non-encrypted data transfers for efficiency.  Fails the  transfer  if
              the  server  doesn't support SSL/TLS.  (Added in 7.16.0) that can still be used but
              will be removed in a future version.

       --form-string <name=string>
              (HTTP) Similar to [4m--form[24m except that the value string for the  named  parameter  is
              used  literally.  Leading  '@'  and  '<' characters, and the ';type=' string in the
              value have no special meaning. Use this in preference to [4m--form[24m if there's any pos-
              sibility  that the string value may accidentally trigger the '@' or '<' features of
              [4m--form[24m.

       -g, --globoff
              This option switches off the "URL globbing parser". When you set this  option,  you
              can  specify  URLs  that  contain the letters {}[] without having them being inter-
              preted by curl itself. Note that these letters are not normal  legal  URL  contents
              but they should be encoded according to the URI standard.

       -G, --get
              When  used, this option will make all data specified with [4m-d,[24m [4m--data[24m, [4m--data-binary[0m
              or [4m--data-urlencode[24m to be used in an HTTP GET request instead of the  POST  request
              that otherwise would be used. The data will be appended to the URL with a '?' sepa-
              rator.

              If used in combination with -I, the POST data will instead be appended to  the  URL
              with a HEAD request.

              If  this  option is used several times, only the first one is used. This is because
              undoing a GET doesn't make sense, but you should then instead enforce the  alterna-
              tive method you prefer.

       -H, --header <header>
              (HTTP)  Extra  header  to include in the request when sending HTTP to a server. You
              may specify any number of extra headers. Note that  if  you  should  add  a  custom
              header  that  has  the  same  name as one of the internal ones curl would use, your
              externally set header will be used instead of the internal one. This allows you  to
              make even trickier stuff than curl would normally do. You should not replace inter-
              nally set headers without knowing perfectly  well  what  you're  doing.  Remove  an
              internal  header  by  giving a replacement without content on the right side of the
              colon, as in: -H "Host:". If you send the custom  header  with  no-value  then  its
              header  must  be terminated with a semicolon, such as -H "X-Custom-Header;" to send
              "X-Custom-Header:".

              curl will make sure that each header you add/replace is sent with the  proper  end-
              of-line  marker,  you  should thus [1mnot [22madd that as a part of the header content: do
              not add newlines or carriage returns, they will only mess things up for you.

              See also the [4m-A,[24m [4m--user-agent[24m and [4m-e,[24m [4m--referer[24m options.

              Starting in 7.37.0, you need [4m--proxy-header[24m to send custom headers intended  for  a
              proxy.

              Example:

              # curl -H "X-First-Name: Joe" http://192.168.0.1/

              [1mWARNING[22m:  headers  set  with  this  option will be set in all requests - even after
              redirects are followed, like when told with [1m-L, --location[22m. This can  lead  to  the
              header  being  sent  to  other  hosts  than the original host, so sensitive headers
              should be used with caution combined with following redirects.

              This option can be used multiple times to add/replace/remove multiple headers.

       --hostpubmd5 <md5>
              (SCP/SFTP) Pass a string containing 32 hexadecimal digits. The string should be the
              128  bit MD5 checksum of the remote host's public key, curl will refuse the connec-
              tion with the host unless the md5sums match. (Added in 7.17.1)

       --ignore-content-length
              (HTTP) Ignore the Content-Length header. This is particularly  useful  for  servers
              running  Apache  1.x,  which  will report incorrect Content-Length for files larger
              than 2 gigabytes.

       -i, --include
              (HTTP) Include the HTTP-header in the output. The HTTP-header includes things  like
              server-name, date of the document, HTTP-version and more...

       -I, --head
              (HTTP/FTP/FILE)  Fetch  the HTTP-header only! HTTP-servers feature the command HEAD
              which this uses to get nothing but the header of a document. When used on an FTP or
              FILE file, curl displays the file size and last modification time only.

       --interface <name>
              Perform  an operation using a specified interface. You can enter interface name, IP
              address or host name. An example could look like:

               curl --interface eth0:1 http://www.netscape.com/

              If this option is used several times, the last one will be used.

       -j, --junk-session-cookies
              (HTTP) When curl is told to read cookies from a given file, this option  will  make
              it  discard all "session cookies". This will basically have the same effect as if a
              new session is started.  Typical  browsers  always  discard  session  cookies  when
              they're closed down.

       -J, --remote-header-name
              (HTTP)  This  option tells the [4m-O,[24m [4m--remote-name[24m option to use the server-specified
              Content-Disposition filename instead of extracting a filename from the URL.

              There's no attempt to decode %-sequences (yet) in the provided file name,  so  this
              option may provide you with rather unexpected file names.

       -k, --insecure
              (SSL)  This option explicitly allows curl to perform "insecure" SSL connections and
              transfers. All SSL connections are attempted to be made secure by using the CA cer-
              tificate  bundle installed by default. This makes all connections considered "inse-
              cure" fail unless [4m-k,[24m [4m--insecure[24m is used.

              See       this       online       resource       for        further        details:
              [1mhttp://curl.haxx.se/docs/sslcerts.html[0m

       -K, --config <config file>
              Specify  which  config  file to read curl arguments from. The config file is a text
              file in which command line arguments can be written which then will be used  as  if
              they were written on the actual command line.

              Options  and their parameters must be specified on the same config file line, sepa-
              rated by whitespace, colon, or the equals sign. Long option names can optionally be
              given  in the config file without the initial double dashes and if so, the colon or
              equals characters can be used as separators. If the option is specified with one or
              two  dashes,  there  can be no colon or equals character between the option and its
              parameter.

              If the parameter is to contain whitespace, the parameter must  be  enclosed  within
              quotes. Within double quotes, the following escape sequences are available: \\, \",
              \t, \n, \r and \v. A backslash preceding any other letter is ignored. If the  first
              column of a config line is a '#' character, the rest of the line will be treated as
              a comment. Only write one option per physical line in the config file.

              Specify the filename to -K, --config as '-' to make curl read the file from stdin.

              Note that to be able to specify a URL in the config file, you need  to  specify  it
              using  the  [4m--url[24m option, and not by simply writing the URL on its own line. So, it
              could look similar to this:

              url = "http://curl.haxx.se/docs/"

              When curl is invoked, it always (unless [4m-q[24m is used) checks  for  a  default  config
              file  and uses it if found. The default config file is checked for in the following
              places in this order:

              1) curl tries to find the "home dir": It first checks for the  CURL_HOME  and  then
              the  HOME environment variables. Failing that, it uses getpwuid() on Unix-like sys-
              tems (which returns the home dir given the current user in your  system).  On  Win-
              dows,  it  then checks for the APPDATA variable, or as a last resort the '%USERPRO-
              FILE%\Application Data'.

              2) On windows, if there is no _curlrc file in the home dir, it checks  for  one  in
              the  same  dir  the curl executable is placed. On Unix-like systems, it will simply
              try to load .curlrc from the determined home dir.

              # --- Example file ---
              # this is a comment
              url = "curl.haxx.se"
              output = "curlhere.html"
              user-agent = "superagent/1.0"

              # and fetch another URL too
              url = "curl.haxx.se/docs/manpage.html"
              -O
              referer = "http://nowhereatall.com/"
              # --- End of example file ---

              This option can be used multiple times to load multiple config files.

       --keepalive-time <seconds>
              This option sets the  time  a  connection  needs  to  remain  idle  before  sending
              keepalive  probes and the time between individual keepalive probes. It is currently
              effective on operating systems offering the TCP_KEEPIDLE and  TCP_KEEPINTVL  socket
              options  (meaning  Linux, recent AIX, HP-UX and more). This option has no effect if
              [4m--no-keepalive[24m is used. (Added in 7.18.0)

              If this option is used several times, the last one will be  used.  If  unspecified,
              the option defaults to 60 seconds.

       --key <key>
              (SSL/SSH)  Private  key  file  name. Allows you to provide your private key in this
              separate file. For SSH, if not specified, curl tries the  following  candidates  in
              order: '~/.ssh/id_rsa', '~/.ssh/id_dsa', './id_rsa', './id_dsa'.

              If this option is used several times, the last one will be used.

       --key-type <type>
              (SSL) Private key file type. Specify which type your [4m--key[24m provided private key is.
              DER, PEM, and ENG are supported. If not specified, PEM is assumed.

              If this option is used several times, the last one will be used.

       --krb <level>
              (FTP) Enable Kerberos authentication and use. The level must be entered and  should
              be  one  of  'clear',  'safe', 'confidential', or 'private'. Should you use a level
              that is not one of these, 'private' will instead be used.

              This option requires a library built with kerberos4 support. This is not very  com-
              mon. Use [4m-V,[24m [4m--version[24m to see if your curl supports it.

              If this option is used several times, the last one will be used.

       -l, --list-only
              (FTP)  When  listing an FTP directory, this switch forces a name-only view. This is
              especially useful if the user wants to machine-parse the contents of an FTP  direc-
              tory  since  the  normal directory view doesn't use a standard look or format. When
              used like this, the option causes a NLST command to be sent to the  server  instead
              of LIST.

              Note:  Some  FTP  servers  list  only  files in their response to NLST; they do not
              include sub-directories and symbolic links.

              (POP3) When retrieving a specific email from POP3, this switch forces a  LIST  com-
              mand to be performed instead of RETR. This is particularly useful if the user wants
              to see if a specific message id exists on the server and what size it is.

              Note: When combined with [4m-X,[24m [4m--request[24m [4m<command>[24m, this option can be used  to  send
              an  UIDL  command instead, so the user may use the email's unique identifier rather
              than it's message id to make the request. (Added in 7.21.5)

       -L, --location
              (HTTP/HTTPS) If the server reports that the requested page has moved to a different
              location  (indicated  with a Location: header and a 3XX response code), this option
              will make curl redo the request on  the  new  place.  If  used  together  with  [4m-i,[0m
              [4m--include[24m  or  [4m-I,[24m  [4m--head[24m,  headers  from  all requested pages will be shown. When
              authentication is used, curl only sends its credentials to the initial host.  If  a
              redirect  takes  curl  to  a  different  host,  it  won't  be able to intercept the
              user+password. See also [4m--location-trusted[24m on how to change this. You can limit the
              amount of redirects to follow by using the [4m--max-redirs[24m option.

              When  curl  follows a redirect and the request is not a plain GET (for example POST
              or PUT), it will do the following request with a GET if the HTTP response was  301,
              302,  or  303.  If  the response code was any other 3xx code, curl will re-send the
              following request using the same unmodified method.

              You can tell curl to not change the non-GET request  method  to  GET  after  a  30x
              response  by  using  the  dedicated  options  for  that:  [4m--post301[24m,  [4m--post302[24m and
              [4m-post303[24m.

       --libcurl <file>
              Append this option to any ordinary curl command line, and you will get  a  libcurl-
              using  C source code written to the file that does the equivalent of what your com-
              mand-line operation does!

              If this option is used several times, the last given file name will be used. (Added
              in 7.16.1)

       --limit-rate <speed>
              Specify  the  maximum  transfer  rate you want curl to use - for both downloads and
              uploads. This feature is useful if you have a limited  pipe  and  you'd  like  your
              transfer  not  to  use  your  entire bandwidth. To make it slower than it otherwise
              would be.

              The given speed is measured in bytes/second, unless a suffix is appended.   Append-
              ing  'k'  or  'K' will count the number as kilobytes, 'm' or M' makes it megabytes,
              while 'g' or 'G' makes it gigabytes. Examples: 200K, 3m and 1G.

              The given rate is the average speed counted during the entire  transfer.  It  means
              that  curl  might use higher transfer speeds in short bursts, but over time it uses
              no more than the given rate.

              If you also use the [4m-Y,[24m [4m--speed-limit[24m option, that option will take precedence  and
              might  cripple  the  rate-limiting  slightly, to help keeping the speed-limit logic
              working.

              If this option is used several times, the last one will be used.

       --local-port <num>[-num]
              Set a preferred number or range of local port numbers to use for the connection(s).
              Note  that  port numbers by nature are a scarce resource that will be busy at times
              so setting this range to something too narrow might  cause  unnecessary  connection
              setup failures. (Added in 7.15.2)

       --location-trusted
              (HTTP/HTTPS) Like [4m-L,[24m [4m--location[24m, but will allow sending the name + password to all
              hosts that the site may redirect to. This may  or  may  not  introduce  a  security
              breach if the site redirects you to a site to which you'll send your authentication
              info (which is plaintext in the case of HTTP Basic authentication).

       -m, --max-time <seconds>
              Maximum time in seconds that you allow the whole operation to take.  This is useful
              for preventing your batch jobs from hanging for hours due to slow networks or links
              going down.  Since 7.32.0, this option accepts decimal values, but the actual time-
              out  will decrease in accuracy as the specified timeout increases in decimal preci-
              sion.  See also the [4m--connect-timeout[24m option.

              If this option is used several times, the last one will be used.

       --login-options <options>
              Specify the login options to use during server authentication.

              You can use the login options to specify protocol specific options that may be used
              during  authentication.  At present only IMAP, POP3 and SMTP support login options.
              For more information about the login options please see RFC 2384, RFC 5092 and IETF
              draft draft-earhart-url-smtp-00.txt (Added in 7.34.0).

              If this option is used several times, the last one will be used.

       --mail-auth <address>
              (SMTP)  Specify  a  single address. This will be used to specify the authentication
              address (identity) of a submitted message that is being relayed to another server.

              (Added in 7.25.0)

       --mail-from <address>
              (SMTP) Specify a single address that the given mail should get sent from.

              (Added in 7.20.0)

       --max-filesize <bytes>
              Specify the maximum size (in bytes) of a file to download. If the file requested is
              larger  than this value, the transfer will not start and curl will return with exit
              code 63.

              [1mNOTE: [22mThe file size is not always known prior to download, and for such files  this
              option has no effect even if the file transfer ends up being larger than this given
              limit. This concerns both FTP and HTTP transfers.

       --mail-rcpt <address>
              (SMTP) Specify a single address, user name or mailing list name.

              When performing a mail transfer, the recipient should specify a valid email address
              to send the mail to. (Added in 7.20.0)

              When  performing  an  address  verification (VRFY command), the recipient should be
              specified as the user name or user name and domain (as per Section 3.5 of RFC5321).
              (Added in 7.34.0)

              When performing a mailing list expand (EXPN command), the recipient should be spec-
              ified using the mailing list name, such as "Friends" or "London-Office".  (Added in
              7.34.0)

       --max-redirs <num>
              Set  maximum  number  of redirection-followings allowed. If [4m-L,[24m [4m--location[24m is used,
              this option can be used to prevent curl from following redirections "in  absurdum".
              By  default,  the limit is set to 50 redirections. Set this option to -1 to make it
              limitless.

              If this option is used several times, the last one will be used.

       --metalink
              This option can tell curl to parse and process a given URI as Metalink  file  (both
              version 3 and 4 (RFC 5854) are supported) and make use of the mirrors listed within
              for failover if there are errors (such as the file or server not being  available).
              It will also verify the hash of the file after the download completes. The Metalink
              file itself is downloaded and processed in memory and not stored in the local  file
              system.

              Example to use a remote Metalink file:

              [1mcurl [22m--metalink http://www.example.com/example.metalink

              To use a Metalink file in the local file system, use FILE protocol (file://):

              [1mcurl [22m--metalink file://example.metalink

              Please  note that if FILE protocol is disabled, there is no way to use a local Met-
              alink file at the time of this writing. Also note that if [4m--metalink[24m and  [4m--include[0m
              are  used together, [4m--include[24m will be ignored. This is because including headers in
              the response will break Metalink parser and if the headers are included in the file
              described in Metalink file, hash check will fail.

              (Added in 7.27.0, if built against the libmetalink library.)

       -n, --netrc
              Makes  curl  scan  the [4m.netrc[24m ([4m_netrc[24m on Windows) file in the user's home directory
              for login name and password. This is typically used for FTP on Unix. If  used  with
              HTTP,  curl  will enable user authentication. See [1mnetrc(4) [22mor [1mftp(1) [22mfor details on
              the file format. Curl will not complain if that file doesn't have the right permis-
              sions  (it should not be either world- or group-readable). The environment variable
              "HOME" is used to find the home directory.

              A quick and very simple example of how to setup a [4m.netrc[24m to allow curl  to  FTP  to
              the  machine  host.domain.com  with user name 'myself' and password 'secret' should
              look similar to:

              [1mmachine host.domain.com login myself password secret[0m

       -N, --no-buffer
              Disables the buffering of the output stream. In normal work situations,  curl  will
              use a standard buffered output stream that will have the effect that it will output
              the data in chunks, not necessarily exactly when  the  data  arrives.   Using  this
              option will disable that buffering.

              Note  that this is the negated option name documented. You can thus use [4m--buffer[24m to
              enforce the buffering.

       --netrc-file
              This option is similar to [4m--netrc[24m, except that you provide the  path  (absolute  or
              relative)  to  the netrc file that Curl should use.  You can only specify one netrc
              file per invocation. If several [4m--netrc-file[24m options are provided,  only  the  [1mlast[0m
              [1mone [22mwill be used.  (Added in 7.21.5)

              This  option  overrides any use of [4m--netrc[24m as they are mutually exclusive.  It will
              also abide by [4m--netrc-optional[24m if specified.


       --netrc-optional
              Very similar to [4m--netrc[24m, but this option makes the .netrc usage  [1moptional  [22mand  not
              mandatory as the [4m--netrc[24m option does.


       --negotiate
              (HTTP) Enables Negotiate (SPNEGO) authentication.

              If  you  want  to  enable  Negotiate  (SPNEGO)  for  proxy authentication, then use
              [4m--proxy-negotiate[24m.

              This option requires a library built with GSS-API or SSPI support. Use  [4m-V,[24m  [4m--ver-[0m
              [4msion[24m to see if your curl supports GSS-API/SSPI and SPNEGO.

              When  using this option, you must also provide a fake [4m-u,[24m [4m--user[24m option to activate
              the authentication code properly. Sending a '-u :' is enough as the user  name  and
              password from the [4m-u[24m option aren't actually used.

              If this option is used several times, only the first one is used.

       --no-keepalive
              Disables  the  use  of keepalive messages on the TCP connection, as by default curl
              enables them.

              Note that this is the negated option name documented. You can thus use  [4m--keepalive[0m
              to enforce keepalive.

       --no-sessionid
              (SSL)  Disable  curl's use of SSL session-ID caching.  By default all transfers are
              done using the cache. Note that while nothing should ever get hurt by attempting to
              reuse SSL session-IDs, there seem to be broken SSL implementations in the wild that
              may require you to disable this in order for you to succeed. (Added in 7.16.0)

              Note that this is the negated option name documented. You can thus use  [4m--sessionid[0m
              to enforce session-ID caching.

       --noproxy <no-proxy-list>
              Comma-separated  list  of hosts which do not use a proxy, if one is specified.  The
              only wildcard is a single * character, which matches  all  hosts,  and  effectively
              disables the proxy. Each name in this list is matched as either a domain which con-
              tains the hostname, or the hostname itself.  For  example,  local.com  would  match
              local.com,  local.com:80,  and  www.local.com, but not www.notlocal.com.  (Added in
              7.19.4).

       --ntlm (HTTP) Enables NTLM authentication. The NTLM authentication method was designed  by
              Microsoft  and  is  used by IIS web servers. It is a proprietary protocol, reverse-
              engineered by clever people and implemented in curl based on  their  efforts.  This
              kind  of  behavior  should  not be endorsed, you should encourage everyone who uses
              NTLM to switch to a public and documented authentication method  instead,  such  as
              Digest.

              If you want to enable NTLM for your proxy authentication, then use [4m--proxy-ntlm[24m.

              This  option requires a library built with SSL support. Use [4m-V,[24m [4m--version[24m to see if
              your curl supports NTLM.

              If this option is used several times, only the first one is used.

       -o, --output <file>
              Write output to <file> instead of stdout. If you are using {} or [] to fetch multi-
              ple  documents,  you can use '#' followed by a number in the <file> specifier. That
              variable will be replaced with the current string for the URL being  fetched.  Like
              in:

                curl http://{one,two}.site.com -o "file_#1.txt"

              or use several variables like:

                curl http://{site,host}.host[1-5].com -o "#1_#2"

              You may use this option as many times as the number of URLs you have.

              See  also  the  [4m--create-dirs[24m  option  to create the local directories dynamically.
              Specifying the output as '-' (a single dash) will force the output to  be  done  to
              stdout.

       -O, --remote-name
              Write output to a local file named like the remote file we get. (Only the file part
              of the remote file is used, the path is cut off.)

              The remote file name to use for saving is extracted from  the  given  URL,  nothing
              else.

              Consequentially,  the  file  will be saved in the current working directory. If you
              want the file saved in a different directory, make sure you change current  working
              directory before you invoke curl with the [1m-O, --remote-name [22mflag!

              There  is no URL decoding done on the file name. If it has %20 or other URL encoded
              parts of the name, they will end up as-is as file name.

              You may use this option as many times as the number of URLs you have.

       --oauth2-bearer
              (IMAP, POP3, SMTP) Specify the Bearer Token for OAUTH  2.0  server  authentication.
              The  Bearer  Token is used in conjunction with the user name which can be specified
              as part of the [4m--url[24m or [4m-u,[24m [4m--user[24m options.

              The Bearer Token and user name are formatted according to RFC 6750.

              If this option is used several times, the last one will be used.

       --proxy-header <header>
              (HTTP) Extra header to include in the request when sending HTTP to a proxy. You may
              specify  any number of extra headers. This is the equivalent option to [4m-H,[24m [4m--header[0m
              but is for proxy communication only like in CONNECT requests when you want a  sepa-
              rate header sent to the proxy to what is sent to the actual remote host.

              curl  will  make sure that each header you add/replace is sent with the proper end-
              of-line marker, you should thus [1mnot [22madd that as a part of the  header  content:  do
              not add newlines or carriage returns, they will only mess things up for you.

              Headers specified with this option will not be included in requests that curl knows
              will not be sent to a proxy.

              This option can be used multiple times to add/replace/remove multiple headers.

              (Added in 7.37.0)

       -p, --proxytunnel
              When an HTTP proxy is used ([4m-x,[24m [4m--proxy[24m), this option will cause non-HTTP protocols
              to  attempt  to tunnel through the proxy instead of merely using it to do HTTP-like
              operations. The tunnel approach is made with the HTTP  proxy  CONNECT  request  and
              requires  that the proxy allows direct connect to the remote port number curl wants
              to tunnel through to.

       -P, --ftp-port <address>
              (FTP) Reverses the default initiator/listener roles when connecting with FTP.  This
              switch  makes curl use active mode. In practice, curl then tells the server to con-
              nect back to the client's specified address and port, while passive mode  asks  the
              server  to  setup  an IP address and port for it to connect to. <address> should be
              one of:

              interface
                     i.e "eth0" to specify which interface's IP address you  want  to  use  (Unix
                     only)

              IP address
                     i.e "192.168.10.1" to specify the exact IP address

              host name
                     i.e "my.host.domain" to specify the machine

              -      make curl pick the same IP address that is already used for the control con-
                     nection

       If this option is used several times, the last one will be used. Disable the use  of  PORT
       with  [4m--ftp-pasv[24m.  Disable  the  attempt  to use the EPRT command instead of PORT by using
       [4m--disable-eprt[24m. EPRT is really PORT++.

       Starting in 7.19.5, you can append ":[start]-[end]" to the right of the address,  to  tell
       curl  what  TCP  port range to use. That means you specify a port range, from a lower to a
       higher number. A single number works as well, but do note that it increases  the  risk  of
       failure since the port may not be available.

       --pass <phrase>
              (SSL/SSH) Passphrase for the private key

              If this option is used several times, the last one will be used.

       --path-as-is
              Tell  curl  to  not handle sequences of /../ or /./ in the given URL path. Normally
              curl will squash or merge them according to standards but with this option set  you
              tell it not to do that.

              (Added in 7.42.0)

       --post301
              (HTTP) Tells curl to respect RFC 2616/10.3.2 and not convert POST requests into GET
              requests when following a 301 redirection. The non-RFC behaviour is  ubiquitous  in
              web  browsers, so curl does the conversion by default to maintain consistency. How-
              ever, a server may require a POST to remain a POST after such a  redirection.  This
              option is meaningful only when using [4m-L,[24m [4m--location[24m (Added in 7.17.1)

       --post302
              (HTTP) Tells curl to respect RFC 2616/10.3.2 and not convert POST requests into GET
              requests when following a 302 redirection. The non-RFC behaviour is  ubiquitous  in
              web  browsers, so curl does the conversion by default to maintain consistency. How-
              ever, a server may require a POST to remain a POST after such a  redirection.  This
              option is meaningful only when using [4m-L,[24m [4m--location[24m (Added in 7.19.1)

       --post303
              (HTTP) Tells curl to respect RFC 2616/10.3.2 and not convert POST requests into GET
              requests when following a 303 redirection. The non-RFC behaviour is  ubiquitous  in
              web  browsers, so curl does the conversion by default to maintain consistency. How-
              ever, a server may require a POST to remain a POST after such a  redirection.  This
              option is meaningful only when using [4m-L,[24m [4m--location[24m (Added in 7.26.0)

       --proto <protocols>
              Tells  curl  to  use  the listed protocols for its initial retrieval. Protocols are
              evaluated left to right, are comma separated, and  are  each  a  protocol  name  or
              'all', optionally prefixed by zero or more modifiers. Available modifiers are:

              [1m+  [22mPermit  this  protocol  in  addition to protocols already permitted (this is the
                 default if no modifier is used).

              [1m-  [22mDeny this protocol, removing it from the list of protocols already permitted.

              [1m=  [22mPermit only this protocol (ignoring the list already permitted), though  subject
                 to later modification by subsequent entries in the comma separated list.

              For example:

              [1m--proto -ftps  [22muses the default protocols, but disables ftps

              [1m--proto -all,https,+http[0m
                             only enables http and https

              [1m--proto =http,https[0m
                             also only enables http and https

              Unknown  protocols  produce  a warning. This allows scripts to safely rely on being
              able to disable potentially dangerous protocols, without relying upon  support  for
              that protocol being built into curl to avoid an error.

              This  option  can  be  used multiple times, in which case the effect is the same as
              concatenating the protocols into one instance of the option.

              (Added in 7.20.2)

       --proto-redir <protocols>
              Tells curl to use the listed protocols after a redirect. See --proto for how proto-
              cols are represented.

              (Added in 7.20.2)

       --proxy-anyauth
              Tells  curl  to  pick  a suitable authentication method when communicating with the
              given proxy. This might cause  an  extra  request/response  round-trip.  (Added  in
              7.13.2)

       --proxy-basic
              Tells  curl  to  use  HTTP  Basic  authentication when communicating with the given
              proxy. Use [4m--basic[24m for enabling HTTP Basic with a remote host. Basic is the default
              authentication method curl uses with proxies.

       --proxy-digest
              Tells  curl  to  use  HTTP  Digest authentication when communicating with the given
              proxy. Use [4m--digest[24m for enabling HTTP Digest with a remote host.

       --proxy-negotiate
              Tells curl to use HTTP Negotiate (SPNEGO) authentication  when  communicating  with
              the given proxy. Use [4m--negotiate[24m for enabling HTTP Negotiate (SPNEGO) with a remote
              host. (Added in 7.17.1)

       --proxy-ntlm
              Tells curl to use HTTP NTLM authentication when communicating with the given proxy.
              Use [4m--ntlm[24m for enabling NTLM with a remote host.

       --proxy1.0 <proxyhost[:port]>
              Use  the  specified  HTTP  1.0  proxy.  If  the port number is not specified, it is
              assumed at port 1080.

              The only difference between this and the HTTP proxy option ([4m-x,[24m [4m--proxy[24m),  is  that
              attempts to use CONNECT through the proxy will specify an HTTP 1.0 protocol instead
              of the default HTTP 1.1.

       --pubkey <key>
              (SSH) Public key file name. Allows you to provide your public key in this  separate
              file.

              If this option is used several times, the last one will be used.

              (As  of 7.39.0, curl attempts to automatically extract the public key from the pri-
              vate key file, so passing this option is generally not  required.  Note  that  this
              public key extraction requires libcurl to be linked against a copy of libssh2 1.2.8
              or higher that is itself linked against OpenSSL.)

       -q     If used as the first parameter on the command line, the [4mcurlrc[24m config file will not
              be  read  and  used.  See  the  [4m-K,[24m [4m--config[24m for details on the default config file
              search path.

       -Q, --quote <command>
              (FTP/SFTP) Send an arbitrary command to the remote FTP or SFTP server.  Quote  com-
              mands  are sent BEFORE the transfer takes place (just after the initial PWD command
              in an FTP transfer, to be exact). To make commands take place  after  a  successful
              transfer,  prefix  them  with  a dash '-'.  To make commands be sent after curl has
              changed the working directory, just before the transfer command(s), prefix the com-
              mand  with  a  '+'  (this is only supported for FTP). You may specify any number of
              commands. If the server returns failure for one of the commands, the entire  opera-
              tion  will  be aborted. You must send syntactically correct FTP commands as RFC 959
              defines to FTP servers, or one of the commands listed below to SFTP servers.   This
              option  can be used multiple times. When speaking to an FTP server, prefix the com-
              mand with an asterisk (*) to make curl continue even if the  command  fails  as  by
              default curl will stop at first failure.

              SFTP  is  a  binary  protocol.  Unlike for FTP, curl interprets SFTP quote commands
              itself before sending them to the server.  File names may be quoted shell-style  to
              embed  spaces  or  special characters.  Following is the list of all supported SFTP
              quote commands:

              chgrp group file
                     The chgrp command sets the group ID of the file named by the file operand to
                     the  group ID specified by the group operand. The group operand is a decimal
                     integer group ID.

              chmod mode file
                     The chmod command modifies the file mode bits of  the  specified  file.  The
                     mode operand is an octal integer mode number.

              chown user file
                     The  chown  command  sets the owner of the file named by the file operand to
                     the user ID specified by the user operand. The user  operand  is  a  decimal
                     integer user ID.

              ln source_file target_file
                     The  ln and symlink commands create a symbolic link at the target_file loca-
                     tion pointing to the source_file location.

              mkdir directory_name
                     The mkdir command creates the directory named by the directory_name operand.

              pwd    The pwd command returns the absolute pathname of the current working  direc-
                     tory.

              rename source target
                     The rename command renames the file or directory named by the source operand
                     to the destination path named by the target operand.

              rm file
                     The rm command removes the file specified by the file operand.

              rmdir directory
                     The rmdir command removes the directory entry specified by the directory op-
                     erand, provided it is empty.

              symlink source_file target_file
                     See ln.

       -r, --range <range>
              (HTTP/FTP/SFTP/FILE)  Retrieve  a  byte  range  (i.e  a  partial  document)  from a
              HTTP/1.1, FTP or SFTP server or a local FILE. Ranges can be specified in  a  number
              of ways.

              [1m0-499     [22mspecifies the first 500 bytes

              [1m500-999   [22mspecifies the second 500 bytes

              [1m-500      [22mspecifies the last 500 bytes

              [1m9500-     [22mspecifies the bytes from offset 9500 and forward

              [1m0-0,-1    [22mspecifies the first and last byte only(*)(H)

              [1m500-700,600-799[0m
                        specifies 300 bytes from offset 500(H)

              [1m100-199,500-599[0m
                        specifies two separate 100-byte ranges(*)(H)

       (*) = NOTE that this will cause the server to reply with a multipart response!

       Only digit characters (0-9) are valid in the 'start' and 'stop' fields of the 'start-stop'
       range syntax. If a non-digit character is given in the range, the server's  response  will
       be unspecified, depending on the server's configuration.

       You  should  also be aware that many HTTP/1.1 servers do not have this feature enabled, so
       that when you attempt to get a range, you'll instead get the whole document.

       FTP and SFTP range downloads only support the simple 'start-stop' syntax (optionally  with
       one of the numbers omitted). FTP use depends on the extended FTP command SIZE.

       If this option is used several times, the last one will be used.

       -R, --remote-time
              When  used,  this  will make curl attempt to figure out the timestamp of the remote
              file, and if that is available make the local file get that same timestamp.

       --random-file <file>
              (SSL) Specify the path name to file containing what will be  considered  as  random
              data. The data is used to seed the random engine for SSL connections.  See also the
              [4m--egd-file[24m option.

       --raw  (HTTP) When used, it disables all internal HTTP decoding  of  content  or  transfer
              encodings and instead makes them passed on unaltered, raw. (Added in 7.16.2)

       --remote-name-all
              This  option  changes  the default action for all given URLs to be dealt with as if
              [4m-O,[24m [4m--remote-name[24m were used for each one. So if you want to disable that for a spe-
              cific  URL  after  [4m--remote-name-all[24m  has  been  used, you must use "-o -" or [4m--no-[0m
              [4mremote-name[24m. (Added in 7.19.0)

       --resolve <host:port:address>
              Provide a custom address for a specific host and port pair.  Using  this,  you  can
              make  the  curl  requests(s) use a specified address and prevent the otherwise nor-
              mally resolved address to be used. Consider it a  sort  of  /etc/hosts  alternative
              provided  on  the  command  line. The port number should be the number used for the
              specific protocol the host will be used for. It means you need several  entries  if
              you want to provide address for the same host but different ports.

              This option can be used many times to add many host names to resolve.

              (Added in 7.21.3)

       --retry <num>
              If  a  transient  error  is returned when curl tries to perform a transfer, it will
              retry this number of times before giving up. Setting the number to 0 makes curl  do
              no  retries (which is the default). Transient error means either: a timeout, an FTP
              4xx response code or an HTTP 5xx response code.

              When curl is about to retry a transfer, it will first wait one second and then  for
              all forthcoming retries it will double the waiting time until it reaches 10 minutes
              which then will be the delay between the rest of the retries.   By  using  [4m--retry-[0m
              [4mdelay[24m  you disable this exponential backoff algorithm. See also [4m--retry-max-time[24m to
              limit the total time allowed for retries. (Added in 7.12.3)

              If this option is used several times, the last one will be used.

       --retry-delay <seconds>
              Make curl sleep this amount of time before each retry when a  transfer  has  failed
              with  a  transient  error  (it  changes  the default backoff time algorithm between
              retries). This option is only interesting if [4m--retry[24m is  also  used.  Setting  this
              delay to zero will make curl use the default backoff time.  (Added in 7.12.3)

              If this option is used several times, the last one will be used.

       --retry-max-time <seconds>
              The retry timer is reset before the first transfer attempt. Retries will be done as
              usual (see [4m--retry[24m) as long as the timer hasn't reached this  given  limit.  Notice
              that if the timer hasn't reached the limit, the request will be made and while per-
              forming, it may take longer  than  this  given  time  period.  To  limit  a  single
              request´s maximum time, use [4m-m,[24m [4m--max-time[24m.  Set this option to zero to not timeout
              retries. (Added in 7.12.3)

              If this option is used several times, the last one will be used.

       -s, --silent
              Silent or quiet mode. Don't show progress meter  or  error  messages.   Makes  Curl
              mute.  It  will  still  output the data you ask for, potentially even to the termi-
              nal/stdout unless you redirect it.

       --sasl-ir
              Enable initial response in SASL authentication.  (Added in 7.31.0)

       -S, --show-error
              When used with [4m-s[24m it makes curl show an error message if it fails.

       --ssl  (FTP, POP3, IMAP, SMTP) Try to use SSL/TLS for the connection.  Reverts to  a  non-
              secure  connection  if the server doesn't support SSL/TLS.  See also [4m--ftp-ssl-con-[0m
              [4mtrol[24m and [4m--ssl-reqd[24m for different levels of encryption required. (Added in 7.20.0)

              This option was formerly known as [4m--ftp-ssl[24m (Added in 7.11.0). That option name can
              still be used but will be removed in a future version.

       --ssl-reqd
              (FTP, POP3, IMAP, SMTP) Require SSL/TLS for the connection.  Terminates the connec-
              tion if the server doesn't support SSL/TLS. (Added in 7.20.0)

              This option was formerly known as [4m--ftp-ssl-reqd[24m (added  in  7.15.5).  That  option
              name can still be used but will be removed in a future version.

       --ssl-allow-beast
              (SSL)  This  option  tells  curl to not work around a security flaw in the SSL3 and
              TLS1.0 protocols known as BEAST.  If this option isn't used, the SSL layer may  use
              workarounds  known to cause interoperability problems with some older SSL implemen-
              tations. WARNING: this option loosens the SSL security, and by using this flag  you
              ask for exactly that.  (Added in 7.25.0)

       --socks4 <host[:port]>
              Use  the specified SOCKS4 proxy. If the port number is not specified, it is assumed
              at port 1080. (Added in 7.15.2)

              This option overrides any previous use of [4m-x,[24m [4m--proxy[24m, as they are mutually  exclu-
              sive.

              Since  7.21.7, this option is superfluous since you can specify a socks4 proxy with
              [4m-x,[24m [4m--proxy[24m using a socks4:// protocol prefix.

              If this option is used several times, the last one will be used.

       --socks4a <host[:port]>
              Use the specified SOCKS4a proxy. If the port number is not specified, it is assumed
              at port 1080. (Added in 7.18.0)

              This  option overrides any previous use of [4m-x,[24m [4m--proxy[24m, as they are mutually exclu-
              sive.

              Since 7.21.7, this option is superfluous since you can specify a socks4a proxy with
              [4m-x,[24m [4m--proxy[24m using a socks4a:// protocol prefix.

              If this option is used several times, the last one will be used.

       --socks5-hostname <host[:port]>
              Use  the  specified  SOCKS5 proxy (and let the proxy resolve the host name). If the
              port number is not specified, it is assumed at port 1080. (Added in 7.18.0)

              This option overrides any previous use of [4m-x,[24m [4m--proxy[24m, as they are mutually  exclu-
              sive.

              Since  7.21.7,  this  option is superfluous since you can specify a socks5 hostname
              proxy with [4m-x,[24m [4m--proxy[24m using a socks5h:// protocol prefix.

              If this option is used several times, the last one will be used. (This  option  was
              previously wrongly documented and used as --socks without the number appended.)

       --socks5 <host[:port]>
              Use  the  specified  SOCKS5  proxy - but resolve the host name locally. If the port
              number is not specified, it is assumed at port 1080.

              This option overrides any previous use of [4m-x,[24m [4m--proxy[24m, as they are mutually  exclu-
              sive.

              Since  7.21.7, this option is superfluous since you can specify a socks5 proxy with
              [4m-x,[24m [4m--proxy[24m using a socks5:// protocol prefix.

              If this option is used several times, the last one will be used. (This  option  was
              previously wrongly documented and used as --socks without the number appended.)

              This option (as well as [4m--socks4[24m) does not work with IPV6, FTPS or LDAP.

       --socks5-gssapi-service <servicename>
              The default service name for a socks server is rcmd/server-fqdn. This option allows
              you to change it.

              Examples: --socks5 proxy-name [4m--socks5-gssapi-service[24m sockd would use  sockd/proxy-
              name   --socks5   proxy-name   [4m--socks5-gssapi-service[24m  sockd/real-name  would  use
              sockd/real-name for cases where the proxy-name does not match the  principal  name.
              (Added in 7.19.4).

       --socks5-gssapi-nec
              As  part  of the GSS-API negotiation a protection mode is negotiated. RFC 1961 says
              in section 4.3/4.4 it should be protected, but  the  NEC  reference  implementation
              does  not.   The  option [4m--socks5-gssapi-nec[24m allows the unprotected exchange of the
              protection mode negotiation. (Added in 7.19.4).

       --stderr <file>
              Redirect all writes to stderr to the specified file instead. If the file name is  a
              plain '-', it is instead written to stdout.

              If this option is used several times, the last one will be used.

       -t, --telnet-option <OPT=val>
              Pass options to the telnet protocol. Supported options are:

              TTYPE=<term> Sets the terminal type.

              XDISPLOC=<X display> Sets the X display location.

              NEW_ENV=<var,val> Sets an environment variable.

       -T, --upload-file <file>
              This transfers the specified local file to the remote URL. If there is no file part
              in the specified URL, Curl will append the local file name. NOTE that you must  use
              a  trailing  /  on the last directory to really prove to Curl that there is no file
              name or curl will think that your last directory name is the remote  file  name  to
              use.  That  will most likely cause the upload operation to fail. If this is used on
              an HTTP(S) server, the PUT command will be used.

              Use the file name "-" (a single dash) to use stdin instead of a given file.  Alter-
              nately,  the file name "." (a single period) may be specified instead of "-" to use
              stdin in non-blocking mode to allow reading server  output  while  stdin  is  being
              uploaded.

              You  can specify one -T for each URL on the command line. Each -T + URL pair speci-
              fies what to upload and to where. curl also supports "globbing" of the -T argument,
              meaning  that  you  can upload multiple files to a single URL by using the same URL
              globbing style supported in the URL, like this:

              curl -T "{file1,file2}" http://www.uploadtothissite.com

              or even

              curl -T "img[1-1000].png" ftp://ftp.picturemania.com/upload/

       --tcp-nodelay
              Turn on the TCP_NODELAY option. See the [4mcurl_easy_setopt(3)[24m man  page  for  details
              about this option. (Added in 7.11.2)

       --tftp-blksize <value>
              (TFTP)  Set  TFTP  BLKSIZE  option (must be >512). This is the block size that curl
              will try to use when transferring data to or from a TFTP  server.  By  default  512
              bytes will be used.

              If this option is used several times, the last one will be used.

              (Added in 7.20.0)

       --tlsauthtype <authtype>
              Set  TLS  authentication  type.  Currently, the only supported option is "SRP", for
              TLS-SRP (RFC 5054). If [4m--tlsuser[24m and [4m--tlspassword[24m are specified but  [4m--tlsauthtype[0m
              is not, then this option defaults to "SRP".  (Added in 7.21.4)

       --tlspassword <password>
              Set   password   for   use  with  the  TLS  authentication  method  specified  with
              [4m--tlsauthtype[24m. Requires that [4m--tlsuser[24m also be set.  (Added in 7.21.4)

       --tlsuser <user>
              Set  username  for  use  with  the  TLS  authentication   method   specified   with
              [4m--tlsauthtype[24m. Requires that [4m--tlspassword[24m also be set.  (Added in 7.21.4)

       --tlsv1.0
              (SSL) Forces curl to use TLS version 1.0 when negotiating with a remote TLS server.
              (Added in 7.34.0)

       --tlsv1.1
              (SSL) Forces curl to use TLS version 1.1 when negotiating with a remote TLS server.
              (Added in 7.34.0)

       --tlsv1.2
              (SSL) Forces curl to use TLS version 1.2 when negotiating with a remote TLS server.
              (Added in 7.34.0)

       --tr-encoding
              (HTTP) Request a compressed Transfer-Encoding response using one of the  algorithms
              curl supports, and uncompress the data while receiving it.

              (Added in 7.21.6)

       --trace <file>
              Enables  a full trace dump of all incoming and outgoing data, including descriptive
              information, to the given output file. Use "-" as filename to have the output  sent
              to stdout.

              This option overrides previous uses of [4m-v,[24m [4m--verbose[24m or [4m--trace-ascii[24m.

              If this option is used several times, the last one will be used.

       --trace-ascii <file>
              Enables  a full trace dump of all incoming and outgoing data, including descriptive
              information, to the given output file. Use "-" as filename to have the output  sent
              to stdout.

              This  is  very  similar  to [4m--trace[24m, but leaves out the hex part and only shows the
              ASCII part of the dump. It makes smaller output that might be easier  to  read  for
              untrained humans.

              This option overrides previous uses of [4m-v,[24m [4m--verbose[24m or [4m--trace[24m.

              If this option is used several times, the last one will be used.

       --trace-time
              Prepends  a time stamp to each trace or verbose line that curl displays.  (Added in
              7.14.0)

       --unix-socket <path>
              (HTTP) Connect through this Unix domain  socket,  instead  of  using  the  network.
              (Added in 7.40.0)

       -u, --user <user:password>
              Specify  the user name and password to use for server authentication. Overrides [4m-n,[0m
              [4m--netrc[24m and [4m--netrc-optional[24m.

              If you simply specify the user name, curl will prompt for a password.

              The user name and passwords are split up on the first colon, which makes it  impos-
              sible to use a colon in the user name with this option. The password can, still.

              When  using  Kerberos V5 with a Windows based server you should include the Windows
              domain name in the user name, in order for the server to successfully obtain a Ker-
              beros Ticket. If you don't then the initial authentication handshake may fail.

              When  using  NTLM,  the user name can be specified simply as the user name, without
              the domain, if there is a single domain and forest in your setup for example.

              To specify the domain name use either Down-Level Logon Name or UPN (User  Principal
              Name) formats. For example, EXAMPLE\user and user@example.com respectively.

              If  you  use a Windows SSPI-enabled curl binary and perform Kerberos V5, Negotiate,
              NTLM or Digest authentication then you can tell curl to select the  user  name  and
              password  from  your environment by specifying a single colon with this option: "-u
              :".

              If this option is used several times, the last one will be used.

       -U, --proxy-user <user:password>
              Specify the user name and password to use for proxy authentication.

              If you use a Windows SSPI-enabled curl binary  and  do  either  Negotiate  or  NTLM
              authentication  then  you  can  tell curl to select the user name and password from
              your environment by specifying a single colon with this option: "-U :".

              If this option is used several times, the last one will be used.

       --url <URL>
              Specify a URL to fetch. This option is mostly handy when you want to specify URL(s)
              in a config file.

              This  option may be used any number of times. To control where this URL is written,
              use the [4m-o,[24m [4m--output[24m or the [4m-O,[24m [4m--remote-name[24m options.

       -v, --verbose
              Be more verbose/talkative during the operation. Useful  for  debugging  and  seeing
              what's going on "under the hood". A line starting with '>' means "header data" sent
              by curl, '<' means "header data" received by curl that is hidden in  normal  cases,
              and a line starting with '*' means additional info provided by curl.

              Note  that  if you only want HTTP headers in the output, [4m-i,[24m [4m--include[24m might be the
              option you're looking for.

              If you think this option still doesn't give  you  enough  details,  consider  using
              [4m--trace[24m or [4m--trace-ascii[24m instead.

              This option overrides previous uses of [4m--trace-ascii[24m or [4m--trace[24m.

              Use [4m-s,[24m [4m--silent[24m to make curl quiet.

       -w, --write-out <format>
              Make curl display information on stdout after a completed transfer. The format is a
              string that may contain plain text mixed with any number of variables.  The  format
              can be specified as a literal "string", or you can have curl read the format from a
              file with "@filename" and to tell curl to read the  format  from  stdin  you  write
              "@-".

              The variables present in the output format will be substituted by the value or text
              that curl thinks fit, as described below. All variables are  specified  as  %{vari-
              able_name}  and  to  output  a normal % you just write them as %%. You can output a
              newline by using \n, a carriage return with \r and a tab space with \t.

              [1mNOTE: [22mThe %-symbol is a special symbol in the win32-environment, where  all  occur-
              rences of % must be doubled when using this option.

              The variables available are:

              [1mcontent_type   [22mThe Content-Type of the requested document, if there was any.

              [1mfilename_effective[0m
                             The ultimate filename that curl writes out to. This is only meaning-
                             ful if curl is told to write to a file  with  the  [4m--remote-name[24m  or
                             [4m--output[24m  option. It's most useful in combination with the [4m--remote-[0m
                             [4mheader-name[24m option. (Added in 7.25.1)

              [1mftp_entry_path [22mThe initial path curl ended up in when logging on to the remote  FTP
                             server. (Added in 7.15.4)

              [1mhttp_code      [22mThe  numerical  response  code  that was found in the last retrieved
                             HTTP(S) or FTP(s) transfer. In 7.18.2 the  alias  [1mresponse_code  [22mwas
                             added to show the same info.

              [1mhttp_connect   [22mThe  numerical  code  that  was  found  in the last response (from a
                             proxy) to a curl CONNECT request. (Added in 7.12.4)

              [1mlocal_ip       [22mThe IP address of the local end of the most recently done connection
                             - can be either IPv4 or IPv6 (Added in 7.29.0)

              [1mlocal_port     [22mThe local port number of the most recently done connection (Added in
                             7.29.0)

              [1mnum_connects   [22mNumber of new connects  made  in  the  recent  transfer.  (Added  in
                             7.12.3)

              [1mnum_redirects  [22mNumber  of  redirects  that  were followed in the request. (Added in
                             7.12.3)

              [1mredirect_url   [22mWhen an HTTP request was made without -L to follow  redirects,  this
                             variable  will  show  the  actual  URL a redirect [4mwould[24m take you to.
                             (Added in 7.18.2)

              [1mremote_ip      [22mThe remote IP address of the most recently done connection - can  be
                             either IPv4 or IPv6 (Added in 7.29.0)

              [1mremote_port    [22mThe  remote  port number of the most recently done connection (Added
                             in 7.29.0)

              [1msize_download  [22mThe total amount of bytes that were downloaded.

              [1msize_header    [22mThe total amount of bytes of the downloaded headers.

              [1msize_request   [22mThe total amount of bytes that were sent in the HTTP request.

              [1msize_upload    [22mThe total amount of bytes that were uploaded.

              [1mspeed_download [22mThe average download speed that curl measured for the complete down-
                             load. Bytes per second.

              [1mspeed_upload   [22mThe average upload speed that curl measured for the complete upload.
                             Bytes per second.

              [1mssl_verify_result[0m
                             The result  of  the  SSL  peer  certificate  verification  that  was
                             requested.  0  means  the  verification  was  successful.  (Added in
                             7.19.0)

              [1mtime_appconnect[0m
                             The time, in seconds, it took from the start until  the  SSL/SSH/etc
                             connect/handshake  to  the  remote  host  was  completed.  (Added in
                             7.19.0)

              [1mtime_connect   [22mThe time, in seconds, it took from the start until the  TCP  connect
                             to the remote host (or proxy) was completed.

              [1mtime_namelookup[0m
                             The  time, in seconds, it took from the start until the name resolv-
                             ing was completed.

              [1mtime_pretransfer[0m
                             The time, in seconds, it took from the start until the file transfer
                             was just about to begin. This includes all pre-transfer commands and
                             negotiations  that  are  specific  to  the  particular   protocol(s)
                             involved.

              [1mtime_redirect  [22mThe time, in seconds, it took for all redirection steps include name
                             lookup, connect, pretransfer and transfer before the final  transac-
                             tion  was  started.  time_redirect shows the complete execution time
                             for multiple redirections. (Added in 7.12.3)

              [1mtime_starttransfer[0m
                             The time, in seconds, it took from the start until  the  first  byte
                             was just about to be transferred. This includes time_pretransfer and
                             also the time the server needed to calculate the result.

              [1mtime_total     [22mThe total time, in seconds, that the full operation lasted. The time
                             will be displayed with millisecond resolution.

              [1murl_effective  [22mThe  URL  that  was  fetched last. This is most meaningful if you've
                             told curl to follow location: headers.

       If this option is used several times, the last one will be used.

       -x, --proxy <[protocol://][user:password@]proxyhost[:port]>
              Use the specified proxy.

              The proxy string can be specified with a protocol:// prefix to specify  alternative
              proxy  protocols. Use socks4://, socks4a://, socks5:// or socks5h:// to request the
              specific SOCKS version to be used. No protocol specified, http://  and  all  others
              will be treated as HTTP proxies. (The protocol support was added in curl 7.21.7)

              If the port number is not specified in the proxy string, it is assumed to be 1080.

              This  option overrides existing environment variables that set the proxy to use. If
              there's an environment variable setting a proxy, you can set proxy to ""  to  over-
              ride it.

              All  operations  that  are  performed over an HTTP proxy will transparently be con-
              verted to HTTP. It means that certain protocol specific  operations  might  not  be
              available.  This  is  not the case if you can tunnel through the proxy, as one with
              the [4m-p,[24m [4m--proxytunnel[24m option.

              User and password that might be provided in the proxy string  are  URL  decoded  by
              curl.  This allows you to pass in special characters such as @ by using %40 or pass
              in a colon with %3a.

              The proxy host can be specified the exact same way as the proxy  environment  vari-
              ables, including the protocol prefix (http://) and the embedded user + password.

              If this option is used several times, the last one will be used.

       -X, --request <command>
              (HTTP)  Specifies  a  custom request method to use when communicating with the HTTP
              server.  The specified request method will be used instead of the method  otherwise
              used  (which  defaults  to  GET).  Read  the HTTP 1.1 specification for details and
              explanations. Common additional HTTP requests include PUT and DELETE,  but  related
              technologies like WebDAV offers PROPFIND, COPY, MOVE and more.

              Normally  you don't need this option. All sorts of GET, HEAD, POST and PUT requests
              are rather invoked by using dedicated command line options.

              This option only changes the actual word used in the  HTTP  request,  it  does  not
              alter  the  way  curl  behaves.  So  for  example if you want to make a proper HEAD
              request, using -X HEAD will not suffice. You need to use the [4m-I,[24m [4m--head[24m option.

              The method string you set with -X will be used for all requests, which if  you  for
              example  use  [1m-L,  --location  [22mmay  cause unintended side-effects when curl doesn't
              change request method according to the HTTP 30x response codes - and similar.

              (FTP) Specifies a custom FTP command to use instead of LIST when doing  file  lists
              with FTP.

              (POP3)  Specifies  a  custom POP3 command to use instead of LIST or RETR. (Added in
              7.26.0)

              (IMAP) Specifies a custom IMAP command to use instead of LIST. (Added in 7.30.0)

              (SMTP) Specifies a custom SMTP command to use instead of HELP or  VRFY.  (Added  in
              7.34.0)

              If this option is used several times, the last one will be used.

       --xattr
              When saving output to a file, this option tells curl to store certain file metadata
              in extended file attributes. Currently, the URL is  stored  in  the  xdg.origin.url
              attribute  and, for HTTP, the content type is stored in the mime_type attribute. If
              the file system does not support extended attributes, a warning is issued.


       -y, --speed-time <time>
              If a download is slower than speed-limit  bytes  per  second  during  a  speed-time
              period,  the  download gets aborted. If speed-time is used, the default speed-limit
              will be 1 unless set with [4m-Y[24m.

              This option controls transfers and thus will not affect slow connects etc. If  this
              is a concern for you, try the [4m--connect-timeout[24m option.

              If this option is used several times, the last one will be used.

       -Y, --speed-limit <speed>
              If  a download is slower than this given speed (in bytes per second) for speed-time
              seconds it gets aborted. speed-time is set with [4m-y[24m and is 30 if not set.

              If this option is used several times, the last one will be used.

       -z, --time-cond <date expression>|<file>
              (HTTP/FTP) Request a file that has been modified later  than  the  given  time  and
              date,  or one that has been modified before that time. The <date expression> can be
              all sorts of date strings or if it doesn't match any internal ones, it is taken  as
              a  filename and tries to get the modification date (mtime) from <file> instead. See
              the [4mcurl_getdate(3)[24m man pages for date expression details.

              Start the date expression with a dash (-) to make it request for a document that is
              older than the given date/time, default is a document that is newer than the speci-
              fied date/time.

              If this option is used several times, the last one will be used.

       -h, --help
              Usage help. This lists all current command line options with a short description.

       -M, --manual
              Manual. Display the huge help text.

       -V, --version
              Displays information about curl and the libcurl version it uses.

              The first line includes the full version of  curl,  libcurl  and  other  3rd  party
              libraries linked with the executable.

              The second line (starts with "Protocols:") shows all protocols that libcurl reports
              to support.

              The third line (starts with "Features:") shows specific features libcurl reports to
              offer. Available features include:

              IPv6   You can use IPv6 with this.

              krb4   Krb4 for FTP is supported.

              SSL    SSL  versions of various protocols are supported, such as HTTPS, FTPS, POP3S
                     and so on.

              libz   Automatic decompression of compressed files over HTTP is supported.

              NTLM   NTLM authentication is supported.

              Debug  This curl uses a libcurl built with Debug. This enables more  error-tracking
                     and memory debugging etc. For curl-developers only!

              AsynchDNS
                     This curl uses asynchronous name resolves. Asynchronous name resolves can be
                     done using either the c-ares or the threaded resolver backends.

              SPNEGO SPNEGO authentication is supported.

              Largefile
                     This curl supports transfers of large files, files larger than 2GB.

              IDN    This curl supports IDN - international domain names.

              GSS-API
                     GSS-API is supported.

              SSPI   SSPI is supported.

              TLS-SRP
                     SRP (Secure Remote Password) authentication is supported for TLS.

              HTTP2  HTTP/2 support has been built-in.

              Metalink
                     This curl supports Metalink  (both  version  3  and  4  (RFC  5854)),  which
                     describes  mirrors  and hashes.  curl will use mirrors for failover if there
                     are errors (such as the file or server not being available).

[1mFILES[0m
       [4m~/.curlrc[0m
              Default config file, see [4m-K,[24m [4m--config[24m for details.

[1mENVIRONMENT[0m
       The environment variables can be specified in lower case or upper  case.  The  lower  case
       version has precedence. http_proxy is an exception as it is only available in lower case.

       Using  an  environment  variable to set the proxy has the same effect as using the [4m--proxy[0m
       option.


       http_proxy [protocol://]<host>[:port]
              Sets the proxy server to use for HTTP.

       HTTPS_PROXY [protocol://]<host>[:port]
              Sets the proxy server to use for HTTPS.

       [url-protocol]_PROXY [protocol://]<host>[:port]
              Sets the proxy server to use for [url-protocol], where the protocol is  a  protocol
              that  curl  supports  and  as specified in a URL. FTP, FTPS, POP3, IMAP, SMTP, LDAP
              etc.

       ALL_PROXY [protocol://]<host>[:port]
              Sets the proxy server to use if no protocol-specific proxy is set.

       NO_PROXY <comma-separated list of hosts>
              list of host names that shouldn't go through any proxy. If set to  a  asterisk  '*'
              only, it matches all hosts.

[1mPROXY PROTOCOL PREFIXES[0m
       Since  curl version 7.21.7, the proxy string may be specified with a protocol:// prefix to
       specify alternative proxy protocols.

       If no protocol is specified in the proxy string or if the string doesn't match a supported
       one, the proxy will be treated as an HTTP proxy.

       The supported proxy protocol prefixes are as follows:

       socks4://
              Makes it the equivalent of [4m--socks4[0m

       socks4a://
              Makes it the equivalent of [4m--socks4a[0m

       socks5://
              Makes it the equivalent of [4m--socks5[0m

       socks5h://
              Makes it the equivalent of [4m--socks5-hostname[0m

[1mEXIT CODES[0m
       There are a bunch of different error codes and their corresponding error messages that may
       appear during bad conditions. At the time of this writing, the exit codes are:

       1      Unsupported protocol. This build of curl has no support for this protocol.

       2      Failed to initialize.

       3      URL malformed. The syntax was not correct.

       4      A feature or option that was needed to perform the desired request was not  enabled
              or  was explicitly disabled at build-time. To make curl able to do this, you proba-
              bly need another build of libcurl!

       5      Couldn't resolve proxy. The given proxy host could not be resolved.

       6      Couldn't resolve host. The given remote host was not resolved.

       7      Failed to connect to host.

       8      FTP weird server reply. The server sent data curl couldn't parse.

       9      FTP access denied. The server denied login  or  denied  access  to  the  particular
              resource  or  directory  you  wanted  to reach. Most often you tried to change to a
              directory that doesn't exist on the server.

       11     FTP weird PASS reply. Curl couldn't parse the reply sent to the PASS request.

       13     FTP weird PASV reply, Curl couldn't parse the reply sent to the PASV request.

       14     FTP weird 227 format. Curl couldn't parse the 227-line the server sent.

       15     FTP can't get host. Couldn't resolve the host IP we got in the 227-line.

       17     FTP couldn't set binary. Couldn't change transfer method to binary.

       18     Partial file. Only a part of the file was transferred.

       19     FTP couldn't download/access the given file, the RETR (or similar) command failed.

       21     FTP quote error. A quote command returned error from the server.

       22     HTTP page not retrieved. The requested url was not found or returned another  error
              with  the  HTTP error code being 400 or above. This return code only appears if [4m-f,[0m
              [4m--fail[24m is used.

       23     Write error. Curl couldn't write data to a local filesystem or similar.

       25     FTP couldn't STOR file. The server denied the STOR operation, used for FTP  upload-
              ing.

       26     Read error. Various reading problems.

       27     Out of memory. A memory allocation request failed.

       28     Operation  timeout. The specified time-out period was reached according to the con-
              ditions.

       30     FTP PORT failed. The PORT command failed. Not all FTP servers support the PORT com-
              mand, try doing a transfer using PASV instead!

       31     FTP  couldn't  use  REST. The REST command failed. This command is used for resumed
              FTP transfers.

       33     HTTP range error. The range "command" didn't work.

       34     HTTP post error. Internal post-request generation error.

       35     SSL connect error. The SSL handshaking failed.

       36     FTP bad download resume. Couldn't continue an earlier aborted download.

       37     FILE couldn't read file. Failed to open the file. Permissions?

       38     LDAP cannot bind. LDAP bind operation failed.

       39     LDAP search failed.

       41     Function not found. A required LDAP function was not found.

       42     Aborted by callback. An application told curl to abort the operation.

       43     Internal error. A function was called with a bad parameter.

       45     Interface error. A specified outgoing interface could not be used.

       47     Too many redirects. When following redirects, curl hit the maximum amount.

       48     Unknown option specified to libcurl. This indicates that you passed a weird  option
              to curl that was passed on to libcurl and rejected. Read up in the manual!

       49     Malformed telnet option.

       51     The peer's SSL certificate or SSH MD5 fingerprint was not OK.

       52     The server didn't reply anything, which here is considered an error.

       53     SSL crypto engine not found.

       54     Cannot set SSL crypto engine as default.

       55     Failed sending network data.

       56     Failure in receiving network data.

       58     Problem with the local certificate.

       59     Couldn't use specified SSL cipher.

       60     Peer certificate cannot be authenticated with known CA certificates.

       61     Unrecognized transfer encoding.

       62     Invalid LDAP URL.

       63     Maximum file size exceeded.

       64     Requested FTP SSL level failed.

       65     Sending the data requires a rewind that failed.

       66     Failed to initialise SSL Engine.

       67     The user name, password, or similar was not accepted and curl failed to log in.

       68     File not found on TFTP server.

       69     Permission problem on TFTP server.

       70     Out of disk space on TFTP server.

       71     Illegal TFTP operation.

       72     Unknown TFTP transfer ID.

       73     File already exists (TFTP).

       74     No such user (TFTP).

       75     Character conversion failed.

       76     Character conversion functions required.

       77     Problem with reading the SSL CA cert (path? access rights?).

       78     The resource referenced in the URL does not exist.

       79     An unspecified error occurred during the SSH session.

       80     Failed to shut down the SSL connection.

       82     Could not load CRL file, missing or wrong format (added in 7.19.0).

       83     Issuer check failed (added in 7.19.0).

       84     The FTP PRET command failed

       85     RTSP: mismatch of CSeq numbers

       86     RTSP: mismatch of Session Identifiers

       87     unable to parse FTP file list

       88     FTP chunk callback reported error

       89     No connection available, the session will be queued

       90     SSL public key does not matched pinned public key

       XX     More  error  codes will appear here in future releases. The existing ones are meant
              to never change.

[1mAUTHORS / CONTRIBUTORS[0m
       Daniel Stenberg is the main author, but the whole list of contributors  is  found  in  the
       separate THANKS file.

[1mWWW[0m
       http://curl.haxx.se

[1mFTP[0m
       ftp://ftp.sunet.se/pub/www/utilities/curl/

[1mSEE ALSO[0m
       [1mftp[22m(1), [1mwget[22m(1)



Curl 7.40.0                                30 Nov 2014                                    curl(1)
