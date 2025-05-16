#!/bin/bash

# Setup script for FIT.py

set -e

echo "Installing Python"
sudo apt update
sudo apt install python3.12-venv
sudo apt install python3-requests-toolbelt
sudo apt install python3-click python3-requests python3-requests-toolbelt python3-selenium

echo "Creating FIT directory and switching to it"
sudo mkdir FIT/
cd FIT/

echo "Creating requirements.txt file"
sudo touch requirements.txt
sudo chmod 777 requirements.txt
sudo cat <<EOF > requirements.txt
click>=8.0
requests>=2.28
selenium>=4.10
requests-toolbelt>=0.10
EOF

echo "Creating appctrl.csv file"
sudo touch appctrl.csv
sudo chmod 777 appctrl.csv
sudo cat <<EOF > appctrl.csv
https://www.facebook.com
https://www.ringcentral.com
http://192.168.100.10
https://www.dropbox.com
https://www.salesforce.com
https://www.twitter.com
https://zoom.us/
https://www.amazon.com
http://192.168.100.10
https://youtube.com
https://www.salesforce.com
https://www.pinterest.com
http://55.55.55.55:8080
https://www.ringcentral.com
https://www.pinterest.com
https://www.eharmony.com
https://www.amazon.com
https://www.salesforce.com
https://www.pinterest.com
https://www.dropbox.com
https://youtube.com
http://192.168.100.10
https://zoom.us/
https://youtube.com
https://www.ringcentral.com
https://mail.google.com
http://55.55.55.55:8080
https://zoom.us/
https://www.salesforce.com
https://www.pinterest.com
https://www.yahoo.com
https://www.gotomeeting.com
https://www.ringcentral.com
https://www.amazon.com
http://192.168.100.10
https://www.salesforce.com
https://www.pinterest.com
https://www.facebook.com
https://zoom.us/
https://youtube.com
https://zoom.us/
https://www.dropbox.com
https://youtube.com
http://55.55.55.55:8080
https://www.salesforce.com
https://zoom.us/
http://192.168.100.10
https://www.ringcentral.com
https://www.twitter.com
https://www.dropbox.com
https://www.facebook.com
https://zoom.us/
http://55.55.55.55:8080
https://www.facebook.com
https://youtube.com
https://youtube.com
https://www.ringcentral.com
https://www.facebook.com
https://www.facebook.com
http://192.168.100.10
https://www.salesforce.com
https://www.eharmony.com
https://www.pinterest.com
http://55.55.55.55:8080
https://zoom.us/
http://192.168.100.10
https://www.ringcentral.com
https://www.pinterest.com
https://mail.google.com
https://www.facebook.com
https://www.dropbox.com
https://www.facebook.com
https://www.salesforce.com
https://youtube.com
http://192.168.100.10
https://www.ringcentral.com
https://www.pinterest.com
EOF

