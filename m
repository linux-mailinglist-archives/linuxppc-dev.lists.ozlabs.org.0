Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 126053556FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 16:48:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF9QD0Wq8z3c00
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 00:48:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r2Ac2vtc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r2Ac2vtc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF9PL5Twmz3046
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 00:48:06 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 136EYLWw187311; Tue, 6 Apr 2021 10:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=bnatnw70rkpNeXtyICwWtfycVqwz1Fi7IGfhuTLSfdQ=;
 b=r2Ac2vtc5Ed3FCibQbjwSL04s/l8hPm64z7tqotMKr8ajZnwyvftXNHzRln3rIEI0SG5
 cRsLmYzPsTBsVtoiO8uVnAY40dhDrKvUKshNgPQXo6uw01UH+KI0ccMTzgExvA4LbAOM
 ytnh6Mt7aODl7DINqySbDVDedRV4/qoUk89/3L7Dlff9k6lYtaSC2mDq/IC9PeQiToUI
 KzZTXzad+/YHtKOEBoCC6vyr9eE4qr4U39sByQPzinfUTD5lkD/AL+/9zqdmV/5KgEv0
 BbNglUV9HiD4ciZZ77PLm+CJD0plqxQzW1P+bkhEzN+ZaqFQVjhauOHmZ9ABH9Qu2K2Y yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37q5tyyw2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 10:48:01 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 136EYddQ189366;
 Tue, 6 Apr 2021 10:48:01 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37q5tyyw1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 10:48:00 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 136Ehtb3025931;
 Tue, 6 Apr 2021 14:47:59 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37q2y9j7vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 14:47:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 136EltEV23790012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 14:47:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36F8A4C046;
 Tue,  6 Apr 2021 14:47:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33DC54C052;
 Tue,  6 Apr 2021 14:47:51 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.124.212.190])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Apr 2021 14:47:50 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Fix PMU callbacks to clear pending PMI before
 resetting an overflown PMC
Date: Tue,  6 Apr 2021 10:47:44 -0400
Message-Id: <1617720464-1651-2-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617720464-1651-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1617720464-1651-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VKOOepUtZJOCX1xvbdDgQUJpzkTT8CqO
X-Proofpoint-GUID: RHm1XeTdhDmP58-6zHA1uh7oM_YhfWb5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_03:2021-04-01,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104030000
 definitions=main-2104060102
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
Cc: nasastry@in.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running perf fuzzer showed below in dmesg logs:
"Can't find PMC that caused IRQ"

This means a PMU exception happened, but none of the PMC's (Performance
Monitor Counter) were found to be overflown. There are some corner cases
that clears the PMCs after PMI gets masked. In such cases, the perf
interrupt handler will not find the active PMC values that had caused
the overflow and thus leads to this message while replaying.

Case 1: PMU Interrupt happens during replay of other interrupts and
counter values gets cleared by PMU callbacks before replay:

During replay of interrupts like timer, __do_irq and doorbell exception, we
conditionally enable interrupts via may_hard_irq_enable(). This could
potentially create a window to generate a PMI. Since irq soft mask is set
to ALL_DISABLED, the PMI will get masked here. We could get IPIs run before
perf interrupt is replayed and the PMU events could deleted or stopped.
This will change the PMU SPR values and resets the counters. Snippet of
ftrace log showing PMU callbacks invoked in "__do_irq":

<idle>-0 [051] dns. 132025441306354: __do_irq <-call_do_irq
<idle>-0 [051] dns. 132025441306430: irq_enter <-__do_irq
<idle>-0 [051] dns. 132025441306503: irq_enter_rcu <-__do_irq
<idle>-0 [051] dnH. 132025441306599: xive_get_irq <-__do_irq
<<>>
<idle>-0 [051] dnH. 132025441307770: generic_smp_call_function_single_interrupt <-smp_ipi_demux_relaxed
<idle>-0 [051] dnH. 132025441307839: flush_smp_call_function_queue <-smp_ipi_demux_relaxed
<idle>-0 [051] dnH. 132025441308057: _raw_spin_lock <-event_function
<idle>-0 [051] dnH. 132025441308206: power_pmu_disable <-perf_pmu_disable
<idle>-0 [051] dnH. 132025441308337: power_pmu_del <-event_sched_out
<idle>-0 [051] dnH. 132025441308407: power_pmu_read <-power_pmu_del
<idle>-0 [051] dnH. 132025441308477: read_pmc <-power_pmu_read
<idle>-0 [051] dnH. 132025441308590: isa207_disable_pmc <-power_pmu_del
<idle>-0 [051] dnH. 132025441308663: write_pmc <-power_pmu_del
<idle>-0 [051] dnH. 132025441308787: power_pmu_event_idx <-perf_event_update_userpage
<idle>-0 [051] dnH. 132025441308859: rcu_read_unlock_strict <-perf_event_update_userpage
<idle>-0 [051] dnH. 132025441308975: power_pmu_enable <-perf_pmu_enable
<<>>
<idle>-0 [051] dnH. 132025441311108: irq_exit <-__do_irq
<idle>-0 [051] dns. 132025441311319: performance_monitor_exception <-replay_soft_interrupts

Case 2: PMI's masked during local_* operations, example local_add.
If the local_add operation happens within a local_irq_save, replay of
PMI will be during local_irq_restore. Similar to case 1, this could
also create a window before replay where PMU events gets deleted or
stopped.

Patch adds a fix to update the PMU callback functions (del,stop,enable) to
check for pending perf interrupt. If there is an overflown PMC and pending
perf interrupt indicated in Paca, clear the PMI bit in paca to drop that
sample. In case of power_pmu_del, also clear the MMCR0 PMAO bit which
otherwise could lead to spurious interrupts in some corner cases. Example,
a timer after power_pmu_del which will re-enable interrupts since PMI is
cleared and triggers a PMI again since PMAO bit is still set.

