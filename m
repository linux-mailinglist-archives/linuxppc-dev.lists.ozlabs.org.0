Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE471B9A69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 10:39:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499dVP0WQgzDqJh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 18:39:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 499cmD5f3TzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 18:06:04 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R82CJr076699; Mon, 27 Apr 2020 04:05:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30me4v714s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 04:05:59 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03R82fDQ078903;
 Mon, 27 Apr 2020 04:05:58 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30me4v714d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 04:05:58 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03R85NKk005486;
 Mon, 27 Apr 2020 08:05:58 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 30mcu65m7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 08:05:58 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03R85u0G52887936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 08:05:57 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD27FC6061;
 Mon, 27 Apr 2020 08:05:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6FD1C6059;
 Mon, 27 Apr 2020 08:05:54 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.72.10])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 08:05:54 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH 13/25] powerpc/book3s64/pkeys: Store/restore userspace AMR
 correctly on entry and exit from kernel
Date: Mon, 27 Apr 2020 13:34:54 +0530
Message-Id: <20200427080507.1626327-14-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200427080507.1626327-1-aneesh.kumar@linux.ibm.com>
References: <20200427080507.1626327-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_03:2020-04-24,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270067
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
 npiggin@gmail.com
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
 arch/powerpc/include/asm/book3s/64/kup.h | 86 ++++++++++++++++++++----
 arch/powerpc/kernel/entry_64.S           |  4 +-
 arch/powerpc/kernel/syscall_64.c         | 19 +++++-
 3 files changed, 92 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index c56894b9b3a1..85645d1b7102 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -13,13 +13,32 @@
 
 #ifdef __ASSEMBLY__
 
-.macro kuap_restore_amr	gpr
-#ifdef CONFIG_PPC_KUAP
+.macro kuap_restore_amr	gpr to_user
+#if defined(CONFIG_PPC_MEM_KEYS) || defined (CONFIG_PPC_KUAP)
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
+	b	101f  // handle_pkey_restore_amr
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY , 67)
+
+	BEGIN_MMU_FTR_SECTION_NESTED(68)
+	b	99f  // handle_kuap_restore_amr
+	MMU_FTR_SECTION_ELSE_NESTED(68)
+	b	100f  // skip_restore_amr
+	ALT_MMU_FTR_SECTION_END_NESTED_IFSET(MMU_FTR_KUAP, 68)
+
+99:  // handle_kuap_restore_amr
+	/*
+	 * No key support, don't bother to restore AMR
+	 * when returning to userspace.
+	 */
+	.ifnb \to_user
+	b	100f
+	.endif
+101:   // handle_pkey_restore_amr
 	ld	\gpr, STACK_REGS_KUAP(r1)
 	isync
 	mtspr	SPRN_AMR, \gpr
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
+	/*  No isync here because we will return to a different context  */
+100:  // skip_restore_amr
 #endif
 .endm
 
@@ -35,23 +54,58 @@
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
+#if defined(CONFIG_PPC_MEM_KEYS) || defined (CONFIG_PPC_KUAP)
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
+        END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 69)
+
+100: // skip_save_amr
 #endif
 .endm
 
@@ -62,9 +116,12 @@
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
-static inline void kuap_restore_amr(struct pt_regs *regs)
+static inline void kuap_restore_amr(struct pt_regs *regs, bool to_user)
 {
-	if (mmu_has_feature(MMU_FTR_KUAP)) {
+	if (!mmu_has_feature(MMU_FTR_PKEY) && to_user)
+		return;
+
+	if (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)) {
 		isync();
 		mtspr(SPRN_AMR, regs->kuap);
 		/*
@@ -76,7 +133,8 @@ static inline void kuap_restore_amr(struct pt_regs *regs)
 
 static inline void kuap_check_amr(void)
 {
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_KUAP))
+	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) &&
+	    (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)))
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
 }
 
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index b3c9f15089b6..c2f783dda56d 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -481,7 +481,7 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
 	kuap_check_amr r3, r4
 	ld	r4,_MSR(r1)
 	andi.	r0,r4,MSR_PR
-	bne	.Lfast_user_interrupt_return
+	bne	.Lfast_user_interrupt_return_amr
 	kuap_restore_amr r3
 	andi.	r0,r4,MSR_RI
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
@@ -502,6 +502,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs
 
+.Lfast_user_interrupt_return_amr:
+	kuap_restore_amr r3, 1
 .Lfast_user_interrupt_return:
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index c0fdb02a13d5..f69b4774f3b3 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -35,7 +35,15 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
 
-	kuap_check_amr();
+	if (mmu_has_feature(MMU_FTR_PKEY)) {
+		unsigned long amr;
+
+		amr = mfspr(SPRN_AMR);
+		regs->kuap = amr;
+		mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+		isync();
+	} else
+		kuap_check_amr();
 
 	account_cpu_user_entry();
 
@@ -208,6 +216,10 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	account_cpu_user_exit();
 
+	/*
+	 * We do this at the end so that we do context switch with KERNEL AMR
+	 */
+	kuap_restore_amr(regs, true);
 	return ret;
 }
 
@@ -293,9 +305,12 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
 #endif
-
 	account_cpu_user_exit();
 
+	/*
+	 * We do this at the end so that we do context switch with KERNEL AMR
+	 */
+	kuap_restore_amr(regs, true);
 	return ret;
 }
 
-- 
2.25.3

