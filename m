Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A03C3AF7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jul 2021 09:07:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GMydc6Zm7z30Gv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jul 2021 17:07:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nxalGVHs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nxalGVHs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GMyd60shPz2yRT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 17:07:05 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16B73mdO044898; Sun, 11 Jul 2021 03:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=GEwUDnetKzfHu5W0oGB7qKLd7S+PO0SjEGH6NOgbEI8=;
 b=nxalGVHsLDnDrBaNc0RxotNiGD6r41a10ozK9EFY43zk11n4QQREIReOebX/rW/0vcmJ
 NKfmS+JOXd+zxmh3sOXmEethhZWqC2E9nNvrKbURGTuLScrmjtnc8aDQA5LwubocoViw
 tzN1YW++6bHa7mRiSkl8ZEP7ymCp3ttalKQQgWy/elruJ+Yu7MEnBaUx0MYfKyt1pq/e
 OSeH3/pmLc2TibV4Abav3hPJkc82+YcHxmyyn3GJTpLxkHPzzV3qI6+AhEaSYGxFpmIW
 TKTkeAESkj3i5W/P7sxHxSKKvo9zJ4wR8BlTAOacazlgDxw9AU2/0WV/mFCAUArEtLUi PQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrhxu1av-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Jul 2021 03:06:55 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16B76qbv017593;
 Sun, 11 Jul 2021 07:06:52 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 39q368857x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Jul 2021 07:06:52 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16B76nkC27394492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Jul 2021 07:06:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00FE24C050;
 Sun, 11 Jul 2021 07:06:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A3EC4C040;
 Sun, 11 Jul 2021 07:06:47 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.180.87])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 11 Jul 2021 07:06:46 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Enable PMU counters post partition migration if
 PMU is active
Date: Sun, 11 Jul 2021 03:06:45 -0400
Message-Id: <1625987205-1649-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: e7Pceis8hqfrPCF7GQCoWnzJB3_dpiuC
X-Proofpoint-GUID: e7Pceis8hqfrPCF7GQCoWnzJB3_dpiuC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-11_04:2021-07-09,
 2021-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=99 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=99 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107110056
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During Live Partition Migration (LPM), it is observed that after
migration completion, perf counter values reports 0 incase of
system/cpu wide monitoring. However 'perf stat' with workload
continues to show counts post migration since PMU gets disabled/enabled
during sched switches.

Example:
 ./perf stat -e r1001e -I 1000
           time             counts unit events
     1.001010437         22,137,414      r1001e
     2.002495447         15,455,821      r1001e
<<>> As seen in next below logs, the counter values shows zero
        after migration is completed.
<<>>
    86.142535370    129,392,333,440      r1001e
    87.144714617                  0      r1001e
    88.146526636                  0      r1001e
    89.148085029                  0      r1001e

Here PMU is enabled during start of perf session and counter
values are read at intervals. Counters are only disabled at the
end of session. The powerpc mobility code presently does not handle
disabling and enabling back of PMU counters during partition
migration. Also since the PMU register values are not saved/restored
during migration, PMU registers like Monitor Mode Control Register 0
(MMCR0), Monitor Mode Control Register 1 (MMCR1) will not contain
the value it was programmed with. Hence PMU counters will not be
enabled correctly post migration.

Fix this in mobility code by handling disabling and enabling of
PMU in all cpu's before and after migration. Patch introduces two
functions 'mobility_pmu_disable' and 'mobility_pmu_enable'.
mobility_pmu_disable() is called before the processor threads goes
to suspend state so as to disable the PMU counters. And disable is
done only if there are any active events running on that cpu.
mobility_pmu_enable() is called after the processor threads are
back online to enable back the PMU counters.

Since the performance Monitor counters ( PMCs) are not
saved/restored during LPM, results in PMC value being zero and the
'event->hw.prev_count' being non-zero value. This causes problem
during updation of event->count since we always accumulate
(event->hw.prev_count - PMC value) in event->count.  If
event->hw.prev_count is greater PMC value, event->count becomes
negative. Fix this by re-initialising 'prev_count' also for all
events while enabling back the events. A new variable 'migrate' is
introduced in 'struct cpu_hw_event' to achieve this for LPM cases
in power_pmu_enable. Use the 'migrate' value to clear the PMC
index (stored in event->hw.idx) for all events so that event
count settings will get re-initialised correctly.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/rtas.h           |  4 +++
 arch/powerpc/perf/core-book3s.c           | 43 ++++++++++++++++++++++++++++---
 arch/powerpc/platforms/pseries/mobility.c |  4 +++
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 9dc97d2..3fc478a 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -376,8 +376,12 @@ static inline void rtas_initialize(void) { }
 
 #ifdef CONFIG_HV_PERF_CTRS
 void read_24x7_sys_info(void);
