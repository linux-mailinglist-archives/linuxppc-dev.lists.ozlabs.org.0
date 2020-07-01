Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 415C62108DA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 12:04:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xcJQ48MpzDr30
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 20:04:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xbMD0mb2zDqs1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 19:21:27 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06192axs012270; Wed, 1 Jul 2020 05:21:23 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320p8nk16r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 05:21:22 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0619G1jo007156;
 Wed, 1 Jul 2020 09:21:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 31wwr8cqcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 09:21:20 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0619LIIP54788128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 09:21:18 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16D044C040;
 Wed,  1 Jul 2020 09:21:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD2144C04E;
 Wed,  1 Jul 2020 09:21:16 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.47.174])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Jul 2020 09:21:16 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 07/10] powerpc/perf: support BHRB disable bit and new
 filtering modes
Date: Wed,  1 Jul 2020 05:20:59 -0400
Message-Id: <1593595262-1433-8-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_04:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 cotscore=-2147483648 suspectscore=1 bulkscore=0 mlxlogscore=823
 adultscore=0 priorityscore=1501 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007010063
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

PowerISA v3.1 has few updates for the Branch History Rolling Buffer(BHRB).
First is the addition of BHRB disable bit and second new filtering
modes for BHRB.

BHRB disable is controlled via Monitor Mode Control Register A (MMCRA)
bit 26, namely "BHRB Recording Disable (BHRBRD)". This field controls
whether BHRB entries are written when BHRB recording is enabled by other
bits. Patch implements support for this BHRB disable bit.

Secondly PowerISA v3.1 introduce filtering support for
PERF_SAMPLE_BRANCH_IND_CALL/COND. The patch adds BHRB filter support
for "ind_call" and "cond" in power10_bhrb_filter_map().

