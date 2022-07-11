Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D456D390
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh90G3Cjyz3dsT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:50:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XfH67vs8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XfH67vs8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh8yz0sjdz3f57
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:49:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26B1geHO022889;
	Mon, 11 Jul 2022 03:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ZkNOnMn4hlJh6K+4qH+CMjoPqwKH/+V8mEP37ESohnk=;
 b=XfH67vs8TBlH6dAiHYDWNCkcBTYPJRVl/mPl/L9LO+frqenPngnTi6dR4/73YfIYE20m
 qFGu+IxqhjHArIyppuLbyHculnZ+VTba35XSG2gPIQ7itMD6eonluAeF2ScQBoX8Lyvb
 qxZKGb8Gx21p87vZDf8b6wG0PNVwVfhyldrI3u+Q6Gs9LQzCRakohaxWgljqkiSZmrY6
 mEW/lKxYtOUJbQNSpppxh98DQBBRn4Pe1D6PTxFqCAY/Ihnp3M1y++iejWkpJR+rs9g7
 pcBXosgzDxjvaZD4dc/6qOf4YtxhKPbuQ134qaChDaCRMb7vyA6V590fRAkBRcN/E3Pr Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h7ygdjsjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 03:49:43 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26B3eiZf018487;
	Mon, 11 Jul 2022 03:49:42 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h7ygdjsja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 03:49:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26B3K8nq000970;
	Mon, 11 Jul 2022 03:49:40 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3h71a8t36m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 03:49:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26B3mArG22544842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jul 2022 03:48:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA6044C044;
	Mon, 11 Jul 2022 03:49:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C47C64C040;
	Mon, 11 Jul 2022 03:49:33 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.105.173])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 11 Jul 2022 03:49:33 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Subject: [PATCH 1/2] powerpc/kvm: Move pmu code in kvm folder to separate file for power9 and later platforms
Date: Mon, 11 Jul 2022 09:19:26 +0530
Message-Id: <20220711034927.213192-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w_LZ8D90JsH94-rLravatuUgUgtqL7WH
X-Proofpoint-ORIG-GUID: t14DDxAavBddbTbWzMmBYfN2uPb9IfeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-10_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110013
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

File book3s_hv_p9_entry.c in powerpc/kvm folder consists of functions
like freeze_pmu, switch_pmu_to_guest and switch_pmu_to_host which are
specific to Performance Monitoring Unit(PMU) for power9 and later
platforms.

For better maintenance, moving pmu related code from
book3s_hv_p9_entry.c to a new file called book3s_hv_p9_perf.c,
without any logic change.
Also make corresponding changes in the Makefile to include
book3s_hv_p9_perf.c during compilation.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/kvm/Makefile             |   1 +
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 221 -------------------------
 arch/powerpc/kvm/book3s_hv_p9_perf.c  | 225 ++++++++++++++++++++++++++
 3 files changed, 226 insertions(+), 221 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_hv_p9_perf.c

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 0cd23ce07d68..5319d889b184 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -86,6 +86,7 @@ kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
 	book3s_hv_rm_mmu.o \
 	book3s_hv_ras.o \
 	book3s_hv_builtin.o \
+	book3s_hv_p9_perf.o \
 	$(kvm-book3s_64-builtin-tm-objs-y) \
 	$(kvm-book3s_64-builtin-xics-objs-y)
 endif
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 112a09b33328..34d81898bf47 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -3,231 +3,10 @@
 #include <linux/kvm_host.h>
 #include <asm/asm-prototypes.h>
 #include <asm/dbell.h>
-#include <asm/kvm_ppc.h>
-#include <asm/pmc.h>
 #include <asm/ppc-opcode.h>
 
 #include "book3s_hv.h"
 
