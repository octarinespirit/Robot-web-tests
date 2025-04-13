"""Module to check DNS records"""
import dns.resolver
import dns.reversename

def get_dns_record(domain, record):
    """Fetches the DNS record for a given domain and record type from Google's nameserver"""
    resolver = dns.resolver.Resolver()
    resolver.nameservers = ["8.8.8.8"]
    try:
        response = resolver.resolve(domain, record)
        return [rdata.to_text() for rdata in response]
    except (dns.resolver.NoAnswer, dns.resolver.NXDOMAIN, dns.exception.Timeout) as e:
        return "Something went wrong, could not get the record. Error: ", str(e)

def check_reverse_name(ip):
    """Check's the given ip address' reverse name, the domain name"""
    for address in ip:
        try:
            rev_name = dns.reversename.from_address(address)
            print(rev_name)
            return rev_name
        except:
            print("Something went wrong")
            return "Error"
