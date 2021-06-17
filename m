Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1273AACB1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 08:47:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5CKw3cvCz3c4q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 16:47:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fjs7lG5t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Fjs7lG5t; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5CBh51CDz3clM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 16:41:32 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H6XKmd073166; Thu, 17 Jun 2021 02:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=y2KOWkLeyJnDCAzBjIai7Hxg6Al0W0avKhYuFlPVnCs=;
 b=Fjs7lG5tTePFgd7P1pFAdQcMVKJKrWZbcxCRZqFEIVivbIUlhG1A+sJ4Ag9q9GHzNhxr
 73L9VoJC0mhcsFwbhWhbwzRbiWIass5nRU8gfLDoaTd0oUSBS1WcmzuT3AYEVDFmgyTj
 9e3oyxWdr/WXMI1rvMSZgyh7KgwZkw9MHMSvIWnPEYsEPO/KmyQfh5aNW63Ziz1qjPlt
 i1if+JIHiZ1PE1PwlrRDBWaCQZ3+rIuL+g2GMAlEsQcDlBxT0fRgyGcK7DSnjOtx2Qs4
 yxiG5agXc2mcxMxna+wKePjLS09javWiGlOpI4iZTEI0xjmGNAmhMkqZfzGvcLkuec47 ZA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39810n8k77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 02:41:23 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15H6XSZc022797;
 Thu, 17 Jun 2021 06:41:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 394m6htgfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 06:41:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15H6fImw26280408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 06:41:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0583A42042;
 Thu, 17 Jun 2021 06:41:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA8F642045;
 Thu, 17 Jun 2021 06:41:16 +0000 (GMT)
Received: from [9.195.37.230] (unknown [9.195.37.230])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 17 Jun 2021 06:41:16 +0000 (GMT)
Subject: Re: Oops (NULL pointer) with 'perf record' of selftest 'null_syscall'
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Content-Type: text/html;
	charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://9/
In-Reply-To: <bc2dac10-9e60-e4b7-c376-5ed00f6e227c@csgroup.eu>
X-Apple-Windows-Friendly: 1
Date: Thu, 17 Jun 2021 12:06:40 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <2F349581-2E44-4C63-A75C-966FA32F26C2@linux.vnet.ibm.com>
References: <c141a18c-b18d-b775-1848-527c35a1c433@csgroup.eu>
 <3388922c-0224-e4aa-f7b7-4fea43e060f9@linux.ibm.com>
 <6102EF12-AFB2-48B1-B707-D3F5471EADDB@linux.vnet.ibm.com>
 <bc2dac10-9e60-e4b7-c376-5ed00f6e227c@csgroup.eu>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kox7YsBGJ5b6nDyaWo19TMB11WysQEMD