+void mobility_pmu_disable(void);
+void mobility_pmu_enable(void);
 #else
 static inline void read_24x7_sys_info(void) { }
+static inline void mobility_pmu_disable(void) { }
+static inline void mobility_pmu_enable(void) { }
 #endif
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index bb0ee71..e86df45 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -58,6 +58,7 @@ struct cpu_hw_events {
 
 	/* Store the PMC values */
 	unsigned long pmcs[MAX_HWEVENTS];
+	int migrate;
 };
 
 static DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
@@ -1335,6 +1336,22 @@ static void power_pmu_disable(struct pmu *pmu)
 }
 
 /*
+ * Called from powerpc mobility code
+ * before migration to disable counters
+ * if the PMU is active.
+ */
+void mobility_pmu_disable(void)
+{
+	struct cpu_hw_events *cpuhw;
+
+	cpuhw = this_cpu_ptr(&cpu_hw_events);
+	if (cpuhw->n_events != 0) {
+		power_pmu_disable(NULL);
+		cpuhw->migrate = 1;
+	}
+}
+
+/*
  * Re-enable all events if disable == 0.
  * If we were previously disabled and events were added, then
  * put the new config on the PMU.
@@ -1379,8 +1396,10 @@ static void power_pmu_enable(struct pmu *pmu)
 	 * no need to recalculate MMCR* settings and reset the PMCs.
 	 * Just reenable the PMU with the current MMCR* settings
 	 * (possibly updated for removal of events).
+	 * While reenabling PMU during partition migration, continue
+	 * with normal flow.
 	 */
-	if (!cpuhw->n_added) {
+	if (!cpuhw->n_added && !cpuhw->migrate) {
 		mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
 		mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
 		if (ppmu->flags & PPMU_ARCH_31)
@@ -1434,11 +1453,15 @@ static void power_pmu_enable(struct pmu *pmu)
 	/*
 	 * Read off any pre-existing events that need to move
 	 * to another PMC.
+	 * While enabling PMU during partition migration,
+	 * skip power_pmu_read since all event count settings
+	 * needs to be re-initialised after migration.
 	 */
 	for (i = 0; i < cpuhw->n_events; ++i) {
 		event = cpuhw->event[i];
-		if (event->hw.idx && event->hw.idx != hwc_index[i] + 1) {
-			power_pmu_read(event);
+		if ((event->hw.idx && event->hw.idx != hwc_index[i] + 1) || (cpuhw->migrate)) {
+			if (!cpuhw->migrate)
+				power_pmu_read(event);
 			write_pmc(event->hw.idx, 0);
 			event->hw.idx = 0;
 		}
@@ -1506,6 +1529,20 @@ static void power_pmu_enable(struct pmu *pmu)
 	local_irq_restore(flags);
 }
 
+/*
+ * Called from powerpc mobility code
+ * during migration completion to
+ * enable back PMU counters.
+ */
+void mobility_pmu_enable(void)
+{
+	struct cpu_hw_events *cpuhw;
+
+	cpuhw = this_cpu_ptr(&cpu_hw_events);
+	power_pmu_enable(NULL);
+	cpuhw->migrate = 0;
+}
+
 static int collect_events(struct perf_event *group, int max_count,
 			  struct perf_event *ctrs[], u64 *events,
 			  unsigned int *flags)
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index e83e089..ff7a77c 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -476,6 +476,8 @@ static int do_join(void *arg)
 retry:
 	/* Must ensure MSR.EE off for H_JOIN. */
 	hard_irq_disable();
+	/* Disable PMU before suspend */
+	mobility_pmu_disable();
 	hvrc = plpar_hcall_norets(H_JOIN);
 
 	switch (hvrc) {
@@ -530,6 +532,8 @@ static int do_join(void *arg)
 	 * reset the watchdog.
 	 */
 	touch_nmi_watchdog();
+	/* Enable PMU after resuming */
+	mobility_pmu_enable();
 	return ret;
 }
 
-- 
1.8.3.1

