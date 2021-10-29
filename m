Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F343F531
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 05:06:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgS4J5ycBz30BM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 14:06:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sxux2CMA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sxux2CMA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgS3Y0srPz2yHq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 14:05:28 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19T2lVIE002720; 
 Fri, 29 Oct 2021 03:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=yUuK8npY1b8ed4vkaq5oINOIsE2WeL1d5aKuDORRdwI=;
 b=sxux2CMAhUdEfOsvyVysLXubyfuNlXJIBuqcUfpjybF6teeRfGuIWnmVXHWVWi0S144y
 X5kyS91ZfksZw7eWITzB/SEcDVUn4x09VPeqXQBFRfmn2mZoy724k0Q5mRuOhUkhr8jI
 QYn2Yfje0wV4e7ZSVbdh4fSNhwWVNKe0tLghQDKKn5FjMZdwMMgIu+DZtzGJkH92gXa5
 +pzeTSY+ia08t7PbgNGdqbMIghb2AfdMmvvCe6tfgDeXqTf2K/WNvfYGLZEJVIVqufBb
 s/maPGWuivra7FbK62JMruRJoWv3sOsoCoP/Byu5FK7ZOcLqoC+lxnS1x7D8gS3JHM50 pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c08g00857-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Oct 2021 03:05:20 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19T30V8G007530;
 Fri, 29 Oct 2021 03:05:20 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c08g0084f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Oct 2021 03:05:20 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19T3068F012380;
 Fri, 29 Oct 2021 03:05:17 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3bx4eeeqb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Oct 2021 03:05:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19T35EV046530866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 03:05:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C24EA4068;
 Fri, 29 Oct 2021 03:05:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCEECA4066;
 Fri, 29 Oct 2021 03:05:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.185.188])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Oct 2021 03:05:12 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [V3] powerpc/perf: Enable PMU counters post partition migration if
 PMU is active
Date: Fri, 29 Oct 2021 08:35:10 +0530
Message-Id: <20211029030510.58797-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YE9FS86yLVsmJBk3pdsPBmtbgkfyfeux
X-Proofpoint-ORIG-GUID: qTLqubCpanAVosiJmkxbltGmCI3aJJq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_06,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 priorityscore=1501 bulkscore=6 impostorscore=0 lowpriorityscore=6
 mlxlogscore=451 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110290017
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
Cc: nathanl@linux.ibm.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 kjain@linux.ibm.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During Live Partition Migration (LPM), it is observed that perf
counter values reports zero post migration completion. However
'perf stat' with workload continues to show counts post migration
since PMU gets disabled/enabled during sched switches. But incase
of system/cpu wide monitoring, zero counts were reported with 'perf
stat' after migration completion.

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
mobility_pmu_enable() is called after the migrate is done to enable
back the PMU counters.

Since the performance Monitor counters ( PMCs) are not
saved/restored during LPM, results in PMC value being zero and the
'event->hw.prev_count' being non-zero value. This causes problem
during updation of event->count since we always accumulate
(event->hw.prev_count - PMC value) in event->count.  If
event->hw.prev_count is greater PMC value, event->count becomes
negative. To fix this, 'prev_count' also needs to be re-initialised
for all events while enabling back the events. Hence read the
existing events and clear the PMC index (stored in event->hw.idx)
for all events im mobility_pmu_disable. By this way, event count
settings will get re-initialised correctly in power_pmu_enable.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
[ Fixed compilation error reported by kernel test robot ]
Reported-by: kernel test robot <lkp@intel.com>
---
Changelog:
Change from v2 -> v3:
Addressed review comments from Nicholas Piggin.
 - Removed the "migrate" field which was added in initial
   patch to address updation of event count settings correctly
   in power_pmu_enable. Instead read off existing events in
   mobility_pmu_disable before power_pmu_enable.
 - Moved the mobility_pmu_disable/enable declaration from
   rtas.h to perf event header file.

Addressed review comments from Nathan.
 - Moved the mobility function calls from stop_machine
   context out to pseries_migrate_partition. Also now this
   is a per cpu invocation.