echo "Creating goodurl.csv file"
sudo touch goodurl.csv
sudo chmod 777 goodurl.csv
sudo cat <<EOF > goodurl.csv
google.com
youtube.com
facebook.com
baidu.com
yahoo.com
wikipedia.org
amazon.com
twitter.com
qq.com
google.co.in
taobao.com
live.com
google.co.jp
linkedin.com
sina.com.cn
instagram.com
weibo.com
bing.com
yahoo.co.jp
msn.com
google.de
hao123.com
vk.com
reddit.com
google.co.uk
yandex.ru
t.co
google.ru
google.fr
ebay.com
gmw.cn
google.com.br
pinterest.com
360.cn
tmall.com
netflix.com
sohu.com
mail.ru
google.it
amazon.co.jp
onclickads.net
google.es
microsoft.com
tumblr.com
paypal.com
chinadaily.com.cn
wordpress.com
blogspot.com
imgur.com
stackoverflow.com
github.com
naver.com
apple.com
xvideos.com
aliexpress.com
google.com.mx
imdb.com
whatsapp.com
google.com.hk
pornhub.com
google.co.kr
google.ca
fc2.com
youth.cn
xhamster.com
blogger.com
ok.ru
soso.com
amazon.in
google.com.tr
163.com
google.co.id
office.com
craigslist.org
jd.com
amazon.de
google.pl
rakuten.co.jp
xinhuanet.com
cnn.com
booking.com
dropbox.com
nicovideo.jp
google.com.au
popads.net
alibaba.com
pixnet.net
diply.com
cntv.cn
google.com.tw
quora.com
googleusercontent.com
amazon.co.uk
youku.com
outbrain.com
microsoftonline.com
360.com
bbc.co.uk
twitch.tv
coccoc.com
adobe.com
bongacams.com
wikia.com
haosou.com
bilibili.com
ask.com
bbc.com
chase.com
alipay.com
isanalyze.com
nytimes.com
google.com.eg
google.com.pk
google.com.sa
google.co.th
google.com.ar
sogou.com
adf.ly
myway.com
google.nl
flipkart.com
salesforce.com
txxx.com
ettoday.net
zhihu.com
dailymail.co.uk
livedoor.jp
daum.net
ebay.co.uk
amazon.cn
china.com.cn
godaddy.com
china.com
indiatimes.com
xnxx.com
ebay.de
dailymotion.com
go.com
bankofamerica.com
terraclicks.com
soundcloud.com
walmart.com
detail.tmall.com
amazonaws.com
buzzfeed.com
huffingtonpost.com
vimeo.com
indeed.com
stackexchange.com
theguardian.com
EOF

