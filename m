Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E55F930530B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 07:16:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQYKN5SJmzDqtS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 17:16:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MyEWzRcr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQXlc2hnZzDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 16:51:07 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10R5W467066029
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 00:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=Hphpurg7AW9Ho3f1MDMOT5P2m8bY0aXeUYyXNevrJr4=;
 b=MyEWzRcrhiBRNTyDwxqqUHFKOqz6TKtndZK4dEUOCUO34xf1hI863Vfa78NZNgUTUyCg
 ttddCEjg6si1RHkiB5Wf/wfjU7FpoGS2MFZlfSc+5pfnYKTsZsrH6z26bz2f+z9f9oEm
 eXCEs2XJKi0MN8F+AXtMrhSOkPcPctk8Vsk2OS6yF06H+KcHPVz2nT9ENw77hc5Ago7i
 YsN6+WZlaXXtOh73UpeQzzFZycVSaDOChgEJQTDSuB/n3pYZHl44usf1E0w27KTcMvKG
 fXg6nEboL0yVDMS7az6FDeJpaKy7y+RUaY0zoxFi1M4nglV2KYxBbqxob+GmrxcPRJIX Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36b1cu1966-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 00:51:05 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10R5e3Th091288
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 00:51:05 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36b1cu1959-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 00:51:05 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10R5WHVj019693;
 Wed, 27 Jan 2021 05:51:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 368be89t59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 05:51:02 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10R5oqUh19792172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 05:50:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E021A405F;
 Wed, 27 Jan 2021 05:51:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43E7AA4054;
 Wed, 27 Jan 2021 05:50:59 +0000 (GMT)
Received: from [9.79.251.195] (unknown [9.79.251.195])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 27 Jan 2021 05:50:59 +0000 (GMT)
Subject: Re: [PATCH v6 14/39] powerpc/perf: move perf irq/nmi handling details
 into traps.c
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Content-Type: text/html;
	charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://9/
In-Reply-To: <1611108829.0isdl3z9na.astroid@bobo.none>
X-Apple-Windows-Friendly: 1
Date: Wed, 27 Jan 2021 11:19:56 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <98BB4986-FF11-449A-8716-437AA9B0F3B1@linux.vnet.ibm.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-15-npiggin@gmail.com>
 <AB6E725D-225E-4FBD-B484-4C8FA627D096@linux.vnet.ibm.com>
 <1611108829.0isdl3z9na.astroid@bobo.none>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_02:2021-01-26,
 2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270028
X-Mailman-Approved-At: Wed, 27 Jan 2021 17:15:20 +1100
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On =
20-Jan-2021, at 8:39 AM, Nicholas Piggin &lt;npiggin@gmail.com&gt; =
wrote:<br><br>Excerpts from Athira Rajeev's message of January 19, 2021 =
8:24 pm:<br><blockquote type=3D"cite"><br><br><blockquote type=3D"cite">On=
 15-Jan-2021, at 10:19 PM, Nicholas Piggin &lt;npiggin@gmail.com&gt; =
