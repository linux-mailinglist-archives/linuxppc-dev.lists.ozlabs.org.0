Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B65316DCF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 01:24:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zG064SFFzDqPM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 09:24:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=windriver.com
 (client-ip=147.11.146.13; helo=mail1.windriver.com;
 envelope-from=pablo.rodriguez-quesada@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=windriver.com
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zCvn48VQzDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 07:50:27 +1000 (AEST)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x47LoJ6R011253
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Tue, 7 May 2019 14:50:20 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.163]) by
 ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0439.000; Tue, 7
 May 2019 14:50:19 -0700
From: "Rodriguez Quesada, Pablo" <Pablo.Rodriguez-Quesada@windriver.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: IPIC_SERMR vs IPIC_SERMR
Thread-Topic: IPIC_SERMR vs IPIC_SERMR
Thread-Index: AdUFGKVoyl91wemYQnSiBoky/o4FAA==
Date: Tue, 7 May 2019 21:50:19 +0000
Message-ID: <0CDD4071D6ACF54ABB9CF1A6D90375A809BAF4E4@ALA-MBD.corp.ad.wrs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.119.215]
Content-Type: multipart/alternative;
 boundary="_000_0CDD4071D6ACF54ABB9CF1A6D90375A809BAF4E4ALAMBDcorpadwrs_"
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 May 2019 09:23:20 +1000
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
Cc: "Ramirez Rojas, Luis Daniel \(Daniel\)" <Daniel.RamirezRojas@windriver.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_0CDD4071D6ACF54ABB9CF1A6D90375A809BAF4E4ALAMBDcorpadwrs_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Christophe and everyone from the LinuxPPC community,

Hope you are doing well!
I was working with Daniel, and we were reviewing the ipic source code and c=
ame to these questions:


1.       The first one came up while reviewing the document "Understanding =
IPIC" from NXP (*). The document states that:

System Error Status Register (SERSR) - 0x40: Each bit in the SERSR register=
 corresponds to a non-maskable error source that generates a machine check =
exception (MCP). These bits are cleared by writing the bit location with a =
logic 1.

The interrupting source must be cleared before clearing the interrupts erro=
r status bit.

System Error Mask Register (SERMR) - 0x44 When a machine check exception is=
 signaled from one of the peripheral modules, its corresponding flag bit in=
 this register is set. Any of the interrupting sources can be individually =
masked.

We noticed that you changed the ipic_clear_mcp_status  function by swapping=
 SERMR to SERSR, but we don't fully understand why. Could you please elabor=
ate on why this change is made? This because we had a code that was working=
 before the patch and we would fully understand why it stopped working. Fro=
m our perspective, both SERSR and SERMR are related to MCEs and honestly do=
n't know what's the difference at the hardware level, and the role of every=
 register on the machine check flow. It is also weird for us that before yo=
ur patch the register SERSR wasn't used in any part of the Linux kernel.


2.       In commit 8acb88682cc00a41a677c2455a7c992d you removed ipic_set_hi=
ghest_priority(), ipic_enable_mcp() and ipic_disable_mcp()because it wasn't=
 used but here we are confused because ipic_clear_mcp_status() sets all bit=
s with the mask and in the old disable function the bits from the mask are =
cleared with a bitwise AND,changing the other bits from the SERMR register =
but the mcp_irq.

ipic_clear:
ipic_write<https://elixir.bootlin.com/linux/v4.1.13/ident/ipic_write>(prima=
ry_ipic<https://elixir.bootlin.com/linux/v4.1.13/ident/primary_ipic>->regs,=
 IPIC_SERMR<https://elixir.bootlin.com/linux/v4.1.13/ident/IPIC_SERMR>, mas=
k);
ipic_disable:
                                temp<https://elixir.bootlin.com/linux/v4.1.=
