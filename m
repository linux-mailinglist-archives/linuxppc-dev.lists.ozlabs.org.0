Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8F2364D61
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 23:57:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPLJR5ZwRz2yRG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 07:57:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YuvC5Z7G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YuvC5Z7G; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP7Yv03QTz2xYn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 23:53:06 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13JDq7CT167929; Mon, 19 Apr 2021 09:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=O/f+b+JLlMZcah6eyTj2swhDLunbEZ/b8sciz3Sjtjw=;
 b=YuvC5Z7GIjzaG3zhyYI/0UXSCU8MwosJkTDj4q5gzgEFrWnQcnxp0DsLrSIL2Zz6Xs6z
 uGFeY50macau2uxGxA0PeGzw54RbYT2X1PjMGI6Tv5aYkfuasnx8T32CbwzI8xJEa0ym
 X0CQXbVLFJcR4Mkfh43nBfWxB61C8UB2RDKJ0uob81GLH7COVKxrt4oW0fY26yg0rZML
 BDAVb+Oeb6ncG2sv8Jprq3IF52VPyMrtuL0pm/g0hxBqfYTQXLw196D+cwKeKLAIPj/y
 8uzN1GxRLpJNgidXiRYv+Cx0YMDbrw6lmV+WQMID2l/6INFBagGBBazwm8MTUBhKBMlr XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380crt2hyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 09:52:57 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13JDqNFK169654;
 Mon, 19 Apr 2021 09:52:56 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380crt2hxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 09:52:56 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13JDm2oU017695;
 Mon, 19 Apr 2021 13:52:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 37yqa88ky8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 13:52:53 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13JDqPPR19399008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Apr 2021 13:52:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B262C4203F;
 Mon, 19 Apr 2021 13:52:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D02C942047;
 Mon, 19 Apr 2021 13:52:46 +0000 (GMT)
Received: from [9.195.33.170] (unknown [9.195.33.170])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 19 Apr 2021 13:52:46 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf: Fix PMU callbacks to clear pending PMI
 before resetting an overflown PMC
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Content-Type: text/html;
	charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://2/
In-Reply-To: <32461D84-098D-44EE-A782-6C7CC7DDEBCC@linux.vnet.ibm.com>
X-Apple-Windows-Friendly: 1
Date: Mon, 19 Apr 2021 19:22:30 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <EC3C1666-214D-4C97-8960-2ABA6EE46C62@linux.vnet.ibm.com>
References: <1617720464-1651-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1617720464-1651-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1617927471.vhjclnvhj3.astroid@bobo.none>
 <6F7D0CD6-EA13-4D6F-9592-98CCC4537133@linux.vnet.ibm.com>
 <1618195598.pijmcbmr3o.astroid@bobo.none>
 <32461D84-098D-44EE-A782-6C7CC7DDEBCC@linux.vnet.ibm.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FO7R-346MzFYiQjNktPaKoD1YQ20RlZz
X-Proofpoint-ORIG-GUID: NKPis0wVByphvJ4TRAno4LHCbPOMLFjv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_10:2021-04-19,
 2021-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104190093
