Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EB0E59E8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 13:16:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470dhV10J3zDqh2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 22:16:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=huawei.com;
 envelope-from=bobo.shaobowang@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 945 seconds by postgrey-1.36 at bilbo;
 Sat, 26 Oct 2019 18:39:24 AEDT
Received: from huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470XtN6kcJzDqmC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 18:39:23 +1100 (AEDT)
Received: from dggemi401-hub.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 2421DBC442EA0C8A5A64;
 Sat, 26 Oct 2019 15:23:29 +0800 (CST)
Received: from DGGEMI529-MBS.china.huawei.com ([169.254.5.149]) by
 dggemi401-hub.china.huawei.com ([10.3.17.134]) with mapi id 14.03.0439.000;
 Sat, 26 Oct 2019 15:23:22 +0800
From: "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
Subject: loop nesting in alignment exception and machine check
Thread-Topic: loop nesting in alignment exception and machine check
Thread-Index: AdWLzOb7zyHoVFoiQIWRpEOzZEjVLw==
Date: Sat, 26 Oct 2019 07:23:22 +0000
Message-ID: <D44062DC474617438D5181ADFE2B2C21016DE42A@dggemi529-mbs.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.184.195.37]
Content-Type: multipart/related;
 boundary="_004_D44062DC474617438D5181ADFE2B2C21016DE42Adggemi529mbschi_";
 type="multipart/alternative"
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 26 Oct 2019 22:12:01 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "alistair@popple.id.au" <alistair@popple.id.au>,
 "chengjian \(D\)" <cj.chengjian@huawei.com>, Xiexiuqi <xiexiuqi@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "oss@buserror.net" <oss@buserror.net>,
 "Wangshaobo \(bobo\)" <bobo.shaobowang@huawei.com>,
 "paulus@samba.org" <paulus@samba.org>,
 "Libin \(Huawei\)" <huawei.libin@huawei.com>, "agust@denx.de" <agust@denx.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_004_D44062DC474617438D5181ADFE2B2C21016DE42Adggemi529mbschi_
Content-Type: multipart/alternative;
	boundary="_000_D44062DC474617438D5181ADFE2B2C21016DE42Adggemi529mbschi_"

--_000_D44062DC474617438D5181ADFE2B2C21016DE42Adggemi529mbschi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
I encountered a problem about a loop nesting occurred in manufacturing the =
alignment exception in machine check, trigger background is :

problem:
machine checkout or critical interrupt ->...->kbox_write[for recording last=
 words] -> memcpy(irremap_addr, src,size):_GLOBAL(memcpy)...
when we enter memcpy,a command 'dcbz r11,r6' will cause a alignment excepti=
on, in this situation,r11 loads the ioremap address,which leads to the alig=
nment exception,
then the command can not be process successfully,as we still in machine che=
ck.at the end ,it triggers a new irq machine check in irq handler function,=
a loop nesting begins.

analysis:
We have analysed a lot,but it still can not come to a reasonable descriptio=
n,in common,the alignment triggered in machine check context can still be c=
ollected into the Kbox
after alignment exception be handled by handler function, but how does the =
machine checkout can be triggered in the handler fucntion for any causes? W=
e print relevant registers
as follow when first enter machine check and alignment exception handler fu=
nction:
         MSR:0x2      MSR:0x0
         SRR1:0x2      SRR1:0x21002
         But the manual says SRR1 should be set to MSR(0x2),why that happen=
ed ?
         [cid:image001.jpg@01D58C0D.E496CFD0]
         Then a branch in handler function copy the SRR1 to MSR,this enble =
MSR[ME] and MSR[CE],system collapses.

Conclusion:
         1)  why the alignment exception can not be handled in machine chec=
k ?
         2)  besides memcpy,any other function can cause the alignment exce=
ption ?

We still recurrent it, the line as follows:
         Cpu dead lock->watch log->trigger fiq->kbox_write->memcpy->alignme=
nt exception->print last words.
         but for those problems as below,what the kbox printed is empty.
------------------kbox restart:[   10.147594]----------------
kbox verify fs magic fail
kbox mem mabye destroyed, format it
kbox: load OK
lock-task: major[249] minor[0]
-----start show_destroyed_kbox_mem_head----
00000000: 00000000 00000000 00000000 00000000  ................
00000010: 00000000 00000000 00000000 00000000  ................
00000020: 00000000 00000000 00000000 00000000  ................
00000030: 00000000 00000000 00000000 00000000  ................
00000040: 00000000 00000000 00000000 00000000  ................
00000050: 00000000 00000000 00000000 00000000  ................
00000060: 00000000 00000000 00000000 00000000  ................
00000070: 00000000 00000000 00000000 00000000  ................
00000080: 00000000 00000000 00000000 00000000  ................
00000090: 00000000 00000000 00000000 00000000  ................


