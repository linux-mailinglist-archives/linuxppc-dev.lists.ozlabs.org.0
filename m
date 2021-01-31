Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D496309E67
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 20:51:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTMBz1BFmzDrB5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 06:51:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DELAjC21; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DT9Tr6X9CzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 23:33:19 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10VCWXYh071354
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 07:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=w4tF5FmrwW4jd055pVkQU0NbK4dj9Z9qFOEHqeQijqI=;
 b=DELAjC2131T9BPCVsMm7g5fJk8u5JZ6oJNwN9mlvGx2z3a6BNV6o6j0cpc9zO4ejQmn7
 MblWu+UoEHGgnAwd04Uz9Zznr4CEsbhH+nWWrfQ4vvUtMhGzvWo2MBsyqWloNZo66Lxa
 XuJ3uIMXgWT11pKJtna5Puz10L97GCW17tguoxk2/+T2cZtldBm43FQ9FfqJQYx2CdbM
 rae83mg58PijSFhj8Ax3/IhBckOtU5vDXo0COXEyLx8MXMa91glqka6yEFknrRXacHUD
 iFSx8KPlzR3xt25Li4knWvyrhMsF4ZSuhYmbGKYvipuvJZ9/dqt1+J+8lS5Oo01ZzaFq nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36dvmhr0np-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 07:33:15 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10VCXEUQ072600
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 07:33:14 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36dvmhr0md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 31 Jan 2021 07:33:14 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10VCTwg1007529;
 Sun, 31 Jan 2021 12:33:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 36cy388gey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 31 Jan 2021 12:33:12 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10VCXAOo41550306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 31 Jan 2021 12:33:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2AF9AE053;
 Sun, 31 Jan 2021 12:33:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8407AE04D;
 Sun, 31 Jan 2021 12:33:08 +0000 (GMT)
Received: from [9.79.253.164] (unknown [9.79.253.164])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sun, 31 Jan 2021 12:33:08 +0000 (GMT)
Subject: Re: [PATCH v7 19/42] powerpc/perf: move perf irq/nmi handling details
 into traps.c
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Content-Type: text/html;
	charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://5/
In-Reply-To: <20210130130852.2952424-20-npiggin@gmail.com>
X-Apple-Windows-Friendly: 1
Date: Sun, 31 Jan 2021 18:00:53 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B8EDA3A-5263-4FF4-9E14-B676AC6DF669@linux.vnet.ibm.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-20-npiggin@gmail.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-01-31_04:2021-01-29,
 2021-01-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101310065
X-Mailman-Approved-At: Mon, 01 Feb 2021 06:49:17 +1100
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
30-Jan-2021, at 6:38 PM, Nicholas Piggin &lt;npiggin@gmail.com&gt; =
wrote:<br><br>This is required in order to allow more significant =
differences between<br>NMI type interrupt handlers and regular =
asynchronous handlers.<br><br>Signed-off-by: Nicholas Piggin =
&lt;npiggin@gmail.com&gt;<br>---<br>arch/powerpc/kernel/traps.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 31 =
+++++++++++++++++++++++++++-<br>arch/powerpc/perf/core-book3s.c &nbsp;| =
35 ++------------------------------<br>arch/powerpc/perf/core-fsl-emb.c =
| 25 -----------------------<br>3 files changed, 32 insertions(+), 59 =
deletions(-)<br><br>diff --git a/arch/powerpc/kernel/traps.c =
b/arch/powerpc/kernel/traps.c<br>index 4349b25807cf..6da3a3642dfb =
100644<br>--- a/arch/powerpc/kernel/traps.c<br>+++ =
b/arch/powerpc/kernel/traps.c<br>@@ -1892,11 +1892,40 @@ void =
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
</span>performance_monitor_exception_async(regs);<br>}<br><br></blockquote=
><br>Hi Nick,<br>Thanks for the change in tracing of PMI =
interrupts.<br><br>I tested with this patch that moves perf irq/nmi =
handling details into traps.c<br>and verified the patch works fine for =
NMI and asynchronous cases.<br><br>Test scenario1: My test kernel module =
tries to create one of performance monitor<br>counter overflow between =
local_irq_save/local_irq_restore which should be delivered as an =
NMI.<br><br>Verified it calls NMI exception handler from my ftrace logs =
below<br><br>&lt;&lt;&gt;&gt;<br>dummy_perf =
&lt;-performance_monitor_exception_nmi<br>&lt;&lt;&gt;&gt;<br><br>Test =
scenario2: My test kernel module tries to create one of performance =
monitor counter<br>overflow between powerpc_local_irq_pmu_save/restore =
which should be delivered as an<br>asynchronous interrupt ( replayed PMI =
).<br><br>Verified it calls correct handler from my ftrace =
logs:<br><br>&lt;&lt;&gt;&gt;<br>replay_soft_interrupts =
&lt;-arch_local_irq_restore<br>irq_enter =
&lt;-performance_monitor_exception_async<br>irq_enter_rcu =
&lt;-performance_monitor_exception_async<br>dummy_perf =
&lt;-performance_monitor_exception_async<br>irq_exit =
&lt;-performance_monitor_exception_async<br>&lt;&lt;&gt;&gt;<br><br>Review=
ed-and-Tested-by: &nbsp;Athira Rajeev =
&lt;atrajeev@linux.vnet.ibm.com&gt;<br><br><br><blockquote =
type=3D"cite">#ifdef CONFIG_PPC_ADV_DEBUG_REGS<br>diff --git =
a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c<br>index 28206b1fe172..9fd06010e8b6 =
100644<br>--- a/arch/powerpc/perf/core-book3s.c<br>+++ =
b/arch/powerpc/perf/core-book3s.c<br>@@ -110,10 +110,6 @@ static inline =
void perf_read_regs(struct pt_regs *regs)<br>{<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>regs-&gt;result =3D 0;<br>}<br>-static inline int =
perf_intr_is_nmi(struct pt_regs *regs)<br>-{<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
0;<br>-}<br><br>static inline int siar_valid(struct pt_regs =
*regs)<br>{<br>@@ -353,15 +349,6 @@ static inline void =
perf_read_regs(struct pt_regs *regs)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>regs-&gt;result =3D =
use_siar;<br>}<br><br>-/*<br>- * If interrupts were soft-disabled when a =
PMU interrupt occurs, treat<br>- * it as an NMI.<br>- */<br>-static =
inline int perf_intr_is_nmi(struct pt_regs *regs)<br>-{<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
(regs-&gt;softe &amp; IRQS_DISABLED);<br>-}<br>-<br>/*<br> * On =
processors like P7+ that have the SIAR-Valid bit, marked =
instructions<br> * must be sampled only if the SIAR-valid bit is =
set.<br>@@ -2279,7 +2266,6 @@ static void __perf_event_interrupt(struct =
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
mfspr(SPRN_PMC5),<br>@@ -2287,18 +2273,6 @@ static void =
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
-2344,8 +2318,8 @@ static void __perf_event_interrupt(struct pt_regs =
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
MMCR0 to its normal value. &nbsp;This will set PMXE and<br>@@ -2355,11 =
+2329,6 @@ static void __perf_event_interrupt(struct pt_regs =
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
