Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E863650A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 05:02:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPT543ypqz30C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 13:02:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n4zUy2+z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n4zUy2+z; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPT444HtFz2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 13:01:55 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13K2XXcA074523; Mon, 19 Apr 2021 23:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=QhapNwOqaTHi8sTaC+GGIP1jsefSKm+BzCC3CRq5W5Q=;
 b=n4zUy2+zw5TXh8uReVh0nnrdHtopa6UAH8Ud0NEWGA3FW696JjINEi2aEDSeCAGzR1+C
 E+x+sOqqgBYrkg3nx4AQGiamJacUE4XJYIML6AHdcU0w8szPmc1bYiw33CQfPWLqR3tr
 hTYzOy6p6Kzutg513BM4ytiz/93ML6IIiSo1NHe3i3uQoC72IMDa/pDaIMq/4C1DjD/K
 MQ5d2pZNF2ZsTSgpSMy9LB+HFuCmFlVsbRqozuRiYDR025eK3Ki/BQNN2BcNROR7n0lQ
 FXOqLkdkfh9gt2CJv8rBIxAYeMmeTLG7z1kMEwNxKqISkqWzzdxPWKRcS2ezuRQ09qnz yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 381dnvwfer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 23:01:49 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13K2tlUf144113;
 Mon, 19 Apr 2021 23:01:49 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 381dnvwfe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 23:01:48 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13K2vNUC015752;
 Tue, 20 Apr 2021 03:01:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 37yqa88s1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 03:01:47 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13K31g1j28639646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 03:01:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 319984C058;
 Tue, 20 Apr 2021 03:01:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF3274C046;
 Tue, 20 Apr 2021 03:01:40 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.124.209.100])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Apr 2021 03:01:40 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 1/1] powerpc/perf: Fix PMU callbacks to clear pending PMI
 before resetting an overflown PMC
Date: Mon, 19 Apr 2021 23:01:37 -0400
Message-Id: <1618887697-1556-2-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1618887697-1556-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1618887697-1556-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3x8ccFJV4-JzfPbGy_kfXiR55c6d7Y-X
X-Proofpoint-ORIG-GUID: M0gcbhvRVI5y17l5xYQLJ4ehotq8OyJj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_16:2021-04-19,
 2021-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200015
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
perf interrupt indicated in Paca or by PMAO bit set in MMCR0, clear the PMI
bit in paca to drop that sample. Also clear the MMCR0 PMAO bit which
otherwise could lead to spurious interrupts in some corner cases. Example,
a timer after power_pmu_del which will re-enable interrupts since PMI is
cleared and triggers a PMI again since PMAO bit is still set. Another
condition occures if had disabled MSR[EE] right before perf interrupt
came in. Re-enabling interrupt will trigger PMI since PMAO is still set.
But fails to find valid overflow if PMC get cleared before enabling EE.

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
 arch/powerpc/include/asm/hw_irq.h | 19 ++++++++
 arch/powerpc/perf/core-book3s.c   | 77 +++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 56a98936a6a9..7e192bd8253b 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -215,6 +215,23 @@ static inline bool arch_irqs_disabled(void)
 	return arch_irqs_disabled_flags(arch_local_save_flags());
 }
 
+static inline int get_clear_pmi_irq_pending(void)
+{
+	/*
+	 * Some corner cases could clear the PMU counter overflow
+	 * while a masked PMI is pending. One of such case is
+	 * when a PMI happens during interrupt replay and perf
+	 * counter values gets cleared by PMU callbacks before
+	 * replay. So the pending PMI must be cleared here.
+	 */
+	if (get_paca()->irq_happened & PACA_IRQ_PMI) {
+		WARN_ON_ONCE(mfmsr() & MSR_EE);
+		get_paca()->irq_happened &= ~PACA_IRQ_PMI;
+		return 1;
+	}
+	return 0;
+}
+
 #ifdef CONFIG_PPC_BOOK3S
 /*
  * To support disabling and enabling of irq with PMI, set of
@@ -391,6 +408,8 @@ static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
 
 static inline void may_hard_irq_enable(void) { }
 
+static inline int get_clear_pmi_irq_pending(void) { return 0; }
+
 static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, unsigned long val)
 {
 }
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 766f064f00fb..6ddac1b913fa 100644
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
@@ -1438,6 +1452,17 @@ static void power_pmu_enable(struct pmu *pmu)
 		event = cpuhw->event[i];
 		if (event->hw.idx && event->hw.idx != hwc_index[i] + 1) {
 			power_pmu_read(event);
+			/*
+			 * if the PMC corresponding to event->hw.idx is
+			 * overflown, check if there is any pending perf
+			 * interrupt set in paca. If so, disable the interrupt
+			 * by clearing the paca bit for PMI since we are going
+			 * to reset the PMC. power_pmu_enable will reset PMAO bit
+			 * of MMCR0 while enabling the event. So PMAO check
+			 * is not needed here (versus PMAO check done in del/stop).
+			 */
+			if (pmc_overflown(event->hw.idx))
+				get_clear_pmi_irq_pending();
 			write_pmc(event->hw.idx, 0);
 			event->hw.idx = 0;
 		}
