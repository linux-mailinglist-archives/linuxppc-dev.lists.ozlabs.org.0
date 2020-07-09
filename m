Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B054621AA54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 00:13:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2r6Q65mTzDqp7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 08:13:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=abali@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2nQh5j2tzDr97
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 06:12:25 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069K2wpb154926
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Jul 2020 16:12:23 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325r2ctunm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 16:12:22 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <abali@us.ibm.com>;
 Thu, 9 Jul 2020 20:12:22 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 9 Jul 2020 20:12:18 -0000
Received: from us1a3-mail224.a3.dal06.isc4sb.com ([10.146.103.203])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020070920121770-1848686 ;
 Thu, 9 Jul 2020 20:12:17 +0000 
In-Reply-To: <OFC54F205D.A4C093B7-ON002585A0.006C5930-882585A0.006DFE69@LocalDomain>
To: "Haren Myneni" <hbabu@us.ibm.com>
From: "Bulent Abali" <abali@us.ibm.com>
Date: Thu, 9 Jul 2020 16:12:17 -0400
References: <f8af60fd4167c9c04ee5ab47147b9e95bcb3b9ff.camel@linux.ibm.com>
 <87y2ntue59.fsf@mpe.ellerman.id.au>
 <OFC54F205D.A4C093B7-ON002585A0.006C5930-882585A0.006DFE69@LocalDomain>
MIME-Version: 1.0
X-KeepSent: 9BD0F9A4:C69A8E84-852585A0:006EED15;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1FP1 March 26, 2019
X-LLNOutbound: False
X-Disclaimed: 33747
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 006EFBA5852585A0_="
x-cbid: 20070920-9463-0000-0000-000003AAB5C2
X-IBM-SpamModules-Scores: BY=0.090149; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.137447
X-IBM-SpamModules-Versions: BY=3.00013437; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01403404; UDB=6.00751710; IPR=6.01185670; 
 MB=3.00032928; MTD=3.00000008; XFM=3.00000015; UTC=2020-07-09 20:12:21
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-07-09 14:34:31 - 6.00011580
x-cbparentid: 20070920-9464-0000-0000-00002D551A41
Message-Id: <OF9BD0F9A4.C69A8E84-ON852585A0.006EED15-852585A0.006EFC86@notes.na.collabserv.com>
Subject: RE: [PATCH 1/2] powerpc/vas: Report proper error for address
 translation failure
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_10:2020-07-09,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:07:42 +1000
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
Cc: tulioqm@br.ibm.com, Haren Myneni <haren@linux.ibm.com>,
 Linuxppc-dev <linuxppc-dev-bounces+hbabu=us.ibm.com@lists.ozlabs.org>,
 linuxppc-dev@lists.ozlabs.org, rzinsly@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=_alternative 006EFBA5852585A0_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

copied verbatim from P9 DD2 Nest Accelerators Workbook Version 3.2

Table 4-36. CSB Non-zero CC Reported Error Types

CC=3D5, Error Type: Translation,=20
Comment: Unused, defined by RFC02130 (footnote:  DMA controller uses this=20
CC internally in translation fault handling. Do not reuse for other=20
purposes.)

CC=3D240 through 251, reserved for future firmware use,=20
Comment: Error codes 240 - 255 (0xF0 - 0xF0) are reserved for firmware use =

and are not signalled by the hardware.=20
These CCs are written in the CSB by hypervisor to alert the partition to=20
error conditions detected by the hypervisor.=20
These codes have been used in past processors for this purpose and ought=20
not be relocated.





From:   Haren Myneni/Beaverton/IBM
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     abali@us.ibm.com, Haren Myneni <haren@linux.ibm.com>,=20
linuxppc-dev@lists.ozlabs.org,=20
"Linuxppc-dev"<linuxppc-dev-bounces+hbabu=3Dus.ibm.com@lists.ozlabs.org>,=20
rzinsly@linux.ibm.com, tulioqm@br.ibm.com, Haren=20
Myneni/Beaverton/IBM@IBMUS
Date:   07/09/2020 04:01 PM
Subject:        Re: [EXTERNAL] Re: [PATCH 1/2] powerpc/vas: Report proper=20
error for address translation failure