Change from v1 -> v2:
 - Moved the mobility_pmu_enable and mobility_pmu_disable
   declarations under CONFIG_PPC_PERF_CTRS in rtas.h.
   Also included 'asm/rtas.h' in core-book3s to fix the
   compilation warning reported by kernel test robot.

 arch/powerpc/include/asm/perf_event.h     |  8 +++++
 arch/powerpc/perf/core-book3s.c           | 39 +++++++++++++++++++++++
 arch/powerpc/platforms/pseries/mobility.c |  7 ++++
 3 files changed, 54 insertions(+)

diff --git a/arch/powerpc/include/asm/perf_event.h b/arch/powerpc/include/asm/perf_event.h
index 164e910bf654..88aab6cf840c 100644
--- a/arch/powerpc/include/asm/perf_event.h
+++ b/arch/powerpc/include/asm/perf_event.h
@@ -17,6 +17,14 @@ static inline bool is_sier_available(void) { return false; }
 static inline unsigned long get_pmcs_ext_regs(int idx) { return 0; }
 #endif
 
+#ifdef CONFIG_PPC_PERF_CTRS
+void mobility_pmu_disable(void *unused);
+void mobility_pmu_enable(void *unused);
+#else
+static inline void mobility_pmu_disable(void *unused) { }
+static inline void mobility_pmu_enable(void *unused) { }
+#endif
+
 #ifdef CONFIG_FSL_EMB_PERF_EVENT
 #include <asm/perf_event_fsl_emb.h>
 #endif
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 73e62e9b179b..2e8c4c668fa3 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1343,6 +1343,33 @@ static void power_pmu_disable(struct pmu *pmu)
 	local_irq_restore(flags);
 }
 
+/*
+ * Called from pseries_migrate_partition() function
+ * before migration, from powerpc/mobility code.
+ */
+void mobility_pmu_disable(void *unused)
+{
+	struct cpu_hw_events *cpuhw = this_cpu_ptr(&cpu_hw_events);
+	struct perf_event *event;
+
+	if (cpuhw->n_events != 0) {
+		int i;
+
+		power_pmu_disable(NULL);
+		/*
+		 * Read off any pre-existing events because the register
+		 * values may not be migrated.
+		 */
+		for (i = 0; i < cpuhw->n_events; ++i) {
+			event = cpuhw->event[i];
+			if (event->hw.idx) {
+				power_pmu_read(event);
+				event->hw.idx = 0;
+			}
+		}
+	}
+}
+
 /*
  * Re-enable all events if disable == 0.
  * If we were previously disabled and events were added, then
@@ -1515,6 +1542,18 @@ static void power_pmu_enable(struct pmu *pmu)
 	local_irq_restore(flags);
 }
 
+/*
+ * Called from pseries_migrate_partition() function
+ * after migration, from powerpc/mobility code.
+ */
+void mobility_pmu_enable(void *unused)
+{
+	struct cpu_hw_events *cpuhw = this_cpu_ptr(&cpu_hw_events);
+
+	cpuhw->n_added = cpuhw->n_events;
+	power_pmu_enable(NULL);
+}
+
 static int collect_events(struct perf_event *group, int max_count,
 			  struct perf_event *ctrs[], u64 *events,
 			  unsigned int *flags)
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index e83e0891272d..3e96485ccba4 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -22,6 +22,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/stringify.h>
+#include <linux/perf_event.h>
 
 #include <asm/machdep.h>
 #include <asm/rtas.h>
@@ -631,12 +632,18 @@ static int pseries_migrate_partition(u64 handle)
 	if (ret)
 		return ret;
 
+	/* Disable PMU before suspend */
+	on_each_cpu(&mobility_pmu_disable, NULL, 0);
+
 	ret = pseries_suspend(handle);
 	if (ret == 0)
 		post_mobility_fixup();
 	else
 		pseries_cancel_migration(handle, ret);
 
+	/* Enable PMU after resuming */
+	on_each_cpu(&mobility_pmu_enable, NULL, 0);
+
 	return ret;
 }
 
-- 
2.33.0