echo "Creating malware_urls.csv file"
sudo touch malware_urls.csv
sudo chmod 777 malware_urls.csv
sudo cat <<EOF > malware_urls.csv
deeploud.net
unrightswire.org
1ozbn171tq4rgqxwqkdips2fim.biz
abebezelekeinternationalhotel.com
predisappointment.assistedlivinghomecareoregon.com
pintadosdeazul.com.ar
246233.com
vaohiy.cn
263253.com
blog.dupen.co.il
turboman.pe.kr
14wktc4120822cq29vb2le8vcu.net
llliii.net
www.sanrankiprudentialsuit.icecasino.uk
airways.mobi
update.isdr4lus41qv.com
amelina.teeth-statue996.ru
s69taq1s8115sdbx31t1detp4q.net
tqa83x7dtvwk14ur0ubsrfkwk.net
www.daiha.com
itsolutionsllc.info
pcmcontech.com.sg
envelopeson.com
1e5a1r91ayj0ircbv54w1eedgi9.org
knot-hatesongs.ru
ehevhrbhjgsqm.period-though.ru
carambolasuperteam.cityandprovincial.london
believeinmiracles.com
2eb2e5197b.windtiregoal.ru
www.888544.com
adcakx.cn
bjmzw.net
redtube2.cc
9fd6d2j.m621p.6080.33.idf31902.0d40q.a61af7v.b8n2mw30.digitman.link
virus-concern.com
zomato.pt
murrayandjack.com
scan95.ponn.co.cc
1qpgqqx1dewlxy1uygnnise5c3h.org
152mmaa1jhypg0bqymu3bo03yo.biz
dishdallas.com
realestatelondon.co.uk
new.mycospon.com
bilgenaslan.com
gossipage3.blogspot.com
xmpenglong.com
14yx72d7xc5ofw6mo0q17s1uv6.com
musicalypse.com
www.sz-showa.com
9-5-1-1-7-7-3-8-3-7-5-4-2-9-1-2-1-2-2-3-5-5-1-6-3-8-3-6-4-3-3-.0-0-0-0-0-0-0-0-0-0-0-0-0-17-0-0-0-0-0-0-0-0-0-0-0-0-0.info
smallbusinessgrowing.com
congresso.fpasurdos.pt
pysghrdimjhkrugbqgycm.com
xunuosvuakakp.lonelybeer.ru
gjiaccereizagreba.topicast.net
85.25.41.95
quatrefoil.korsa.us
db36956cffabedf5af0a70aae8ec897a8e.ws
m.wowano.com
tt915.com
imtex.org
www.xiaomi.co
lfrcyxdyhetknfrchmnhjzpjst.biz
djssr.link
thenawayk.cf
xnwlpt.com
toowherez.cf
taodiewang.net
sheppardsecurity.com
mockup.asia
werehighallthetime.com
hitlet.ru
l0086qpn.com
9ae5484316.linksmile.ru
coverletter.us
qqfltwv.loan
www.gmi88.com
runn.serverp2p.ru
p5cobpnpz2ihuuzcmn3t9j7g.com
www.wlcox.link
vyzjdplafobxixp.assassinbeneath.ru
maskiertmartesana.shetlandyarn.com
xpbhiuchazzdayibtwbexcpbmrguw.net
indianweddingstyles.com
www.my3daydetox.info
www.360baxi.com
132r4zp18tqz1ktk0yg6kj4y2p.org
fireplastic.com
aurangabadinfonews.com
scan6.mostgalo.co.cc
palachicola.clubdeadly.ru
tjvwmkmhvti.height-suppose.ru
yktwg.win
tdel.pseadzcb.top
jrguukamhdqojvpeqkbtjb.biz
svmywc.loan
d3v7pynkiayd1trks8a1va5c2h.net
yzvijfhzqli.seizeitemperfect.ru
www.thyto.link
gestioncompta.com
applyforbankaccountonline.xyz
celesta-spb.ru
x0ditg1vnblc91cpevu21xg5in6.biz
1mnuwvv1bxiic9refyzhmgtkdz.com
sellec.tk
jeansowghtqq.com
www.lalgudigjrkrishnan.com
m57op4m.ed6zede.top
www.idcrom.cn
0452luntan.com
www.tritonship.com
hitqrq.cn
www.18andundermd.com
willdelgado.com
politeness.3eeweb.com
m1m4.com
agoinside.gq
www.bmhoe.link
iwaredistribution.co.uk
negahtofigh.blogspot.al
huilidiban.com
backforteam.com.br
createanddonate.org
luroweb.sk
lhlhu.nowtomorrow.top
www.wuseng.com
pulllorry.link
itourongbao.com
ueewtl.loan
taiwanlaoyule.com.cn
www.homebestbusiness.com
interoceanica.com.br
dalotto.com
mgz3nd.faststorageonline.com
download1275.downloadlsdir.com
www.kanrenti.net
jpebefno.pinklike.top
montagu-events.co.uk
kkmunhflzgfkkyqs9.com
consultoradealimentos.com.br
currentfactorybest.com
vornot.blogspot.com
1dk1cf11tfkdmibl0sskvsxo5e.com
noncorinletoffzijtje.theunitarypatent.co.uk
tineser.narod.ru
www.xn--ksen-bruktbil-pfb.com
buonomabuono.com
zzyy99.com
actualvirtual.co.uk
ypzbv6gk.top
fleree.test.mediapark.lt
tts-tn.com
acymart.com
lm0ne61g02zsgd7y2ppfkyqmk.net
onlytheni.tk
almostthus.cf
creditmanme.com
neibet-360.ddns.net
www.iphone.iosbz.top
green9.jvibgsez.ru
0306737775.win
osteriailgambero.it
everalwayse.ga
sxajfq.com
www.nsmw.mamaskonacoffee.com
www.techdeepak.co.cc
cswsyp.com
connect-expedition.com
mezhgorie.ru
online.citi.com.ic3i3cxrt2.ignition3.tv
mail.40thousandwords.com
www.baolairuyimenye.com
constanceethelbert.net
xic9c69.top
uxexe.loan
ztoxywpbelt7.hanghieu247.com
chopper.bludicka-luhacovice.cz
www.channelcom.co.ls
update1.ovwejcyi7o.com
ofywxjggemio.biz
ancret4564.3eeweb.com
eukqfqodkupbrtp.wadechipchoice.ru
uytbixfmgiscibpnamhyltwjv.com
corolbugan.com
tjafrocosmetics.com
beheutsi.ru
apple-ituncs-ios.com
online.citibank.com.hpbgchp9if.ignition3.tv
bcwnukvjhnvygp.repeat-chief.ru
breezesteez.com
1sty7jepixya01bq04bx1wkk8zo.org
hydpq.com.cn
www.zinomp3.com
cyqxx.link
10yi6bh1fvlx3mt260kix2924l.net
zhongxuesheng.net
xuouzaibqzdi.rubber-whole.ru
tularebankruptcylawyer.com
ukgwx.link
dlgrabtowers.com
itop30.com
ymvqhnwertoi.attachskyassure.ru
exampaperssg.com
675ee.asia
1nsa23vkex4nzek71ylvr40k7.biz
sey.beltbinbelts.com
www.pechrnmc.org.ua
onceasz.tk
www.arkaanproperties.com
www.fusionwindows.com
yhgl2ahxfhaacv45st1qwd8ex.net
dtlyx.link
yantarny.net
024student.com
bip.whollynatural.me
tboy23101building.com
zkqssbvv.homemedicativeinc.ru
sebastien-gillmann.fr
qh505.com
118.171.94.192
stupidgirl.blogdrive.com
www.xn--l3cgic6bwb6ctd.com
71831.loan
mnyuab.cn
1415mkbh3xir51g4v42mahng3w.net
report.5k5555c5sk5yws5.com
afterusual.net
www.safeonlinemailing.co
loveyoudo.com
ekakkshar.com
stillquite.gq
chgedu.com
80txt.org
www.chinadtce.com
ojwn0q1gz6vfp1aflcttvrvz5j.com
60176.loan
www.xieetuans.com
dlmdsqilpjtp.wadechipchoice.ru
tjtmd.link
www.blissyogawithannu.com
www.parathaking.ae
01gtf.org
www.love4you.co.il
zhanhuo.help
www.cialdepertorta.it
www.paypal1.com.case.569-134-255.wgj7xuax8huyc.yuamyymgxh.com.ve
fxespanol.info
dotech.ca
magreen.no-ip.org
vynaa.com
EOF