"Linuxppc-dev" <linuxppc-dev-bounces+hbabu=3Dus.ibm.com@lists.ozlabs.org>=20
wrote on 07/09/2020 04:22:10 AM:

> From: Michael Ellerman <mpe@ellerman.id.au>
> To: Haren Myneni <haren@linux.ibm.com>
> Cc: tulioqm@br.ibm.com, abali@us.ibm.com, linuxppc-
> dev@lists.ozlabs.org, rzinsly@linux.ibm.com
> Date: 07/09/2020 04:21 AM
> Subject: [EXTERNAL] Re: [PATCH 1/2] powerpc/vas: Report proper error
> for address translation failure
> Sent by: "Linuxppc-dev" <linuxppc-dev-bounces
> +hbabu=3Dus.ibm.com@lists.ozlabs.org>
>=20
> Haren Myneni <haren@linux.ibm.com> writes:
> > DMA controller uses CC=3D5 internally for translation fault handling. So
> > OS should be using CC=3D250 and should report this error to the user=20
space
> > when NX encounters address translation failure on the request buffer.
>=20
> That doesn't really explain *why* the OS must use CC=3D250.
>=20
> Is it documented somewhere that 5 is for hardware use, and 250 is for
> software?

Yes, mentioned in Table 4-36. CSB Non-zero CC Reported Error Types (P9 NX=20
DD2 work book). Also footnote for CC=3D5 says "DMA controller uses this CC =

internally in translation fault handling. Do not reuse for other purposes"

I will add documentation reference for CC=3D250 comment.=20

>=20
> > This patch defines CSB=5FCC=5FADDRESS=5FTRANSLATION(250) and updates
> > CSB.CC with this proper error code for user space.
>=20
> We still have:
>=20
> #define CSB=5FCC=5FTRANSLATION   (5)
>=20
> And it's very unclear where one or the other should be used.
>=20
> Can one or the other get a name that makes the distinction clear.

CSB=5FCC=5FTRANSLATION is added in 842 driver (nx-common-powernv.c) when NX=
 is=20
introduced (P7+). NX will not see faults on kernel requests (cc=3D250) and =

even CC=3D5.=20

Table 4-36:=20
For CC=3D5: says Translation
CC=3D250:    says "Address Translation Fault"

So I can say CRB=5FCC=5FADDRESS=5FTRANSLATION=5FFAULT or CRN=5FCC=5FTRANSLA=
TION=5FFAULT.=20
This code path (also CRBs) should be generic, so should not use like=20
CRB=5FCC=5FNX=5FFAULT.=20

Thanks
Haren

