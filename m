Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C4921089B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 11:51:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xc2N4jY6zDqyc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 19:51:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xbM36SLHzDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 19:21:19 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06192T7K164479; Wed, 1 Jul 2020 05:21:11 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3205wtfh96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 05:21:10 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0619FTSR019412;
 Wed, 1 Jul 2020 09:21:09 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 31wwr8cq7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 09:21:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0619L6do14352386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 09:21:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBE494C05A;
 Wed,  1 Jul 2020 09:21:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DE164C052;
 Wed,  1 Jul 2020 09:21:05 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.47.174])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Jul 2020 09:21:05 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 01/10] powerpc/perf: Add support for ISA3.1 PMU SPRs
Date: Wed,  1 Jul 2020 05:20:53 -0400
Message-Id: <1593595262-1433-2-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_04:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 cotscore=-2147483648
 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007010063
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

PowerISA v3.1 includes new performance monitoring unit(PMU)
special purpose registers (SPRs). They are

Monitor Mode Control Register 3 (MMCR3)
Sampled Instruction Event Register 2 (SIER2)
Sampled Instruction Event Register 3 (SIER3)

MMCR3 is added for further sampling related configuration
control. SIER2/SIER3 are added to provide additional
information about the sampled instruction.

Patch adds new PPMU flag called "PPMU_ARCH_310S" to support
handling of these new SPRs, updates the struct thread_struct
to include these new SPRs, increase the size of mmcr[] array
by one to include MMCR3 in struct cpu_hw_event. This is needed
to support programming of MMCR3 SPR during event_[enable/disable].
Patch also adds the sysfs support for the MMCR3 SPR along with
SPRN_ macros for these new pmu sprs.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h |  1 +
 arch/powerpc/include/asm/processor.h         |  4 ++++
 arch/powerpc/include/asm/reg.h               |  6 ++++++
 arch/powerpc/kernel/sysfs.c                  |  8 ++++++++
 arch/powerpc/perf/core-book3s.c              | 29 ++++++++++++++++++++++++++--
 5 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index 3e9703f..895aeaa 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -69,6 +69,7 @@ struct power_pmu {
 #define PPMU_HAS_SIER		0x00000040 /* Has SIER */
 #define PPMU_ARCH_207S		0x00000080 /* PMC is architecture v2.07S */
 #define PPMU_NO_SIAR		0x00000100 /* Do not use SIAR */
+#define PPMU_ARCH_310S		0x00000200 /* Has MMCR3, SIER2 and SIER3 */
 
 /*
  * Values for flags to get_alternatives()
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 52a6783..a466e94 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -272,6 +272,10 @@ struct thread_struct {
 	unsigned 	mmcr0;
 
 	unsigned 	used_ebb;
+	unsigned long   mmcr3;
+	unsigned long   sier2;
+	unsigned long   sier3;
+
 #endif
 };
 
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 88e6c78..21a1b2d 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -876,7 +876,9 @@
 #define   MMCR0_FCHV	0x00000001UL /* freeze conditions in hypervisor mode */
 #define SPRN_MMCR1	798
 #define SPRN_MMCR2	785
+#define SPRN_MMCR3	754
 #define SPRN_UMMCR2	769
+#define SPRN_UMMCR3	738
 #define SPRN_MMCRA	0x312
 #define   MMCRA_SDSYNC	0x80000000UL /* SDAR synced with SIAR */
 #define   MMCRA_SDAR_DCACHE_MISS 0x40000000UL
@@ -918,6 +920,10 @@
 #define   SIER_SIHV		0x1000000	/* Sampled MSR_HV */
 #define   SIER_SIAR_VALID	0x0400000	/* SIAR contents valid */
 #define   SIER_SDAR_VALID	0x0200000	/* SDAR contents valid */
+#define SPRN_SIER2	752
+#define SPRN_SIER3	753
+#define SPRN_USIER2	736
+#define SPRN_USIER3	737
 #define SPRN_SIAR	796
 #define SPRN_SDAR	797
 #define SPRN_TACR	888
diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 571b325..46b4ebc 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -622,8 +622,10 @@ void ppc_enable_pmcs(void)
 SYSFS_PMCSETUP(pmc8, SPRN_PMC8);
 
 SYSFS_PMCSETUP(mmcra, SPRN_MMCRA);
+SYSFS_PMCSETUP(mmcr3, SPRN_MMCR3);
 
 static DEVICE_ATTR(mmcra, 0600, show_mmcra, store_mmcra);
+static DEVICE_ATTR(mmcr3, 0600, show_mmcr3, store_mmcr3);
 #endif /* HAS_PPC_PMC56 */
 
 
@@ -886,6 +888,9 @@ static int register_cpu_online(unsigned int cpu)
 #ifdef	CONFIG_PMU_SYSFS
 	if (cpu_has_feature(CPU_FTR_MMCRA))
 		device_create_file(s, &dev_attr_mmcra);
+
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		device_create_file(s, &dev_attr_mmcr3);
 #endif /* CONFIG_PMU_SYSFS */
 
 	if (cpu_has_feature(CPU_FTR_PURR)) {
@@ -980,6 +985,9 @@ static int unregister_cpu_online(unsigned int cpu)
 #ifdef CONFIG_PMU_SYSFS
 	if (cpu_has_feature(CPU_FTR_MMCRA))
 		device_remove_file(s, &dev_attr_mmcra);
+
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		device_remove_file(s, &dev_attr_mmcr3);
 #endif /* CONFIG_PMU_SYSFS */
 
 	if (cpu_has_feature(CPU_FTR_PURR)) {
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index cd6a742..5c64bd3 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -39,10 +39,10 @@ struct cpu_hw_events {
 	unsigned int flags[MAX_HWEVENTS];
 	/*
 	 * The order of the MMCR array is:
-	 *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2
+	 *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2, MMCR3
 	 *  - 32-bit, MMCR0, MMCR1, MMCR2
 	 */
-	unsigned long mmcr[4];
+	unsigned long mmcr[5];
 	struct perf_event *limited_counter[MAX_LIMITED_HWCOUNTERS];
 	u8  limited_hwidx[MAX_LIMITED_HWCOUNTERS];
 	u64 alternatives[MAX_HWEVENTS][MAX_EVENT_ALTERNATIVES];
@@ -586,6 +586,11 @@ static void ebb_switch_out(unsigned long mmcr0)
 	current->thread.sdar  = mfspr(SPRN_SDAR);
 	current->thread.mmcr0 = mmcr0 & MMCR0_USER_MASK;
 	current->thread.mmcr2 = mfspr(SPRN_MMCR2) & MMCR2_USER_MASK;
+	if (ppmu->flags & PPMU_ARCH_310S) {
+		current->thread.mmcr3 = mfspr(SPRN_MMCR3);
+		current->thread.sier2 = mfspr(SPRN_SIER2);
+		current->thread.sier3 = mfspr(SPRN_SIER3);
+	}
 }
 
 static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events *cpuhw)
@@ -625,6 +630,12 @@ static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events *cpuhw)
 	 * instead manage the MMCR2 entirely by itself.
 	 */
 	mtspr(SPRN_MMCR2, cpuhw->mmcr[3] | current->thread.mmcr2);
+
+	if (ppmu->flags & PPMU_ARCH_310S) {
+		mtspr(SPRN_MMCR3, current->thread.mmcr3);
+		mtspr(SPRN_SIER2, current->thread.sier2);
+		mtspr(SPRN_SIER3, current->thread.sier3);
+	}
 out:
 	return mmcr0;
 }
