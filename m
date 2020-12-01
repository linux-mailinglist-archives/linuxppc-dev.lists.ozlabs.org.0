Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A132CAE10
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 22:10:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clvrz3XNwzDqly
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 08:10:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=abali@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KUVt5oGU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CljLS3cKPzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 00:16:57 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B1CY7lY017522
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Dec 2020 08:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : to : cc :
 subject : from : date : references : content-type : message-id :
 mime-version; s=pp1; bh=jSLwFK4G3vyxKTfCyyPTbLpsQ05CYumSnGO5WttsvAo=;
 b=KUVt5oGUjvo2hBEhDUvv7A2egRPXq4qDp7mj7H1W1Lige+rGutceKttWeO5svLTB+uVX
 LWuHj57ojhtLwC835RBBVupNn85cgDCPUVdq5IqU6dl1UvwsFGRTX0Y9scM/UEGm8Qyp
 sPnmbzFqxvclgl9JcywVosH8yynL37JUWPlHOfWZOIqlM/Swdhwxl80RDQfQ5tjXu9sL
 hRvdEEBfcyqrjB5YVZuWnatAphnbD1AGqlnRnsgdPeFmVsp+d0ujxW1h4pPuPu5R2GyA
 O5FEVsBQYehrjLVq2o44UDKjnZE1rrDkpThnGc7a0ohoLjMddhW3/i+u3IuPivQt+fvw TA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0b-001b2d01.pphosted.com with ESMTP id 355jwuy4jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 08:16:54 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <abali@us.ibm.com>;
 Tue, 1 Dec 2020 13:16:54 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 1 Dec 2020 13:16:52 -0000
Received: from us1a3-mail224.a3.dal06.isc4sb.com ([10.146.103.203])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2020120113165158-398486 ;
 Tue, 1 Dec 2020 13:16:51 +0000 
In-Reply-To: <20201201055228.GA2213889@us.ibm.com>
To: "Sukadev Bhattiprolu" <sukadev@linux.ibm.com>
Subject: Re: CONFIG_PPC_VAS depends on 64k pages...?
From: "Bulent Abali" <abali@us.ibm.com>
Date: Tue, 1 Dec 2020 08:16:51 -0500
References: <7171078.EvYhyI6sBW@sheen>
 <2b234a7e-e9f6-d02b-a20f-74c0cc1df8d3@csgroup.eu>
 <20201201055228.GA2213889@us.ibm.com>
X-KeepSent: 66F86744:2ADAED9E-85258631:0047CAC6;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1FP1 March 26, 2019
X-LLNOutbound: False
X-Disclaimed: 25239
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 0048F3BC85258631_="
x-cbid: 20120113-8877-0000-0000-0000050D3010
X-IBM-SpamModules-Scores: BY=0.292476; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.427716; ST=0; TS=0; UL=0; ISC=; MB=0.147956
X-IBM-SpamModules-Versions: BY=3.00014291; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01471769; UDB=6.00792612; IPR=6.01254416; 
 MB=3.00035300; MTD=3.00000008; XFM=3.00000015; UTC=2020-12-01 13:16:53
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-12-01 09:24:53 - 6.00012102
x-cbparentid: 20120113-8878-0000-0000-0000F46433BF
Message-Id: <OF66F86744.2ADAED9E-ON85258631.0047CAC6-85258631.0048F494@notes.na.collabserv.com>
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_04:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:09:07 +1100
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
Cc: Tulio Magno Quites Machado Filho <tulioqm@br.ibm.com>, daniel@octaforge.org,
 haren@linux.ibm.com, Will
 Springer <skirmisher@protonmail.com>, Bulent Abali <abali@us.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Raphael M Zinsly <rzinsly@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=_alternative 0048F3BC85258631_=
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

I don't know anything about VAS page size requirements in the kernel.  I=20
checked the user compression library and saw that we do a sysconf to get=20
the page size; so the library should be immune to page size by design.
But it wouldn't surprise me if a 64KB constant is inadvertently hardcoded=20
somewhere else in the library.  Giving heads up to Tulio and Raphael who=20
are owners of the github repo.