-static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
-{
-	if (!(mmcr0 & MMCR0_FC))
-		goto do_freeze;
-	if (mmcra & MMCRA_SAMPLE_ENABLE)
-		goto do_freeze;
-	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-		if (!(mmcr0 & MMCR0_PMCCEXT))
-			goto do_freeze;
-		if (!(mmcra & MMCRA_BHRB_DISABLE))
-			goto do_freeze;
-	}
-	return;
-
-do_freeze:
-	mmcr0 = MMCR0_FC;
-	mmcra = 0;
-	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-		mmcr0 |= MMCR0_PMCCEXT;
-		mmcra = MMCRA_BHRB_DISABLE;
-	}
-
-	mtspr(SPRN_MMCR0, mmcr0);
-	mtspr(SPRN_MMCRA, mmcra);
-	isync();
-}
-
-void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
-			 struct p9_host_os_sprs *host_os_sprs)
-{
-	struct lppaca *lp;
-	int load_pmu = 1;
-
-	lp = vcpu->arch.vpa.pinned_addr;
-	if (lp)
-		load_pmu = lp->pmcregs_in_use;
-
-	/* Save host */
-	if (ppc_get_pmu_inuse()) {
-		/*
-		 * It might be better to put PMU handling (at least for the
-		 * host) in the perf subsystem because it knows more about what
-		 * is being used.
-		 */
-
-		/* POWER9, POWER10 do not implement HPMC or SPMC */
-
-		host_os_sprs->mmcr0 = mfspr(SPRN_MMCR0);
-		host_os_sprs->mmcra = mfspr(SPRN_MMCRA);
-
-		freeze_pmu(host_os_sprs->mmcr0, host_os_sprs->mmcra);
-
-		host_os_sprs->pmc1 = mfspr(SPRN_PMC1);
-		host_os_sprs->pmc2 = mfspr(SPRN_PMC2);
-		host_os_sprs->pmc3 = mfspr(SPRN_PMC3);
-		host_os_sprs->pmc4 = mfspr(SPRN_PMC4);
-		host_os_sprs->pmc5 = mfspr(SPRN_PMC5);
-		host_os_sprs->pmc6 = mfspr(SPRN_PMC6);
-		host_os_sprs->mmcr1 = mfspr(SPRN_MMCR1);
-		host_os_sprs->mmcr2 = mfspr(SPRN_MMCR2);
-		host_os_sprs->sdar = mfspr(SPRN_SDAR);
-		host_os_sprs->siar = mfspr(SPRN_SIAR);
-		host_os_sprs->sier1 = mfspr(SPRN_SIER);
-
-		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-			host_os_sprs->mmcr3 = mfspr(SPRN_MMCR3);
-			host_os_sprs->sier2 = mfspr(SPRN_SIER2);
-			host_os_sprs->sier3 = mfspr(SPRN_SIER3);
-		}
-	}
-
-#ifdef CONFIG_PPC_PSERIES
-	/* After saving PMU, before loading guest PMU, flip pmcregs_in_use */
-	if (kvmhv_on_pseries()) {
-		barrier();
-		get_lppaca()->pmcregs_in_use = load_pmu;
-		barrier();
-	}
-#endif
-
-	/*
-	 * Load guest. If the VPA said the PMCs are not in use but the guest
-	 * tried to access them anyway, HFSCR[PM] will be set by the HFAC
-	 * fault so we can make forward progress.
-	 */
-	if (load_pmu || (vcpu->arch.hfscr & HFSCR_PM)) {
-		mtspr(SPRN_PMC1, vcpu->arch.pmc[0]);
-		mtspr(SPRN_PMC2, vcpu->arch.pmc[1]);
-		mtspr(SPRN_PMC3, vcpu->arch.pmc[2]);
-		mtspr(SPRN_PMC4, vcpu->arch.pmc[3]);
-		mtspr(SPRN_PMC5, vcpu->arch.pmc[4]);
-		mtspr(SPRN_PMC6, vcpu->arch.pmc[5]);
-		mtspr(SPRN_MMCR1, vcpu->arch.mmcr[1]);
-		mtspr(SPRN_MMCR2, vcpu->arch.mmcr[2]);
-		mtspr(SPRN_SDAR, vcpu->arch.sdar);
-		mtspr(SPRN_SIAR, vcpu->arch.siar);
-		mtspr(SPRN_SIER, vcpu->arch.sier[0]);
-
-		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-			mtspr(SPRN_MMCR3, vcpu->arch.mmcr[3]);
-			mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
-			mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
-		}
-
-		/* Set MMCRA then MMCR0 last */
-		mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
-		mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
-		/* No isync necessary because we're starting counters */
-
-		if (!vcpu->arch.nested &&
-				(vcpu->arch.hfscr_permitted & HFSCR_PM))
-			vcpu->arch.hfscr |= HFSCR_PM;
-	}
-}
-EXPORT_SYMBOL_GPL(switch_pmu_to_guest);
-
-void switch_pmu_to_host(struct kvm_vcpu *vcpu,
-			struct p9_host_os_sprs *host_os_sprs)
-{
-	struct lppaca *lp;
-	int save_pmu = 1;
-
-	lp = vcpu->arch.vpa.pinned_addr;
-	if (lp)
-		save_pmu = lp->pmcregs_in_use;
-	if (IS_ENABLED(CONFIG_KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND)) {
-		/*
-		 * Save pmu if this guest is capable of running nested guests.
-		 * This is option is for old L1s that do not set their
-		 * lppaca->pmcregs_in_use properly when entering their L2.
-		 */
-		save_pmu |= nesting_enabled(vcpu->kvm);
-	}
-
-	if (save_pmu) {
-		vcpu->arch.mmcr[0] = mfspr(SPRN_MMCR0);
-		vcpu->arch.mmcra = mfspr(SPRN_MMCRA);
-
-		freeze_pmu(vcpu->arch.mmcr[0], vcpu->arch.mmcra);
-
-		vcpu->arch.pmc[0] = mfspr(SPRN_PMC1);
-		vcpu->arch.pmc[1] = mfspr(SPRN_PMC2);
-		vcpu->arch.pmc[2] = mfspr(SPRN_PMC3);
-		vcpu->arch.pmc[3] = mfspr(SPRN_PMC4);
-		vcpu->arch.pmc[4] = mfspr(SPRN_PMC5);
-		vcpu->arch.pmc[5] = mfspr(SPRN_PMC6);
-		vcpu->arch.mmcr[1] = mfspr(SPRN_MMCR1);
-		vcpu->arch.mmcr[2] = mfspr(SPRN_MMCR2);
-		vcpu->arch.sdar = mfspr(SPRN_SDAR);
-		vcpu->arch.siar = mfspr(SPRN_SIAR);
-		vcpu->arch.sier[0] = mfspr(SPRN_SIER);
-
-		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-			vcpu->arch.mmcr[3] = mfspr(SPRN_MMCR3);
-			vcpu->arch.sier[1] = mfspr(SPRN_SIER2);
-			vcpu->arch.sier[2] = mfspr(SPRN_SIER3);
-		}
-
-	} else if (vcpu->arch.hfscr & HFSCR_PM) {
-		/*
-		 * The guest accessed PMC SPRs without specifying they should
-		 * be preserved, or it cleared pmcregs_in_use after the last
-		 * access. Just ensure they are frozen.
-		 */
-		freeze_pmu(mfspr(SPRN_MMCR0), mfspr(SPRN_MMCRA));
-
-		/*
-		 * Demand-fault PMU register access in the guest.
-		 *
-		 * This is used to grab the guest's VPA pmcregs_in_use value
-		 * and reflect it into the host's VPA in the case of a nested
-		 * hypervisor.
-		 *
-		 * It also avoids having to zero-out SPRs after each guest
-		 * exit to avoid side-channels when.
-		 *
-		 * This is cleared here when we exit the guest, so later HFSCR
-		 * interrupt handling can add it back to run the guest with
-		 * PM enabled next time.
-		 */
-		if (!vcpu->arch.nested)
-			vcpu->arch.hfscr &= ~HFSCR_PM;
-	} /* otherwise the PMU should still be frozen */
-
-#ifdef CONFIG_PPC_PSERIES
-	if (kvmhv_on_pseries()) {
-		barrier();
-		get_lppaca()->pmcregs_in_use = ppc_get_pmu_inuse();
-		barrier();
-	}
-#endif
-
-	if (ppc_get_pmu_inuse()) {
-		mtspr(SPRN_PMC1, host_os_sprs->pmc1);
-		mtspr(SPRN_PMC2, host_os_sprs->pmc2);
-		mtspr(SPRN_PMC3, host_os_sprs->pmc3);
-		mtspr(SPRN_PMC4, host_os_sprs->pmc4);
-		mtspr(SPRN_PMC5, host_os_sprs->pmc5);
-		mtspr(SPRN_PMC6, host_os_sprs->pmc6);
-		mtspr(SPRN_MMCR1, host_os_sprs->mmcr1);
-		mtspr(SPRN_MMCR2, host_os_sprs->mmcr2);
-		mtspr(SPRN_SDAR, host_os_sprs->sdar);
-		mtspr(SPRN_SIAR, host_os_sprs->siar);
-		mtspr(SPRN_SIER, host_os_sprs->sier1);
-
-		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-			mtspr(SPRN_MMCR3, host_os_sprs->mmcr3);
-			mtspr(SPRN_SIER2, host_os_sprs->sier2);
-			mtspr(SPRN_SIER3, host_os_sprs->sier3);
-		}
-
-		/* Set MMCRA then MMCR0 last */
-		mtspr(SPRN_MMCRA, host_os_sprs->mmcra);
-		mtspr(SPRN_MMCR0, host_os_sprs->mmcr0);
-		isync();
-	}
-}
-EXPORT_SYMBOL_GPL(switch_pmu_to_host);
-
 static void load_spr_state(struct kvm_vcpu *vcpu,
 				struct p9_host_os_sprs *host_os_sprs)
 {
diff --git a/arch/powerpc/kvm/book3s_hv_p9_perf.c b/arch/powerpc/kvm/book3s_hv_p9_perf.c
new file mode 100644
index 000000000000..da3135cab9ea
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv_p9_perf.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/kvm_ppc.h>
+#include <asm/pmc.h>
+
+#include "book3s_hv.h"
+
+static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
+{
+	if (!(mmcr0 & MMCR0_FC))
+		goto do_freeze;
+	if (mmcra & MMCRA_SAMPLE_ENABLE)
+		goto do_freeze;
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		if (!(mmcr0 & MMCR0_PMCCEXT))
+			goto do_freeze;
+		if (!(mmcra & MMCRA_BHRB_DISABLE))
+			goto do_freeze;
+	}
+	return;
+
+do_freeze:
+	mmcr0 = MMCR0_FC;
+	mmcra = 0;
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		mmcr0 |= MMCR0_PMCCEXT;
+		mmcra = MMCRA_BHRB_DISABLE;
+	}
+
+	mtspr(SPRN_MMCR0, mmcr0);
+	mtspr(SPRN_MMCRA, mmcra);
+	isync();
+}
+
+void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
+			 struct p9_host_os_sprs *host_os_sprs)
+{
+	struct lppaca *lp;
+	int load_pmu = 1;
+
+	lp = vcpu->arch.vpa.pinned_addr;
+	if (lp)
+		load_pmu = lp->pmcregs_in_use;
+
+	/* Save host */
+	if (ppc_get_pmu_inuse()) {
+		/*
+		 * It might be better to put PMU handling (at least for the
+		 * host) in the perf subsystem because it knows more about what
+		 * is being used.
+		 */
+
+		/* POWER9, POWER10 do not implement HPMC or SPMC */
+
+		host_os_sprs->mmcr0 = mfspr(SPRN_MMCR0);
+		host_os_sprs->mmcra = mfspr(SPRN_MMCRA);
+
+		freeze_pmu(host_os_sprs->mmcr0, host_os_sprs->mmcra);
+
+		host_os_sprs->pmc1 = mfspr(SPRN_PMC1);
+		host_os_sprs->pmc2 = mfspr(SPRN_PMC2);
+		host_os_sprs->pmc3 = mfspr(SPRN_PMC3);
+		host_os_sprs->pmc4 = mfspr(SPRN_PMC4);
+		host_os_sprs->pmc5 = mfspr(SPRN_PMC5);
+		host_os_sprs->pmc6 = mfspr(SPRN_PMC6);
+		host_os_sprs->mmcr1 = mfspr(SPRN_MMCR1);
+		host_os_sprs->mmcr2 = mfspr(SPRN_MMCR2);
+		host_os_sprs->sdar = mfspr(SPRN_SDAR);
+		host_os_sprs->siar = mfspr(SPRN_SIAR);
+		host_os_sprs->sier1 = mfspr(SPRN_SIER);
+
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			host_os_sprs->mmcr3 = mfspr(SPRN_MMCR3);
+			host_os_sprs->sier2 = mfspr(SPRN_SIER2);
+			host_os_sprs->sier3 = mfspr(SPRN_SIER3);
+		}
+	}
+
+#ifdef CONFIG_PPC_PSERIES
+	/* After saving PMU, before loading guest PMU, flip pmcregs_in_use */
+	if (kvmhv_on_pseries()) {
+		barrier();
+		get_lppaca()->pmcregs_in_use = load_pmu;
+		barrier();
+	}
+#endif
+
+	/*
+	 * Load guest. If the VPA said the PMCs are not in use but the guest
+	 * tried to access them anyway, HFSCR[PM] will be set by the HFAC
+	 * fault so we can make forward progress.
+	 */
+	if (load_pmu || (vcpu->arch.hfscr & HFSCR_PM)) {
+		mtspr(SPRN_PMC1, vcpu->arch.pmc[0]);
+		mtspr(SPRN_PMC2, vcpu->arch.pmc[1]);
+		mtspr(SPRN_PMC3, vcpu->arch.pmc[2]);
+		mtspr(SPRN_PMC4, vcpu->arch.pmc[3]);
+		mtspr(SPRN_PMC5, vcpu->arch.pmc[4]);
+		mtspr(SPRN_PMC6, vcpu->arch.pmc[5]);
+		mtspr(SPRN_MMCR1, vcpu->arch.mmcr[1]);
+		mtspr(SPRN_MMCR2, vcpu->arch.mmcr[2]);
+		mtspr(SPRN_SDAR, vcpu->arch.sdar);
+		mtspr(SPRN_SIAR, vcpu->arch.siar);
+		mtspr(SPRN_SIER, vcpu->arch.sier[0]);
+
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			mtspr(SPRN_MMCR3, vcpu->arch.mmcr[3]);
+			mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
+			mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
+		}
+
+		/* Set MMCRA then MMCR0 last */
+		mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
+		mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
+		/* No isync necessary because we're starting counters */
+
+		if (!vcpu->arch.nested &&
+		    (vcpu->arch.hfscr_permitted & HFSCR_PM))
+			vcpu->arch.hfscr |= HFSCR_PM;
+	}
+}
+EXPORT_SYMBOL_GPL(switch_pmu_to_guest);
+
+void switch_pmu_to_host(struct kvm_vcpu *vcpu,
+			struct p9_host_os_sprs *host_os_sprs)
+{
+	struct lppaca *lp;
+	int save_pmu = 1;
+
+	lp = vcpu->arch.vpa.pinned_addr;
+	if (lp)
+		save_pmu = lp->pmcregs_in_use;
+	if (IS_ENABLED(CONFIG_KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND)) {
+		/*
+		 * Save pmu if this guest is capable of running nested guests.
+		 * This is option is for old L1s that do not set their
+		 * lppaca->pmcregs_in_use properly when entering their L2.
+		 */
+		save_pmu |= nesting_enabled(vcpu->kvm);
+	}
+
+	if (save_pmu) {
+		vcpu->arch.mmcr[0] = mfspr(SPRN_MMCR0);
+		vcpu->arch.mmcra = mfspr(SPRN_MMCRA);
+
+		freeze_pmu(vcpu->arch.mmcr[0], vcpu->arch.mmcra);
+
+		vcpu->arch.pmc[0] = mfspr(SPRN_PMC1);
+		vcpu->arch.pmc[1] = mfspr(SPRN_PMC2);
+		vcpu->arch.pmc[2] = mfspr(SPRN_PMC3);
+		vcpu->arch.pmc[3] = mfspr(SPRN_PMC4);
+		vcpu->arch.pmc[4] = mfspr(SPRN_PMC5);
+		vcpu->arch.pmc[5] = mfspr(SPRN_PMC6);
+		vcpu->arch.mmcr[1] = mfspr(SPRN_MMCR1);
+		vcpu->arch.mmcr[2] = mfspr(SPRN_MMCR2);
+		vcpu->arch.sdar = mfspr(SPRN_SDAR);
+		vcpu->arch.siar = mfspr(SPRN_SIAR);
+		vcpu->arch.sier[0] = mfspr(SPRN_SIER);
+
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			vcpu->arch.mmcr[3] = mfspr(SPRN_MMCR3);
+			vcpu->arch.sier[1] = mfspr(SPRN_SIER2);
+			vcpu->arch.sier[2] = mfspr(SPRN_SIER3);
+		}
+
+	} else if (vcpu->arch.hfscr & HFSCR_PM) {
+		/*
+		 * The guest accessed PMC SPRs without specifying they should
+		 * be preserved, or it cleared pmcregs_in_use after the last
+		 * access. Just ensure they are frozen.
+		 */
+		freeze_pmu(mfspr(SPRN_MMCR0), mfspr(SPRN_MMCRA));
+
+		/*
+		 * Demand-fault PMU register access in the guest.
+		 *
+		 * This is used to grab the guest's VPA pmcregs_in_use value
+		 * and reflect it into the host's VPA in the case of a nested
+		 * hypervisor.
+		 *
+		 * It also avoids having to zero-out SPRs after each guest
+		 * exit to avoid side-channels when.
+		 *
+		 * This is cleared here when we exit the guest, so later HFSCR
+		 * interrupt handling can add it back to run the guest with
+		 * PM enabled next time.
+		 */
+		if (!vcpu->arch.nested)
+			vcpu->arch.hfscr &= ~HFSCR_PM;
+	} /* otherwise the PMU should still be frozen */
+
+#ifdef CONFIG_PPC_PSERIES
+	if (kvmhv_on_pseries()) {
+		barrier();
+		get_lppaca()->pmcregs_in_use = ppc_get_pmu_inuse();
+		barrier();
+	}
+#endif
+
+	if (ppc_get_pmu_inuse()) {
+		mtspr(SPRN_PMC1, host_os_sprs->pmc1);
+		mtspr(SPRN_PMC2, host_os_sprs->pmc2);
+		mtspr(SPRN_PMC3, host_os_sprs->pmc3);
+		mtspr(SPRN_PMC4, host_os_sprs->pmc4);
+		mtspr(SPRN_PMC5, host_os_sprs->pmc5);
+		mtspr(SPRN_PMC6, host_os_sprs->pmc6);
+		mtspr(SPRN_MMCR1, host_os_sprs->mmcr1);
+		mtspr(SPRN_MMCR2, host_os_sprs->mmcr2);
+		mtspr(SPRN_SDAR, host_os_sprs->sdar);
+		mtspr(SPRN_SIAR, host_os_sprs->siar);
+		mtspr(SPRN_SIER, host_os_sprs->sier1);
+
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			mtspr(SPRN_MMCR3, host_os_sprs->mmcr3);
+			mtspr(SPRN_SIER2, host_os_sprs->sier2);
+			mtspr(SPRN_SIER3, host_os_sprs->sier3);
+		}
+
+		/* Set MMCRA then MMCR0 last */
+		mtspr(SPRN_MMCRA, host_os_sprs->mmcra);
+		mtspr(SPRN_MMCR0, host_os_sprs->mmcr0);
+		isync();
+	}
+}
+EXPORT_SYMBOL_GPL(switch_pmu_to_host);
-- 
2.27.0