echo "Creating FIT.py file"
sudo touch FIT.py
sudo chmod 777 FIT.py
sudo cat <<EOF > FIT.py
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import click
import requests
import requests_toolbelt
#import telnetlib
import socket
import random
import os
from requests.packages.urllib3.exceptions import InsecureRequestWarning
from selenium import webdriver
import selenium
import platform

# disable warnings in requests for cert bypass
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

__version__ =  1

# some console colours
W = '\033[0m'  # white (normal)
R = '\033[31m'  # red
G = '\033[32m'  # green
O = '\033[33m'  # orange
B = '\033[34m'  # blue
P = '\033[35m'  # purple
C = '\033[36m'  # cyan
GR = '\033[37m'  # gray

if platform.system() == "Windows":
	W = ''  # white (normal)
	R = ''  # red
	G = ''  # green
	O = ''  # orange
	B = ''  # blue
	P = ''  # purple
	C = ''  # cyan
	GR = ''  # gray



def banner():
    '''Print stylized banner'''
    print(r"""
TRAFFIC GENERATOR
Firewall Inspection Tester
Author: Fortinet Federal CSA Team""")
    print("Version: %0.2f\n" % __version__)

def test_port(ip, port=443, timeout=1):
    try:
        with socket.create_connection((ip, port), timeout=timeout):
            return True
    except (socket.timeout, socket.error, ConnectionRefusedError):
        return False


def checkconnection():
    ''' check network connection '''
    try:
        r = requests.get("https://www.google.ca", verify=False)
    except:
        return False
    else:
        return True


def checkips(srcip):
    for ipaddr in srcip:
        try:
            socket.inet_aton(ipaddr)
            print(G + "[+] " + W + "Source IP Address " + ipaddr)
        except socket.error:
            print(R + "[-] " + W + "IP Address " + ipaddr + " is not valid")
            exit(-1)