'commit bb19af816025 ("powerpc/perf: Prevent kernel address leak to userspace via BHRB buffer")'
added a check in bhrb_read() to filter the kernel address from BHRB buffer. Patch here modified
it to avoid that check for PowerISA v3.1 based processors, since PowerISA v3.1 allows
only MSR[PR]=1 address to be written to BHRB buffer.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/core-book3s.c       | 27 +++++++++++++++++++++------
 arch/powerpc/perf/isa207-common.c     | 13 +++++++++++++
 arch/powerpc/perf/power10-pmu.c       | 13 +++++++++++--
 arch/powerpc/platforms/powernv/idle.c | 14 ++++++++++++++
 4 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index fad5159..9709606 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -466,9 +466,13 @@ static void power_pmu_bhrb_read(struct perf_event *event, struct cpu_hw_events *
 			 * addresses at this point. Check the privileges before
 			 * exporting it to userspace (avoid exposure of regions
 			 * where we could have speculative execution)
+			 * Incase of ISA 310, BHRB will capture only user-space
+			 * address,hence include a check before filtering code
 			 */
-			if (is_kernel_addr(addr) && perf_allow_kernel(&event->attr) != 0)
-				continue;
+			if (!(ppmu->flags & PPMU_ARCH_310S))
+				if (is_kernel_addr(addr) &&
+				perf_allow_kernel(&event->attr) != 0)
+					continue;
 
 			/* Branches are read most recent first (ie. mfbhrb 0 is
 			 * the most recent branch).
@@ -1212,7 +1216,7 @@ static void write_mmcr0(struct cpu_hw_events *cpuhw, unsigned long mmcr0)
 static void power_pmu_disable(struct pmu *pmu)
 {
 	struct cpu_hw_events *cpuhw;
-	unsigned long flags, mmcr0, val;
+	unsigned long flags, mmcr0, val, mmcra = 0;
 
 	if (!ppmu)
 		return;
@@ -1245,12 +1249,23 @@ static void power_pmu_disable(struct pmu *pmu)
 		mb();
 		isync();
 
+		val = mmcra = cpuhw->mmcr[2];
+
 		/*
 		 * Disable instruction sampling if it was enabled
 		 */
-		if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE) {
-			mtspr(SPRN_MMCRA,
-			      cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
+		if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE)
+			mmcra = cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE;
+
+		/* Disable BHRB via mmcra [:26] for p10 if needed */
+		if (!(cpuhw->mmcr[2] & MMCRA_BHRB_DISABLE))
+			mmcra |= MMCRA_BHRB_DISABLE;
+
+		/* Write SPRN_MMCRA if mmcra has either disabled
+		 * instruction sampling or BHRB
+		 */
+		if (val != mmcra) {
+			mtspr(SPRN_MMCRA, mmcra);
 			mb();
 			isync();
 		}
diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 7d4839e..463d925 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -404,6 +404,12 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
 
 	mmcra = mmcr1 = mmcr2 = mmcr3 = 0;
 
+	/* Disable bhrb unless explicitly requested
+	 * by setting MMCRA [:26] bit.
+	 */
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		mmcra |= MMCRA_BHRB_DISABLE;
+
 	/* Second pass: assign PMCs, set all MMCR1 fields */
 	for (i = 0; i < n_ev; ++i) {
 		pmc     = (event[i] >> EVENT_PMC_SHIFT) & EVENT_PMC_MASK;
@@ -475,10 +481,17 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
 		}
 
 		if (event[i] & EVENT_WANTS_BHRB) {
+			/* set MMCRA[:26] to 0 for Power10 to enable BHRB */
+			if (cpu_has_feature(CPU_FTR_ARCH_31))
+				mmcra &= ~MMCRA_BHRB_DISABLE;
 			val = (event[i] >> EVENT_IFM_SHIFT) & EVENT_IFM_MASK;
 			mmcra |= val << MMCRA_IFM_SHIFT;
 		}
 
+		/* set MMCRA[:26] to 0 if there is user request for BHRB */
+		if (cpu_has_feature(CPU_FTR_ARCH_31) && has_branch_stack(pevents[i]))
+			mmcra &= ~MMCRA_BHRB_DISABLE;
+
 		if (pevents[i]->attr.exclude_user)
 			mmcr2 |= MMCR2_FCP(pmc);
 
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index d64d69d..07fb919 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -82,6 +82,8 @@
 
 /* MMCRA IFM bits - POWER10 */
 #define POWER10_MMCRA_IFM1		0x0000000040000000UL
+#define POWER10_MMCRA_IFM2		0x0000000080000000UL
+#define POWER10_MMCRA_IFM3		0x00000000C0000000UL
 #define POWER10_MMCRA_BHRB_MASK		0x00000000C0000000UL
 
 /* Table of alternatives, sorted by column 0 */
@@ -233,8 +235,15 @@ static u64 power10_bhrb_filter_map(u64 branch_sample_type)
 	if (branch_sample_type & PERF_SAMPLE_BRANCH_ANY_RETURN)
 		return -1;
 
-	if (branch_sample_type & PERF_SAMPLE_BRANCH_IND_CALL)
-		return -1;
+	if (branch_sample_type & PERF_SAMPLE_BRANCH_IND_CALL) {
+		pmu_bhrb_filter |= POWER10_MMCRA_IFM2;
+		return pmu_bhrb_filter;
+	}
+
+	if (branch_sample_type & PERF_SAMPLE_BRANCH_COND) {
+		pmu_bhrb_filter |= POWER10_MMCRA_IFM3;
+		return pmu_bhrb_filter;
+	}
 
 	if (branch_sample_type & PERF_SAMPLE_BRANCH_CALL)
 		return -1;
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 2dd4673..7db99c7 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -611,6 +611,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	unsigned long srr1;
 	unsigned long pls;
 	unsigned long mmcr0 = 0;
+	unsigned long mmcra_bhrb = 0;
 	struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
 	bool sprs_saved = false;
 
@@ -657,6 +658,15 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		  */
 		mmcr0		= mfspr(SPRN_MMCR0);
 	}
+
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		/* POWER10 uses MMCRA[:26] as BHRB disable bit
+		 * to disable BHRB logic when not used. Hence Save and
+		 * restore MMCRA after a state-loss idle.
+		 */
+		mmcra_bhrb		= mfspr(SPRN_MMCRA);
+	}
+
 	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
 		sprs.lpcr	= mfspr(SPRN_LPCR);
 		sprs.hfscr	= mfspr(SPRN_HFSCR);
@@ -721,6 +731,10 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 			mtspr(SPRN_MMCR0, mmcr0);
 		}
 
+		/* Reload MMCRA to restore BHRB disable bit for POWER10 */
+		if (cpu_has_feature(CPU_FTR_ARCH_31))
+			mtspr(SPRN_MMCRA, mmcra_bhrb);
+
 		/*
 		 * DD2.2 and earlier need to set then clear bit 60 in MMCRA
 		 * to ensure the PMU starts running.
-- 
1.8.3.1