https://github.com/libnxz/power-gzip/blob/master/lib/nx_zlib.c#L922

If we got this wrong in the library it might manifest itself as an error=20
message of the sort "excessive page faults".  The library must touch pages=
=20
ahead to make them present in the memory; occasional page faults is=20
acceptable. It will retry.


Bulent




From:   "Sukadev Bhattiprolu" <sukadev@linux.ibm.com>
To:     "Christophe Leroy" <christophe.leroy@csgroup.eu>
Cc:     "Will Springer" <skirmisher@protonmail.com>,=20
linuxppc-dev@lists.ozlabs.org, daniel@octaforge.org, Bulent=20
Abali/Watson/IBM@IBM, haren@linux.ibm.com
Date:   12/01/2020 12:53 AM
Subject:        Re: CONFIG_PPC_VAS depends on 64k pages...?




Christophe Leroy [christophe.leroy@csgroup.eu] wrote:
> Hi,
>=20
> Le 19/11/2020 =E0 11:58, Will Springer a =E9crit :
> > I learned about the POWER9 gzip accelerator a few months ago when the
> > support hit upstream Linux 5.8. However, for some reason the Kconfig
> > dictates that VAS depends on a 64k page size, which is problematic as=20
I
> > run Void Linux, which uses a 4k-page kernel.
> >=20
> > Some early poking by others indicated there wasn't an obvious page=20
size
> > dependency in the code, and suggested I try modifying the config to=20
switch
> > it on. I did so, but was stopped by a minor complaint of an=20
"unexpected DT
> > configuration" by the VAS code. I wasn't equipped to figure out=20
exactly what
> > this meant, even after finding the offending condition, so after=20
writing a
> > very drawn-out forum post asking for help, I dropped the subject.
> >=20
> > Fast forward to today, when I was reminded of the whole thing again,=20
and
> > decided to debug a bit further. Apparently the VAS platform device
> > (derived from the DT node) has 5 resources on my 4k kernel, instead of=
=20
4
> > (which evidently works for others who have had success on 64k=20
kernels). I
> > have no idea what this means in practice (I don't know how to=20
introspect
> > it), but after making a tiny patch[1], everything came up smoothly and=
=20
I
> > was doing blazing-fast gzip (de)compression in no time.
> >=20
> > Everything seems to work fine on 4k pages. So, what's up? Are there
> > pitfalls lurking around that I've yet to stumble over? More=20
reasonably,
> > I'm curious as to why the feature supposedly depends on 64k pages, or=20
if
> > there's anything else I should be concerned about.

Will,

The reason I put in that config check is because we were only able to
test 64K pages at that point.

It is interesting that it is working for you. Following code in skiboot
https://github.com/open-power/skiboot/blob/master/hw/vas.c should restrict
it to 64K pages. IIRC there is also a corresponding change in some NX=20
registers that should also be configured to allow 4K pages.


                 static int init_north_ctl(struct proc_chip *chip)
                 {
                                 uint64_t val =3D 0ULL;

                                 val =3D SETFIELD(VAS_64K_MODE_MASK, val,=20
true);
                                 val =3D SETFIELD(VAS_ACCEPT_PASTE_MASK,=20
val, true);
                                 val =3D SETFIELD(VAS_ENABLE_WC_MMIO_BAR,=20
val, true);
                                 val =3D SETFIELD(VAS_ENABLE_UWC_MMIO_BAR,=
=20
val, true);
                                 val =3D SETFIELD(VAS_ENABLE_RMA_MMIO_BAR,=
=20
val, true);

                                 return vas_scom_write(chip,=20
VAS_MISC_N_CTL, val);
                 }

I am copying Bulent Albali and Haren Myneni who have been working with
VAS/NX for their thoughts/experience.

> >=20
>=20
> Maybe ask Sukadev who did the implementation and is maintaining it ?
>=20
> > I do have to say I'm quite satisfied with the results of the NX
> > accelerator, though. Being able to shuffle data to a RaptorCS box over=
=20
gigE
> > and get compressed data back faster than most software gzip could ever
> > hope to achieve is no small feat, let alone the instantaneous results=20
locally.
> > :)
> >=20
> > Cheers,
> > Will Springer [she/her]
> >=20
> > [1]:=20
https://github.com/Skirmisher/void-packages/blob/vas-4k-pages/srcpkgs/linux=
5.9/patches/ppc-vas-on-4k.patch

