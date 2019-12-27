Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96112B155
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2019 06:31:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47kb6C4Zj0zDqGG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2019 16:31:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47kb493KrMzDqBV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2019 16:29:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47kb492C6Kz8t07
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2019 16:29:45 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47kb491gqsz9sR4; Fri, 27 Dec 2019 16:29:45 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47kb4851Pwz9sPW;
 Fri, 27 Dec 2019 16:29:44 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBR5M8aq086437; Fri, 27 Dec 2019 00:29:36 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x21r82vhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Dec 2019 00:29:36 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBR5OeUW029841;
 Fri, 27 Dec 2019 05:29:35 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 2x1b17j1n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Dec 2019 05:29:35 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBR5TYoe50921778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Dec 2019 05:29:34 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA4BAB2065;
 Fri, 27 Dec 2019 05:29:34 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DCD4B205F;
 Fri, 27 Dec 2019 05:29:34 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 27 Dec 2019 05:29:34 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id E86C12E0ED6; Thu, 26 Dec 2019 21:29:32 -0800 (PST)
Date: Thu, 26 Dec 2019 21:29:32 -0800
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/pseries/svm: Disable BHRB/EBB/PMU access
Message-ID: <20191227052932.GA20946@us.ibm.com>
References: <20191225051634.3262-1-sukadev@linux.ibm.com>
 <20191225051634.3262-2-sukadev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191225051634.3262-2-sukadev@linux.ibm.com>
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-26_07:2019-12-24,2019-12-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912270042
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
Cc: linux-mm@kvack.org, linuxram@us.ibm.com, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sukadev Bhattiprolu [sukadev@linux.ibm.com] wrote:
> Ultravisor disables some CPU features like BHRB, EBB and PMU in
> secure virtual machines (SVMs). Skip accessing those registers
> in SVMs to avoid getting a Program Interrupt.

Here is an updated patch that explicitly includes <asm/svm.h> in
in some files to fix build errors reported by <lkp@intel.org>.
---

From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Date: Thu, 16 May 2019 20:57:12 -0500
Subject: [PATCH 2/2] powerpc/pseries/svm: Disable BHRB/EBB/PMU access

Ultravisor disables some CPU features like BHRB, EBB and PMU in
secure virtual machines (SVMs). Skip accessing those registers
in SVMs to avoid getting a Program Interrupt.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
---
Changelog[v2]
	- [Michael Ellerman] Optimize the code using FW_FEATURE_SVM
	- Merged EBB/BHRB and PMU patches into one and reorganized code.
	- Fix some build errors reported by <lkp@intel.org>
---
 arch/powerpc/kernel/cpu_setup_power.S   | 21 ++++++++++++++++
 arch/powerpc/kernel/process.c           | 23 ++++++++++-------
 arch/powerpc/kvm/book3s_hv.c            | 33 ++++++++++++++++---------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 32 +++++++++++++++---------
 arch/powerpc/kvm/book3s_hv_tm_builtin.c | 21 ++++++++++------
 arch/powerpc/perf/core-book3s.c         |  6 +++++
 arch/powerpc/xmon/xmon.c                | 30 +++++++++++++---------
 7 files changed, 114 insertions(+), 52 deletions(-)

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
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 709cf1fd4cf4..29a2640108d1 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -42,6 +42,7 @@
 #include <linux/module.h>
 #include <linux/compiler.h>
 #include <linux/of.h>
+#include <asm/svm.h>
 
 #include <asm/ftrace.h>
 #include <asm/reg.h>
@@ -3568,9 +3569,11 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_PSPB, vcpu->arch.pspb);
 	mtspr(SPRN_FSCR, vcpu->arch.fscr);
 	mtspr(SPRN_TAR, vcpu->arch.tar);
-	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
-	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
-	mtspr(SPRN_BESCR, vcpu->arch.bescr);
+	if (!is_secure_guest()) {
+		mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
+		mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
+		mtspr(SPRN_BESCR, vcpu->arch.bescr);
+	}
 	mtspr(SPRN_WORT, vcpu->arch.wort);
 	mtspr(SPRN_TIDR, vcpu->arch.tid);
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
@@ -3641,9 +3644,11 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu->arch.pspb = mfspr(SPRN_PSPB);
 	vcpu->arch.fscr = mfspr(SPRN_FSCR);
 	vcpu->arch.tar = mfspr(SPRN_TAR);
-	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
-	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
-	vcpu->arch.bescr = mfspr(SPRN_BESCR);
+	if (!is_secure_guest()) {
+		vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
+		vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
+		vcpu->arch.bescr = mfspr(SPRN_BESCR);
+	}
 	vcpu->arch.wort = mfspr(SPRN_WORT);
 	vcpu->arch.tid = mfspr(SPRN_TIDR);
 	vcpu->arch.amr = mfspr(SPRN_AMR);
@@ -4272,9 +4277,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_run *run, struct kvm_vcpu *vcpu)
 
 	/* Save userspace EBB and other register values */
 	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
-		ebb_regs[0] = mfspr(SPRN_EBBHR);
-		ebb_regs[1] = mfspr(SPRN_EBBRR);
-		ebb_regs[2] = mfspr(SPRN_BESCR);
+		if (!is_secure_guest()) {
+			ebb_regs[0] = mfspr(SPRN_EBBHR);
+			ebb_regs[1] = mfspr(SPRN_EBBRR);
+			ebb_regs[2] = mfspr(SPRN_BESCR);
+		}
 		user_tar = mfspr(SPRN_TAR);
 	}
 	user_vrsave = mfspr(SPRN_VRSAVE);
@@ -4320,9 +4327,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_run *run, struct kvm_vcpu *vcpu)
 
 	/* Restore userspace EBB and other register values */
 	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
