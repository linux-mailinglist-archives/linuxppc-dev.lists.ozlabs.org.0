Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF26D19CCDE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 00:30:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48td7h4MvMzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 09:30:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=wenxiong@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tcgm0YlDzDrSK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 09:10:04 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032M2NqG092125
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Apr 2020 18:10:03 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304swtbsqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 18:10:03 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <wenxiong@us.ibm.com>;
 Thu, 2 Apr 2020 22:10:02 -0000
Received: from us1b3-smtp02.a3dr.sjc01.isc4sb.com (10.122.7.175)
 by smtp.notes.na.collabserv.com (10.122.47.50) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 2 Apr 2020 22:09:58 -0000
Received: from us1b3-mail226.a3dr.sjc03.isc4sb.com ([10.168.214.40])
 by us1b3-smtp02.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020040222095760-888505 ;
 Thu, 2 Apr 2020 22:09:57 +0000 
In-Reply-To: <20200331012338.23773-1-aik@ozlabs.ru>
From: "Wen Xiong" <wenxiong@us.ibm.com>
To: aik@ozlabs.ru
Date: Thu, 2 Apr 2020 22:09:57 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20200331012338.23773-1-aik@ozlabs.ru>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP64 March 05, 2020 at 12:58
X-KeepSent: AFE8A91E:912BDABA-0025853E:00788BCA;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 60015
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20040222-1059-0000-0000-000001B9B8FD
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.177461
X-IBM-SpamModules-Versions: BY=3.00012866; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01356748; UDB=6.00724087; IPR=6.01139182; 
 MB=3.00031517; MTD=3.00000008; XFM=3.00000015; UTC=2020-04-02 22:10:02
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-04-02 15:08:11 - 6.00011194
x-cbparentid: 20040222-1060-0000-0000-00004A9BE18F
Message-Id: <OFAFE8A91E.912BDABA-ON0025853E.00788BCA-0025853E.0079C2C8@notes.na.collabserv.com>
Subject: Re: [PATCH kernel] powerpc/pseries/ddw: Extend upper limit for huge
 DMA window for persistent memory
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_11:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Fri, 03 Apr 2020 09:29:24 +1100
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
Cc: Brian J King <bjking1@us.ibm.com>, aik@ozlabs.ru,
 aneesh.kumar@linux.ibm.com, oohall@gmail.com, linuxppc-dev@lists.ozlabs.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" style=3D"font-family:Arial, Helvetica, sa=
ns-serif;font-size:10pt" dir=3D"ltr" ><div dir=3D"ltr" >I applied the patch=
 on top of the latest upstream kernel. I ran HTX over pmem nodes for severa=
l hours and it works.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Tested-by: Wen Xiong&lt;wenxiong@linux.vnet.ibm.com&gt;</=
div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks,</div>
<div dir=3D"ltr" >Wendy</div>
<blockquote style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddin=
g-left:5px; direction:ltr; margin-right:0px" dir=3D"ltr" data-history-conte=
nt-modified=3D"1" >----- Original message -----<br>From: Alexey Kardashevsk=
iy &lt;aik@ozlabs.ru&gt;<br>To: linuxppc-dev@lists.ozlabs.org<br>Cc: Alexey=
 Kardashevskiy &lt;aik@ozlabs.ru&gt;, David Gibson &lt;david@gibson.dropbea=
r.id.au&gt;, Michael Ellerman &lt;mpe@ellerman.id.au&gt;, Oliver O'Halloran=
 &lt;oohall@gmail.com&gt;, "Aneesh Kumar K . V" &lt;aneesh.kumar@linux.ibm.=
com&gt;, Wen Xiong &lt;wenxiong@us.ibm.com&gt;, Brian J King &lt;bjking1@us=
.ibm.com&gt;<br>Subject: [EXTERNAL] [PATCH kernel] powerpc/pseries/ddw: Ext=
end upper limit for huge DMA window for persistent memory<br>Date: Mon, Mar=
 30, 2020 8:23 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Unlike normal memory ("memory" compatible type in the FDT),<br>the per=
sistent memory ("ibm,pmemory" in the FDT) can be mapped anywhere<br>in the =
guest physical space and it can be used for DMA.<br><br>In order to maintai=
n 1:1 mapping via the huge DMA window, we need to<br>know the maximum physi=
cal address at the time of the window setup.<br>So far we've been looking a=
t "memory" nodes but "ibm,pmemory" does not<br>have fixed addresses and the=
 persistent memory may be mapped afterwards.<br><br>Since the persistent me=
mory is still backed with page structs,<br>use MAX=5FPHYSMEM=5FBITS as the =
upper limit.<br><br>This effectively disables huge DMA window in LPAR under=
 pHyp if<br>persistent memory is present but this is the best we can do.<br=
><br>Signed-off-by: Alexey Kardashevskiy &lt;aik@ozlabs.ru&gt;<br>---<br>&n=
bsp;arch/powerpc/platforms/pseries/iommu.c | 9 +++++++++<br>&nbsp;1 file ch=
anged, 9 insertions(+)<br><br>diff --git a/arch/powerpc/platforms/pseries/i=
ommu.c b/arch/powerpc/platforms/pseries/iommu.c<br>index 2e0a8eab5588..6d47=
b4a3ce39 100644<br>--- a/arch/powerpc/platforms/pseries/iommu.c<br>+++ b/ar=
ch/powerpc/platforms/pseries/iommu.c<br>@@ -945,6 +945,15 @@ static phys=5F=
addr=5Ft ddw=5Fmemory=5Fhotplug=5Fmax(void)<br>&nbsp; phys=5Faddr=5Ft max=
=5Faddr =3D memory=5Fhotplug=5Fmax();<br>&nbsp; struct device=5Fnode *memor=
y;<br>&nbsp;<br>+ /*<br>+ * The "ibm,pmemory" can appear anywhere in the ad=
dress space.<br>+ * Assuming it is still backed by page structs, set the up=
per limit<br>+ * for the huge DMA window as MAX=5FPHYSMEM=5FBITS.<br>+ */<b=
r>+ if (of=5Ffind=5Fnode=5Fby=5Ftype(NULL, "ibm,pmemory"))<br>+ return (siz=
eof(phys=5Faddr=5Ft) * 8 &lt;=3D MAX=5FPHYSMEM=5FBITS) ?<br>+ (phys=5Faddr=
=5Ft) -1 : (1ULL &lt;&lt; MAX=5FPHYSMEM=5FBITS);<br>+<br>&nbsp; for=5Feach=
=5Fnode=5Fby=5Ftype(memory, "memory") {<br>&nbsp; unsigned long start, size=
;<br>&nbsp; int n=5Fmem=5Faddr=5Fcells, n=5Fmem=5Fsize=5Fcells, len;<br>--<=
br>2.17.1</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

