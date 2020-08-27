Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A56C1253CBA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:31:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcVCj4xp9zDqV5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:30:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NT6KV55W; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTm504PFzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:10:28 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R42IKr093430; Thu, 27 Aug 2020 00:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m8dCsL5+5RXT70ziOz6QRuwV2oMDGSgIC2z3KUnxGAI=;
 b=NT6KV55WruVZDvzXaDhlI1l95dXH2lLI72U7JbMjth+uxKHCY+dzTpLevn3IoA1AL97O
 c4uqptSXhwRhlElnqfZranRn+g+phxMDdOAPJac0W0DSNtQrq1kid7XMR7agePVIP6HH
 Hj/g26cHWBzAjYIZTgolWHZvihc2041WaflP7EfAsdb6vLz6dDueyAsQjkU+HVgLn766
 kUw7DrfhsLQyM5z6KbQEU76UBgyOT2LZEM1t0yXuEoljC0/95oxVNj87r+Q2NhbtR8p/
 Wrsgbv4HKk8TXwTJBO20yIBfZZZBkl2DIz9vuCYf0HYNVa/mpXh/lyVVeqAZ8fiZ20CK aA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3364b1hvpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 00:10:23 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R47iJb020771;
 Thu, 27 Aug 2020 04:10:23 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 332utu0s5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:10:23 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R4AMRJ50200998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 04:10:22 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A69D28058;
 Thu, 27 Aug 2020 04:10:22 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3F4528059;
 Thu, 27 Aug 2020 04:10:20 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 04:10:20 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 11/23] powerpc/book3s64/pkeys: Store/restore userspace
 AMR/IAMR correctly on entry and exit from kernel
Date: Thu, 27 Aug 2020 09:39:19 +0530
Message-Id: <20200827040931.297759-12-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_14:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270028
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This prepare kernel to operate with a different value than userspace AMR/IAMR.
For this, AMR/IAMR need to be saved and restored on entry and return from the
kernel.

With KUAP we modify kernel AMR when accessing user address from the kernel
via copy_to/from_user interfaces. We don't need to modify IAMR value in
similar fashion.

If MMU_FTR_PKEY is enabled we need to save AMR/IAMR in pt_regs on entering
kernel from userspace. If not we can assume that AMR/IAMR is not modified
from userspace.

We need to save AMR if we have MMU_FTR_KUAP feature enabled and we are
interrupted within kernel. This is required so that if we get interrupted
within copy_to/from_user we continue with the right AMR value.

If we hae MMU_FTR_KUEP enabled we need to restore IAMR on return to userspace
beause kernel will be running with a different IAMR value.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 177 ++++++++++++++++++++---
 arch/powerpc/include/asm/ptrace.h        |   4 +-
 arch/powerpc/kernel/asm-offsets.c        |   2 +
 arch/powerpc/kernel/entry_64.S           |   6 +-
 arch/powerpc/kernel/exceptions-64s.S     |   4 +-
 arch/powerpc/kernel/syscall_64.c         |  30 +++-
 6 files changed, 192 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 5cec202dc42f..3f5b97b2a3d8 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -13,17 +13,46 @@
 
 #ifdef __ASSEMBLY__
 
-.macro kuap_restore_amr	gpr1, gpr2
-#ifdef CONFIG_PPC_KUAP
+.macro kuap_restore_user_amr gpr1
+#if defined(CONFIG_PPC_PKEY)
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
-	mfspr	\gpr1, SPRN_AMR
+	/*
+	 * AMR and IAMR are going to be different when
+	 * returning to userspace.
+	 */
+	ld	\gpr1, STACK_REGS_KUAP(r1)
+	isync
+	mtspr	SPRN_AMR, \gpr1
+	/*
+	 * Restore IAMR only when returning to userspace
+	 */
+	ld	\gpr1, STACK_REGS_KUEP(r1)
+	mtspr	SPRN_IAMR, \gpr1
+
+	/* No isync required, see kuap_restore_user_amr() */
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY, 67)
+#endif
+.endm
+
+.macro kuap_restore_kernel_amr	gpr1, gpr2
+#if defined(CONFIG_PPC_PKEY)
+
+	BEGIN_MMU_FTR_SECTION_NESTED(67)
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
-	/* No isync required, see kuap_restore_amr() */
-998:
+	/*
+	 * No isync required, see kuap_restore_amr()
+	 * No need to restore IAMR when returning to kernel space.
+	 */
+100:
 	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
 #endif
 .endm