@@ -1474,6 +1499,10 @@ static void power_pmu_enable(struct pmu *pmu)
 		event->hw.idx = idx;
 		if (event->hw.state & PERF_HES_STOPPED)
 			val = 0;
+
+		/* See above for get_clear_pmi_irq_pending */
+		if (pmc_overflown(event->hw.idx))
+			get_clear_pmi_irq_pending();
 		write_pmc(idx, val);
 
 		perf_event_update_userpage(event);
@@ -1619,6 +1648,7 @@ static void power_pmu_del(struct perf_event *event, int ef_flags)
 	struct cpu_hw_events *cpuhw;
 	long i;
 	unsigned long flags;
+	unsigned long val_mmcr0;
 
 	local_irq_save(flags);
 	perf_pmu_disable(event->pmu);
@@ -1636,6 +1666,23 @@ static void power_pmu_del(struct perf_event *event, int ef_flags)
 			--cpuhw->n_events;
 			ppmu->disable_pmc(event->hw.idx - 1, &cpuhw->mmcr);
 			if (event->hw.idx) {
+				/*
+				 * if the PMC corresponding to event->hw.idx is
+				 * overflown, check if there is any pending perf
+				 * interrupt set in paca or indicated by PMAO bit
+				 * in MMCR0. If so, disable the interrupt and clear
+				 * the MMCR0 PMAO bit since we are going to reset
+				 * the PMC and delete the event.
+				 */
+				if (pmc_overflown(event->hw.idx)) {
+					if ((get_clear_pmi_irq_pending() | (mfspr(SPRN_MMCR0) & MMCR0_PMAO))) {
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
@@ -1705,6 +1752,8 @@ static void power_pmu_start(struct perf_event *event, int ef_flags)
 static void power_pmu_stop(struct perf_event *event, int ef_flags)
 {
 	unsigned long flags;
+	unsigned long val_mmcr0;
+	struct cpu_hw_events *cpuhw;
 
 	if (!event->hw.idx || !event->hw.sample_period)
 		return;
@@ -1713,8 +1762,27 @@ static void power_pmu_stop(struct perf_event *event, int ef_flags)
 		return;
 
 	local_irq_save(flags);
+	cpuhw = this_cpu_ptr(&cpu_hw_events);
 	perf_pmu_disable(event->pmu);
 
+	/*
+	 * if the PMC corresponding to event->hw.idx is
+	 * overflown, check if there is any pending perf
+	 * interrupt set in paca or indicated by PMAO bit
+	 * in MMCR0. If so, disable the interrupt and clear
+	 * the MMCR0 PMAO bit since we are going to reset
+	 * the PMC.
+	 */
+	if (pmc_overflown(event->hw.idx)) {
+		if ((get_clear_pmi_irq_pending() | (mfspr(SPRN_MMCR0) & MMCR0_PMAO))) {
+			val_mmcr0 = mfspr(SPRN_MMCR0);
+			val_mmcr0 &= ~MMCR0_PMAO;
+			write_mmcr0(cpuhw, val_mmcr0);
+			mb();
+			isync();
+		}
+	}
+
 	power_pmu_read(event);
 	event->hw.state |= PERF_HES_STOPPED | PERF_HES_UPTODATE;
 	write_pmc(event->hw.idx, 0);
@@ -2343,6 +2411,15 @@ static void __perf_event_interrupt(struct pt_regs *regs)
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
2.26.2