--_000_D44062DC474617438D5181ADFE2B2C21016DE42Adggemi529mbschi_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@\5B8B\4F53";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">I =
encountered a problem about a loop nesting occurred in manufacturing the al=
ignment exception in machine check, trigger background is :<span style=3D"c=
olor:#1F497D"><o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">problem=
:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">ma=
chine checkout or critical interrupt -&gt;&#8230;-&gt;kbox_write[for record=
ing
<span style=3D"color:black">last words] -</span>&gt; memcpy(irremap_addr, s=
rc,size):_GLOBAL(memcpy)&#8230;<span style=3D"color:#1F497D"><o:p></o:p></s=
pan></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">wh=
en we enter memcpy,a command &#8216;dcbz r11,r6&#8217; will cause a alignme=
nt exception, in this situation,r11 loads the ioremap address,which leads t=
o the alignment exception,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">then the command can not be pro=
cess successfully,as we still in machine check.at the end ,it triggers a ne=
w irq machine check in irq handler function,a loop nesting begins.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">analysi=
s:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">We=
 have analysed a lot,but it still can not come to a reasonable description,=
in common,the alignment triggered in machine check context can still be col=
lected into the Kbox
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">after alignment exception be ha=
ndled by handler function, but how does the machine checkout can be trigger=
ed in the handler fucntion for any causes? We print relevant registers
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">as follow when first enter mach=
ine check and alignment exception handler function:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; MSR:0x2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSR:0x0<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; SRR1:0x2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SRR1:0x21002<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; But the manual says SRR1 should be set to MSR(0x2),why th=
at happened ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <img width=3D"500" height=3D"123" id=3D"_x0000_i1029" src=
=3D"cid:image001.jpg@01D58C0D.E496CFD0"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; Then a branch in handler function copy the SRR1 to MSR,th=
is enble MSR[ME] and MSR[CE],system collapses.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#2F5597;mso-styl=
e-textfill-fill-color:#2F5597;mso-style-textfill-fill-alpha:100.0%">Conclus=
ion:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 1)&nbsp; why the alignment exception can not be handled i=
n machine check ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 2)&nbsp; besides memcpy,any other function can cause the =
alignment exception ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <span style=3D"color:#1F497D"><o:p></o:p></span></span></=
p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">We=
 still recurrent it, the line as follows:<span style=3D"color:#1F497D"><o:p=
></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; Cpu dead lock-&gt;watch log-&gt;trigger fiq-&gt;kbox_writ=
e-&gt;memcpy-&gt;alignment exception-&gt;print last words.<span style=3D"co=
lor:#1F497D"><o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; but for those problems as below,what the kbox printed is =
empty.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">------------------kbox restart:=
[&nbsp;&nbsp; 10.147594]----------------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">kbox verify fs magic fail<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">kbox mem mabye destroyed, forma=
t it<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">kbox: load OK<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lock-task: major[249] minor[0]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-----start show_destroyed_kbox_=
mem_head----<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">00000000: 00000000 00000000 000=
00000 00000000&nbsp; ................<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">00000010: 00000000 00000000 000=
00000 00000000&nbsp; ................<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">00000020: 00000000 00000000 000=
00000 00000000&nbsp; ................<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">00000030: 00000000 00000000 000=
00000 00000000&nbsp; ................<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">00000040: 00000000 00000000 000=
00000 00000000&nbsp; ................<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">00000050: 00000000 00000000 000=
00000 00000000&nbsp; ................<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">00000060: 00000000 00000000 000=
00000 00000000&nbsp; ................<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">00000070: 00000000 00000000 000=
00000 00000000&nbsp; ................<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">00000080: 00000000 00000000 000=
00000 00000000&nbsp; ................<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">00000090: 00000000 00000000 000=
00000 00000000&nbsp; ................<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_D44062DC474617438D5181ADFE2B2C21016DE42Adggemi529mbschi_--

--_004_D44062DC474617438D5181ADFE2B2C21016DE42Adggemi529mbschi_
Content-Type: image/jpeg; name="image001.jpg"
Content-Description: image001.jpg
Content-Disposition: inline; filename="image001.jpg"; size=11935;
	creation-date="Sat, 26 Oct 2019 07:23:21 GMT";
	modification-date="Sat, 26 Oct 2019 07:23:21 GMT"
Content-ID: <image001.jpg@01D58C0D.E496CFD0>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMg
IyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCAB7AfQDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD2KLoa
fTIuhp9ABRilooASilooASilooATFGKWigBMUUtFACUUtFACUUtJQAVWk1KximMMt5bJKCBsaVQ2
T04zVk1yPiHRVm8T2d9DpaXDJaXBZxEuTJhdgLEdcjgmgDrGkRCoZ1UscKCcZPoKBIhkMYdS4GSu
eQPpXmCWetym2+32+rywQ3sUw2bjKgMLh8EnP3iB/KpPsfiVFad4bvzJIrdZ3XPmtEGkyMrzuAKZ
xzQB6RcXMFrH5lzNHCmcbpGCjP1NOiminiEkMiSRt0ZGBB/Guamgvn8BiO8tvt2oeXhFmhDHcThW
KnPIByfpVmLRJrTTf7JgSBNKS1MYEbOsxfvyOME/zoA15b+0hEbS3UEYk+4WkA3fT1qxXnEmkahD
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
4FH2eH/njF/3wKAJMg8jpRSCigD/2Q==

--_004_D44062DC474617438D5181ADFE2B2C21016DE42Adggemi529mbschi_--