> >=20
>=20
>=20
> Christophe





--=_alternative 0048F3BC85258631_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="ISO-8859-1"

<span style=3D" font-size:10pt;font-family:sans-serif">I don't know anything
about VAS page size requirements in the kernel. &nbsp;I checked the user
compression library and saw that we do a sysconf to get the page size;
so the library should be immune to page size by design.</span><br><span sty=
le=3D" font-size:10pt;font-family:sans-serif">But it wouldn't
surprise me if a 64KB constant is inadvertently hardcoded somewhere else
in the library. &nbsp;Giving heads up to Tulio and Raphael who are owners
of the github repo.</span><br><br><a href=3D"https://github.com/libnxz/powe=
r-gzip/blob/master/lib/nx=5Fzlib.c#L922"><span style=3D" font-size:10pt;col=
or:blue;font-family:sans-serif">https://github.com/libnxz/power-gzip/blob/m=
aster/lib/nx=5Fzlib.c#L922</span></a><br><br><span style=3D" font-size:10pt=
;font-family:sans-serif">If we got this
wrong in the library it might manifest itself as an error message of the
sort &quot;excessive page faults&quot;. &nbsp;The library must touch pages
ahead to make them present in the memory; occasional page faults is accepta=
ble.
It will retry.</span><br><br><br><span style=3D" font-size:10pt;font-family=
:sans-serif">Bulent</span><br><br><br><br><br><span style=3D" font-size:9pt=
;color:#5f5f5f;font-family:sans-serif">From:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">&quot;Sukadev
Bhattiprolu&quot; &lt;sukadev@linux.ibm.com&gt;</span><br><span style=3D" f=
ont-size:9pt;color:#5f5f5f;font-family:sans-serif">To:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">&quot;Christophe
Leroy&quot; &lt;christophe.leroy@csgroup.eu&gt;</span><br><span style=3D" f=
ont-size:9pt;color:#5f5f5f;font-family:sans-serif">Cc:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">&quot;Will
Springer&quot; &lt;skirmisher@protonmail.com&gt;, linuxppc-dev@lists.ozlabs=
.org,
daniel@octaforge.org, Bulent Abali/Watson/IBM@IBM, haren@linux.ibm.com</spa=
n><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:sans-serif">D=
ate:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">12/01/2020
12:53 AM</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:=
sans-serif">Subject:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Re:
CONFIG=5FPPC=5FVAS depends on 64k pages...?</span><br><hr noshade><br><br><=
br><tt><span style=3D" font-size:10pt"><br>Christophe Leroy [christophe.ler=
oy@csgroup.eu] wrote:<br>&gt; Hi,<br>&gt; <br>&gt; Le 19/11/2020 =E0 11:58,=
 Will Springer a =E9crit&nbsp;:<br>&gt; &gt; I learned about the POWER9 gzi=
p accelerator a few months ago
when the<br>&gt; &gt; support hit upstream Linux 5.8. However, for some rea=
son the
Kconfig<br>&gt; &gt; dictates that VAS depends on a 64k page size, which is=
 problematic
as I<br>&gt; &gt; run Void Linux, which uses a 4k-page kernel.<br>&gt; &gt;=
 <br>&gt; &gt; Some early poking by others indicated there wasn't an obvious
page size<br>&gt; &gt; dependency in the code, and suggested I try modifyin=
g the config
to switch<br>&gt; &gt; it on. I did so, but was stopped by a minor complain=
t of an &quot;unexpected
DT<br>&gt; &gt; configuration&quot; by the VAS code. I wasn't equipped to f=
igure
out exactly what<br>&gt; &gt; this meant, even after finding the offending =
condition, so after
writing a<br>&gt; &gt; very drawn-out forum post asking for help, I dropped=
 the subject.<br>&gt; &gt; <br>&gt; &gt; Fast forward to today, when I was =