@@ -40,23 +69,98 @@
 #endif
 .endm
 
+/*
+ *	if (pkey) {
+ *
+ *		save AMR -> stack;
+ *		if (kuap) {
+ *			if (AMR != BLOCKED)
+ *				KUAP_BLOCKED -> AMR;
+ *		}
+ *		if (from_user) {
+ *			save IAMR -> stack;
+ *			if (kuep) {
+ *				KUEP_BLOCKED ->IAMR
+ *			}
+ *		}
+ *		return;
+ *	}
+ *
+ *	if (kuap) {
+ *		if (from_kernel) {
+ *			save AMR -> stack;
+ *			if (AMR != BLOCKED)
+ *				KUAP_BLOCKED -> AMR;
+ *		}
+ *
+ *	}
+ */
 .macro kuap_save_amr_and_lock gpr1, gpr2, use_cr, msr_pr_cr
-#ifdef CONFIG_PPC_KUAP
+#if defined(CONFIG_PPC_PKEY)
+
+	/*
+	 * if both pkey and kuap is disabled, nothing to do
+	 */
+	BEGIN_MMU_FTR_SECTION_NESTED(68)
+	b	100f  // skip_save_amr
+	END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY | MMU_FTR_KUAP, 68)
+
+	/*
+	 * if pkey is disabled and we are entering from userspace
+	 * don't do anything.
+	 */
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
 	.ifnb \msr_pr_cr
-	bne	\msr_pr_cr, 99f
+	/*
+	 * Without pkey we are not changing AMR outside the kernel
+	 * hence skip this completely.
+	 */
+	bne	\msr_pr_cr, 100f  // from userspace
 	.endif
+        END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY, 67)
+
+	/*
+	 * pkey is enabled or pkey is disabled but entering from kernel
+	 */
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
+	/*
+	 * if entering from kernel we don't need save IAMR
+	 */
+	.ifnb \msr_pr_cr
+	beq	\msr_pr_cr, 100f // from kernel space
+	mfspr	\gpr1, SPRN_IAMR
+	std	\gpr1, STACK_REGS_KUEP(r1)
+
+	/*
+	 * update kernel IAMR with AMR_KUEP_BLOCKED only
+	 * if KUEP feature is enabled
+	 */
+	BEGIN_MMU_FTR_SECTION_NESTED(70)
+	LOAD_REG_IMMEDIATE(\gpr2, AMR_KUEP_BLOCKED)
+	mtspr	SPRN_IAMR, \gpr2
+	isync
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUEP, 70)
+	.endif
+
+100: // skip_save_amr
 #endif
 .endm
 
@@ -67,17 +171,37 @@
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
-static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
+static inline void kuap_restore_user_amr(struct pt_regs *regs)
+{
+	if (!mmu_has_feature(MMU_FTR_PKEY))
+		return;
+
+	isync();
+	mtspr(SPRN_AMR, regs->kuap);
+	mtspr(SPRN_IAMR, regs->kuep);
+	/*
+	 * No isync required here because we are about to rfi
+	 * back to previous context before any user accesses
+	 * would be made, which is a CSI.
+	 */
+}
+static inline void kuap_restore_kernel_amr(struct pt_regs *regs,
+					   unsigned long amr)
 {
-	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap != amr)) {
-		isync();
-		mtspr(SPRN_AMR, regs->kuap);
-		/*
-		 * No isync required here because we are about to RFI back to
-		 * previous context before any user accesses would be made,
-		 * which is a CSI.
-		 */
+	if (mmu_has_feature(MMU_FTR_KUAP)) {
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
+	/*
+	 * No need to restore IAMR when returning to kernel space.
+	 */
 }
 
 static inline unsigned long kuap_get_and_check_amr(void)
@@ -99,7 +223,11 @@ static inline void kuap_check_amr(void)
 
 #else /* CONFIG_PPC_PKEY */
 
-static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
+static inline void kuap_restore_user_amr(struct pt_regs *regs)
+{
+}
+
+static inline void kuap_restore_kernel_amr(struct pt_regs *regs, unsigned long amr)
 {
 }
 
@@ -111,6 +239,7 @@ static inline unsigned long kuap_get_and_check_amr(void)
 {
 	return 0;
 }
+
 #endif /* CONFIG_PPC_PKEY */
 
 
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 5f62ce579a8b..83f3276fab7b 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -55,9 +55,11 @@ struct pt_regs
 #endif
 #ifdef CONFIG_PPC_PKEY
 			unsigned long kuap;
+			unsigned long kuep;
 #endif
+
 		};
