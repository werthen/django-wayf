import re 
import DNS
from IPy import IP

ipspaces = {
     'admin.grnet.gr':	['195.251.29.0/24', '83.212.9.64/26',
                         '2001:648:2320:1::/64', '2001:648:2340:1::/64'],

     'aegean.gr':   	['83.212.68.0/22', '195.251.128.0/18', 
                         '195.251.160.0/20', '195.251.176.0/21',
                         '2001:648:2050::/48'],

     'aua.gr':	        ['143.233.54.0/24', '143.233.182.0/23',
                         '143.233.184.0/22', '143.233.188.0/23', 
                         '143.233.204.0/24'],

     'aueb.gr':	        ['195.251.255.0/24', '2001:648:2020::/48'],

     'auth.gr':	        ['155.207.0.0/16', '2001:648:2800::/48'],

     'cti.gr':	        ['150.140.0.0/17'],

     'duth.gr':	        ['192.108.114.0/24', '193.92.204.0/22', 
                         '193.92.208.0/20', '193.92.224.0/22', 
                         '193.92.236.0/22', '193.92.240.0/21', 
                         '193.92.248.0/22', '195.130.122.0/24',
                         '2001:648:2E80::/48'],

     'edunet.gr':   	['195.134.100.0/26'],

     'ekt.gr':	        ['194.177.214.0/23'],

     'teicrete.gr': 	['193.92.8.0/22', '83.212.45.0/24', 
                         '83.212.46.0/23', '2001:648:2C10::/48'],

     'hua.gr':	        ['83.212.240.0/23', '83.212.242.0/24', 
                         '195.130.90.0/23', '195.251.30.0/23', 
                         '83.212.240.0/23', '83.212.242.0/24', 
                         '195.130.90.0/23', '195.251.30.0/23'],

     'ntua.gr':	        ['147.102.0.0/16', '2001:648:2000::/48', 
                         '2001:648:2001::/48'],

     'teiath.gr':	    ['195.130.96.0/20', '83.212.64.0/22',
                         '2001:648:2E00::/48'],

     'chania.teicrete.gr':	    ['194.177.198.0/24'],

     'teimes.gr':	    ['194.177.216.0/24'],

     'teiser.gr':	    ['195.130.67.0/24'],

     'tuc.gr':	        ['147.27.0.0/16', '194.177.198.0/24', 
                         '147.27.0.0/16', '194.177.198.0/24'],

     'uoc.gr':      	['147.52.0.0/16', '192.103.20.0/24', 
                         '194.177.197.0/24', '2001:648:2C00::/48'],

     'uoa.gr':	        ['84.38.0.0/20', '87.239.232.0/21', 
                         '88.197.0.0/17', '195.130.123.0/24', 
                         '195.134.64.0/18'],

     'uoi.gr':	        ['83.212.192.0/21', '83.212.200.0/23', 
                         '195.130.112.0/21', '195.130.120.0/23', 
                         '195.251.192.0/21', '195.251.200.0/23'],

     'uop.gr':	        ['195.251.38.0/23', '195.251.46.0/23', 
                         '195.251.112.0/23', '195.251.38.0/23', 
                         '195.251.46.0/23', '195.251.112.0/23'],

     'upatras.gr':	    ['150.140.0.0/16', '195.251.54.128/25'],

     'uth.gr':	        ['83.212.32.0/22', '83.212.34.0/23', 
                         '83.212.43.0/24', '194.177.200.0/21', 
                         '195.251.17.0/24', '195.251.18.0/23'],

}

def urldecode(string):
    urlenc = re.compile(r'%([0-9a-fA-F]{2})')
    return urlenc.sub(lambda x: chr(int(x.group(1), 16)), string)

def getUserRealm(ipaddr):
    ip = IP(ipaddr)

    # First try the address ranges:
    for scope, ranges in ipspaces.items():
        if filter(lambda x: ip.overlaps(x), ranges):
            return scope

    # Then try DNS
    revip = IP(ipaddr).reverseName()
    DNS.ParseResolvConf()
    req = DNS.DnsRequest(name=revip, qtype='PTR')
    res = req.req()
    if res.answers:
        return res.answers[0]['data']
    
