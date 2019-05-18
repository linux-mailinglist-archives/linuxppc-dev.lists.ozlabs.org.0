Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B38223B6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 16:41:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455nt73HgQzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 May 2019 00:41:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455nWq708yzDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 00:25:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 455nWq215Qz8xCn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 00:25:59 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 455nWq0BPDz9s9y; Sun, 19 May 2019 00:25:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 455nWp3sn6z9sPK
 for <linuxppc-dev@ozlabs.org>; Sun, 19 May 2019 00:25:58 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4IEGYIv087334
 for <linuxppc-dev@ozlabs.org>; Sat, 18 May 2019 10:25:56 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sje6x0r9p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sat, 18 May 2019 10:25:56 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <cclaudio@linux.ibm.com>;
 Sat, 18 May 2019 15:25:55 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 18 May 2019 15:25:53 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4IEPpdC58130640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 May 2019 14:25:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A186C78064;
 Sat, 18 May 2019 14:25:51 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D20557805C;
 Sat, 18 May 2019 14:25:48 +0000 (GMT)
Received: from rino.ibm.com (unknown [9.85.168.40])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 18 May 2019 14:25:48 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 kvm-ppc@vger.kernel.org, linuxppc-dev@ozlabs.org
Subject: [RFC PATCH v2 07/10] KVM: PPC: Ultravisor: Restrict LDBAR access
Date: Sat, 18 May 2019 11:25:21 -0300
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190518142524.28528-1-cclaudio@linux.ibm.com>
References: <20190518142524.28528-1-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19051814-8235-0000-0000-00000E9900AF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011118; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01205121; UDB=6.00632701; IPR=6.00986061; 
 MB=3.00026948; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-18 14:25:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051814-8236-0000-0000-0000459E04FF
Message-Id: <20190518142524.28528-8-cclaudio@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-18_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905180103
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ram Pai <linuxram@us.ibm.com>

When the ultravisor firmware is available, it takes control over the
LDBAR register. In this case, thread-imc updates and save/restore
operations on the LDBAR register are handled by ultravisor.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
[Restrict LDBAR access in assembly code and some in C, update the commit
 message]
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv.c                 |  4 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S      |  2 +
 arch/powerpc/perf/imc-pmu.c                  | 64 ++++++++++++--------
 arch/powerpc/platforms/powernv/idle.c        |  6 +-
 arch/powerpc/platforms/powernv/subcore-asm.S |  4 ++
 5 files changed, 52 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 0fab0a201027..81f35f955d16 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -75,6 +75,7 @@
 #include <asm/xics.h>
 #include <asm/xive.h>
 #include <asm/hw_breakpoint.h>
+#include <asm/firmware.h>
 
 #include "book3s.h"
 
@@ -3117,7 +3118,8 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 			subcore_size = MAX_SMT_THREADS / split;
 			split_info.rpr = mfspr(SPRN_RPR);
 			split_info.pmmar = mfspr(SPRN_PMMAR);
-			split_info.ldbar = mfspr(SPRN_LDBAR);
+			if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
+				split_info.ldbar = mfspr(SPRN_LDBAR);
 			split_info.subcore_size = subcore_size;
 		} else {
 			split_info.subcore_size = 1;
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index dd014308f065..938cfa5dceed 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -375,8 +375,10 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_RPR, r0
 	ld	r0, KVM_SPLIT_PMMAR(r6)
 	mtspr	SPRN_PMMAR, r0
+BEGIN_FW_FTR_SECTION_NESTED(70)
 	ld	r0, KVM_SPLIT_LDBAR(r6)
 	mtspr	SPRN_LDBAR, r0
+END_FW_FTR_SECTION_NESTED(FW_FEATURE_ULTRAVISOR, 0, 70)
 	isync
 FTR_SECTION_ELSE
 	/* On P9 we use the split_info for coordinating LPCR changes */
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 31fa753e2eb2..39c84de74da9 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -17,6 +17,7 @@
 #include <asm/cputhreads.h>
 #include <asm/smp.h>
 #include <linux/string.h>
+#include <asm/firmware.h>
 
 /* Nest IMC data structures and variables */
 
@@ -816,6 +817,17 @@ static int core_imc_event_init(struct perf_event *event)
 	return 0;
 }
 
