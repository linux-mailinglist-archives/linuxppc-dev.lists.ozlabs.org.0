Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AF2144B7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 06:52:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482ZLg6XFvzDqQv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 16:52:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482ZJk4GQYzDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 16:51:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 482ZJk1vc4z8vl3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 16:51:02 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 482ZJk1f2kz9sRk; Wed, 22 Jan 2020 16:51:02 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 482ZJj4hLHz9sRX;
 Wed, 22 Jan 2020 16:51:01 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00M5lTLi017630; Wed, 22 Jan 2020 00:50:58 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xnnn7c0fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 00:50:58 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00M5kQXC005679;
 Wed, 22 Jan 2020 05:50:57 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 2xksn72wv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 05:50:57 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00M5ouQu52298146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jan 2020 05:50:56 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83C17AE063;
 Wed, 22 Jan 2020 05:50:56 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8FD0AE05C;
 Wed, 22 Jan 2020 05:50:55 +0000 (GMT)
Received: from suka-w540.usor.ibm.com (unknown [9.70.94.45])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jan 2020 05:50:55 +0000 (GMT)
From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@ozlabs.org>, 
 linuxram@us.ibm.com, maddy@linux.ibm.com
Subject: [PATCH v4 2/2] powerpc/pseries/svm: Disable BHRB/EBB/PMU access
Date: Tue, 21 Jan 2020 21:50:54 -0800
Message-Id: <20200122055054.6482-2-sukadev@linux.ibm.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200122055054.6482-1-sukadev@linux.ibm.com>
References: <20200122055054.6482-1-sukadev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001220051
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
Cc: linuxppc-dev@ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ultravisor disables some CPU features like BHRB, EBB and PMU in secure
virtual machines (SVMs) for now. Skip accessing those registers in
SVMs to avoid getting a Program Interrupt.

Basic performance monitoring in SVMs is likely to be enabled in the future
after adding the necessary security mechanisms in Ultravisor. Some features,
like BHRB or monitoring event counts in HV-mode (e.g: perf stat -e cycles:h)
may still be restricted for the longer term.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog[v4]
	- [Paul Mackerras] Drop is_secure_guest() checks in HV-only code
	  and indicate if the disabling of PMU is temporary.
	- For consistency, also skip registering PMUs in secure guests.

Changelog[v2]
	- [Michael Ellerman] Optimize the code using FW_FEATURE_SVM
	- Merged EBB/BHRB and PMU patches into one and reorganized code.
	- Fix some build errors reported by <lkp@intel.org>
---
 arch/powerpc/kernel/cpu_setup_power.S | 21 +++++++++++++++++++
 arch/powerpc/kernel/process.c         | 23 ++++++++++++--------
 arch/powerpc/perf/power9-pmu.c        | 10 +++++++++
 arch/powerpc/xmon/xmon.c              | 30 +++++++++++++++++----------
 4 files changed, 64 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
index a460298c7ddb..9e895d8db468 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -206,14 +206,35 @@ __init_PMU_HV_ISA207:
 	blr
 
 __init_PMU:
+#ifdef CONFIG_PPC_SVM
+	/*
+	 * SVM's are restricted from accessing PMU, so skip.
+	 */
+	mfmsr   r5
+	rldicl  r5, r5, 64-MSR_S_LG, 62
+	cmpwi   r5,1
+	beq     skip1
+#endif
 	li	r5,0
 	mtspr	SPRN_MMCRA,r5
 	mtspr	SPRN_MMCR0,r5
 	mtspr	SPRN_MMCR1,r5
 	mtspr	SPRN_MMCR2,r5
+skip1:
 	blr
 
 __init_PMU_ISA207:
+
+#ifdef CONFIG_PPC_SVM
+	/*
+	 * SVM's are restricted from accessing PMU, so skip.
+	*/
+	mfmsr   r5
+	rldicl  r5, r5, 64-MSR_S_LG, 62
+	cmpwi   r5,1
+	beq     skip2
+#endif
 	li	r5,0
 	mtspr	SPRN_MMCRS,r5
+skip2:
 	blr
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 639ceae7da9d..83c7c4119305 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -64,6 +64,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/stacktrace.h>
 #include <asm/hw_breakpoint.h>
+#include <asm/svm.h>
 
 #include <linux/kprobes.h>
 #include <linux/kdebug.h>
@@ -1059,9 +1060,11 @@ static inline void save_sprs(struct thread_struct *t)
 		t->dscr = mfspr(SPRN_DSCR);
 
 	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
-		t->bescr = mfspr(SPRN_BESCR);
-		t->ebbhr = mfspr(SPRN_EBBHR);
-		t->ebbrr = mfspr(SPRN_EBBRR);
+		if (!is_secure_guest()) {
+			t->bescr = mfspr(SPRN_BESCR);
+			t->ebbhr = mfspr(SPRN_EBBHR);
+			t->ebbrr = mfspr(SPRN_EBBRR);
+		}
 
 		t->fscr = mfspr(SPRN_FSCR);
 
