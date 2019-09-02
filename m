Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0AAA55EC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 14:26:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MTq36DyZzDqgP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 22:26:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MSnc1dlGzDqcn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 21:40:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sina.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46MSnc0J5Hz8t9F
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 21:40:36 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46MSnb6QT3z9sDQ; Mon,  2 Sep 2019 21:40:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=sina.com
 (client-ip=202.108.3.164; helo=mail3-164.sinamail.sina.com.cn;
 envelope-from=hdanton@sina.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sina.com
Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn
 [202.108.3.164]) by ozlabs.org (Postfix) with SMTP id 46MSnY3XQpz9s7T
 for <linuxppc-dev@ozlabs.org>; Mon,  2 Sep 2019 21:40:22 +1000 (AEST)
Received: from unknown (HELO [IPv6:::ffff:192.168.199.155])([114.254.173.51])
 by sina.com with ESMTP
 id 5D6CFF9F0002CCB9; Mon, 2 Sep 2019 19:40:16 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 46345515077932
MIME-Version: 1.0
To: David Howells <dhowells@redhat.com>
From: Hillf Danton <hdanton@sina.com>
Subject: Re: Oops (request_key_auth_describe) while running cve-2016-7042
 from LTP
Date: Mon, 2 Sep 2019 19:40:15 +0800
Importance: normal
X-Priority: 3
In-Reply-To: <761.1567408455@warthog.procyon.org.uk>
References: <11986.1567178014@warthog.procyon.org.uk>
 <85B7196E-D717-4F19-A7E8-82A18287A3DE@linux.vnet.ibm.com>
 <761.1567408455@warthog.procyon.org.uk>
Content-Type: multipart/alternative;
 boundary="_0BF70FBD-0CB0-4F27-A3BD-7BAB1CF9484A_"
X-Mailman-Approved-At: Mon, 02 Sep 2019 22:24:15 +1000
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
Cc: "dhowells@redhat.com" <dhowells@redhat.com>,
 Sachin Sant <sachinp@linux.vnet.ibm.com>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Message-Id: <46MTq36DyZzDqgP@lists.ozlabs.org>


--_0BF70FBD-0CB0-4F27-A3BD-7BAB1CF9484A_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

>
> Hi Hillf,
>
> Would you like to me to put you down as the author of this patch?  If so,=
 I'll
> need a Signed-off-by from you.
>
Signed-off-by: Hillf Danton <hdanton@sina.com>


--_0BF70FBD-0CB0-4F27-A3BD-7BAB1CF9484A_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.DefaultFontHxMailStyle
	{mso-style-name:"Default Font HxMail Style";
	font-family:DengXian;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DZH-CN link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal><span class=3DDefaultFontHxMailStyle=
><span lang=3DEN-US>&gt;</span></span><span lang=3DEN-US><o:p>&nbsp;</o:p><=
/span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; Hi Hillf,</span></p>=
<p class=3DMsoNormal><span lang=3DEN-US>&gt;<o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>&gt; Would you like to me to put you d=
own as the author of this patch?=C2=A0 If so, I'll</span></p><p class=3DMso=
Normal><span lang=3DEN-US>&gt; need a Signed-off-by from you.</span></p><p =
class=3DMsoNormal><span lang=3DEN-US>&gt;<o:p>&nbsp;</o:p></span></p><p cla=
ss=3DMsoNormal><span lang=3DEN-US>Signed-off-by: Hillf Danton &lt;hdanton@s=
ina.com&gt;</span></p><p class=3DMsoNormal><span class=3DDefaultFontHxMailS=
tyle><span lang=3DEN-US><o:p>&nbsp;</o:p></span></span></p></div></body></h=
tml>=

--_0BF70FBD-0CB0-4F27-A3BD-7BAB1CF9484A_--


