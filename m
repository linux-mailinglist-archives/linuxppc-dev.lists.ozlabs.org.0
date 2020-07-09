Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D524121AA4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 00:11:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2r4B0pnVzDrFb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 08:11:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbabu@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2nBM73mFzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 06:01:41 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069K1bg6036328
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Jul 2020 16:01:38 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325kgupmqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 16:01:38 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <hbabu@us.ibm.com>;
 Thu, 9 Jul 2020 20:01:31 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 9 Jul 2020 20:01:27 -0000
Received: from us1a3-mail61.a3.dal09.isc4sb.com ([10.142.3.102])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2020070920012617-1824202 ;
 Thu, 9 Jul 2020 20:01:26 +0000 
MIME-Version: 1.0
In-Reply-To: <87y2ntue59.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
From: "Haren Myneni" <hbabu@us.ibm.com>
Date: Thu, 9 Jul 2020 13:01:25 -0700
References: <f8af60fd4167c9c04ee5ab47147b9e95bcb3b9ff.camel@linux.ibm.com>
 <87y2ntue59.fsf@mpe.ellerman.id.au>
X-KeepSent: C54F205D:A4C093B7-002585A0:006C5930;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP7 Octobe4, 2013
X-LLNOutbound: False
X-Disclaimed: 58791
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBB0F33DFFFDFA08f9e8a93df938690918c8FBB0F33DFFFDFA0"
Content-Disposition: inline
x-cbid: 20070920-7279-0000-0000-00000321AEB2
X-IBM-SpamModules-Scores: BY=0.260658; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.000411
X-IBM-SpamModules-Versions: BY=3.00013437; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01403400; UDB=6.00751708; IPR=6.01185666; 
 MB=3.00032928; MTD=3.00000008; XFM=3.00000015; UTC=2020-07-09 20:01:30
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-07-09 19:46:40 - 6.00011581
x-cbparentid: 20070920-7280-0000-0000-000098FB132B
Message-Id: <OFC54F205D.A4C093B7-ON002585A0.006C5930-882585A0.006DFE69@notes.na.collabserv.com>
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
 abali@us.ibm.com, linuxppc-dev@lists.ozlabs.org, rzinsly@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0__=8FBB0F33DFFFDFA08f9e8a93df938690918c8FBB0F33DFFFDFA0
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII




"Linuxppc-dev" <linuxppc-dev-bounces+hbabu=3Dus.ibm.com@lists.ozlabs.org>
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
>
> Haren Myneni <haren@linux.ibm.com> writes:
> > DMA controller uses CC=3D5 internally for translation fault handling. So
> > OS should be using CC=3D250 and should report this error to the user
space
> > when NX encounters address translation failure on the request buffer.
>
> That doesn't really explain *why* the OS must use CC=3D250.
>
> Is it documented somewhere that 5 is for hardware use, and 250 is for
> software?

Yes, mentioned in Table 4-36. CSB Non-zero CC Reported Error Types (P9 NX
DD2 work book). Also footnote for CC=3D5 says "DMA controller uses this CC
internally in translation fault handling. Do not reuse for other purposes"

I will add documentation reference for CC=3D250 comment.

>
> > This patch defines CSB=5FCC=5FADDRESS=5FTRANSLATION(250) and updates
> > CSB.CC with this proper error code for user space.
>
> We still have:
>
> #define CSB=5FCC=5FTRANSLATION   (5)
>
> And it's very unclear where one or the other should be used.
>
> Can one or the other get a name that makes the distinction clear.

CSB=5FCC=5FTRANSLATION is added in 842 driver (nx-common-powernv.c) when NX=
 is
introduced (P7+). NX will not see faults on kernel requests (cc=3D250) and
even CC=3D5.

Table 4-36:
For CC=3D5: says Translation
CC=3D250:    says "Address Translation Fault"

So I can say CRB=5FCC=5FADDRESS=5FTRANSLATION=5FFAULT or CRN=5FCC=5FTRANSLA=
TION=5FFAULT.
This code path (also CRBs) should be generic, so should not use like
CRB=5FCC=5FNX=5FFAULT.

Thanks
Haren