wrote:<br><br>This is required in order to allow more significant =
differences between<br>NMI type interrupt handlers and regular =
asynchronous handlers.<br><br>Signed-off-by: Nicholas Piggin =
&lt;npiggin@gmail.com&gt;<br>---<br>arch/powerpc/kernel/traps.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 31 =
+++++++++++++++++++++++++++-<br>arch/powerpc/perf/core-book3s.c &nbsp;| =
35 ++------------------------------<br>arch/powerpc/perf/core-fsl-emb.c =
| 25 -----------------------<br>3 files changed, 32 insertions(+), 59 =
deletions(-)<br></blockquote><br>Hi Nick,<br><br>Reviewed this perf =
patch which moves the nmi_enter/irq_enter to traps.c and code-wise =
changes<br>for perf looks fine to me. Further, I was trying to test this =
by picking the whole Patch series on top<br>of 5.11.0-rc3 kernel and =
using below test scenario:<br><br>Intention of testcase is to check =
whether the perf nmi and asynchronous interrupts are getting<br>captured =
as expected. My test kernel module below tries to create one of =
performance monitor<br>counter ( PMC6 ) overflow between =
local_irq_save/local_irq_restore.<br>[ Here interrupts are disabled and =
has IRQS_DISABLED as regs-&gt;softe ].<br>I am expecting the PMI to come =
as an NMI in this case. I am also configuring ftrace so that I<br>can =
confirm whether it comes as an NMI or a replayed interrupt from the =
trace.<br><br>Environment :One CPU online<br>prerequisite for =
ftrace:<br># cd /sys/kernel/debug/tracing<br># echo 100 &gt; =
buffer_percent<br># echo 200000 &gt; buffer_size_kb <br># echo ppc-tb =
&gt; trace_clock<br># echo function &gt; current_tracer<br><br>Part of =
sample kernel test module to trigger a PMI between <br>local_irq_save =
and local_irq_restore:<br><br>&lt;&lt;&gt;&gt;<br>static ulong delay =3D =
1;<br>static void busy_wait(ulong time)<br>{<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;udelay(delay);<br>}<br>static =
__always_inline void irq_test(void)<br>{<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long flags;<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;local_irq_save(flags);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trace_printk("IN IRQ TEST\n");<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR0, 0x80000000);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_PMC6, 0x80000000 - =
100);<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR0, =
0x6004000);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;busy_wait(delay);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trace_printk("IN IRQ TEST =
DONE\n");<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;local_irq_restore(flags);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR0, 0x80000000);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_PMC6, =
0);<br>}<br>&lt;&lt;&gt;&gt;<br><br>But this resulted in soft lockup, =
Adding a snippet of call-trace below:<br></blockquote><br>I'm not =
getting problems with your test case, but I am testing in a VM <br>so =
may not be getting device interrupts so much (your 0xea0 =
interrupt).<br>I'll try test on bare metal next. Does it reproduce =
easily, and <br>unpatched kernel definitely does not have the =
problem?<br><br>A different issue, after my series, I don't see the perf =
"NMI" interrupt <br>in any traces under local_irq_disable, because it's =
disabling ftrace the<br>same as the other NMI interrupts, so your test =
wouldn't see them.<br><br>I don't know if this is exactly right. Can =
tracing cope with such NMIs<br>okay even if it's interrupted in the =
middle of the tracing code? Machine<br>check at least has to disable =
tracing because it's in real-mode, machine<br>check and sreset also want =
to disable tracing because something is going<br>wrong and we don't want =
to make it worse (e.g., to get a cleaner crash).<br>Should we still =
permit tracing of perf NMIs?<br></blockquote><br><br>Hi =
Nick,<br><br>Having tracing of perf NMI's enabled is actually helpful =
for debugging PMU issues. <br>Especially since for perf, we decide at =
runtime whether PMI is going to be delivered<br>as an NMI or an =
asynchronous interrupt. So having the PMI captured in trace will be =
good.<br><br>Also while debugging interrupt/overflow issues captured =
with testsuites like perf fuzzer, &nbsp;<br>where lot of test =
combinations are run, having the PMI's ( nmi and async ) in traces =
will<br>help in debug which otherwise will need to be analysed by adding =
printk's etc.<br><br>Thanks<br>Athira<br><br><blockquote =
type=3D"cite"><br><blockquote type=3D"cite"><br>[ &nbsp;883.900762] =
watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper/0:0]<br>[ =
&nbsp;883.901381] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OE =
&nbsp;&nbsp;&nbsp;&nbsp;5.11.0-rc3+ #34<br>--<br>[ &nbsp;883.901999] NIP =
[c0000000000168d0] replay_soft_interrupts+0x70/0x2f0<br>[ =
&nbsp;883.902032] LR [c00000000003b2b8] =
interrupt_exit_kernel_prepare+0x1e8/0x240<br>[ &nbsp;883.902063] Call =
Trace:<br>[ &nbsp;883.902085] [c000000001c96f50] [c00000000003b2b8] =
interrupt_exit_kernel_prepare+0x1e8/0x240 (unreliable)<br>[ =
&nbsp;883.902139] [c000000001c96fb0] [c00000000000fd88] =
interrupt_return+0x158/0x200<br>[ &nbsp;883.902185] --- interrupt: ea0 =
at __rb_reserve_next+0xc0/0x5b0<br>[ &nbsp;883.902224] NIP: =
&nbsp;c0000000002d8980 LR: c0000000002d897c CTR: c0000000001aad90<br>[ =
&nbsp;883.902262] REGS: c000000001c97020 TRAP: 0ea0 &nbsp;&nbsp;Tainted: =
G &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OE =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(5.11.0-rc3+)<br>[ &nbsp;883.902301] MSR: =
&nbsp;9000000000009033 &lt;SF,HV,EE,ME,IR,DR,RI,LE&gt; &nbsp;CR: =
28000484 &nbsp;XER: 20040000<br>[ &nbsp;883.902387] CFAR: =
c00000000000fe00 IRQMASK: 0 <br>--<br>[ &nbsp;883.902757] NIP =
[c0000000002d8980] __rb_reserve_next+0xc0/0x5b0<br>[ &nbsp;883.902786] =
LR [c0000000002d897c] __rb_reserve_next+0xbc/0x5b0<br>[ =
&nbsp;883.902824] --- interrupt: ea0<br>[ &nbsp;883.902848] =
[c000000001c97360] [c0000000002d8fcc] =
ring_buffer_lock_reserve+0x15c/0x580<br>[ &nbsp;883.902894] =
[c000000001c973f0] [c0000000002e82fc] trace_function+0x4c/0x1c0<br>[ =
&nbsp;883.902930] [c000000001c97440] [c0000000002f6f50] =
function_trace_call+0x140/0x190<br>[ &nbsp;883.902976] =
[c000000001c97470] [c00000000007d6f8] ftrace_call+0x4/0x44<br>[ =
&nbsp;883.903021] [c000000001c97660] [c000000000dcf70c] =
__do_softirq+0x15c/0x3d4<br>[ &nbsp;883.903066] [c000000001c97750] =
[c00000000015fc68] irq_exit+0x198/0x1b0<br>[ &nbsp;883.903102] =
[c000000001c97780] [c000000000dc1790] timer_interrupt+0x170/0x3b0<br>[ =
&nbsp;883.903148] [c000000001c977e0] [c000000000016994] =
replay_soft_interrupts+0x134/0x2f0<br>[ &nbsp;883.903193] =
[c000000001c979d0] [c00000000003b2b8] =
interrupt_exit_kernel_prepare+0x1e8/0x240<br>[ &nbsp;883.903240] =
[c000000001c97a30] [c00000000000fd88] interrupt_return+0x158/0x200<br>[ =
&nbsp;883.903276] --- interrupt: ea0 at =
arch_local_irq_restore+0x70/0xc0<br></blockquote><br>You got a 0xea0 =
interrupt in the ftrace code. I wonder where it is <br>looping. Do you =
see more soft lockup =
messages?<br><br>Thanks,<br>Nick<br><br><br><blockquote =
type=3D"cite"><br>Thanks<br>Athira<br><blockquote type=3D"cite"><br>diff =
--git a/arch/powerpc/kernel/traps.c =
b/arch/powerpc/kernel/traps.c<br>index 738370519937..bd55f201115b =
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
</span>performance_monitor_exception_async(regs);<br>}<br><br>#ifdef =
CONFIG_PPC_ADV_DEBUG_REGS<br>diff --git =
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
(regs-&gt;softe &amp; IRQS_DISABLED);<br>-}<br>-<br>/*<br>* On =
processors like P7+ that have the SIAR-Valid bit, marked =
instructions<br>* must be sampled only if the SIAR-valid bit is =
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
<br>2.23.0<br></blockquote></blockquote></blockquote><br></div></body></ht=
ml>=