We can't just replay PMI any time. Hence this approach is preferred rather
than replaying PMI before resetting overflown PMC. Patch also documents
core-book3s on a race condition which can trigger these PMC messages during
idle path in PowerNV.

Fixes: f442d004806e ("powerpc/64s: Add support to mask perf interrupts and replay them")
Reported-by: Nageswara R Sastry <nasastry@in.ibm.com>
Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Suggested-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/pmc.h  | 11 +++++++++
 arch/powerpc/perf/core-book3s.c | 55 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/powerpc/include/asm/pmc.h b/arch/powerpc/include/asm/pmc.h
index c6bbe9778d3c..97b4bd8de25b 100644
--- a/arch/powerpc/include/asm/pmc.h
+++ b/arch/powerpc/include/asm/pmc.h
@@ -34,11 +34,22 @@ static inline void ppc_set_pmu_inuse(int inuse)
 #endif
 }
 
+static inline int clear_paca_irq_pmi(void)
+{
+	if (get_paca()->irq_happened & PACA_IRQ_PMI) {
+		WARN_ON_ONCE(mfmsr() & MSR_EE);
+		get_paca()->irq_happened &= ~PACA_IRQ_PMI;
+		return 1;
+	}
+	return 0;
+}
+
 extern void power4_enable_pmcs(void);
 
 #else /* CONFIG_PPC64 */
 
 static inline void ppc_set_pmu_inuse(int inuse) { }
+static inline int clear_paca_irq_pmi(void) { return 0; }
 
 #endif
 
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 766f064f00fb..18ca3c90f866 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -847,6 +847,20 @@ static void write_pmc(int idx, unsigned long val)
 	}
 }
 
+static int pmc_overflown(int idx)
+{
+	unsigned long val[8];
+	int i;
+
+	for (i = 0; i < ppmu->n_counter; i++)
+		val[i] = read_pmc(i + 1);
+
+	if ((int)val[idx-1] < 0)
+		return 1;
+
+	return 0;
+}
+
 /* Called from sysrq_handle_showregs() */
 void perf_event_print_debug(void)
 {
@@ -1438,6 +1452,15 @@ static void power_pmu_enable(struct pmu *pmu)
 		event = cpuhw->event[i];
 		if (event->hw.idx && event->hw.idx != hwc_index[i] + 1) {
 			power_pmu_read(event);
+			/*
+			 * if the PMC corresponding to event->hw.idx is
+			 * overflown, check if there is any pending perf
+			 * interrupt set in paca. If so, disable the interrupt
+			 * by clearing the paca bit for PMI since we are going
+			 * to reset the PMC.
+			 */
+			if (pmc_overflown(event->hw.idx))
+				clear_paca_irq_pmi();
 			write_pmc(event->hw.idx, 0);
 			event->hw.idx = 0;
 		}
@@ -1474,6 +1497,10 @@ static void power_pmu_enable(struct pmu *pmu)
 		event->hw.idx = idx;
 		if (event->hw.state & PERF_HES_STOPPED)
 			val = 0;
+
+		/* See above for clear_paca_irq_pmi */
+		if (pmc_overflown(event->hw.idx))
+			clear_paca_irq_pmi();
 		write_pmc(idx, val);
 
 		perf_event_update_userpage(event);
@@ -1619,6 +1646,7 @@ static void power_pmu_del(struct perf_event *event, int ef_flags)
 	struct cpu_hw_events *cpuhw;
 	long i;
 	unsigned long flags;
+	unsigned long val_mmcr0;
 
 	local_irq_save(flags);
 	perf_pmu_disable(event->pmu);
@@ -1636,6 +1664,22 @@ static void power_pmu_del(struct perf_event *event, int ef_flags)
 			--cpuhw->n_events;
 			ppmu->disable_pmc(event->hw.idx - 1, &cpuhw->mmcr);
 			if (event->hw.idx) {
+				/*
+				 * if the PMC corresponding to event->hw.idx is
+				 * overflown, check if there is any pending perf
+				 * interrupt set in paca. If so, disable the interrupt
+				 * and clear the MMCR0 PMAO bit since we are going
+				 * to reset the PMC and delete the event.
+				 */
+				if (pmc_overflown(event->hw.idx)) {
+					if (clear_paca_irq_pmi()) {
+						val_mmcr0 = mfspr(SPRN_MMCR0);
+						val_mmcr0 &= ~MMCR0_PMAO;
+						write_mmcr0(cpuhw, val_mmcr0);
+						mb();
+						isync();
+					}
+				}
 				write_pmc(event->hw.idx, 0);
 				event->hw.idx = 0;
 			}
@@ -1714,6 +1758,8 @@ static void power_pmu_stop(struct perf_event *event, int ef_flags)
 
 	local_irq_save(flags);
 	perf_pmu_disable(event->pmu);
+	if (pmc_overflown(event->hw.idx))
+		clear_paca_irq_pmi();
 
 	power_pmu_read(event);
 	event->hw.state |= PERF_HES_STOPPED | PERF_HES_UPTODATE;
@@ -2343,6 +2389,15 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 			}
 		}
 	}
+
+	/*
+	 * During system wide profling or while specific CPU
+	 * is monitored for an event, some corner cases could
+	 * cause PMC to overflow in idle path. This will trigger
+	 * a PMI after waking up from idle. Since counter values
+	 * are _not_ saved/restored in idle path, can lead to
+	 * below "Can't find PMC" message.
+	 */
 	if (unlikely(!found) && !arch_irq_disabled_regs(regs))
 		printk_ratelimited(KERN_WARNING "Can't find PMC that caused IRQ\n");
 
-- 
1.8.3.1