>=20
> cheers
>=20
>=20
> > diff --git a/Documentation/powerpc/vas-api.rst b/Documentation/
> powerpc/vas-api.rst
> > index 1217c2f..78627cc 100644
> > --- a/Documentation/powerpc/vas-api.rst
> > +++ b/Documentation/powerpc/vas-api.rst
> > @@ -213,7 +213,7 @@ request buffers are not in memory. The=20
> operating system handles the fault by
> >  updating CSB with the following data:
> >=20
> >     csb.flags =3D CSB=5FV;
> > -   csb.cc =3D CSB=5FCC=5FTRANSLATION;
> > +   csb.cc =3D CSB=5FCC=5FADDRESS=5FTRANSLATION;
> >     csb.ce =3D CSB=5FCE=5FTERMINATION;
> >     csb.address =3D fault=5Faddress;
> >=20
> > diff --git a/arch/powerpc/include/asm/icswx.h b/arch/powerpc/
> include/asm/icswx.h
> > index 965b1f3..b1c9a57 100644
> > --- a/arch/powerpc/include/asm/icswx.h
> > +++ b/arch/powerpc/include/asm/icswx.h
> > @@ -77,6 +77,8 @@ struct coprocessor=5Fcompletion=5Fblock {
> >  #define CSB=5FCC=5FCHAIN      (37)
> >  #define CSB=5FCC=5FSEQUENCE      (38)
> >  #define CSB=5FCC=5FHW      (39)
> > +/* User space address traslation failure */
> > +#define   CSB=5FCC=5FADDRESS=5FTRANSLATION   (250)
> >=20
> >  #define CSB=5FSIZE      (0x10)
> >  #define CSB=5FALIGN      CSB=5FSIZE
> > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/
> powerpc/platforms/powernv/vas-fault.c
> > index 266a6ca..33e89d4 100644
> > --- a/arch/powerpc/platforms/powernv/vas-fault.c
> > +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> > @@ -79,7 +79,7 @@ static void update=5Fcsb(struct vas=5Fwindow *window,
> >     csb=5Faddr =3D (void =5F=5Fuser *)be64=5Fto=5Fcpu(crb->csb=5Faddr);
> >=20
> >     memset(&csb, 0, sizeof(csb));
> > -   csb.cc =3D CSB=5FCC=5FTRANSLATION;
> > +   csb.cc =3D CSB=5FCC=5FADDRESS=5FTRANSLATION;
> >     csb.ce =3D CSB=5FCE=5FTERMINATION;
> >     csb.cs =3D 0;
> >     csb.count =3D 0;
> > --=20
> > 1.8.3.1
>=20





--=_alternative 006EFBA5852585A0_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<span style=3D" font-size:10pt;font-family:Arial">copied verbatim from P9
DD2 Nest Accelerators Workbook</span><span style=3D" font-size:10pt;font-fa=
mily:sans-serif">Version 3.2</span><br><br><span style=3D" font-size:10pt;f=
ont-family:sans-serif">Table 4-36. </span><span style=3D" font-size:10pt;fo=
nt-family:Arial"><i>CSB
Non-zero CC Reported Error Types</i></span><br><br><span style=3D" font-siz=
e:10pt;font-family:sans-serif">CC=3D5, Error Type:
Translation, </span><br><span style=3D" font-size:10pt;font-family:sans-ser=
if">Comment: Unused,
defined by RFC02130 (footnote: &nbsp;</span><span style=3D" font-size:10pt;=
font-family:Arial">DMA
controller uses this CC internally in translation fault handling. Do not
reuse for other purposes.</span><span style=3D" font-size:10pt;font-family:=
sans-serif">)</span><br><br><span style=3D" font-size:10pt;font-family:Aria=
l">CC=3D240 through 251,
reserved for future firmware use, </span><br><span style=3D" font-size:10pt=
;font-family:Arial">Comment: Error codes
240 - 255 (0xF0 - 0xF0) are reserved for firmware use and are not signalled
by the hardware. </span><br><span style=3D" font-size:10pt;font-family:Aria=
l">These CCs are written
in the CSB by hypervisor to alert the partition to error conditions detected
by the hypervisor. </span><br><span style=3D" font-size:10pt;font-family:Ar=
ial">These codes have been
used in past processors for this purpose and ought not be relocated.</span>=
<br><br><br><br><br><br><span style=3D" font-size:9pt;color:#5f5f5f;font-fa=
mily:sans-serif">From:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Haren
Myneni/Beaverton/IBM</span><br><span style=3D" font-size:9pt;color:#5f5f5f;=
font-family:sans-serif">To:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Michael
Ellerman &lt;mpe@ellerman.id.au&gt;</span><br><span style=3D" font-size:9pt=
;color:#5f5f5f;font-family:sans-serif">Cc:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">abali@us.ibm.com,
Haren Myneni &lt;haren@linux.ibm.com&gt;, linuxppc-dev@lists.ozlabs.org,
&quot;Linuxppc-dev&quot;&lt;linuxppc-dev-bounces+hbabu=3Dus.ibm.com@lists.o=
zlabs.org&gt;,
rzinsly@linux.ibm.com, tulioqm@br.ibm.com, Haren Myneni/Beaverton/IBM@IBMUS=
</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:sans-ser=
if">Date:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">07/09/2020
04:01 PM</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:=
sans-serif">Subject:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Re:
[EXTERNAL] Re: [PATCH 1/2] powerpc/vas: Report proper error for address
translation failure</span><br><hr noshade><br><br><br><br><tt><span style=
=3D" font-size:10pt">&quot;Linuxppc-dev&quot; &lt;linuxppc-dev-bounces+hbab=
u=3Dus.ibm.com@lists.ozlabs.org&gt;
wrote on 07/09/2020 04:22:10 AM:<br><br>&gt; From: Michael Ellerman &lt;mpe=
@ellerman.id.au&gt;</span></tt><br><tt><span style=3D" font-size:10pt">&gt;=
 To: Haren Myneni &lt;haren@linux.ibm.com&gt;</span></tt><br><tt><span styl=
e=3D" font-size:10pt">&gt; Cc: tulioqm@br.ibm.com, abali@us.ibm.com,
linuxppc-<br>&gt; dev@lists.ozlabs.org, rzinsly@linux.ibm.com</span></tt><b=
r><tt><span style=3D" font-size:10pt">&gt; Date: 07/09/2020 04:21 AM</span>=
</tt><br><tt><span style=3D" font-size:10pt">&gt; Subject: [EXTERNAL] Re: [=
PATCH
1/2] powerpc/vas: Report proper error<br>&gt; for address translation failu=
re</span></tt><br><tt><span style=3D" font-size:10pt">&gt; Sent by: &quot;L=
inuxppc-dev&quot;
&lt;linuxppc-dev-bounces<br>&gt; +hbabu=3Dus.ibm.com@lists.ozlabs.org&gt;</=
span></tt><br><tt><span style=3D" font-size:10pt">&gt; <br>&gt; Haren Mynen=
i &lt;haren@linux.ibm.com&gt; writes:<br>&gt; &gt; DMA controller uses CC=
=3D5 internally for translation fault handling.
So<br>&gt; &gt; OS should be using CC=3D250 and should report this error to=
 the
user space<br>&gt; &gt; when NX encounters address translation failure on t=
he request
buffer.<br>&gt; <br>&gt; That doesn't really explain *why* the OS must use =
CC=3D250.<br>&gt; <br>&gt; Is it documented somewhere that 5 is for hardwar=
e use, and 250 is
for<br>&gt; software?</span></tt><br><br><tt><span style=3D" font-size:10pt=
">Yes, mentioned in</span></tt><span style=3D" font-size:10pt;font-family:A=
rial-ItalicMT">Table 4-36. CSB Non-zero CC Reported Error Types</span><tt><=
span style=3D" font-size:10pt">(P9 NX DD2 work book). Also footnote for CC=
=3D5 says </span></tt><span style=3D" font-size:10pt;font-family:sans-serif=
">&quot;DMA
controller uses this CC internally in translation fault handling. Do not
reuse for other purposes&quot;</span><br><br><span style=3D" font-size:10pt=
;font-family:sans-serif">I will add documentation
reference for CC=3D250 comment. </span><br><tt><span style=3D" font-size:10=
pt"><br>&gt; <br>&gt; &gt; This patch defines CSB=5FCC=5FADDRESS=5FTRANSLAT=
ION(250) and updates<br>&gt; &gt; CSB.CC with this proper error code for us=
er space.<br>&gt; <br>&gt; We still have:<br>&gt; <br>&gt; #define CSB=5FCC=
=5FTRANSLATION &nbsp; (5)<br>&gt; <br>&gt; And it's very unclear where one =
or the other should be used.<br>&gt; <br>&gt; Can one or the other get a na=
me that makes the distinction clear.</span></tt><br><br><tt><span style=3D"=
 font-size:10pt">CSB=5FCC=5FTRANSLATION is added in 842
driver (nx-common-powernv.c) when NX is introduced (P7+). NX will not see
faults on kernel requests (cc=3D250) and even CC=3D5. </span></tt><br><br><=
tt><span style=3D" font-size:10pt">Table 4-36: </span></tt><br><tt><span st=
yle=3D" font-size:10pt">For CC=3D5: says Translation</span></tt><br><tt><sp=
an style=3D" font-size:10pt">CC=3D250: &nbsp; &nbsp;says &quot;Address
Translation Fault&quot;</span></tt><br><br><tt><span style=3D" font-size:10=
pt">So I can say CRB=5FCC=5FADDRESS=5FTRANSLATION=5FFAULT
or CRN=5FCC=5FTRANSLATION=5FFAULT. This code path (also CRBs) should be gen=
eric,
so should not use like CRB=5FCC=5FNX=5FFAULT. </span></tt><br><br><tt><span=
 style=3D" font-size:10pt">Thanks</span></tt><br><tt><span style=3D" font-s=
ize:10pt">Haren</span></tt><br><tt><span style=3D" font-size:10pt"><br>&gt;=
 <br>&gt; cheers<br>&gt; <br>&gt; <br>&gt; &gt; diff --git a/Documentation/=
powerpc/vas-api.rst b/Documentation/<br>&gt; powerpc/vas-api.rst<br>&gt; &g=
t; index 1217c2f..78627cc 100644<br>&gt; &gt; --- a/Documentation/powerpc/v=
as-api.rst<br>&gt; &gt; +++ b/Documentation/powerpc/vas-api.rst<br>&gt; &gt=
; @@ -213,7 +213,7 @@ request buffers are not in memory. The <br>&gt; opera=
ting system handles the fault by<br>&gt; &gt; &nbsp;updating CSB with the f=
ollowing data:<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; csb.flags =3D=
 CSB=5FV;<br>&gt; &gt; - &nbsp; csb.cc =3D CSB=5FCC=5FTRANSLATION;<br>&gt; =
&gt; + &nbsp; csb.cc =3D CSB=5FCC=5FADDRESS=5FTRANSLATION;<br>&gt; &gt; &nb=
sp; &nbsp; csb.ce =3D CSB=5FCE=5FTERMINATION;<br>&gt; &gt; &nbsp; &nbsp; cs=
b.address =3D fault=5Faddress;<br>&gt; &gt; &nbsp;<br>&gt; &gt; diff --git =
a/arch/powerpc/include/asm/icswx.h b/arch/powerpc/<br>&gt; include/asm/icsw=
x.h<br>&gt; &gt; index 965b1f3..b1c9a57 100644<br>&gt; &gt; --- a/arch/powe=
rpc/include/asm/icswx.h<br>&gt; &gt; +++ b/arch/powerpc/include/asm/icswx.h=
<br>&gt; &gt; @@ -77,6 +77,8 @@ struct coprocessor=5Fcompletion=5Fblock {<b=
r>&gt; &gt; &nbsp;#define CSB=5FCC=5FCHAIN &nbsp; &nbsp; &nbsp;(37)<br>&gt;=
 &gt; &nbsp;#define CSB=5FCC=5FSEQUENCE &nbsp; &nbsp; &nbsp;(38)<br>&gt; &g=
t; &nbsp;#define CSB=5FCC=5FHW &nbsp; &nbsp; &nbsp;(39)<br>&gt; &gt; +/* Us=
er space address traslation failure */<br>&gt; &gt; +#define &nbsp; CSB=5FC=
C=5FADDRESS=5FTRANSLATION &nbsp; (250)<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nb=
sp;#define CSB=5FSIZE &nbsp; &nbsp; &nbsp;(0x10)<br>&gt; &gt; &nbsp;#define=
 CSB=5FALIGN &nbsp; &nbsp; &nbsp;CSB=5FSIZE<br>&gt; &gt; diff --git a/arch/=
powerpc/platforms/powernv/vas-fault.c b/arch/<br>&gt; powerpc/platforms/pow=
ernv/vas-fault.c<br>&gt; &gt; index 266a6ca..33e89d4 100644<br>&gt; &gt; --=
- a/arch/powerpc/platforms/powernv/vas-fault.c<br>&gt; &gt; +++ b/arch/powe=
rpc/platforms/powernv/vas-fault.c<br>&gt; &gt; @@ -79,7 +79,7 @@ static voi=
d update=5Fcsb(struct vas=5Fwindow *window,<br>&gt; &gt; &nbsp; &nbsp; csb=
=5Faddr =3D (void =5F=5Fuser *)be64=5Fto=5Fcpu(crb-&gt;csb=5Faddr);<br>&gt;=
 &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; memset(&amp;csb, 0, sizeof(csb));<b=
r>&gt; &gt; - &nbsp; csb.cc =3D CSB=5FCC=5FTRANSLATION;<br>&gt; &gt; + &nbs=
p; csb.cc =3D CSB=5FCC=5FADDRESS=5FTRANSLATION;<br>&gt; &gt; &nbsp; &nbsp; =
csb.ce =3D CSB=5FCE=5FTERMINATION;<br>&gt; &gt; &nbsp; &nbsp; csb.cs =3D 0;=
<br>&gt; &gt; &nbsp; &nbsp; csb.count =3D 0;<br>&gt; &gt; -- <br>&gt; &gt; =
1.8.3.1<br>&gt; <br></span></tt><br><br><BR>

--=_alternative 006EFBA5852585A0_=--