X-Proofpoint-ORIG-GUID: kox7YsBGJ5b6nDyaWo19TMB11WysQEMD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_02:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170045
X-Mailman-Approved-At: Thu, 17 Jun 2021 16:47:25 +1000
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On =
16-Jun-2021, at 11:56 AM, Christophe Leroy =
&lt;christophe.leroy@csgroup.eu&gt; wrote:<br><br><br><br>Le 16/06/2021 =
=C3=A0 05:40, Athira Rajeev a =C3=A9crit :<br><blockquote =
type=3D"cite"><blockquote type=3D"cite">On 16-Jun-2021, at 8:53 AM, =
Madhavan Srinivasan &lt;maddy@linux.ibm.com&gt; wrote:<br><br><br>On =
6/15/21 8:35 PM, Christophe Leroy wrote:<br><blockquote type=3D"cite">For =
your information, I'm getting the following Oops. Detected with =
5.13-rc6, it also oopses on 5.12 and 5.11.<br>Runs ok on 5.10. I'm =
starting bisecting now.<br></blockquote><br><br>Thanks for reporting, =
got the issue. What has happened in this case is that, pmu device is not =
registered<br>and trying to access the instruction point which will land =
in perf_instruction_pointer(). And recently I have added<br>a workaround =
patch for power10 DD1 which has caused this breakage. My bad. We are =
working on a fix patch<br>for the same and will post it out. Sorry =
again.<br><br></blockquote>Hi Christophe,<br>Can you please try with =
below patch in your environment and test if it works for you.<br>=46rom =
55d3afc9369dfbe28a7152c8e9f856c11c7fe43d Mon Sep 17 00:00:00 =
2001<br>From: Athira Rajeev &lt;atrajeev@linux.vnet.ibm.com&gt;<br>Date: =
Tue, 15 Jun 2021 22:28:11 -0400<br>Subject: [PATCH] powerpc/perf: Fix =
crash with 'perf_instruction_pointer' when<br> pmu is not set<br>On =
systems without any specific PMU driver support registered, =
running<br>perf record causes oops:<br>[ &nbsp;&nbsp;38.841073] NIP =
[c00000000013af54] perf_instruction_pointer+0x24/0x100<br>[ =
&nbsp;&nbsp;38.841079] LR [c0000000003c7358] =
perf_prepare_sample+0x4e8/0x820<br>[ &nbsp;&nbsp;38.841085] --- =
interrupt: 300<br>[ &nbsp;&nbsp;38.841088] [c00000001cf03440] =
[c0000000003c6ef8] perf_prepare_sample+0x88/0x820 (unreliable)<br>[ =
&nbsp;&nbsp;38.841096] [c00000001cf034a0] [c0000000003c76d0] =
perf_event_output_forward+0x40/0xc0<br>[ &nbsp;&nbsp;38.841104] =
[c00000001cf03520] [c0000000003b45e8] =
__perf_event_overflow+0x88/0x1b0<br>[ &nbsp;&nbsp;38.841112] =
[c00000001cf03570] [c0000000003b480c] =
perf_swevent_hrtimer+0xfc/0x1a0<br>[ &nbsp;&nbsp;38.841119] =
[c00000001cf03740] [c0000000002399cc] =
__hrtimer_run_queues+0x17c/0x380<br>[ &nbsp;&nbsp;38.841127] =
[c00000001cf037c0] [c00000000023a5f8] hrtimer_interrupt+0x128/0x2f0<br>[ =
&nbsp;&nbsp;38.841135] [c00000001cf03870] [c00000000002962c] =
timer_interrupt+0x13c/0x370<br>[ &nbsp;&nbsp;38.841143i] =
[c00000001cf038d0] [c000000000009ba4] =
decrementer_common_virt+0x1a4/0x1b0<br>[ &nbsp;&nbsp;38.841151] --- =
interrupt: 900 at copypage_power7+0xd4/0x1c0<br>During perf record =
session, perf_instruction_pointer() is called to<br>capture the sample =
ip. This function in core-book3s accesses ppmu-&gt;flags.<br>If a =
platform specific PMU driver is not registered, ppmu is set to =
NULL<br>and accessing its members results in a crash. Fix this crash by =
checking<br>if ppmu is set.<br>Signed-off-by: Athira Rajeev =
&lt;atrajeev@linux.vnet.ibm.com&gt;<br>Reported-by: Christophe Leroy =
&lt;christophe.leroy@csgroup.eu&gt;<br></blockquote><br>Fixes: =
2ca13a4cc56c ("powerpc/perf: Use regs-&gt;nip when SIAR is zero")<br>Cc: =
stable@vger.kernel.org<br>Tested-by: Christophe Leroy =
&lt;christophe.leroy@csgroup.eu&gt;<br></blockquote><br>Hi =
Christophe,<br><br>Thanks for testing with the change. I have a newer =
version where I have added braces around the check.<br>Can you please =
check once and can I add your tested-by for the below patch.<br><br>=46rom=
 621cd0449c8503a016c0b1ae63639061aa5134a8 Mon Sep 17 00:00:00 =