13/ident/temp> =3D ipic_read<https://elixir.bootlin.com/linux/v4.1.13/ident=
/ipic_read>(ipic<https://elixir.bootlin.com/linux/v4.1.13/ident/ipic>->regs=
, IPIC_SERMR<https://elixir.bootlin.com/linux/v4.1.13/ident/IPIC_SERMR>);
                                temp<https://elixir.bootlin.com/linux/v4.1.=
13/ident/temp> &=3D (1 << (31 - mcp_irq));
                                ipic_write<https://elixir.bootlin.com/linux=
/v4.1.13/ident/ipic_write>(ipic<https://elixir.bootlin.com/linux/v4.1.13/id=
ent/ipic>->regs, IPIC_SERMR<https://elixir.bootlin.com/linux/v4.1.13/ident/=
IPIC_SERMR>, temp<https://elixir.bootlin.com/linux/v4.1.13/ident/temp>);

                Isn't ipic_clear a set function instead of a clear function=
? This bring us confusion
Another question is why these functions were created in the first place?


3.       In the NXP document it states that: These bits are cleared by writ=
ing the bit location with a logic 1. The interrupting source must be cleare=
d before clearing the interrupts error status bit.
Does this mean that these registers work with negative logic? How is this m=
anaged in the kernel?
The interrupting source is the SERMR register, the SERSR or any other?


4.       What is the real difference between MCP and MCE? What are their us=
es?


I know it is a lot of information but we are very confused about the use of=
 these registers and we noticed that you are very involved on the PPC devel=
opment. So we would like to hear from an expert.

Thank you very much for your time,
Pablo






(*) https://www.nxp.com/docs/en/application-note/AN3797.pdf

--_000_0CDD4071D6ACF54ABB9CF1A6D90375A809BAF4E4ALAMBDcorpadwrs_
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
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
span.n
	{mso-style-name:n;}
span.p
	{mso-style-name:p;}
span.o
	{mso-style-name:o;}
span.mi
	{mso-style-name:mi;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:638807685;
	mso-list-type:hybrid;
	mso-list-template-ids:756864570 67698703 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi, Christophe and everyone from the LinuxPPC commun=
ity,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hope you are doing well!<o:p></o:p></p>
<p class=3D"MsoNormal">I was working with Daniel, and we were reviewing the=
 ipic source code and came to these questions:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">1.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>The first one came up while reviewing the document =
&#8220;Understanding IPIC&#8221; from NXP (*). The document states that:<o:=
p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-autospace:none"><i><span style=
=3D"font-size:10.0pt;font-family:&quot;Times New Roman&quot;,serif">System =
Error Status Register (SERSR) &#8211; 0x40: Each bit in the SERSR register =
corresponds to a non-maskable error source that generates
 a machine check exception (MCP). These bits are cleared by writing the bit=
 location with a logic 1.<o:p></o:p></span></i></p>
<p class=3D"MsoListParagraph" style=3D"text-autospace:none"><i><span style=
=3D"font-size:10.0pt;font-family:&quot;Times New Roman&quot;,serif">The int=
errupting source must be cleared before clearing the interrupts error statu=
s bit.<o:p></o:p></span></i></p>
<p class=3D"MsoListParagraph" style=3D"text-autospace:none"><i><span style=
=3D"font-size:10.0pt;font-family:&quot;Times New Roman&quot;,serif">System =
Error Mask Register (SERMR) &#8211; 0x44 When a machine check exception is =
signaled from one of the peripheral modules, its corresponding
 flag bit in this register is set. Any of the interrupting sources can be i=
ndividually masked.<o:p></o:p></span></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:10.0pt;font-family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:=
p></span></i></p>
<p class=3D"MsoNormal" style=3D"margin-left:.25in;text-indent:.25in;text-au=
tospace:none">
We noticed that you changed the ipic_clear_mcp_status &nbsp;function by swa=
pping SERMR to SERSR, but we don&#8217;t fully understand why. Could you pl=
ease elaborate on why this change is made? This because we had a code that =
was working before the patch and we would fully
 understand why it stopped working. From our perspective, both SERSR and SE=
RMR are related to MCEs and honestly don&#8217;t know what&#8217;s the diff=
erence at the hardware level, and the role of every register on the machine=
 check flow. It is also weird for us that before
 your patch the register SERSR wasn&#8217;t used in any part of the Linux k=
ernel.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1;text-autospace:none">
<![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>In commit 8acb88682cc00a41a677c2455a7c992d you remo=
ved ipic_set_highest_priority(), ipic_enable_mcp() and ipic_disable_mcp()be=
cause it wasn&#8217;t used but here we are confused because ipic_clear_mcp_=
status() sets all bits with the mask and
 in the old disable function the bits from the mask are cleared with a bitw=
ise AND,changing the other bits from the SERMR register but the mcp_irq.<o:=
p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.25in;text-autospace:none"><o:p=
>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in;text-autospace:none">ipic_=
clear: <o:p>
</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in;text-indent:.5in;text-auto=
space:none">
<a href=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/ipic_write"><span=
 style=3D"color:windowtext;text-decoration:none">ipic_write</span></a>(<a h=
ref=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/primary_ipic"><span s=
tyle=3D"color:windowtext;text-decoration:none">primary_ipic</span></a>-&gt;=
regs,
<a href=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/IPIC_SERMR"><span=
 style=3D"color:windowtext;text-decoration:none">IPIC_SERMR</span></a>, mas=
k);<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in;text-autospace:none">ipic_=
disable:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; <a href=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/temp">
<span style=3D"color:windowtext;text-decoration:none">temp</span></a> =3D <=
a href=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/ipic_read">
<span style=3D"color:windowtext;text-decoration:none">ipic_read</span></a>(=
<a href=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/ipic"><span style=
=3D"color:windowtext;text-decoration:none">ipic</span></a>-&gt;regs,
<a href=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/IPIC_SERMR"><span=
 style=3D"color:windowtext;text-decoration:none">IPIC_SERMR</span></a>);<o:=
p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; <a href=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/temp">
<span style=3D"color:windowtext;text-decoration:none">temp</span></a> &amp;=
=3D (1 &lt;&lt; (31 - mcp_irq));<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; <a href=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/ipic_wr=
ite">
<span style=3D"color:windowtext;text-decoration:none">ipic_write</span></a>=
(<a href=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/ipic"><span styl=
e=3D"color:windowtext;text-decoration:none">ipic</span></a>-&gt;regs,
<a href=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/IPIC_SERMR"><span=
 style=3D"color:windowtext;text-decoration:none">IPIC_SERMR</span></a>,
<a href=3D"https://elixir.bootlin.com/linux/v4.1.13/ident/temp"><span style=
=3D"color:windowtext;text-decoration:none">temp</span></a>);<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Isn&#8=
217;t ipic_clear a set function instead of a clear function? This bring us =
confusion
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in;text-autospace:none">Anoth=
er question is why these functions were created in the first place?<o:p></o=
:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1;text-autospace:none">
<![if !supportLists]><span style=3D"mso-list:Ignore">3.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>In the NXP document it states that: <i><span style=
=3D"font-size:9.0pt">These bits are cleared by writing the bit location wit=
h a logic 1. The interrupting source must be cleared before clearing the in=
terrupts error status bit.</span></i><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.25in;text-indent:.25in;text-au=
tospace:none">
Does this mean that these registers work with negative logic? How is this m=
anaged in the kernel?
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.25in;text-indent:.25in;text-au=
tospace:none">
The interrupting source is the SERMR register, the SERSR or any other?<o:p>=
</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in;text-autospace:none"><o:p>=
&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1;text-autospace:none">
<![if !supportLists]><span style=3D"mso-list:Ignore">4.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>What is the real difference between MCP and MCE? Wh=
at are their uses?<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in;text-autospace:none">I kno=
w it is a lot of information but we are very confused about the use of thes=
e registers and we noticed that you are very involved on the PPC developmen=
t. So we would like to hear from an
 expert.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in;text-autospace:none"><o:p>=
&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in;text-autospace:none">Thank=
 you very much for your time,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in;text-autospace:none">Pablo=
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<pre><span style=3D"font-size:11.0pt;color:black"><o:p>&nbsp;</o:p></span><=
/pre>
<p class=3D"MsoNormal" style=3D"margin-left:.5in;text-autospace:none"><o:p>=
&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">(*) <a href=3D"https://www.nxp.com/docs/en/applicati=
on-note/AN3797.pdf">
https://www.nxp.com/docs/en/application-note/AN3797.pdf</a><o:p></o:p></p>
</div>
</body>
</html>

--_000_0CDD4071D6ACF54ABB9CF1A6D90375A809BAF4E4ALAMBDcorpadwrs_--