@@ -845,6 +856,11 @@ void perf_event_print_debug(void)
 		pr_info("EBBRR: %016lx BESCR: %016lx\n",
 			mfspr(SPRN_EBBRR), mfspr(SPRN_BESCR));
 	}
+
+	if (ppmu->flags & PPMU_ARCH_310S) {
+		pr_info("MMCR3: %016lx SIER2: %016lx SIER3: %016lx\n",
+		mfspr(SPRN_MMCR3), mfspr(SPRN_SIER2), mfspr(SPRN_SIER3));
+	}
 #endif
 	pr_info("SIAR:  %016lx SDAR:  %016lx SIER:  %016lx\n",
 		mfspr(SPRN_SIAR), sdar, sier);
@@ -1310,6 +1326,10 @@ static void power_pmu_enable(struct pmu *pmu)
 	if (!cpuhw->n_added) {
 		mtspr(SPRN_MMCRA, cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
 		mtspr(SPRN_MMCR1, cpuhw->mmcr[1]);
+#ifdef CONFIG_PPC64
+		if (ppmu->flags & PPMU_ARCH_310S)
+			mtspr(SPRN_MMCR3, cpuhw->mmcr[4]);
+#endif /* CONFIG_PPC64 */
 		goto out_enable;
 	}
 
@@ -1353,6 +1373,11 @@ static void power_pmu_enable(struct pmu *pmu)
 	if (ppmu->flags & PPMU_ARCH_207S)
 		mtspr(SPRN_MMCR2, cpuhw->mmcr[3]);
 
+#ifdef CONFIG_PPC64
+	if (ppmu->flags & PPMU_ARCH_310S)
+		mtspr(SPRN_MMCR3, cpuhw->mmcr[4]);
+#endif /* CONFIG_PPC64 */
+
 	/*
 	 * Read off any pre-existing events that need to move
 	 * to another PMC.
-- 
1.8.3.1