-		unsigned long __pad[2];	/* Maintain 16 byte interrupt stack alignment */
+		unsigned long __pad[4];	/* Maintain 16 byte interrupt stack alignment */
 	};
 };
 #endif
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 63548992b5ab..2f413aaa29cb 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -355,8 +355,10 @@ int main(void)
 
 #ifdef CONFIG_PPC_PKEY
 	STACK_PT_REGS_OFFSET(STACK_REGS_KUAP, kuap);
+	STACK_PT_REGS_OFFSET(STACK_REGS_KUEP, kuep);
 #endif
 
+
 #if defined(CONFIG_PPC32)
 #if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
 	DEFINE(EXC_LVL_SIZE, STACK_EXC_LVL_FRAME_SIZE);
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 33a42e42c56f..68171689db5d 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -645,8 +645,8 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
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
@@ -666,6 +666,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs
 
+.Lfast_user_interrupt_return_amr:
+	kuap_restore_user_amr r3
 .Lfast_user_interrupt_return:
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f7d748b88705..93c7840ea8b9 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1061,7 +1061,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	kuap_restore_amr r9, r10
+	kuap_restore_kernel_amr r9, r10
 	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
 
@@ -2874,7 +2874,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	kuap_restore_amr r9, r10
+	kuap_restore_kernel_amr r9, r10
 	EXCEPTION_RESTORE_REGS hsrr=0
 	RFI_TO_KERNEL
 
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 22a31a988264..e49d604b811b 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -35,7 +35,25 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
 
-	kuap_check_amr();
+#ifdef CONFIG_PPC_PKEY
+	if (mmu_has_feature(MMU_FTR_PKEY)) {
+		unsigned long amr, iamr;
+		/*
+		 * When entering from userspace we mostly have the AMR/IAMR
+		 * different from kernel default values. Hence don't compare.
+		 */
+		amr = mfspr(SPRN_AMR);
+		iamr = mfspr(SPRN_IAMR);
+		regs->kuap = amr;
+		regs->kuep = iamr;
+		if (mmu_has_feature(MMU_FTR_KUAP))
+			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+		if (mmu_has_feature(MMU_FTR_KUEP))
+			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
+		isync();
+	} else
+#endif
+		kuap_check_amr();
 
 	account_cpu_user_entry();
 
@@ -245,6 +263,10 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	account_cpu_user_exit();
 
+	/*
+	 * We do this at the end so that we do context switch with KERNEL AMR
+	 */
+	kuap_restore_user_amr(regs);
 	return ret;
 }
 
@@ -330,6 +352,10 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 
 	account_cpu_user_exit();
 
+	/*
+	 * We do this at the end so that we do context switch with KERNEL AMR
+	 */
+	kuap_restore_user_amr(regs);
 	return ret;
 }
 
@@ -400,7 +426,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * which would cause Read-After-Write stalls. Hence, we take the AMR
 	 * value from the check above.
 	 */
-	kuap_restore_amr(regs, amr);
+	kuap_restore_kernel_amr(regs, amr);
 
 	return ret;
 }
-- 
2.26.2