def setsrcip(srcip):
    ''' Set a random source ip from a list '''
    ip = random.choice(srcip)
    s = requests.Session()
    s.mount("http://", requests_toolbelt.adapters.source.SourceAddressAdapter(ip))
    s.mount("https://", requests_toolbelt.adapters.source.SourceAddressAdapter(ip))
    return s


@click.group(chain=True)
def cli():
    banner()
    if checkconnection():
        print(G + "[+] " + W + "Network connection is okay")
    else:
        print(R + "[!] " + W + "Network connection failed")
        print(R + "[!] " + W + "Please verify the network connection")
        exit(-1)


@cli.command()
@click.option('--repeat/--no-repeat', default=False)
@click.option('--srcip', '-s', multiple=True)
def all(repeat, srcip):
    '''Run all test one after the other'''
    checkips(srcip)
    if repeat:
        print(G + "[+] " + W + "Repeat, repeat, repeat...")

    while True:
        _iprep(srcip)
        _vxvault(srcip)
        _malwareurls(srcip)
        _appctrl()
        _webtraffic()
        if repeat == False:
            exit()


@cli.command()
@click.option('--srcip', '-s', multiple=True)
def iprep(srcip):
    '''IP Reputation test using zeustracker uiplist'''
    checkips(srcip)
    _iprep(srcip)


def _iprep(srcip):
    '''IP Reputation test using zeustracker uiplist'''
    # https://zeustracker.abuse.ch/blocklist.php?download=badips
    print(G + "[+] " + W + "IP Reputation Test")
    print(G + "[+] " + W + "Fetching bad ip list...", end=" ")
    r = requests.get("https://zeustracker.abuse.ch/blocklist.php?download=badips", verify=False)
    print("Done")

    # clean up list
    data2 = []
    data = r.text.split("\n")
    for line in data:
        if len(line) > 1:
            if line[0] != "#":
                data2.append(line)
    data = data2

    with click.progressbar(data) as ips:
        for ip in ips:
            try:
                tn = telnetlib.Telnet(ip, 443, 1)
            except (socket.timeout, socket.error, ConnectionRefusedError):
                pass


@cli.command()
@click.option('--srcip', '-s', multiple=True)
def vxvault(srcip):
    '''Malware samples download from vxvault'''
    checkips(srcip)
    _vxvault(srcip)


def _vxvault(srcip):
    '''Malware samples download from vxvault'''
    # http://vxvault.net/URL_List.php
    print(G + "[+] " + W + "VX Vault Malware Downloads")
    print(G + "[+] " + W + "Fetching VXVault list...", end=" ")
    r = requests.get("http://vxvault.net/URL_List.php", timeout=10)
    print("Done")

    if len(srcip) > 0:
        print(G + "[+] " + W + "Multi source IP mode enabled")

    # clean up list
    data2 = []
    data = r.text.split("\r\n")
    for line in data:
        if len(line) > 1:
            if line[0] == "h":
                data2.append(line)
    data = data2
    with click.progressbar(data) as urls:
        for url in urls:
            try:
                if len(srcip) > 0:
                    r = setsrcip(srcip).get(url, timeout=1)
                else:
                    r = requests.get(url, timeout=1)
            except requests.exceptions.RequestException:
                pass


@cli.command()
@click.option('--srcip', '-s', multiple=True)
def malwareurls(srcip):
    '''  Malware URl/Domain test '''
    checkips(srcip)
    _malwareurls(srcip)


