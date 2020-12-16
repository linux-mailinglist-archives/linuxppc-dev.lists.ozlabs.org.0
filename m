Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7012DBE78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 11:18:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwrgW6mb3zDqSV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 21:18:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A0xWPck9; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwmgL398MzDqL8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 18:18:05 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG714Qk035370
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 02:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=B51zfQmetJwdBTVmgxJuiA471NypYC1n2pRrdXgCECc=;
 b=A0xWPck9qFpI0G86Wq1ObdUdRgpTXqrHj7dOVYlj0Q5SIaFhY0rSI2zdqh6RRA61OXw4
 yYZxGb9yEfv3Z/l2Pl5hGaT1PqKOwsk5oXddMV/4KcnKY0akg6tzWadDjAemC2UJ0qt3
 vImhxwUHWQNs4dauIpuhB79H8Cg76E4q/mmIsvRjDf3jdeR7y0x87k6aAjtxHhpR45IM
 2VeIgvtr/Rwyi2BQ8NVi1YdZpa7pQaT2IhYE3NcyIcf06K7UnZDzrA0Nd/6kfKNt5bUk
 DqaeJLB/DL58NgG4jP7br2K5WPCcImfdwrk4rc3R/SJSmORw9STW1qkpy/xi3yvfFCzW 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fa98csg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 02:18:01 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG71EXH036209
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 02:18:01 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fa98csfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 02:18:01 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG7EL1q007947;
 Wed, 16 Dec 2020 07:17:59 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 35cng8a3ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 07:17:59 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG7HuS132440598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 07:17:56 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB9CEA4054;
 Wed, 16 Dec 2020 07:17:56 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C50C7A405B;
 Wed, 16 Dec 2020 07:17:55 +0000 (GMT)
Received: from [9.79.245.117] (unknown [9.79.245.117])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 16 Dec 2020 07:17:55 +0000 (GMT)
Subject: Re: [PATCH v3 04/19] powerpc/perf: move perf irq/nmi handling details
 into traps.c
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Content-Type: text/html;
	charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://4/
In-Reply-To: <20201128144114.944000-5-npiggin@gmail.com>
X-Apple-Windows-Friendly: 1
Date: Wed, 16 Dec 2020 12:47:50 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <8CBD7964-DAAD-4063-8288-C7A6FA9EEF02@linux.vnet.ibm.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
 <20201128144114.944000-5-npiggin@gmail.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_02:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160040
X-Mailman-Approved-At: Wed, 16 Dec 2020 21:14:19 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On =
28-Nov-2020, at 8:10 PM, Nicholas Piggin &lt;npiggin@gmail.com&gt; =
wrote:<br><br>This is required in order to allow more significant =
differences between<br>NMI type interrupt handlers and regular =
asynchronous handlers.<br><br>Signed-off-by: Nicholas Piggin =
&lt;npiggin@gmail.com&gt;<br></blockquote><br>Reviewed this patch and =
the changes looks good to me.<br><br>Reviewed-by: Athira Rajeev =
&lt;atrajeev@linux.vnet.ibm.com&gt;<br><br>Thanks<br>Athira<br><blockquote=
 type=3D"cite">---<br>arch/powerpc/kernel/traps.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 31 =
