Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7EA1A2FD7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 09:17:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yXX35lnPzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 17:17:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=cmss.chinamobile.com (client-ip=221.176.66.81;
 helo=cmccmta3.chinamobile.com; envelope-from=tangbin@cmss.chinamobile.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cmss.chinamobile.com
X-Greylist: delayed 210 seconds by postgrey-1.36 at bilbo;
 Thu, 09 Apr 2020 16:56:02 AEST
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by lists.ozlabs.org (Postfix) with ESMTP id 48yX3k72NNzDqtW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 16:56:02 +1000 (AEST)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
 rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id 2eea5e8ec5f05da-e3790;
 Thu, 09 Apr 2020 14:51:28 +0800 (CST)
X-RM-TRANSID: 2eea5e8ec5f05da-e3790
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [IPv6:::ffff:172.20.21.59] (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee95e8ec5dea4b-79549;
 Thu, 09 Apr 2020 14:51:28 +0800 (CST)
X-RM-TRANSID: 2ee95e8ec5dea4b-79549
MIME-Version: 1.0
To: "markus.elfring@web.de" <markus.elfring@web.de>, 
 Li Yang <leoyang.li@nxp.com>
From: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: usb: gadget: fsl_udc_core: Checking for a failed
 platform_get_irq() call in fsl_udc_probe()
Date: Thu, 9 Apr 2020 14:51:36 +0800
Importance: normal
X-Priority: 3
Content-Type: multipart/alternative;
 boundary="_E794D81C-AFD9-4756-ACB1-CC4F309ACEB1_"
X-Mailman-Approved-At: Thu, 09 Apr 2020 17:15:39 +1000
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
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "tangbin@cmss.chinamobile.com" <tangbin@cmss.chinamobile.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Message-Id: <48yXX35lnPzDqPW@lists.ozlabs.org>

--_E794D81C-AFD9-4756-ACB1-CC4F309ACEB1_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thu,Apr 9,2020 08:28:28 Markus Elfring <Markus.Elfring@web.de> wrote:


> I was unsure if I noticed another programming mistake.

> Do other contributors know the affected software module better than me?

I discovered this problem fews days ago, and doing experiments on the hardw=
are to test my idea.

Thanks
Tang Bin


--_E794D81C-AFD9-4756-ACB1-CC4F309ACEB1_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Microsoft YaHei UI";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@Microsoft YaHei UI";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML \9884\8BBE\683C\5F0F \5B57\7B26";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:SimSun;}
span.HTML
	{mso-style-name:"HTML \9884\8BBE\683C\5F0F \5B57\7B26";
	mso-style-priority:99;
	mso-style-link:"HTML \9884\8BBE\683C\5F0F";
	font-family:SimSun;}
span.q
	{mso-style-name:q;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DZH-CN link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><div><pre><span lang=3DEN-US style=3D'font-size:10.5pt'>O=
n </span><span lang=3DEN-US style=3D'font-size:10.5pt;font-family:"Courier =
New";color:black'>Thu,Apr 9,2020 08:28:28</span><span lang=3DEN-US style=3D=
'font-size:10.0pt;font-family:"Courier New";color:black'> </span><span lang=
=3DEN-US style=3D'font-size:10.5pt;font-family:"Microsoft YaHei UI",sans-se=
rif;color:black;background:white'>Markus Elfring &lt;Markus.Elfring@web.de&=
gt; wrote:</span><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"=
Courier New";color:black'><o:p></o:p></span></pre></div><p class=3DMsoNorma=
l><span lang=3DEN-US style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></p=
><pre><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier New=
";color:black'><o:p>&nbsp;</o:p></span></pre><pre><span class=3Dq><span lan=
g=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier New";color:black'>=
&gt; </span></span><span lang=3DEN-US style=3D'font-size:10.0pt;font-family=
:"Courier New";color:black'>I was unsure if I noticed another programming m=
istake.<o:p></o:p></span></pre><pre><span lang=3DEN-US style=3D'font-size:1=
0.0pt;font-family:"Courier New";color:black'><o:p>&nbsp;</o:p></span></pre>=
<pre><span class=3Dq><span lang=3DEN-US style=3D'font-size:10.0pt;font-fami=
ly:"Courier New";color:black'>&gt; </span></span><span lang=3DEN-US style=
=3D'font-size:10.0pt;font-family:"Courier New";color:black'>Do other contri=
butors know the affected software module better than me?<o:p></o:p></span><=
/pre><pre><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier=
 New";color:black'><o:p>&nbsp;</o:p></span></pre><pre><span lang=3DEN-US st=
yle=3D'font-size:10.0pt;font-family:"Courier New";color:black'>I discovered=
 this problem fews days ago, and doing experiments on the hardware to test =
my idea.<o:p></o:p></span></pre><pre><span lang=3DEN-US style=3D'font-size:=
10.0pt;font-family:"Courier New";color:black'><o:p>&nbsp;</o:p></span></pre=
><p class=3DMsoNormal><span lang=3DEN-US>Thanks</span></p><p class=3DMsoNor=
mal><span lang=3DEN-US>Tang Bin</span></p><p class=3DMsoNormal><span lang=
=3DEN-US style=3D'font-size:12.0pt;font-family:SimSun'><o:p>&nbsp;</o:p></s=
pan></p></div></body></html>=

--_E794D81C-AFD9-4756-ACB1-CC4F309ACEB1_--



