Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B31F5280
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 12:39:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hk4V2DTHzDqG1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 20:39:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hj3n11rlzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 19:53:24 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05A9aAOq059388; Wed, 10 Jun 2020 05:53:19 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31jujwu00t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 05:53:19 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05A9iu7T017007;
 Wed, 10 Jun 2020 09:53:19 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 31g2s8x1a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 09:53:19 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05A9rIoJ55509302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 09:53:18 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5A3A112062;
 Wed, 10 Jun 2020 09:53:18 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B340A112061;
 Wed, 10 Jun 2020 09:53:16 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.180.2])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 09:53:16 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 24/41] powerpc/book3s64/pkeys: Store/restore userspace AMR
 correctly on entry and exit from kernel
Date: Wed, 10 Jun 2020 15:21:47 +0530
Message-Id: <20200610095204.608183-25-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
References: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_04:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 cotscore=-2147483648
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100070
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This prepare kernel to operate with a different value than userspace AMR.
For this, AMR needs to be saved and restored on entry and return from the
kernel.

With KUAP we modify kernel AMR when accessing user address from the kernel
via copy_to/from_user interfaces.

If MMU_FTR_KEY is enabled we always use the key mechanism to implement KUAP
feature. If MMU_FTR_KEY is not supported and if we support MMU_FTR_KUAP
(radix translation on POWER9), we can skip restoring AMR on return
to userspace. Userspace won't be using AMR in that specific config.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 145 ++++++++++++++++++-----
 arch/powerpc/kernel/entry_64.S           |   6 +-
 arch/powerpc/kernel/exceptions-64s.S     |   4 +-
 arch/powerpc/kernel/syscall_64.c         |  26 +++-
 4 files changed, 146 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 84a7f209ccfd..82bef3901672 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -13,18 +13,47 @@
 
 #ifdef __ASSEMBLY__
 
-.macro kuap_restore_amr	gpr1, gpr2
-#ifdef CONFIG_PPC_KUAP
+.macro kuap_restore_user_amr gpr1
+#if defined(CONFIG_PPC_MEM_KEYS)
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
-	mfspr	\gpr1, SPRN_AMR
+	/*
+	 * AMR is going to be different when
+	 * returning to userspace.
+	 */
+	ld	\gpr1, STACK_REGS_KUAP(r1)
+	isync
+	mtspr	SPRN_AMR, \gpr1
+
+	/* No isync required, see kuap_restore_user_amr() */
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY , 67)
+#endif
+.endm
+
+.macro kuap_restore_kernel_amr	gpr1, gpr2
+#if defined(CONFIG_PPC_MEM_KEYS)
+	BEGIN_MMU_FTR_SECTION_NESTED(67)
+	b	99f  // handle_pkey_restore_amr
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY , 67)
+
+	BEGIN_MMU_FTR_SECTION_NESTED(68)
+	b	99f  // handle_kuap_restore_amr
+	MMU_FTR_SECTION_ELSE_NESTED(68)
+	b	100f  // skip_restore_amr
+	ALT_MMU_FTR_SECTION_END_NESTED_IFSET(MMU_FTR_KUAP, 68)
+
+99:
+	/*
+	 * AMR is going to be mostly the same since we are
+	 * returning to the kernel. Compare and do a mtspr.
+	 */
 	ld	\gpr2, STACK_REGS_KUAP(r1)
+	mfspr	\gpr1, SPRN_AMR
 	cmpd	\gpr1, \gpr2
-	beq	998f
+	beq	100f
 	isync
 	mtspr	SPRN_AMR, \gpr2
 	/* No isync required, see kuap_restore_amr() */
-998:
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
+100:  // skip_restore_amr
 #endif
 .endm
 
@@ -40,51 +69,104 @@
 #endif
 .endm
 
+/*
+ * MMU_FTR_PKEY and MMU_FTR_KUAP can both be enabled on a platform. We prefer
+ * PKEY over KUAP if both can be enabled on the platform.
+ *
+ * With KUAP only enabled on exception if we are coming from userspace we don't
+ * save the AMR at all, because the expectation is that userspace can't change
+ * the AMR if KUAP feature is enabled.
+ */
 .macro kuap_save_amr_and_lock gpr1, gpr2, use_cr, msr_pr_cr
-#ifdef CONFIG_PPC_KUAP
+#if defined(CONFIG_PPC_MEM_KEYS)
+
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
+	b	101f   // handle_pkey_save_amr
+        END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY , 67)
+
+	BEGIN_MMU_FTR_SECTION_NESTED(68)
+	b	99f  // handle_kuap_save_amr
+	MMU_FTR_SECTION_ELSE_NESTED(68)
+	b	100f  // skip_save_amr
+	ALT_MMU_FTR_SECTION_END_NESTED_IFSET(MMU_FTR_KUAP, 68)
+
+
+99: // handle_kuap_save_amr
 	.ifnb \msr_pr_cr
-	bne	\msr_pr_cr, 99f
+	/*
+	 * We avoid changing AMR outside the kernel
+	 * hence skip this completely.
+	 */
+	bne	\msr_pr_cr, 100f  // from userspace
 	.endif
+
+101:   // handle_pkey_save_amr
 	mfspr	\gpr1, SPRN_AMR
 	std	\gpr1, STACK_REGS_KUAP(r1)
-	li	\gpr2, (AMR_KUAP_BLOCKED >> AMR_KUAP_SHIFT)
-	sldi	\gpr2, \gpr2, AMR_KUAP_SHIFT
+
+	/*
+	 * update kernel AMR with AMR_KUAP_BLOCKED only
+	 * if KUAP feature is enabled
+	 */
+	BEGIN_MMU_FTR_SECTION_NESTED(69)
+	LOAD_REG_IMMEDIATE(\gpr2, AMR_KUAP_BLOCKED)
 	cmpd	\use_cr, \gpr1, \gpr2