+static void thread_imc_ldbar_disable(void *dummy)
+{
+	/*
+	 * By Zeroing LDBAR, we disable thread-imc updates. When the ultravisor
+	 * firmware is available, it is responsible for handling thread-imc
+	 * updates, though
+	 */
+	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
+		mtspr(SPRN_LDBAR, 0);
+}
+
 /*
  * Allocates a page of memory for each of the online cpus, and load
  * LDBAR with 0.
@@ -856,7 +868,7 @@ static int thread_imc_mem_alloc(int cpu_id, int size)
 		per_cpu(thread_imc_mem, cpu_id) = local_mem;
 	}
 
-	mtspr(SPRN_LDBAR, 0);
+	thread_imc_ldbar_disable(NULL);
 	return 0;
 }
 
@@ -867,7 +879,7 @@ static int ppc_thread_imc_cpu_online(unsigned int cpu)
 
 static int ppc_thread_imc_cpu_offline(unsigned int cpu)
 {
-	mtspr(SPRN_LDBAR, 0);
+	thread_imc_ldbar_disable(NULL);
 	return 0;
 }
 
@@ -1010,7 +1022,6 @@ static int thread_imc_event_add(struct perf_event *event, int flags)
 {
 	int core_id;
 	struct imc_pmu_ref *ref;
-	u64 ldbar_value, *local_mem = per_cpu(thread_imc_mem, smp_processor_id());
 
 	if (flags & PERF_EF_START)
 		imc_event_start(event, flags);
@@ -1019,8 +1030,14 @@ static int thread_imc_event_add(struct perf_event *event, int flags)
 		return -EINVAL;
 
 	core_id = smp_processor_id() / threads_per_core;
-	ldbar_value = ((u64)local_mem & THREAD_IMC_LDBAR_MASK) | THREAD_IMC_ENABLE;
-	mtspr(SPRN_LDBAR, ldbar_value);
+	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR)) {
+		u64 ldbar_value, *local_mem;
+
+		local_mem = per_cpu(thread_imc_mem, smp_processor_id());
+		ldbar_value = ((u64)local_mem & THREAD_IMC_LDBAR_MASK) |
+				THREAD_IMC_ENABLE;
+		mtspr(SPRN_LDBAR, ldbar_value);
+	}
 
 	/*
 	 * imc pmus are enabled only when it is used.
@@ -1053,7 +1070,7 @@ static void thread_imc_event_del(struct perf_event *event, int flags)
 	int core_id;
 	struct imc_pmu_ref *ref;
 
-	mtspr(SPRN_LDBAR, 0);
+	thread_imc_ldbar_disable(NULL);
 
 	core_id = smp_processor_id() / threads_per_core;
 	ref = &core_imc_refc[core_id];
@@ -1109,7 +1126,7 @@ static int trace_imc_mem_alloc(int cpu_id, int size)
 	trace_imc_refc[core_id].id = core_id;
 	mutex_init(&trace_imc_refc[core_id].lock);
 
-	mtspr(SPRN_LDBAR, 0);
+	thread_imc_ldbar_disable(NULL);
 	return 0;
 }
 
@@ -1120,7 +1137,7 @@ static int ppc_trace_imc_cpu_online(unsigned int cpu)
 
 static int ppc_trace_imc_cpu_offline(unsigned int cpu)
 {
-	mtspr(SPRN_LDBAR, 0);
+	thread_imc_ldbar_disable(NULL);
 	return 0;
 }
 
@@ -1207,11 +1224,6 @@ static int trace_imc_event_add(struct perf_event *event, int flags)
 {
 	int core_id = smp_processor_id() / threads_per_core;
 	struct imc_pmu_ref *ref = NULL;
-	u64 local_mem, ldbar_value;
-
-	/* Set trace-imc bit in ldbar and load ldbar with per-thread memory address */
-	local_mem = get_trace_imc_event_base_addr();
-	ldbar_value = ((u64)local_mem & THREAD_IMC_LDBAR_MASK) | TRACE_IMC_ENABLE;
 
 	if (core_imc_refc)
 		ref = &core_imc_refc[core_id];
@@ -1222,14 +1234,25 @@ static int trace_imc_event_add(struct perf_event *event, int flags)
 		if (!ref)
 			return -EINVAL;
 	}