X-Mailman-Approved-At: Tue, 20 Apr 2021 07:56:16 +1000
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
Cc: "nasastry@in.ibm.com" <nasastry@in.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On =
12-Apr-2021, at 12:49 PM, Athira Rajeev =
&lt;atrajeev@linux.vnet.ibm.com&gt; wrote:<br><br><br><br><blockquote =
type=3D"cite">On 12-Apr-2021, at 8:38 AM, Nicholas Piggin =
&lt;npiggin@gmail.com&gt; wrote:<br><br>Excerpts from Athira Rajeev's =
message of April 9, 2021 10:53 pm:<br><blockquote =
type=3D"cite"><br><br><blockquote type=3D"cite">On 09-Apr-2021, at 6:38 =
AM, Nicholas Piggin &lt;npiggin@gmail.com&gt; =
wrote:<br><br></blockquote>Hi Nick,<br><br>Thanks for checking the patch =
and sharing review comments.<br><br><blockquote type=3D"cite">I was =
going to nitpick "overflown" here as something birds do, but =
some<br>sources says overflown is okay for past tense.<br><br>You could =
use "overflowed" for that, but I understand the issue with the <br>word: =
you are talking about counters that are currently in an "overflow" =
<br>state, but the overflow occurred in the past and is not still =
happening<br>so you "overflowing" doesn't exactly fit =
either.<br><br>overflown kind of works for some reason you can kind of =
use it for<br>present tense!<br></blockquote><br>Ok sure, Yes counter is =
currently in an =E2=80=9Coverflow=E2=80=9D state.<br><br><blockquote =
type=3D"cite"><br>Excerpts from Athira Rajeev's message of April 7, 2021 =
12:47 am:<br><blockquote type=3D"cite">Running perf fuzzer showed below =
in dmesg logs:<br>"Can't find PMC that caused IRQ"<br><br>This means a =
PMU exception happened, but none of the PMC's (Performance<br>Monitor =
Counter) were found to be overflown. There are some corner cases<br>that =
clears the PMCs after PMI gets masked. In such cases, the =
perf<br>interrupt handler will not find the active PMC values that had =
caused<br>the overflow and thus leads to this message while =
replaying.<br><br>Case 1: PMU Interrupt happens during replay of other =
interrupts and<br>counter values gets cleared by PMU callbacks before =
replay:<br><br>During replay of interrupts like timer, __do_irq and =
doorbell exception, we<br>conditionally enable interrupts via =
may_hard_irq_enable(). This could<br>potentially create a window to =
generate a PMI. Since irq soft mask is set<br>to ALL_DISABLED, the PMI =
will get masked here.<br></blockquote><br>I wonder if =
may_hard_irq_enable shouldn't enable if PMI is soft<br>disabled. And =
also maybe replay should not set ALL_DISABLED if<br>there are no PMI =
interrupts pending.<br><br>Still, I think those are a bit more tricky =
and might take a while<br>to get right or just not be worth while, so I =
think your patch is<br>fine.<br></blockquote><br>Ok Nick.<br><blockquote =
type=3D"cite"><br><blockquote type=3D"cite">We could get IPIs run =
before<br>perf interrupt is replayed and the PMU events could deleted or =
stopped.<br>This will change the PMU SPR values and resets the counters. =
Snippet of<br>ftrace log showing PMU callbacks invoked in =
"__do_irq":<br><br>&lt;idle&gt;-0 [051] dns. 132025441306354: __do_irq =
&lt;-call_do_irq<br>&lt;idle&gt;-0 [051] dns. 132025441306430: irq_enter =
&lt;-__do_irq<br>&lt;idle&gt;-0 [051] dns. 132025441306503: =
irq_enter_rcu &lt;-__do_irq<br>&lt;idle&gt;-0 [051] dnH. =
132025441306599: xive_get_irq =
&lt;-__do_irq<br>&lt;&lt;&gt;&gt;<br>&lt;idle&gt;-0 [051] dnH. =
132025441307770: generic_smp_call_function_single_interrupt =
&lt;-smp_ipi_demux_relaxed<br>&lt;idle&gt;-0 [051] dnH. 132025441307839: =
flush_smp_call_function_queue =
&lt;-smp_ipi_demux_relaxed<br>&lt;idle&gt;-0 [051] dnH. 132025441308057: =
_raw_spin_lock &lt;-event_function<br>&lt;idle&gt;-0 [051] dnH. =
132025441308206: power_pmu_disable =
&lt;-perf_pmu_disable<br>&lt;idle&gt;-0 [051] dnH. 132025441308337: =
power_pmu_del &lt;-event_sched_out<br>&lt;idle&gt;-0 [051] dnH. =
132025441308407: power_pmu_read &lt;-power_pmu_del<br>&lt;idle&gt;-0 =
[051] dnH. 132025441308477: read_pmc =
&lt;-power_pmu_read<br>&lt;idle&gt;-0 [051] dnH. 132025441308590: =
isa207_disable_pmc &lt;-power_pmu_del<br>&lt;idle&gt;-0 [051] dnH. =
132025441308663: write_pmc &lt;-power_pmu_del<br>&lt;idle&gt;-0 [051] =
dnH. 132025441308787: power_pmu_event_idx =
&lt;-perf_event_update_userpage<br>&lt;idle&gt;-0 [051] dnH. =
132025441308859: rcu_read_unlock_strict =
&lt;-perf_event_update_userpage<br>&lt;idle&gt;-0 [051] dnH. =
132025441308975: power_pmu_enable =
&lt;-perf_pmu_enable<br>&lt;&lt;&gt;&gt;<br>&lt;idle&gt;-0 [051] dnH. =
132025441311108: irq_exit &lt;-__do_irq<br>&lt;idle&gt;-0 [051] dns. =
132025441311319: performance_monitor_exception =
&lt;-replay_soft_interrupts<br><br>Case 2: PMI's masked during local_* =
operations, example local_add.<br>If the local_add operation happens =
within a local_irq_save, replay of<br>PMI will be during =
local_irq_restore. Similar to case 1, this could<br>also create a window =
before replay where PMU events gets deleted =
or<br>stopped.<br></blockquote><br>Here as well perhaps PMIs should be =
replayed if they are unmasked<br>even if other interrupts are still =
masked. Again that might be more<br>complexity than it's =
worth.<br></blockquote>Ok..<br><br><blockquote =
type=3D"cite"><br><blockquote type=3D"cite"><br>Patch adds a fix to =
update the PMU callback functions (del,stop,enable) to<br>check for =
pending perf interrupt. If there is an overflown PMC and pending<br>perf =
interrupt indicated in Paca, clear the PMI bit in paca to drop =
that<br>sample. In case of power_pmu_del, also clear the MMCR0 PMAO bit =
which<br>otherwise could lead to spurious interrupts in some corner =
cases. Example,<br>a timer after power_pmu_del which will re-enable =
interrupts since PMI is<br>cleared and triggers a PMI again since PMAO =
bit is still set.<br><br>We can't just replay PMI any time. Hence this =
approach is preferred rather<br>than replaying PMI before resetting =
overflown PMC. Patch also documents<br>core-book3s on a race condition =
which can trigger these PMC messages during<br>idle path in =
PowerNV.<br><br>Fixes: f442d004806e ("powerpc/64s: Add support to mask =
perf interrupts and replay them")<br>Reported-by: Nageswara R Sastry =
&lt;nasastry@in.ibm.com&gt;<br>Suggested-by: Nicholas Piggin =
&lt;npiggin@gmail.com&gt;<br>Suggested-by: Madhavan Srinivasan =
&lt;maddy@linux.ibm.com&gt;<br>Signed-off-by: Athira Rajeev =
&lt;atrajeev@linux.vnet.ibm.com&gt;<br>---<br>arch/powerpc/include/asm/pmc=
.h &nbsp;| 11 +++++++++<br>arch/powerpc/perf/core-book3s.c | 55 =
+++++++++++++++++++++++++++++++++++++++++<br>2 files changed, 66 =
insertions(+)<br><br>diff --git a/arch/powerpc/include/asm/pmc.h =
b/arch/powerpc/include/asm/pmc.h<br>index c6bbe9778d3c..97b4bd8de25b =
100644<br>--- a/arch/powerpc/include/asm/pmc.h<br>+++ =
b/arch/powerpc/include/asm/pmc.h<br>@@ -34,11 +34,22 @@ static inline =
void ppc_set_pmu_inuse(int inuse)<br>#endif<br>}<br><br>+static inline =
int clear_paca_irq_pmi(void)<br>+{<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (get_paca()-&gt;irq_happened =
&amp; PACA_IRQ_PMI) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>WARN_ON_ONCE(mfmsr() &amp; =
MSR_EE);<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>get_paca()-&gt;irq_happened &amp;=3D ~PACA_IRQ_PMI;<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
1;<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return 0;<br>+}<br></blockquote><br>Could you put this in =
arch/powerpc/include/asm/hw_irq.h and<br>rather than paca_irq, call it =
irq_pending =
perhaps<br><br>clear_pmi_irq_pending()<br><br>get_clear_pmi_irq_pending() =
if you're also testing it.<br></blockquote><br>Sure, &nbsp;I will use =
=E2=80=9Cget_clear_pmi_irq_pending()=E2=80=9D and try with moving this =
to arch/powerpc/include/asm/hw_irq.h<br><br><blockquote =
type=3D"cite"><br>Could you add a little comment about the corner cases =
above it too?<br>The root cause seem to be interrupt replay while a =
masked PMI is<br>pending can result in other interrupts arriving which =
clear the PMU<br>overflow so the pending PMI must be =
cleared.<br></blockquote><br>Ok, I will add comment and fix this in next =
version.<br><br><blockquote type=3D"cite"><br><blockquote =
type=3D"cite">+<br>extern void power4_enable_pmcs(void);<br><br>#else /* =
CONFIG_PPC64 */<br><br>static inline void ppc_set_pmu_inuse(int inuse) { =
}<br>+static inline int clear_paca_irq_pmi(void) { return 0; =
}<br><br>#endif<br><br>diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c<br>index 766f064f00fb..18ca3c90f866 =
100644<br>--- a/arch/powerpc/perf/core-book3s.c<br>+++ =
b/arch/powerpc/perf/core-book3s.c<br>@@ -847,6 +847,20 @@ static void =
write_pmc(int idx, unsigned long val)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br>}<br><br>+static int =
pmc_overflown(int idx)<br>+{<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned long val[8];<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>int =
i;<br>+<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>for (i =3D 0; i &lt; ppmu-&gt;n_counter; i++)<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>val[i] =3D =
read_pmc(i + 1);<br>+<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if ((int)val[idx-1] &lt; =
0)<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return 1;<br>+<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return 0;<br>+}<br>+<br>/* Called =
from sysrq_handle_showregs() */<br>void =
perf_event_print_debug(void)<br>{<br>@@ -1438,6 +1452,15 @@ static void =
power_pmu_enable(struct pmu *pmu)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>event =3D =
cpuhw-&gt;event[i];<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (event-&gt;hw.idx &amp;&amp; =
event-&gt;hw.idx !=3D hwc_index[i] + 1) {<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>power_pmu_read(event);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/*<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * if the =
PMC corresponding to event-&gt;hw.idx is<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * =
overflown, check if there is any pending perf<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * =
interrupt set in paca. If so, disable the interrupt<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * by =
clearing the paca bit for PMI since we are going<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * to =
reset the PMC.<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> */<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(pmc_overflown(event-&gt;hw.idx))<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>clear_paca_irq_pmi();<br></blockquote><br>If the pmc is not =
overflown, could there still be a PMI pending?<br></blockquote><br>I =
didn=E2=80=99t hit that scenario where PMI is pending without an =
overflown PMC.<br>Also I believe if such a case happens, we will need an =
investigation there. It could be a different case to be =
handled.<br></blockquote><br>Okay, so a PMI will not occur without an =
overflown PMC, and the <br>overflown PMC will only be cleared in places =
where you also clear a <br>possible pending PMI?<br></blockquote><br>Hi =
Nick,<br><br>Yes, I have added this PMI check in possible places we =
clear PMC=E2=80=99s.<br><br><blockquote type=3D"cite"><br><blockquote =
type=3D"cite"><br>I actually considered below two points for adding this =
PMC check instead of just clearing the PMI.<br><br>1. Make sure we are =
not masking any bug here by just clearing PACA_IRQ_PMI.<br>Ideally if =
PMI is set in irq_happened, it means there was a counter overflow.<br>2. =
If there is more than one PMU event, say two events. Make sure we are =
clearing PMI only for the<br>event whose counter is =
overflown.<br></blockquote><br>Those are good points. Would you consider =
also adding a warning for the <br>case of no PMCs overflown but PMI is =
pending? That way you might have more <br>information about such a =
problem if it ever happens.<br><br>We try to add a good deal of warnings =
around the soft-mask code because <br>it's very tricky to change without =
causing more bugs, so even for future<br>changes to the code this would =
probably be useful.<br></blockquote><br>Sure, I will check to add a =
warning.<br></blockquote><br>Hi Nick, <br><br>Just a correction =
here.<br>We are already printing message if we find such cases. =
Basically in the perf interrupt handler, if we find that there is no =
counter overflow, we print debug message. So any case with pending PMI =
and no PMC overflown will be caught there when PMI is played. So we =
don=E2=80=99t need to add warning again in PMU callbacks.<br><br>I will =
be sending a V2 addressing other =
changes.<br><br>Thanks<br>Athira<br><br><br><blockquote =
type=3D"cite"><br><blockquote type=3D"cite"><br><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">@@ =
-1636,6 +1664,22 @@ static void power_pmu_del(struct perf_event *event, =
int ef_flags)<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>--cpuhw-&gt;n_events;<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>ppmu-&gt;disable_pmc(event-&gt;hw.idx - 1, =
&amp;cpuhw-&gt;mmcr);<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (event-&gt;hw.idx) {<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/*<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * if the PMC corresponding to event-&gt;hw.idx is<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * =
overflown, check if there is any pending perf<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * =
interrupt set in paca. If so, disable the interrupt<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * and =
clear the MMCR0 PMAO bit since we are going<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * to =
reset the PMC and delete the event.<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> */<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(pmc_overflown(event-&gt;hw.idx)) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (clear_paca_irq_pmi()) =
{<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>val_mmcr0 =3D mfspr(SPRN_MMCR0);<br>+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>val_mmcr0 &amp;=3D =
~MMCR0_PMAO;<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>write_mmcr0(cpuhw, val_mmcr0);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mb();<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>isync();<br></blockquote><br>I don't know the perf subsystem, but =
just out of curiosity why does<br>MMCR0 need to be cleared only in this =
case?<br></blockquote><br>I got a corner case in power_pmu_del, with =
only clearing PACA_IRQ_PMI and without resetting MMCR0 PMAO bit.<br>Here =
is the flow:<br><br>1. We clear the PMI bit Paca, but MMCR0 has the PMAO =
bit still set. PMAO bit indicates a PMI has occurred.<br>2. A timer =
interrupt is replayed after power_pmu_del which does a =
=E2=80=9Cmay_hard_irq_enable=E2=80=9D.<br>This will re-enable interrupts =
and triggers a PMI again since PMAO bit is still set.<br><br>So clear =
PMAO bit to avoid such spurious interrupts.<br>Ftrace logs showing the =
same with some debug trace_printks :<br><br> &nbsp;&nbsp;&lt;idle&gt;-0 =
&nbsp;&nbsp;&nbsp;[134] d.h. 327287888478: power_pmu_del =
&lt;-event_sched_out.isra.126<br> &nbsp;&nbsp;&lt;&lt;&gt;&gt; =
&nbsp;&nbsp;&nbsp;Here we cleared the PMI<br> &nbsp;&nbsp;&lt;idle&gt;-0 =
&nbsp;&nbsp;&nbsp;[134] d.h. 327287889272: write_pmc =
&lt;-power_pmu_del<br> &nbsp;&nbsp;&lt;idle&gt;-0 =
&nbsp;&nbsp;&nbsp;[134] d.h. 327287889346: rcu_read_unlock_strict =
&lt;-perf_event_update_userpage<br> &nbsp;&nbsp;&lt;idle&gt;-0 =
&nbsp;&nbsp;&nbsp;[134] d.h. 327287889711: power_pmu_del: In =
power_pmu_del MMCR0 is 82004090, local_paca-&gt;irq_happened is 9<br> =
&nbsp;&nbsp;&lt;idle&gt;-0 &nbsp;&nbsp;&nbsp;[134] d.h. 327287889811: =
power_pmu_enable &lt;-perf_pmu_enable<br> &nbsp;&nbsp;&lt;idle&gt;-0 =
&nbsp;&nbsp;&nbsp;[134] d.h. 327287889982: irq_exit =
&lt;-doorbell_exception<br> &nbsp;&nbsp;&lt;idle&gt;-0 =
&nbsp;&nbsp;&nbsp;[134] d... 327287890053: idle_cpu &lt;-irq_exit<br> =
&nbsp;&nbsp;&lt;idle&gt;-0 &nbsp;&nbsp;&nbsp;[134] d... 327287890158: =
tick_nohz_irq_exit &lt;-irq_exit<br> &nbsp;&nbsp;&lt;idle&gt;-0 =
&nbsp;&nbsp;&nbsp;[134] d... 327287890219: ktime_get =
&lt;-tick_nohz_irq_exit<br> &nbsp;&nbsp;&lt;idle&gt;-0 =
&nbsp;&nbsp;&nbsp;[134] d... 327287890328: replay_soft_interrupts =
&lt;-interrupt_exit_kernel_prepare<br> &nbsp;&nbsp;&lt;idle&gt;-0 =
&nbsp;&nbsp;&nbsp;[134] d... 327287890399: irq_enter =
&lt;-timer_interrupt<br> &nbsp;&nbsp;&lt;&lt;&gt;&gt;<br> =
&nbsp;&nbsp;&lt;idle&gt;-0 &nbsp;&nbsp;&nbsp;[134] d.h. 327287891163: =
timer_interrupt: Before may_hard_irq_enable MMCR0 is 82004090, =
local_paca-&gt;irq_happened is 1<br> &nbsp;&nbsp;&lt;&lt;&gt;&gt;<br> =
&nbsp;&nbsp;&lt;idle&gt;-0 &nbsp;&nbsp;&nbsp;[134] d.h. 327287894310: =
timer_interrupt: After may_hard_irq_enable MMCR0 is 82004090, =
local_paca-&gt;irq_happened is 21<br><br>In case of other callbacks like =
pmu enable, we are programming MMCR0. But in case of event getting =
deleted, there is no<br>way we clear PMAO unless an event gets scheduled =
again in that cpu. Hence added this check only in pmu_del =
callback.<br><br><br><blockquote type=3D"cite">What if we disabled =
MSR[EE]<br>right before a perf interrupt came in, so we don't get a =
pending PMI<br>but the condition is still close to the =
same.<br></blockquote><br>Nick, I didn=E2=80=99t get this question =
exactly. Can you please help explain a bit ?<br>=46rom my understanding, =
consider that we disabled MSR[EE] before perf interrupt came in.<br>So =
once the interrupts are re-enabled:<br><br>1. If soft mask is set to =
IRQS_DISABLED, perf interrupt will be triggered as NMI.<br>2. In case of =
ALL_DISABLED, it will be masked for replay. If PMU callbacks are invoked =
before replay,<br>our present patch will take care of clearing PMI in =
corner cases.<br></blockquote><br>Well I'm wondering about the same PMAO =
bug. Above you said:<br><br>1. We clear the PMI bit Paca, but MMCR0 has =
the PMAO bit still set. PMAO bit indicates a PMI has occurred.<br>2. A =
timer interrupt is replayed after power_pmu_del which does a =
=E2=80=9Cmay_hard_irq_enable=E2=80=9D.<br>This will re-enable interrupts =
and triggers a PMI again since PMAO bit is still set.<br><br>So in this =
situation, what if we had disabled interrupts and that had <br>caused =
MSR[EE] to be cleared (let's say due to a PCI interrupt <br>arriving), =
and then a PMC overflows and causes PMAO to be set.<br><br>Then you run =
this code:<br><br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/*<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * if the =
PMC corresponding to event-&gt;hw.idx is<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * =
overflown, check if there is any pending perf<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * =
interrupt set in paca. If so, disable the interrupt<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * and =
clear the MMCR0 PMAO bit since we are going<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * to =
reset the PMC and delete the event.<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> */<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(pmc_overflown(event-&gt;hw.idx)) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (clear_paca_irq_pmi()) =
{<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>val_mmcr0 =3D mfspr(SPRN_MMCR0);<br>+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>val_mmcr0 &amp;=3D =
~MMCR0_PMAO;<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>write_mmcr0(cpuhw, val_mmcr0);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mb();<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>isync();<br><br>And this does not clear PMAO because we had no =
pending PMI, but we still <br>have the pending PMAO =
exception.<br><br>The only difference was that MSR[EE] happened to be =
disabled when the <br>PMC overflowed so no pending PMI was recorded, but =
otherwise everything <br>is the same so I wonder why it's not subject to =
the same problem?<br></blockquote><br>Ok, thanks for explaining Nick, I =
got the scenario now :<br><br>1. MSR[EE] is set to zero<br>2. PMC gets =
overflown and PMAO bit gets set. But since MSR[EE] is set to zero, =
interrupt won=E2=80=99t be triggered<br> &nbsp;&nbsp;and hence Paca =
won=E2=80=99t mark the pending PMI.<br>3. Next power_pmu callbacks were =
called which clears the PMC.<br> &nbsp;&nbsp;Here though PMC is an =
overflown value, we won=E2=80=99t be clearing PMAO since my patch checks =
for only Paca PMI bit.<br><br>To address this issue, I will try with the =
below change:<br><br>If we find a PMC is overflown before clearing, do =
two checks:<br>1. If a PMI is pending in paca, clear the paca pmi bit =
and also clear PMAO bit<br>2. Else if a PMI is not pending in paca, =
check for PMAO bit and clear if it is set.<br> &nbsp;&nbsp;This will =
disable the PMI coming in =
later.<br><br><br>Thanks<br>Athira<br><br><blockquote =
type=3D"cite"><br>Thanks,<br>Nick<br></blockquote></blockquote><br></div><=
/body></html>=