-	beq	\use_cr, 99f
-	// We don't isync here because we very recently entered via rfid
+	beq	\use_cr, 102f
+	/*
+	 * We don't isync here because we very recently entered via an interrupt
+	 */
 	mtspr	SPRN_AMR, \gpr2
 	isync
-99:
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
+102:
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 69)
+
+100: // skip_save_amr
 #endif
 .endm
 
 #else /* !__ASSEMBLY__ */
 
-#ifdef CONFIG_PPC_KUAP
+#ifdef CONFIG_PPC_MEM_KEYS
 
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
 extern u64 default_uamor;
 
-static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
+static inline void kuap_restore_user_amr(struct pt_regs *regs)
 {
-	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap != amr)) {
-		isync();
-		mtspr(SPRN_AMR, regs->kuap);
-		/*
-		 * No isync required here because we are about to RFI back to
-		 * previous context before any user accesses would be made,
-		 * which is a CSI.
-		 */
+	if (!mmu_has_feature(MMU_FTR_PKEY))
+		return;
+
+	isync();
+	mtspr(SPRN_AMR, regs->kuap);
+	/*
+	 * No isync required here because we are about to rfi
+	 * back to previous context before any user accesses
+	 * would be made, which is a CSI.
+	 */
+}
+
+static inline void kuap_restore_kernel_amr(struct pt_regs *regs,
+					   unsigned long amr)
+{
+	if (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)) {
+
+		if (unlikely(regs->kuap != amr)) {
+			isync();
+			mtspr(SPRN_AMR, regs->kuap);
+			/*
+			 * No isync required here because we are about to rfi
+			 * back to previous context before any user accesses
+			 * would be made, which is a CSI.
+			 */
+		}
 	}
 }
 
 static inline unsigned long kuap_get_and_check_amr(void)
 {
-	if (mmu_has_feature(MMU_FTR_KUAP)) {
+	if (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)) {
 		unsigned long amr = mfspr(SPRN_AMR);
 		if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
 			WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
@@ -95,7 +177,8 @@ static inline unsigned long kuap_get_and_check_amr(void)
 
 static inline void kuap_check_amr(void)
 {
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_KUAP))
+	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) &&
+	    (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)))
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
 }
 
@@ -168,8 +251,12 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
 		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
 }
-#else /* CONFIG_PPC_KUAP */
-static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
+#else /* CONFIG_PPC_MEM_KEYS */
+static inline void kuap_restore_user_amr(struct pt_regs *regs)
+{
+}
+
+static inline void kuap_restore_kernel_amr(struct pt_regs *regs, unsigned long amr)
 {
 }
 
@@ -181,7 +268,7 @@ static inline unsigned long kuap_get_and_check_amr(void)
 {
 	return 0;
 }
-#endif /* CONFIG_PPC_KUAP */
+#endif /* CONFIG_PPC_MEM_KEYS */
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 9d49338e0c85..a087cbe0b17d 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -481,8 +481,8 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
 	kuap_check_amr r3, r4
 	ld	r5,_MSR(r1)
 	andi.	r0,r5,MSR_PR
-	bne	.Lfast_user_interrupt_return
-	kuap_restore_amr r3, r4
+	bne	.Lfast_user_interrupt_return_amr
+	kuap_restore_kernel_amr r3, r4
 	andi.	r0,r5,MSR_RI
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
 	bne+	.Lfast_kernel_interrupt_return
@@ -502,6 +502,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs
 
+.Lfast_user_interrupt_return_amr:
+	kuap_restore_user_amr r3
 .Lfast_user_interrupt_return:
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e70ebb5c318c..8226af444d77 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -971,7 +971,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	kuap_restore_amr r9, r10
+	kuap_restore_kernel_amr r9, r10
 	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
 
@@ -2784,7 +2784,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	kuap_restore_amr r9, r10
+	kuap_restore_kernel_amr r9, r10
 	EXCEPTION_RESTORE_REGS hsrr=0
 	RFI_TO_KERNEL
 
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 7e560a01afa4..fded67982fbe 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -35,7 +35,21 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
 
-	kuap_check_amr();
+#ifdef CONFIG_PPC_MEM_KEYS
+	if (mmu_has_feature(MMU_FTR_PKEY)) {
+		unsigned long amr;
+		/*
+		 * When entering from userspace we mostly have the AMR
+		 * different from kernel default values. Hence don't compare.
+		 */
+		amr = mfspr(SPRN_AMR);
+		regs->kuap = amr;
+		if (mmu_has_feature(MMU_FTR_KUAP))
+			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+		isync();
+	} else
+#endif
+		kuap_check_amr();
 
 	account_cpu_user_entry();
 
@@ -222,6 +236,10 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	account_cpu_user_exit();
 
+	/*
+	 * We do this at the end so that we do context switch with KERNEL AMR
+	 */
+	kuap_restore_user_amr(regs);
 	return ret;
 }
 
@@ -306,6 +324,10 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 
 	account_cpu_user_exit();
 
+	/*
+	 * We do this at the end so that we do context switch with KERNEL AMR
+	 */
+	kuap_restore_user_amr(regs);
 	return ret;
 }
 
@@ -376,7 +398,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * which would cause Read-After-Write stalls. Hence, we take the AMR
 	 * value from the check above.
 	 */
-	kuap_restore_amr(regs, amr);
+	kuap_restore_kernel_amr(regs, amr);
 
 	return ret;
 }
-- 
2.26.2