def _malwareurls(srcip):
    '''  Malware URl/Domain test '''
    # http://www.malwaredomainlist.com/mdlcsv.php
    print(G + "[+] " + W + "Malware URL Downloads")
    print(G + "[+] " + W + "Fetching Malware URL list...", end=" ")
    # r = requests.get("http://vxvault.net/URL_List.php", timeout=1)
    f = open("malware_urls.csv", 'r')
    lines = f.read()
    print("Done")

    if len(srcip) > 0:
        print(G + "[+] " + W + "Multi source IP mode enabled")

    lines = lines.split("\n")
    with click.progressbar(lines) as urls:
        for url in urls:
            try:
                if len(srcip) > 0:
                    r = setsrcip(srcip).get(("http://" + url), timeout=1)
                else:
                    r = requests.get(("http://" + url), timeout=1)
            except requests.exceptions.RequestException:
                pass


@cli.command()
def appctrl():
    ''' Trigger application control '''
    _appctrl()


def _appctrl():
    ''' Trigger application control '''
    print(G + "[+] " + W + "Application Congtrol")
    print(G + "[+] " + W + "Fetching AppCtrl list...", end=" ")
    # r = requests.get("http://vxvault.net/URL_List.php", timeout=1)
    f = open("appctrl.csv", 'r')
    lines = f.read()
    print("Done")

    lines = lines.split("\n")
    with click.progressbar(lines) as urls:
        for url in urls:
            try:
                r = requests.get(url, timeout=1)
            except requests.exceptions.RequestException:
                pass


@cli.command()
def wf():
    '''  URL categorisation trigger '''
    _wf()


def _wf():
    '''  URL categorisation trigger '''
    # http://www.malwaredomainlist.com/mdlcsv.php
    print(G + "[+] " + W + "WF categorisation trigger")
    print(G + "[+] " + W + "Fetching URL list...", end=" ")
    # r = requests.get("http://vxvault.net/URL_List.php", timeout=1)
    f = open("wf.csv", 'r')
    lines = f.read()
    print("Done")

    lines = lines.split("\n")
    with click.progressbar(lines) as urls:
        for url in urls:
            try:
                r = requests.get(url, timeout=1)
            except requests.exceptions.RequestException:
                pass

def read_list_from_file(filename):
    if not os.path.exists(filename):
        print(R + f"[-] Missing file: {filename}")
        return []
    with open(filename, "r") as f:
        return [line.strip() for line in f if line.strip()]


@cli.command()
def webtraffic():
    ''' Generate good web traffic '''
    _webtraffic()


def _webtraffic():
    from selenium.webdriver.chrome.options import Options
    from selenium.common.exceptions import WebDriverException

    options = Options()
    options.headless = True
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-gpu")
    options.add_argument("--disable-dev-shm-usage")

    try:
        driver = webdriver.Chrome(options=options)
    except WebDriverException as e:
        print(R + "[-] Failed to launch headless Chrome: " + str(e))
        return

    driver.set_window_size(1920, 1080)
    driver.set_page_load_timeout(10)

    print(G + "[+] " + W + "Web traffic trigger")
    print(G + "[+] " + W + "Fetching traffic list...", end=" ")
    urls = read_list_from_file("goodurl.csv")
    print("Done")

    with click.progressbar(urls) as links:
        for url in links:
            try:
                driver.get("http://" + url)
            except KeyboardInterrupt:
                raise
            except:
                pass

    driver.quit()


if __name__ == '__main__':
    cli()
EOF

echo "Creating repeatFIT.py file"
sudo touch repeatFIT.py
sudo chmod 777 repeatFIT.py
sudo cat <<EOF > repeatFIT.py
#!/bin/sh

while [ 1 ] ; do
    ./FIT.py appctrl
done
EOF


echo "Cleaning up old virtual environment (if any)..."
sudo rm -rf venv

echo "Fixing permissions on ~/FIT..."
sudo chown -R "$USER:$USER" "$(pwd)"

echo "Creating new virtual environment..."
python3 -m venv venv

echo "Activating virtual environment and upgrading pip..."
source venv/bin/activate
pip install --upgrade pip

echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

echo ""
echo "✅ Setup complete!"
echo "To activate your environment manually, run:"
echo "    source venv/bin/activate"
echo ""
echo "To run the tool:"
echo "    python FIT.py all --srcip <your-ip>"