+++++++++++++++++++++++++++-<br>arch/powerpc/perf/core-book3s.c &nbsp;| =
35 ++------------------------------<br>arch/powerpc/perf/core-fsl-emb.c =
| 25 -----------------------<br>3 files changed, 32 insertions(+), 59 =
deletions(-)<br><br>diff --git a/arch/powerpc/kernel/traps.c =
b/arch/powerpc/kernel/traps.c<br>index 902fcbd1a778..7dda72eb97cc =
100644<br>--- a/arch/powerpc/kernel/traps.c<br>+++ =
b/arch/powerpc/kernel/traps.c<br>@@ -1919,11 +1919,40 @@ void =
vsx_unavailable_tm(struct pt_regs *regs)<br>}<br>#endif /* =
CONFIG_PPC_TRANSACTIONAL_MEM */<br><br>-void =
performance_monitor_exception(struct pt_regs *regs)<br>+static void =
performance_monitor_exception_nmi(struct pt_regs *regs)<br>+{<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>nmi_enter();<br>+<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>__this_cpu_inc(irq_stat.pmu_irqs);<br>+<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>perf_irq(regs);<br>+<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>nmi_exit();<br>+}<br>+<br>+static =
void performance_monitor_exception_async(struct pt_regs =
*regs)<br>{<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>irq_enter();<br>+<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>__this_cpu_inc(irq_stat.pmu_irqs);<br><br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>perf_irq(regs);<br>+<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>irq_exit();<br>+}<br>+<br>+void =
performance_monitor_exception(struct pt_regs *regs)<br>+{<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/*<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * On 64-bit, if perf interrupts hit in a =
local_irq_disable<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> * (soft-masked) region, we =
consider them as NMIs. This is required to<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * =
prevent hash faults on user addresses when reading callchains =
(and<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * looks better from an irq tracing perspective).<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
*/<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (IS_ENABLED(CONFIG_PPC64) &amp;&amp; =
unlikely(arch_irq_disabled_regs(regs)))<br>+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>performance_monitor_exception_nmi(regs);<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>else<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>performance_monitor_exception_async(regs);<br>}<br><br>#ifdef =
CONFIG_PPC_ADV_DEBUG_REGS<br>diff --git =
a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c<br>index 08643cba1494..9fd8cae09218 =
100644<br>--- a/arch/powerpc/perf/core-book3s.c<br>+++ =
b/arch/powerpc/perf/core-book3s.c<br>@@ -109,10 +109,6 @@ static inline =
void perf_read_regs(struct pt_regs *regs)<br>{<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>regs-&gt;result =3D 0;<br>}<br>-static inline int =
perf_intr_is_nmi(struct pt_regs *regs)<br>-{<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
0;<br>-}<br><br>static inline int siar_valid(struct pt_regs =
*regs)<br>{<br>@@ -328,15 +324,6 @@ static inline void =
perf_read_regs(struct pt_regs *regs)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>regs-&gt;result =3D =
use_siar;<br>}<br><br>-/*<br>- * If interrupts were soft-disabled when a =
PMU interrupt occurs, treat<br>- * it as an NMI.<br>- */<br>-static =
inline int perf_intr_is_nmi(struct pt_regs *regs)<br>-{<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
(regs-&gt;softe &amp; IRQS_DISABLED);<br>-}<br>-<br>/*<br> * On =
processors like P7+ that have the SIAR-Valid bit, marked =
instructions<br> * must be sampled only if the SIAR-valid bit is =
set.<br>@@ -2224,7 +2211,6 @@ static void __perf_event_interrupt(struct =
pt_regs *regs)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>struct perf_event =
*event;<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>unsigned long val[8];<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>int found, active;<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>int =
nmi;<br><br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (cpuhw-&gt;n_limited)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>freeze_limited_counters(cpuhw, =
mfspr(SPRN_PMC5),<br>@@ -2232,18 +2218,6 @@ static void =
__perf_event_interrupt(struct pt_regs *regs)<br><br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>perf_read_regs(regs);<br><br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/*<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * If =
perf interrupts hit in a local_irq_disable (soft-masked) =
region,<br>-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * we consider them as NMIs. This is required to prevent hash =
faults on<br>-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * user addresses when reading callchains. See the NMI test =
in<br>-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * do_hash_page.<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> */<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>nmi =3D =
perf_intr_is_nmi(regs);<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (nmi)<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>nmi_enter();<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>else<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>irq_enter();<br>-<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/* Read all the PMCs since we'll =
need them a bunch of times */<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>for (i =3D 0; i &lt; =
ppmu-&gt;n_counter; ++i)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>val[i] =3D read_pmc(i + 1);<br>@@ =
-2289,8 +2263,8 @@ static void __perf_event_interrupt(struct pt_regs =
*regs)<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br>-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (!found &amp;&amp; !nmi &amp;&amp; =
printk_ratelimit())<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>printk(KERN_WARNING "Can't find =
PMC that caused IRQ\n");<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (unlikely(!found) &amp;&amp; =
!arch_irq_disabled_regs(regs))<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>printk_ratelimited(KERN_WARNING =
"Can't find PMC that caused IRQ\n");<br><br><span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>/*<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * Reset =
MMCR0 to its normal value. &nbsp;This will set PMXE and<br>@@ -2300,11 =
+2274,6 @@ static void __perf_event_interrupt(struct pt_regs =
*regs)<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * we get back out of this interrupt.<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
*/<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>write_mmcr0(cpuhw, cpuhw-&gt;mmcr.mmcr0);<br>-<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(nmi)<br>-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>nmi_exit();<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>else<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>irq_exit();<br>}<br><br>static void perf_event_interrupt(struct =
pt_regs *regs)<br>diff --git a/arch/powerpc/perf/core-fsl-emb.c =
b/arch/powerpc/perf/core-fsl-emb.c<br>index e0e7e276bfd2..ee721f420a7b =
100644<br>--- a/arch/powerpc/perf/core-fsl-emb.c<br>+++ =
b/arch/powerpc/perf/core-fsl-emb.c<br>@@ -31,19 +31,6 @@ static atomic_t =
num_events;<br>/* Used to avoid races in calling =
reserve/release_pmc_hardware */<br>static =
DEFINE_MUTEX(pmc_reserve_mutex);<br><br>-/*<br>- * If interrupts were =
soft-disabled when a PMU interrupt occurs, treat<br>- * it as an =
NMI.<br>- */<br>-static inline int perf_intr_is_nmi(struct pt_regs =
*regs)<br>-{<br>-#ifdef __powerpc64__<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return (regs-&gt;softe &amp; =
IRQS_DISABLED);<br>-#else<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return =
0;<br>-#endif<br>-}<br>-<br>static void perf_event_interrupt(struct =
pt_regs *regs);<br><br>/*<br>@@ -659,13 +646,6 @@ static void =
perf_event_interrupt(struct pt_regs *regs)<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>struct =
perf_event *event;<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned long val;<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>int found =
=3D 0;<br>-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>int nmi;<br>-<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>nmi =3D =
perf_intr_is_nmi(regs);<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (nmi)<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>nmi_enter();<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>else<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>irq_enter();<br><br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>for (i =3D 0; i &lt; =
ppmu-&gt;n_counter; ++i) {<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>event =3D =
cpuhw-&gt;event[i];<br>@@ -690,11 +670,6 @@ static void =
perf_event_interrupt(struct pt_regs *regs)<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtmsr(mfmsr() | MSR_PMM);<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtpmr(PMRN_PMGC0, PMGC0_PMIE | =
PMGC0_FCECE);<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>isync();<br>-<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (nmi)<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>nmi_exit();<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>else<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>irq_exit();<br>}<br><br>void hw_perf_event_setup(int cpu)<br>-- =
<br>2.23.0<br><br></blockquote><br></div></body></html>=