2001<br>From: Athira Rajeev &lt;atrajeev@linux.vnet.ibm.com&gt;<br>Date: =
Tue, 15 Jun 2021 22:28:11 -0400<br>Subject: [PATCH] powerpc/perf: Fix =
crash with 'perf_instruction_pointer' when<br> pmu is not set<br><br>On =
systems without any specific PMU driver support registered, =
running<br>perf record causes Oops.<br><br>The relevant portion from =
call trace:<br><br>BUG: Kernel NULL pointer dereference on read at =
0x00000040<br>Faulting instruction address: 0xc0021f0c<br>Oops: Kernel =
access of bad area, sig: 11 [#1]<br>BE PAGE_SIZE=3D4K PREEMPT =
CMPCPRO<br>SAF3000 DIE NOTIFICATION<br>CPU: 0 PID: 442 Comm: =
null_syscall Not tainted 5.13.0-rc6-s3k-dev-01645-g7649ee3d2957 =
#5164<br>NIP: &nbsp;c0021f0c LR: c00e8ad8 CTR: c00d8a5c<br>NIP =
[c0021f0c] perf_instruction_pointer+0x10/0x60<br>LR [c00e8ad8] =
perf_prepare_sample+0x344/0x674<br>Call Trace:<br>[e6775880] [c00e8810] =
perf_prepare_sample+0x7c/0x674 (unreliable)<br>[e67758c0] [c00e8e44] =
perf_event_output_forward+0x3c/0x94<br>[e6775910] [c00dea8c] =
__perf_event_overflow+0x74/0x14c<br>[e6775930] [c00dec5c] =
perf_swevent_hrtimer+0xf8/0x170<br>[e6775a40] [c008c8d0] =
__hrtimer_run_queues.constprop.0+0x160/0x318<br>[e6775a90] [c008d94c] =
hrtimer_interrupt+0x148/0x3b0<br>[e6775ae0] [c000c0c0] =
timer_interrupt+0xc4/0x22c<br>[e6775b10] [c00046f0] =
Decrementer_virt+0xb8/0xbc<br><br>During perf record session, =
perf_instruction_pointer() is called to<br>capture the sample ip. This =
function in core-book3s accesses ppmu-&gt;flags.<br>If a platform =
specific PMU driver is not registered, ppmu is set to NULL<br>and =
accessing its members results in a crash. Fix this crash by =
checking<br>if ppmu is set.<br><br>Fixes: 2ca13a4cc56c ("powerpc/perf: =
Use regs-&gt;nip when SIAR is zero")<br>Signed-off-by: Athira Rajeev =
&lt;atrajeev@linux.vnet.ibm.com&gt;<br>Reported-by: Christophe Leroy =
&lt;christophe.leroy@csgroup.eu&gt;<br>---<br> =
arch/powerpc/perf/core-book3s.c | 2 +-<br> 1 file changed, 1 =
insertion(+), 1 deletion(-)<br><br>diff --git =
a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c<br>index 16d4d1b..5162241 =
100644<br>--- a/arch/powerpc/perf/core-book3s.c<br>+++ =
b/arch/powerpc/perf/core-book3s.c<br>@@ -2254,7 +2254,7 @@ unsigned long =
perf_instruction_pointer(struct pt_regs *regs)<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>bool =
use_siar =3D regs_use_siar(regs);<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned long siar =3D =
mfspr(SPRN_SIAR);<br><br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (ppmu-&gt;flags &amp; =
PPMU_P10_DD1) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (ppmu &amp;&amp; =
(ppmu-&gt;flags &amp; PPMU_P10_DD1)) {<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (siar)<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
siar;<br> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>else<br>-- <br>1.8.3.1<br><br>Thanks<br>Athira<br><br><blockquote =
type=3D"cite"><br><blockquote type=3D"cite">---<br> =
arch/powerpc/perf/core-book3s.c | 2 +-<br> 1 file changed, 1 =
insertion(+), 1 deletion(-)<br>diff --git =
a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c<br>index 16d4d1b6a1ff..816756588cb7 =
100644<br>--- a/arch/powerpc/perf/core-book3s.c<br>+++ =
b/arch/powerpc/perf/core-book3s.c<br>@@ -2254,7 +2254,7 @@ unsigned long =
perf_instruction_pointer(struct pt_regs *regs)<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>bool =
use_siar =3D regs_use_siar(regs);<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned long siar =3D =
mfspr(SPRN_SIAR);<br> -<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (ppmu-&gt;flags &amp; =
PPMU_P10_DD1) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (ppmu &amp;&amp; =
ppmu-&gt;flags &amp; PPMU_P10_DD1) {<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (siar)<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
siar;<br> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>else<br></blockquote></blockquote><br></div></body></html>=
