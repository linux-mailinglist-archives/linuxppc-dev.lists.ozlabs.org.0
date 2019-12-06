Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D19E0115965
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 23:48:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V76r1hKwzDqjQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 09:48:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbabu@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Tnsp6xHNzDqHG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 20:51:25 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB69l5Hm098424
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Dec 2019 04:51:22 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.119])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq9gmvxmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Dec 2019 04:51:22 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <hbabu@us.ibm.com>;
 Fri, 6 Dec 2019 09:51:21 -0000
Received: from us1b3-smtp04.a3dr.sjc01.isc4sb.com (10.122.203.161)
 by smtp.notes.na.collabserv.com (10.122.182.123) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 6 Dec 2019 09:51:14 -0000
Received: from us1b3-mail61.a3dr.sjc01.isc4sb.com ([10.122.7.99])
 by us1b3-smtp04.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019120609511404-212506 ;
 Fri, 6 Dec 2019 09:51:14 +0000 
In-Reply-To: <20191127084609.GF17097@infradead.org>
From: "Haren Myneni" <hbabu@us.ibm.com>
To: hch@infradead.org
Date: Fri, 6 Dec 2019 09:51:13 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20191127084609.GF17097@infradead.org>,
 <1574817074.13250.16.camel@hbabu-laptop>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-KeepSent: 1D63117F:3ABE1CEA-002584C8:0034C090;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 57143
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19120609-3975-0000-0000-000000FF6302
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.407427; ST=0; TS=0; UL=0; ISC=; MB=0.003030
X-IBM-SpamModules-Versions: BY=3.00012203; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01300352; UDB=6.00690437; IPR=6.01082627; 
 MB=3.00029868; MTD=3.00000008; XFM=3.00000015; UTC=2019-12-06 09:51:20
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-12-06 05:54:51 - 6.00010733
x-cbparentid: 19120609-3976-0000-0000-000033B3973A
Message-Id: <OF1D63117F.3ABE1CEA-ON002584C8.0034C090-002584C8.003620E3@notes.na.collabserv.com>
Subject: RE: [PATCH 09/14] powerpc/vas: Update CSB and notify process for
 fault CRBs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_02:2019-12-04,2019-12-06 signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Sat, 07 Dec 2019 09:47:19 +1100
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" ><font face=3D"Defau=
lt Monospace,Courier New,Courier,monospace" size=3D"2" >&gt; &nbsp;<br>&gt;=
 +static void notify=5Fprocess(pid=5Ft pid, u64 fault=5Faddr)<br>&gt; +{<br=
>&gt; + int rc;<br>&gt; + struct kernel=5Fsiginfo info;<br>&gt; +<br>&gt; +=
 memset(&amp;info, 0, sizeof(info));<br>&gt; +<br>&gt; + info.si=5Fsigno =
=3D SIGSEGV;<br>&gt; + info.si=5Ferrno =3D EFAULT;<br>&gt; + info.si=5Fcode=
 =3D SEGV=5FMAPERR;<br>&gt; +<br>&gt; + info.si=5Faddr =3D (void *)fault=5F=
addr;<br>&gt; + rcu=5Fread=5Flock();<br>&gt; + rc =3D kill=5Fpid=5Finfo(SIG=
SEGV, &amp;info, find=5Fvpid(pid));<br>&gt; + rcu=5Fread=5Funlock();<br>&gt=
; +<br>&gt; + pr=5Fdevel("%s(): pid %d kill=5Fproc=5Finfo() rc %d\n", =5F=
=5Ffunc=5F=5F, pid, rc);<br>&gt; +}<br><br>Shouldn't this use force=5Fsig=
=5Ffault=5Fto=5Ftask instead?</font><br>&nbsp;</div>
<div dir=3D"ltr" ><font face=3D"Default Monospace,Courier New,Courier,monos=
pace" size=3D"2" >User space send compression request as Coprocessor Reques=
t Block (CRB) with CSB (status block)to NX&nbsp;directly and polls on CSB a=
ddress. NX updates CSB after&nbsp;processing the request. If NX sees&nbsp;f=
ault on the request buffer or CSB,&nbsp;interrupts kernel. So generally CSB=
 should be valid since it supposed to poll&nbsp;csb.flags.&nbsp;</font></di=
v>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><font face=3D"Default Monospace,Courier New,Courier,monos=
pace" size=3D"2" >If an application does not behave as expected&nbsp;or NX =
pastes wrong information, an error message will be printed and send signal =
to an application. So&nbsp;applications or libnxz can ignore SEGV signal or=
 can have their own handlers.&nbsp;</font><br>&nbsp;</div></div><BR>

