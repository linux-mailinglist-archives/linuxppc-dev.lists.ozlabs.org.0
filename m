Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50896A42FE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 09:13:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46L6y22MzhzDr49
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 17:13:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KjFF00mGzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 00:54:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sina.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46KjFD3d9nz8t79
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 00:54:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46KjFD2sZKz9sBp; Sat, 31 Aug 2019 00:54:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=sina.com
 (client-ip=202.108.3.162; helo=mail3-162.sinamail.sina.com.cn;
 envelope-from=hdanton@sina.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sina.com
Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn
 [202.108.3.162]) by ozlabs.org (Postfix) with SMTP id 46KjFC1zKbz9s5b
 for <linuxppc-dev@ozlabs.org>; Sat, 31 Aug 2019 00:54:45 +1000 (AEST)
Received: from unknown (HELO [IPv6:::ffff:192.168.199.155])([114.254.173.51])
 by sina.com with ESMTP
 id 5D6938AC000124E4; Fri, 30 Aug 2019 22:54:39 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 10726449326101
MIME-Version: 1.0
To: David Howells <dhowells@redhat.com>
From: Hillf Danton <hdanton@sina.com>
Subject: Re: Oops (request_key_auth_describe) while running cve-2016-7042
 from LTP
Date: Fri, 30 Aug 2019 22:54:37 +0800
Importance: normal
X-Priority: 3
In-Reply-To: <4384.1567174383@warthog.procyon.org.uk>
References: <20190830085646.14740-1-hdanton@sina.com>
 <4384.1567174383@warthog.procyon.org.uk>
Content-Type: multipart/alternative;
 boundary="_12CB79AF-0B70-49E2-8B3F-06A5A6969988_"
X-Mailman-Approved-At: Sat, 31 Aug 2019 17:11:34 +1000
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
Message-Id: <46L6y22MzhzDr49@lists.ozlabs.org>


--_12CB79AF-0B70-49E2-8B3F-06A5A6969988_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

David Howells <dhowells@redhat.com> wrote:
>
> Hillf Danton <hdanton@sina.com> wrote:
>
> > -	struct request_key_auth *rka =3D dereference_key_rcu(key);
> > +	struct request_key_auth *rka;
> > +
> > +	rcu_read_lock();
> > +	rka =3D dereference_key_rcu(key);
>
> This shouldn't help as the caller, proc_keys_show(), is holding the RCU r=
ead
> lock across the call.  The end of the function reads:
> and the documentation says "This method will be called with the RCU read =
lock
> held".
>
1, callee has no pre defined duty to help caller in general; they should
not try to do anything, however, to help their callers in principle due to
limited info on their hands IMO.
2, uses of rcu can be nested.
3, no comment can be found in security/keys/request_key_auth.c about
the rcu already documented.
4, the newly added rcu can avoid incidental messup anywhere else.

Hillf

--_12CB79AF-0B70-49E2-8B3F-06A5A6969988_
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML \9884\8BBE\683C\5F0F \5B57\7B26";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:SimSun;}
span.DefaultFontHxMailStyle
	{mso-style-name:"Default Font HxMail Style";
	font-family:DengXian;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
span.HTML
	{mso-style-name:"HTML \9884\8BBE\683C\5F0F \5B57\7B26";
	mso-style-priority:99;
	mso-style-link:"HTML \9884\8BBE\683C\5F0F";
	font-family:SimSun;}
span.od
	{mso-style-name:od;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DZH-CN link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US style=3D'color:bl=
ack'>David Howells &lt;dhowells@redhat.com&gt; wrote:</span><span lang=3DEN=
-US><o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;<o:p>=
&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; Hillf D=
anton &lt;hdanton@sina.com&gt; wrote:</span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&gt;<o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lan=
g=3DEN-US>&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0 struct request_key_auth *rka =
=3D dereference_key_rcu(key);</span></p><p class=3DMsoNormal><span lang=3DE=
N-US>&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 struct request_key_auth *rka;</spa=
n></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; &gt; +</span></p><p clas=
s=3DMsoNormal><span lang=3DEN-US>&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 rcu_re=
ad_lock();</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; &gt; +=C2=
=A0=C2=A0=C2=A0=C2=A0 rka =3D dereference_key_rcu(key);</span></p><p class=
=3DMsoNormal><span lang=3DEN-US>&gt;<o:p>&nbsp;</o:p></span></p><p class=3D=
MsoNormal><span lang=3DEN-US>&gt; This shouldn't help as the caller, proc_k=
eys_show(), is holding the RCU read</span></p><p class=3DMsoNormal><span la=
ng=3DEN-US>&gt; lock across the call.=C2=A0 The end of the function reads:<=
/span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; and the documentatio=
n says &quot;This method will be called with the RCU read lock</span></p><p=
 class=3DMsoNormal><span lang=3DEN-US>&gt; held&quot;.</span></p><p class=
=3DMsoNormal><span lang=3DEN-US>&gt;<o:p>&nbsp;</o:p></span></p><p class=3D=
MsoNormal><span lang=3DEN-US>1, callee has no pre defined duty to help call=
er in general; they should</span></p><p class=3DMsoNormal><span lang=3DEN-U=
S>not try to do anything, however, to help their callers in principle due t=
o</span></p><p class=3DMsoNormal><span lang=3DEN-US>limited info on their h=
ands IMO.</span></p><p class=3DMsoNormal><span lang=3DEN-US>2, uses of rcu =
can be nested.</span></p><p class=3DMsoNormal><span lang=3DEN-US>3, no comm=
ent can be found in security/keys/request_key_auth.c about</span></p><p cla=
ss=3DMsoNormal><span lang=3DEN-US>the rcu already documented.</span></p><p =
class=3DMsoNormal><span lang=3DEN-US>4, the newly added rcu can avoid incid=
ental messup anywhere else.</span></p><p class=3DMsoNormal><span lang=3DEN-=
US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Hill=
f<span class=3DDefaultFontHxMailStyle><o:p></o:p></span></span></p></div></=
body></html>=

--_12CB79AF-0B70-49E2-8B3F-06A5A6969988_--


