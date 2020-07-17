Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BC0223F05
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 17:02:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7Z951mzQzDrB4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 01:02:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Yf774p8zDrNh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 00:38:55 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HEXcQP053190; Fri, 17 Jul 2020 10:38:50 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32auqv538w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 10:38:50 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06HEWrvO003156;
 Fri, 17 Jul 2020 14:38:48 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 327q2y341p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 14:38:47 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06HEcj1524838600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 14:38:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E7974C046;
 Fri, 17 Jul 2020 14:38:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82FD94C04E;
 Fri, 17 Jul 2020 14:38:42 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.77.207.73])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 14:38:42 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [v3 04/15] powerpc/perf: Add support for ISA3.1 PMU SPRs
Date: Fri, 17 Jul 2020 10:38:16 -0400
Message-Id: <1594996707-3727-5-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_06:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=1 priorityscore=1501 mlxscore=0
 mlxlogscore=878 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170103
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 acme@kernel.org, jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
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
to include these new SPRs, include MMCR3 in struct mmcr_regs.
This is needed to support programming of MMCR3 SPR during
event_[enable/disable]. Patch also adds the sysfs support
for the MMCR3 SPR along with SPRN_ macros for these new pmu sprs.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h |  2 ++
 arch/powerpc/include/asm/processor.h         |  4 ++++
 arch/powerpc/include/asm/reg.h               |  6 ++++++
 arch/powerpc/kernel/sysfs.c                  |  8 ++++++++
 arch/powerpc/perf/core-book3s.c              | 29 ++++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index 14b8dc1..832450a 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -22,6 +22,7 @@ struct mmcr_regs {
 	unsigned long mmcr1;
 	unsigned long mmcr2;
 	unsigned long mmcra;
+	unsigned long mmcr3;
 };
 /*
  * This struct provides the constants and functions needed to
@@ -75,6 +76,7 @@ struct power_pmu {
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
index f4d07b5..ca32fc0 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -72,6 +72,11 @@ struct cpu_hw_events {
 /*
  * 32-bit doesn't have MMCRA but does have an MMCR2,
  * and a few other names are different.
+ * Also 32-bit doesn't have MMCR3, SIER2 and SIER3.
+ * Define them as zero knowing that any code path accessing
+ * these registers (via mtspr/mfspr) are done under ppmu flag
+ * check for PPMU_ARCH_310S and we will not enter that code path
+ * for 32-bit.
  */
 #ifdef CONFIG_PPC32
 
@@ -85,6 +90,9 @@ struct cpu_hw_events {
 #define MMCR0_PMCC_U6		0
 
 #define SPRN_MMCRA		SPRN_MMCR2
+#define SPRN_MMCR3		0
+#define SPRN_SIER2		0
+#define SPRN_SIER3		0
 #define MMCRA_SAMPLE_ENABLE	0
 
 static inline unsigned long perf_ip_adjust(struct pt_regs *regs)
@@ -581,6 +589,11 @@ static void ebb_switch_out(unsigned long mmcr0)
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
@@ -620,6 +633,12 @@ static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events *cpuhw)
 	 * instead manage the MMCR2 entirely by itself.
 	 */
 	mtspr(SPRN_MMCR2, cpuhw->mmcr.mmcr2 | current->thread.mmcr2);
+
+	if (ppmu->flags & PPMU_ARCH_310S) {
+		mtspr(SPRN_MMCR3, current->thread.mmcr3);
+		mtspr(SPRN_SIER2, current->thread.sier2);
+		mtspr(SPRN_SIER3, current->thread.sier3);
+	}
 out:
 	return mmcr0;
 }
@@ -840,6 +859,11 @@ void perf_event_print_debug(void)
 		pr_info("EBBRR: %016lx BESCR: %016lx\n",
 			mfspr(SPRN_EBBRR), mfspr(SPRN_BESCR));
 	}
+
+	if (ppmu->flags & PPMU_ARCH_310S) {
+		pr_info("MMCR3: %016lx SIER2: %016lx SIER3: %016lx\n",
+			mfspr(SPRN_MMCR3), mfspr(SPRN_SIER2), mfspr(SPRN_SIER3));
+	}
 #endif
 	pr_info("SIAR:  %016lx SDAR:  %016lx SIER:  %016lx\n",
 		mfspr(SPRN_SIAR), sdar, sier);
@@ -1305,6 +1329,8 @@ static void power_pmu_enable(struct pmu *pmu)
 	if (!cpuhw->n_added) {
 		mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
 		mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
+		if (ppmu->flags & PPMU_ARCH_310S)
+			mtspr(SPRN_MMCR3, cpuhw->mmcr.mmcr3);
 		goto out_enable;
 	}
 
@@ -1348,6 +1374,9 @@ static void power_pmu_enable(struct pmu *pmu)
 	if (ppmu->flags & PPMU_ARCH_207S)
 		mtspr(SPRN_MMCR2, cpuhw->mmcr.mmcr2);
 
+	if (ppmu->flags & PPMU_ARCH_310S)
+		mtspr(SPRN_MMCR3, cpuhw->mmcr.mmcr3);
+
 	/*
 	 * Read off any pre-existing events that need to move
 	 * to another PMC.
-- 
1.8.3.1