-	mtspr(SPRN_LDBAR, ldbar_value);
+	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR)) {
+		u64 local_mem, ldbar_value;
+
+		/*
+		 * Set trace-imc bit in ldbar and load ldbar with per-thread
+		 * memory address
+		 */
+		local_mem = get_trace_imc_event_base_addr();
+		ldbar_value = ((u64)local_mem & THREAD_IMC_LDBAR_MASK) |
+				TRACE_IMC_ENABLE;
+		mtspr(SPRN_LDBAR, ldbar_value);
+	}
 	mutex_lock(&ref->lock);
 	if (ref->refc == 0) {
 		if (opal_imc_counters_start(OPAL_IMC_COUNTERS_TRACE,
 				get_hard_smp_processor_id(smp_processor_id()))) {
 			mutex_unlock(&ref->lock);
 			pr_err("trace-imc: Unable to start the counters for core %d\n", core_id);
-			mtspr(SPRN_LDBAR, 0);
+			thread_imc_ldbar_disable(NULL);
 			return -EINVAL;
 		}
 	}
@@ -1270,7 +1293,7 @@ static void trace_imc_event_del(struct perf_event *event, int flags)
 		if (!ref)
 			return;
 	}
-	mtspr(SPRN_LDBAR, 0);
+	thread_imc_ldbar_disable(NULL);
 	mutex_lock(&ref->lock);
 	ref->refc--;
 	if (ref->refc == 0) {
@@ -1413,15 +1436,6 @@ static void cleanup_all_core_imc_memory(void)
 	kfree(core_imc_refc);
 }
 
-static void thread_imc_ldbar_disable(void *dummy)
-{
-	/*
-	 * By Zeroing LDBAR, we disable thread-imc
-	 * updates.
-	 */
-	mtspr(SPRN_LDBAR, 0);
-}
-
 void thread_imc_disable(void)
 {
 	on_each_cpu(thread_imc_ldbar_disable, NULL, 1);
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index c9133f7908ca..fd62435e3267 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -679,7 +679,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		sprs.ptcr	= mfspr(SPRN_PTCR);
 		sprs.rpr	= mfspr(SPRN_RPR);
 		sprs.tscr	= mfspr(SPRN_TSCR);
-		sprs.ldbar	= mfspr(SPRN_LDBAR);
+		if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
+			sprs.ldbar	= mfspr(SPRN_LDBAR);
 
 		sprs_saved = true;
 
@@ -762,7 +763,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	mtspr(SPRN_PTCR,	sprs.ptcr);
 	mtspr(SPRN_RPR,		sprs.rpr);
 	mtspr(SPRN_TSCR,	sprs.tscr);
-	mtspr(SPRN_LDBAR,	sprs.ldbar);
+	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
+		mtspr(SPRN_LDBAR,	sprs.ldbar);
 
 	if (pls >= pnv_first_tb_loss_level) {
 		/* TB loss */
diff --git a/arch/powerpc/platforms/powernv/subcore-asm.S b/arch/powerpc/platforms/powernv/subcore-asm.S
index 39bb24aa8f34..e4383fa5e150 100644
--- a/arch/powerpc/platforms/powernv/subcore-asm.S
+++ b/arch/powerpc/platforms/powernv/subcore-asm.S
@@ -44,7 +44,9 @@ _GLOBAL(split_core_secondary_loop)
 
 real_mode:
 	/* Grab values from unsplit SPRs */
+BEGIN_FW_FTR_SECTION
 	mfspr	r6,  SPRN_LDBAR
+END_FW_FTR_SECTION_IFCLR(FW_FEATURE_ULTRAVISOR)
 	mfspr	r7,  SPRN_PMMAR
 	mfspr	r8,  SPRN_PMCR
 	mfspr	r9,  SPRN_RPR
@@ -77,7 +79,9 @@ real_mode:
 	mtspr	SPRN_HDEC, r4
 
 	/* Restore SPR values now we are split */
+BEGIN_FW_FTR_SECTION
 	mtspr	SPRN_LDBAR, r6
+END_FW_FTR_SECTION_IFCLR(FW_FEATURE_ULTRAVISOR)
 	mtspr	SPRN_PMMAR, r7
 	mtspr	SPRN_PMCR, r8
 	mtspr	SPRN_RPR, r9
-- 
2.20.1