reminded of the whole thing
again, and<br>&gt; &gt; decided to debug a bit further. Apparently the VAS =
platform device<br>&gt; &gt; (derived from the DT node) has 5 resources on =
my 4k kernel, instead
of 4<br>&gt; &gt; (which evidently works for others who have had success on=
 64k
kernels). I<br>&gt; &gt; have no idea what this means in practice (I don't =
know how to
introspect<br>&gt; &gt; it), but after making a tiny patch[1], everything c=
ame up smoothly
and I<br>&gt; &gt; was doing blazing-fast gzip (de)compression in no time.<=
br>&gt; &gt; <br>&gt; &gt; Everything seems to work fine on 4k pages. So, w=
hat's up? Are
there<br>&gt; &gt; pitfalls lurking around that I've yet to stumble over? M=
ore reasonably,<br>&gt; &gt; I'm curious as to why the feature supposedly d=
epends on 64k pages,
or if<br>&gt; &gt; there's anything else I should be concerned about.<br><b=
r>Will,<br><br>The reason I put in that config check is because we were onl=
y able to<br>test 64K pages at that point.<br><br>It is interesting that it=
 is working for you. Following code in skiboot<br></span></tt><a href=3D"ht=
tps://github.com/open-power/skiboot/blob/master/hw/vas.c"><tt><span style=
=3D" font-size:10pt">https://github.com/open-power/skiboot/blob/master/hw/v=
as.c</span></tt></a><tt><span style=3D" font-size:10pt">should restrict<br>=
it to 64K pages. IIRC there is also a corresponding change in some NX <br>r=
egisters that should also be configured to allow 4K pages.<br><br><br> &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
static int init=5Fnorth=5Fctl(struct proc=5Fchip *chip)<br> &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
{<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint64=5Ft
val =3D 0ULL;<br><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val
=3D SETFIELD(VAS=5F64K=5FMODE=5FMASK, val, true);<br> &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val
=3D SETFIELD(VAS=5FACCEPT=5FPASTE=5FMASK, val, true);<br> &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val
=3D SETFIELD(VAS=5FENABLE=5FWC=5FMMIO=5FBAR, val, true);<br> &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val
=3D SETFIELD(VAS=5FENABLE=5FUWC=5FMMIO=5FBAR, val, true);<br> &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val
=3D SETFIELD(VAS=5FENABLE=5FRMA=5FMMIO=5FBAR, val, true);<br><br> &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
vas=5Fscom=5Fwrite(chip, VAS=5FMISC=5FN=5FCTL, val);<br> &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br><br>I am copying Bulent Albali and Haren Myneni who have been working =
with<br>VAS/NX for their thoughts/experience.<br><br>&gt; &gt; <br>&gt; <br=
>&gt; Maybe ask Sukadev who did the implementation and is maintaining it
?<br>&gt; <br>&gt; &gt; I do have to say I'm quite satisfied with the resul=
ts of the
NX<br>&gt; &gt; accelerator, though. Being able to shuffle data to a Raptor=
CS
box over gigE<br>&gt; &gt; and get compressed data back faster than most so=
ftware gzip could
ever<br>&gt; &gt; hope to achieve is no small feat, let alone the instantan=
eous
results locally.<br>&gt; &gt; :)<br>&gt; &gt; <br>&gt; &gt; Cheers,<br>&gt;=
 &gt; Will Springer [she/her]<br>&gt; &gt; <br>&gt; &gt; [1]: </span></tt><=
a href=3D"https://github.com/Skirmisher/void-packages/blob/vas-4k-pages/src=
pkgs/linux5.9/patches/ppc-vas-on-4k.patch"><tt><span style=3D" font-size:10=
pt">https://github.com/Skirmisher/void-packages/blob/vas-4k-pages/srcpkgs/l=
inux5.9/patches/ppc-vas-on-4k.patch</span></tt></a><tt><span style=3D" font=
-size:10pt"><br>&gt; &gt; <br>&gt; <br>&gt; <br>&gt; Christophe<br></span><=
/tt><br><br><BR>

--=_alternative 0048F3BC85258631_=--

