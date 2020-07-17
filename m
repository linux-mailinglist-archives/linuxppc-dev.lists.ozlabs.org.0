Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A2A223F8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 17:26:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7Zj31RlKzDqCx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 01:26:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Yfc5pPGzDrNn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 00:39:20 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HEWOQa102235; Fri, 17 Jul 2020 10:39:12 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32aurbdtw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 10:39:11 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06HEUBmb024426;
 Fri, 17 Jul 2020 14:39:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 329nmyk1b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 14:39:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06HEd7pC63307978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 14:39:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08F254C04E;
 Fri, 17 Jul 2020 14:39:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 745A14C046;
 Fri, 17 Jul 2020 14:39:04 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.77.207.73])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 14:39:04 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [v3 11/15] powerpc/perf: BHRB control to disable BHRB logic when not
 used
Date: Fri, 17 Jul 2020 10:38:23 -0400
Message-Id: <1594996707-3727-12-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_06:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=1 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

PowerISA v3.1 has few updates for the Branch History Rolling Buffer(BHRB).

BHRB disable is controlled via Monitor Mode Control Register A (MMCRA)
bit, namely "BHRB Recording Disable (BHRBRD)". This field controls
whether BHRB entries are written when BHRB recording is enabled by other
bits. This patch implements support for this BHRB disable bit.

By setting 0b1 to this bit will disable the BHRB and by setting 0b0
to this bit will have BHRB enabled. This addresses backward
compatibility (for older OS), since this bit will be cleared and
hardware will be writing to BHRB by default.

This patch addresses changes to set MMCRA (BHRBRD) at boot for power10
( there by the core will run faster) and enable this feature only on
runtime ie, on explicit need from user. Also save/restore MMCRA in the
restore path of state-loss idle state to make sure we keep BHRB disabled
if it was not enabled on request at runtime.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/core-book3s.c       | 20 ++++++++++++++++----
 arch/powerpc/perf/isa207-common.c     | 12 ++++++++++++
 arch/powerpc/platforms/powernv/idle.c | 22 ++++++++++++++++++++--
 3 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index bd125fe..31c0535 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1218,7 +1218,7 @@ static void write_mmcr0(struct cpu_hw_events *cpuhw, unsigned long mmcr0)
 static void power_pmu_disable(struct pmu *pmu)
 {
 	struct cpu_hw_events *cpuhw;
-	unsigned long flags, mmcr0, val;
+	unsigned long flags, mmcr0, val, mmcra;
 
 	if (!ppmu)
 		return;
@@ -1251,12 +1251,24 @@ static void power_pmu_disable(struct pmu *pmu)
 		mb();
 		isync();
 
+		val = mmcra = cpuhw->mmcr.mmcra;
+
 		/*
 		 * Disable instruction sampling if it was enabled
 		 */
-		if (cpuhw->mmcr.mmcra & MMCRA_SAMPLE_ENABLE) {
-			mtspr(SPRN_MMCRA,
-			      cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
+		if (cpuhw->mmcr.mmcra & MMCRA_SAMPLE_ENABLE)
+			val &= ~MMCRA_SAMPLE_ENABLE;
+
+		/* Disable BHRB via mmcra (BHRBRD) for p10 */
+		if (ppmu->flags & PPMU_ARCH_310S)
+			val |= MMCRA_BHRB_DISABLE;
+
+		/*
+		 * Write SPRN_MMCRA if mmcra has either disabled
+		 * instruction sampling or BHRB.
+		 */
+		if (val != mmcra) {
+			mtspr(SPRN_MMCRA, mmcra);
 			mb();
 			isync();
 		}
diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 77643f3..964437a 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -404,6 +404,13 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
 
 	mmcra = mmcr1 = mmcr2 = mmcr3 = 0;
 
+	/*
+	 * Disable bhrb unless explicitly requested
+	 * by setting MMCRA (BHRBRD) bit.
+	 */
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		mmcra |= MMCRA_BHRB_DISABLE;
+
 	/* Second pass: assign PMCs, set all MMCR1 fields */
 	for (i = 0; i < n_ev; ++i) {
 		pmc     = (event[i] >> EVENT_PMC_SHIFT) & EVENT_PMC_MASK;
@@ -479,6 +486,11 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
 			mmcra |= val << MMCRA_IFM_SHIFT;
 		}
 
+		/* set MMCRA (BHRBRD) to 0 if there is user request for BHRB */
+		if (cpu_has_feature(CPU_FTR_ARCH_31) &&
+				(has_branch_stack(pevents[i]) || (event[i] & EVENT_WANTS_BHRB)))
+			mmcra &= ~MMCRA_BHRB_DISABLE;
+
 		if (pevents[i]->attr.exclude_user)
 			mmcr2 |= MMCR2_FCP(pmc);
 
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 2dd4673..1c9d0a9 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -611,6 +611,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	unsigned long srr1;
 	unsigned long pls;
 	unsigned long mmcr0 = 0;
+	unsigned long mmcra = 0;
 	struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
 	bool sprs_saved = false;
 
@@ -657,6 +658,21 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		  */
 		mmcr0		= mfspr(SPRN_MMCR0);
 	}
+
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		/*
+		 * POWER10 uses MMCRA (BHRBRD) as BHRB disable bit.
+		 * If the user hasn't asked for the BHRB to be
+		 * written, the value of MMCRA[BHRBRD] is 1.
+		 * On wakeup from stop, MMCRA[BHRBD] will be 0,
+		 * since it is previleged resource and will be lost.
+		 * Thus, if we do not save and restore the MMCRA[BHRBD],
+		 * hardware will be needlessly writing to the BHRB
+		 * in problem mode.
+		 */
+		mmcra		= mfspr(SPRN_MMCRA);
+	}
+
 	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
 		sprs.lpcr	= mfspr(SPRN_LPCR);
 		sprs.hfscr	= mfspr(SPRN_HFSCR);
@@ -700,8 +716,6 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	WARN_ON_ONCE(mfmsr() & (MSR_IR|MSR_DR));
 
 	if ((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS) {
-		unsigned long mmcra;
-
 		/*
 		 * We don't need an isync after the mtsprs here because the
 		 * upcoming mtmsrd is execution synchronizing.
@@ -721,6 +735,10 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 			mtspr(SPRN_MMCR0, mmcr0);
 		}
 
+		/* Reload MMCRA to restore BHRB disable bit for POWER10 */
+		if (cpu_has_feature(CPU_FTR_ARCH_31))
+			mtspr(SPRN_MMCRA, mmcra);
+
 		/*
 		 * DD2.2 and earlier need to set then clear bit 60 in MMCRA
 		 * to ensure the PMU starts running.
-- 
1.8.3.1