-		mtspr(SPRN_EBBHR, ebb_regs[0]);
-		mtspr(SPRN_EBBRR, ebb_regs[1]);
-		mtspr(SPRN_BESCR, ebb_regs[2]);
+		if (!is_secure_guest()) {
+			mtspr(SPRN_EBBHR, ebb_regs[0]);
+			mtspr(SPRN_EBBRR, ebb_regs[1]);
+			mtspr(SPRN_BESCR, ebb_regs[2]);
+		}
 		mtspr(SPRN_TAR, user_tar);
 		mtspr(SPRN_FSCR, current->thread.fscr);
 	}
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index faebcbb8c4db..7cc73c832482 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -810,15 +810,19 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	mtspr	SPRN_CIABR, r7
 	mtspr	SPRN_TAR, r8
 	ld	r5, VCPU_IC(r4)
-	ld	r8, VCPU_EBBHR(r4)
 	mtspr	SPRN_IC, r5
-	mtspr	SPRN_EBBHR, r8
-	ld	r5, VCPU_EBBRR(r4)
-	ld	r6, VCPU_BESCR(r4)
+
+BEGIN_FTR_SECTION
+	ld	r5, VCPU_EBBHR(r4)
+	ld	r6, VCPU_EBBRR(r4)
+	ld	r7, VCPU_BESCR(r4)
+	mtspr	SPRN_EBBHR, r5
+	mtspr	SPRN_EBBRR, r6
+	mtspr	SPRN_BESCR, r7
+END_FW_FTR_SECTION_IFCLR(FW_FEATURE_SVM)
+
 	lwz	r7, VCPU_GUEST_PID(r4)
 	ld	r8, VCPU_WORT(r4)
-	mtspr	SPRN_EBBRR, r5
-	mtspr	SPRN_BESCR, r6
 	mtspr	SPRN_PID, r7
 	mtspr	SPRN_WORT, r8
 BEGIN_FTR_SECTION
@@ -1615,14 +1619,18 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	mfspr	r7, SPRN_TAR
 	std	r5, VCPU_IC(r9)
 	std	r7, VCPU_TAR(r9)
-	mfspr	r8, SPRN_EBBHR
-	std	r8, VCPU_EBBHR(r9)
-	mfspr	r5, SPRN_EBBRR
-	mfspr	r6, SPRN_BESCR
+
+BEGIN_FTR_SECTION
+	mfspr	r5, SPRN_EBBHR
+	mfspr	r6, SPRN_EBBRR
+	mfspr	r7, SPRN_BESCR
+	std	r5, VCPU_EBBHR(r9)
+	std	r6, VCPU_EBBRR(r9)
+	std	r7, VCPU_BESCR(r9)
+END_FW_FTR_SECTION_IFCLR(FW_FEATURE_SVM)
+
 	mfspr	r7, SPRN_PID
 	mfspr	r8, SPRN_WORT
-	std	r5, VCPU_EBBRR(r9)
-	std	r6, VCPU_BESCR(r9)
 	stw	r7, VCPU_GUEST_PID(r9)
 	std	r8, VCPU_WORT(r9)
 BEGIN_FTR_SECTION
diff --git a/arch/powerpc/kvm/book3s_hv_tm_builtin.c b/arch/powerpc/kvm/book3s_hv_tm_builtin.c
index 217246279dfa..46257a464f99 100644
--- a/arch/powerpc/kvm/book3s_hv_tm_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_tm_builtin.c
@@ -10,6 +10,7 @@
 #include <asm/kvm_book3s_64.h>
 #include <asm/reg.h>
 #include <asm/ppc-opcode.h>
+#include <asm/svm.h>
 
 /*
  * This handles the cases where the guest is in real suspend mode
@@ -45,14 +46,18 @@ int kvmhv_p9_tm_emulation_early(struct kvm_vcpu *vcpu)
 		if (!(vcpu->arch.hfscr & HFSCR_EBB) ||
 		    ((msr & MSR_PR) && !(mfspr(SPRN_FSCR) & FSCR_EBB)))
 			return 0;
-		bescr = mfspr(SPRN_BESCR);
-		/* expect to see a S->T transition requested */
-		if (((bescr >> 30) & 3) != 2)
-			return 0;
-		bescr &= ~BESCR_GE;
-		if (instr & (1 << 11))
-			bescr |= BESCR_GE;
-		mtspr(SPRN_BESCR, bescr);
+
+		if (!is_secure_guest()) {
+			bescr = mfspr(SPRN_BESCR);
+			/* expect to see a S->T transition requested */
+			if (((bescr >> 30) & 3) != 2)
+				return 0;
+			bescr &= ~BESCR_GE;
+			if (instr & (1 << 11))
+				bescr |= BESCR_GE;
+			mtspr(SPRN_BESCR, bescr);
+		}
+
 		msr = (msr & ~MSR_TS_MASK) | MSR_TS_T;
 		vcpu->arch.shregs.msr = msr;
 		vcpu->arch.cfar = vcpu->arch.regs.nip - 4;
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index ca92e01d0bd1..52384b4c2bd6 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -17,6 +17,7 @@
 #include <asm/firmware.h>
 #include <asm/ptrace.h>
 #include <asm/code-patching.h>
+#include <asm/svm.h>
 
 #ifdef CONFIG_PPC64
 #include "internal.h"
@@ -813,6 +814,11 @@ void perf_event_print_debug(void)
 		return;
 	}
 
+	if (is_secure_guest()) {
+		pr_info("Performance monitor access disabled in SVM.\n");
+		return;
+	}
+
 	if (!ppmu->n_counter)
 		return;
 
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index d83364ebc5c5..35fd3edb1949 100644
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