@@ -1097,12 +1100,14 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 	}
 
 	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
-		if (old_thread->bescr != new_thread->bescr)
-			mtspr(SPRN_BESCR, new_thread->bescr);
-		if (old_thread->ebbhr != new_thread->ebbhr)
-			mtspr(SPRN_EBBHR, new_thread->ebbhr);
-		if (old_thread->ebbrr != new_thread->ebbrr)
-			mtspr(SPRN_EBBRR, new_thread->ebbrr);
+		if (!is_secure_guest()) {
+			if (old_thread->bescr != new_thread->bescr)
+				mtspr(SPRN_BESCR, new_thread->bescr);
+			if (old_thread->ebbhr != new_thread->ebbhr)
+				mtspr(SPRN_EBBHR, new_thread->ebbhr);
+			if (old_thread->ebbrr != new_thread->ebbrr)
+				mtspr(SPRN_EBBRR, new_thread->ebbrr);
+		}
 
 		if (old_thread->fscr != new_thread->fscr)
 			mtspr(SPRN_FSCR, new_thread->fscr);
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index 08c3ef796198..c6eca682180d 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt)	"power9-pmu: " fmt
 
 #include "isa207-common.h"
+#include <asm/svm.h>
 
 /*
  * Raw event encoding for Power9:
@@ -446,6 +447,15 @@ int init_power9_pmu(void)
 	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power9"))
 		return -ENODEV;
 
+	/*
+	 * Disable PMUs in secure guests until we evaluate security
+	 * exposure and add relevant functionality in Ultravisor.
+	 */
+	if (is_secure_guest()) {
+		printk("Not registering Performance Monitor in secure guest\n");
+		return 0;
+	}
+
 	/* Blacklist events */
 	if (!(pvr & PVR_POWER9_CUMULUS)) {
 		if ((PVR_CFG(pvr) == 2) && (PVR_MIN(pvr) == 1)) {
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 8057aafd5f5e..2d6c4963ec3c 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -53,6 +53,7 @@
 #include <asm/firmware.h>
 #include <asm/code-patching.h>
 #include <asm/sections.h>
+#include <asm/svm.h>
 
 #ifdef CONFIG_PPC64
 #include <asm/hvcall.h>
@@ -1861,17 +1862,24 @@ static void dump_207_sprs(void)
 			mfspr(SPRN_TEXASR));
 	}
 
-	printf("mmcr0  = %.16lx  mmcr1 = %.16lx mmcr2  = %.16lx\n",
-		mfspr(SPRN_MMCR0), mfspr(SPRN_MMCR1), mfspr(SPRN_MMCR2));
-	printf("pmc1   = %.8lx pmc2 = %.8lx  pmc3 = %.8lx  pmc4   = %.8lx\n",
-		mfspr(SPRN_PMC1), mfspr(SPRN_PMC2),
-		mfspr(SPRN_PMC3), mfspr(SPRN_PMC4));
-	printf("mmcra  = %.16lx   siar = %.16lx pmc5   = %.8lx\n",
-		mfspr(SPRN_MMCRA), mfspr(SPRN_SIAR), mfspr(SPRN_PMC5));
-	printf("sdar   = %.16lx   sier = %.16lx pmc6   = %.8lx\n",
-		mfspr(SPRN_SDAR), mfspr(SPRN_SIER), mfspr(SPRN_PMC6));
-	printf("ebbhr  = %.16lx  ebbrr = %.16lx bescr  = %.16lx\n",
-		mfspr(SPRN_EBBHR), mfspr(SPRN_EBBRR), mfspr(SPRN_BESCR));
+	if (!is_secure_guest()) {
+		printf("mmcr0  = %.16lx  mmcr1 = %.16lx mmcr2  = %.16lx\n",
+			mfspr(SPRN_MMCR0), mfspr(SPRN_MMCR1),
+			mfspr(SPRN_MMCR2));
+		printf("pmc1   = %.8lx pmc2 = %.8lx  pmc3 = %.8lx  pmc4   = %.8lx\n",
+			mfspr(SPRN_PMC1), mfspr(SPRN_PMC2),
+			mfspr(SPRN_PMC3), mfspr(SPRN_PMC4));
+		printf("mmcra  = %.16lx   siar = %.16lx pmc5   = %.8lx\n",
+			mfspr(SPRN_MMCRA), mfspr(SPRN_SIAR), mfspr(SPRN_PMC5));
+		printf("sdar   = %.16lx   sier = %.16lx pmc6   = %.8lx\n",
+			mfspr(SPRN_SDAR), mfspr(SPRN_SIER), mfspr(SPRN_PMC6));
+
+		printf("ebbhr  = %.16lx  ebbrr = %.16lx bescr  = %.16lx\n",
+			mfspr(SPRN_EBBHR), mfspr(SPRN_EBBRR),
+			mfspr(SPRN_BESCR));
+	}
+
+
 	printf("iamr   = %.16lx\n", mfspr(SPRN_IAMR));
 
 	if (!(msr & MSR_HV))
-- 
2.17.2