>
> cheers
>
>
> > diff --git a/Documentation/powerpc/vas-api.rst b/Documentation/
> powerpc/vas-api.rst
> > index 1217c2f..78627cc 100644
> > --- a/Documentation/powerpc/vas-api.rst
> > +++ b/Documentation/powerpc/vas-api.rst
> > @@ -213,7 +213,7 @@ request buffers are not in memory. The
> operating system handles the fault by
> >  updating CSB with the following data:
> >
> >     csb.flags =3D CSB=5FV;
> > -   csb.cc =3D CSB=5FCC=5FTRANSLATION;
> > +   csb.cc =3D CSB=5FCC=5FADDRESS=5FTRANSLATION;
> >     csb.ce =3D CSB=5FCE=5FTERMINATION;
> >     csb.address =3D fault=5Faddress;
> >
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
> >
> >  #define CSB=5FSIZE      (0x10)
> >  #define CSB=5FALIGN      CSB=5FSIZE
> > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/
> powerpc/platforms/powernv/vas-fault.c
> > index 266a6ca..33e89d4 100644
> > --- a/arch/powerpc/platforms/powernv/vas-fault.c
> > +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> > @@ -79,7 +79,7 @@ static void update=5Fcsb(struct vas=5Fwindow *window,
> >     csb=5Faddr =3D (void =5F=5Fuser *)be64=5Fto=5Fcpu(crb->csb=5Faddr);
> >
> >     memset(&csb, 0, sizeof(csb));
> > -   csb.cc =3D CSB=5FCC=5FTRANSLATION;
> > +   csb.cc =3D CSB=5FCC=5FADDRESS=5FTRANSLATION;
> >     csb.ce =3D CSB=5FCE=5FTERMINATION;
> >     csb.cs =3D 0;
> >     csb.count =3D 0;
> > --
> > 1.8.3.1
>

--0__=8FBB0F33DFFFDFA08f9e8a93df938690918c8FBB0F33DFFFDFA0
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;Linuxppc-dev&quot; &lt;linuxppc-d=
ev-bounces+hbabu=3Dus.ibm.com@lists.ozlabs.org&gt; wrote on 07/09/2020 04:2=
2:10 AM:<br><br>&gt; From: Michael Ellerman &lt;mpe@ellerman.id.au&gt;</fon=
t></tt><br><tt><font size=3D"2">&gt; To: Haren Myneni &lt;haren@linux.ibm.c=
om&gt;</font></tt><br><tt><font size=3D"2">&gt; Cc: tulioqm@br.ibm.com, aba=
li@us.ibm.com, linuxppc-<br>&gt; dev@lists.ozlabs.org, rzinsly@linux.ibm.co=
m</font></tt><br><tt><font size=3D"2">&gt; Date: 07/09/2020 04:21 AM</font>=
</tt><br><tt><font size=3D"2">&gt; Subject: [EXTERNAL] Re: [PATCH 1/2] powe=
rpc/vas: Report proper error<br>&gt; for address translation failure</font>=
</tt><br><tt><font size=3D"2">&gt; Sent by: &quot;Linuxppc-dev&quot; &lt;li=
nuxppc-dev-bounces<br>&gt; +hbabu=3Dus.ibm.com@lists.ozlabs.org&gt;</font><=
/tt><br><tt><font size=3D"2">&gt; <br>&gt; Haren Myneni &lt;haren@linux.ibm=
.com&gt; writes:<br>&gt; &gt; DMA controller uses CC=3D5 internally for tra=
nslation fault handling. So<br>&gt; &gt; OS should be using CC=3D250 and sh=
ould report this error to the user space<br>&gt; &gt; when NX encounters ad=
dress translation failure on the request buffer.<br>&gt; <br>&gt; That does=
n't really explain *why* the OS must use CC=3D250.<br>&gt; <br>&gt; Is it d=
ocumented somewhere that 5 is for hardware use, and 250 is for<br>&gt; soft=
ware?</font></tt><br><br><tt><font size=3D"2">Yes, mentioned in</font></tt>=
<font size=3D"2" face=3D"Arial-ItalicMT"> Table 4-36. CSB Non-zero CC Repor=
ted Error Types</font><tt><font size=3D"2">&nbsp;(</font></tt><tt><font siz=
e=3D"2">P9 NX DD2 work book). Also footnote for CC=3D5 says </font></tt><fo=
nt size=3D"2">&quot;</font><font size=3D"2">DMA controller uses this CC int=
ernally in translation fault handling. Do not reuse for other purposes</fon=
t><font size=3D"2">&quot;</font><br><br><font size=3D"2">I will add documen=
tation reference for CC=3D250 comment. </font><br><tt><font size=3D"2"><br>=
&gt; <br>&gt; &gt; This patch defines CSB=5FCC=5FADDRESS=5FTRANSLATION(250)=
 and updates<br>&gt; &gt; CSB.CC with this proper error code for user space=
.<br>&gt; <br>&gt; We still have:<br>&gt; <br>&gt; #define CSB=5FCC=5FTRANS=
LATION &nbsp; (5)<br>&gt; <br>&gt; And it's very unclear where one or the o=
ther should be used.<br>&gt; <br>&gt; Can one or the other get a name that =
makes the distinction clear.</font></tt><br><br><tt><font size=3D"2">CSB=5F=
CC=5FTRANSLATION is added in 842 driver (nx-common-powernv.c) when NX is in=
troduced (P7+). NX will not see faults on kernel requests (cc=3D250) and ev=
en CC=3D5. </font></tt><br><br><tt><font size=3D"2">Table 4-36: </font></tt=
><br><tt><font size=3D"2">For CC=3D5: says Translation</font></tt><br><tt><=
font size=3D"2">CC=3D250: &nbsp; &nbsp;says &quot;Address Translation Fault=
&quot;</font></tt><br><br><tt><font size=3D"2">So I can say CRB=5FCC=5FADDR=
ESS=5FTRANSLATION=5FFAULT or CRN=5FCC=5FTRANSLATION=5FFAULT. This code path=
 (also CRBs) should be generic, so should not use like CRB=5FCC=5FNX=5FFAUL=
T. </font></tt><br><br><tt><font size=3D"2">Thanks</font></tt><br><tt><font=
 size=3D"2">Haren</font></tt><br><tt><font size=3D"2"><br>&gt; <br>&gt; che=
ers<br>&gt; <br>&gt; <br>&gt; &gt; diff --git a/Documentation/powerpc/vas-a=
pi.rst b/Documentation/<br>&gt; powerpc/vas-api.rst<br>&gt; &gt; index 1217=
c2f..78627cc 100644<br>&gt; &gt; --- a/Documentation/powerpc/vas-api.rst<br=
>&gt; &gt; +++ b/Documentation/powerpc/vas-api.rst<br>&gt; &gt; @@ -213,7 +=
213,7 @@ request buffers are not in memory. The <br>&gt; operating system h=
andles the fault by<br>&gt; &gt; &nbsp;updating CSB with the following data=
:<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; csb.flags =3D CSB=5FV;<br>=
&gt; &gt; - &nbsp; csb.cc =3D CSB=5FCC=5FTRANSLATION;<br>&gt; &gt; + &nbsp;=
 csb.cc =3D CSB=5FCC=5FADDRESS=5FTRANSLATION;<br>&gt; &gt; &nbsp; &nbsp; cs=
b.ce =3D CSB=5FCE=5FTERMINATION;<br>&gt; &gt; &nbsp; &nbsp; csb.address =3D=
 fault=5Faddress;<br>&gt; &gt; &nbsp;<br>&gt; &gt; diff --git a/arch/powerp=
c/include/asm/icswx.h b/arch/powerpc/<br>&gt; include/asm/icswx.h<br>&gt; &=
gt; index 965b1f3..b1c9a57 100644<br>&gt; &gt; --- a/arch/powerpc/include/a=
sm/icswx.h<br>&gt; &gt; +++ b/arch/powerpc/include/asm/icswx.h<br>&gt; &gt;=
 @@ -77,6 +77,8 @@ struct coprocessor=5Fcompletion=5Fblock {<br>&gt; &gt; &=
nbsp;#define CSB=5FCC=5FCHAIN &nbsp; &nbsp; &nbsp;(37)<br>&gt; &gt; &nbsp;#=
define CSB=5FCC=5FSEQUENCE &nbsp; &nbsp; &nbsp;(38)<br>&gt; &gt; &nbsp;#def=
ine CSB=5FCC=5FHW &nbsp; &nbsp; &nbsp;(39)<br>&gt; &gt; +/* User space addr=
ess traslation failure */<br>&gt; &gt; +#define &nbsp; CSB=5FCC=5FADDRESS=
=5FTRANSLATION &nbsp; (250)<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;#define =
CSB=5FSIZE &nbsp; &nbsp; &nbsp;(0x10)<br>&gt; &gt; &nbsp;#define CSB=5FALIG=
N &nbsp; &nbsp; &nbsp;CSB=5FSIZE<br>&gt; &gt; diff --git a/arch/powerpc/pla=
tforms/powernv/vas-fault.c b/arch/<br>&gt; powerpc/platforms/powernv/vas-fa=
ult.c<br>&gt; &gt; index 266a6ca..33e89d4 100644<br>&gt; &gt; --- a/arch/po=
werpc/platforms/powernv/vas-fault.c<br>&gt; &gt; +++ b/arch/powerpc/platfor=
ms/powernv/vas-fault.c<br>&gt; &gt; @@ -79,7 +79,7 @@ static void update=5F=
csb(struct vas=5Fwindow *window,<br>&gt; &gt; &nbsp; &nbsp; csb=5Faddr =3D =
(void =5F=5Fuser *)be64=5Fto=5Fcpu(crb-&gt;csb=5Faddr);<br>&gt; &gt; &nbsp;=
<br>&gt; &gt; &nbsp; &nbsp; memset(&amp;csb, 0, sizeof(csb));<br>&gt; &gt; =
- &nbsp; csb.cc =3D CSB=5FCC=5FTRANSLATION;<br>&gt; &gt; + &nbsp; csb.cc =
=3D CSB=5FCC=5FADDRESS=5FTRANSLATION;<br>&gt; &gt; &nbsp; &nbsp; csb.ce =3D=
 CSB=5FCE=5FTERMINATION;<br>&gt; &gt; &nbsp; &nbsp; csb.cs =3D 0;<br>&gt; &=
gt; &nbsp; &nbsp; csb.count =3D 0;<br>&gt; &gt; -- <br>&gt; &gt; 1.8.3.1<br=
>&gt; <br></font></tt><BR>
</body></html>

--0__=8FBB0F33DFFFDFA08f9e8a93df938690918c8FBB0F33DFFFDFA0--

