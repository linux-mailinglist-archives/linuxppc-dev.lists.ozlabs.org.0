Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D9F2C5F67
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 06:04:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj2cF5zNPzDsM2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 16:04:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M8BPWa+g; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj29f5g4mzDrVM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 15:45:10 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AR4WNgZ077736; Thu, 26 Nov 2020 23:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=b7xQj5xy92yj++EOgzApY/rv8n4ZCy1vqz1ERmg4LNU=;
 b=M8BPWa+gN2vTeGal/q9DfMrnSrnaNSUD3Sb2izChZ3T27uBVrXvFiIj7dNKSEugROh8N
 gI2QWkuib2e0m0tFNkLhCtLzhFIp+FjyICVp7fktWqE8OzQGH0Er7K9WI3Zj9KXfp/7q
 orJeCKp16GsBbEHYiXBQJeA8j00mKZNc2aVah3kS2BbkrB5l5w5JLsRHA1lpf0eDroGa
 3cpIVhercarrc50vDP1TRSkO2e6z0BYBNrrGEQxK/oeZsjKddIgvq9QD6svHil1kW9xL
 2FnrHrMFRMM77o7mu/hpPOobLiDZeyn1Imgw2VKvbqnFz/ENiK6h8jRLic8GGY9otM6k mQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352sg21gud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 23:45:01 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AR4hfcW012835;
 Fri, 27 Nov 2020 04:45:00 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 34xth9kw72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 04:45:00 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AR4iraD54329644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 04:44:53 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E2E86E052;
 Fri, 27 Nov 2020 04:44:59 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BBFE6E04E;
 Fri, 27 Nov 2020 04:44:57 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.45.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Nov 2020 04:44:56 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 10/22] powerpc/book3s64/pkeys: Store/restore userspace
 AMR/IAMR correctly on entry and exit from kernel
Date: Fri, 27 Nov 2020 10:14:12 +0530
Message-Id: <20201127044424.40686-11-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
References: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_01:2020-11-26,
 2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270021
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Sandipan Das <sandipan@linux.ibm.com>
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

We need to save AMR if we have MMU_FTR_BOOK3S_KUAP feature enabled and we are
interrupted within kernel. This is required so that if we get interrupted
within copy_to/from_user we continue with the right AMR value.

If we hae MMU_FTR_BOOK3S_KUEP enabled we need to restore IAMR on
return to userspace beause kernel will be running with a different
IAMR value.

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 222 +++++++++++++++++++----
 arch/powerpc/include/asm/ptrace.h        |   5 +-
 arch/powerpc/kernel/asm-offsets.c        |   2 +
 arch/powerpc/kernel/entry_64.S           |   6 +-
 arch/powerpc/kernel/exceptions-64s.S     |   4 +-
 arch/powerpc/kernel/syscall_64.c         |  32 +++-
 6 files changed, 225 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 262576514eac..1b2047202a85 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -13,17 +13,46 @@
 
 #ifdef __ASSEMBLY__
 
-.macro kuap_restore_amr	gpr1, gpr2
-#ifdef CONFIG_PPC_KUAP
+.macro kuap_user_restore gpr1
+#if defined(CONFIG_PPC_PKEY)
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
-	mfspr	\gpr1, SPRN_AMR
+	/*
+	 * AMR and IAMR are going to be different when
+	 * returning to userspace.
+	 */
+	ld	\gpr1, STACK_REGS_AMR(r1)
+	isync
+	mtspr	SPRN_AMR, \gpr1
+	/*
+	 * Restore IAMR only when returning to userspace
+	 */
+	ld	\gpr1, STACK_REGS_IAMR(r1)
+	mtspr	SPRN_IAMR, \gpr1
+
+	/* No isync required, see kuap_user_restore() */
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY, 67)
+#endif
+.endm
+
+.macro kuap_kernel_restore	gpr1, gpr2
+#if defined(CONFIG_PPC_PKEY)
+
+	BEGIN_MMU_FTR_SECTION_NESTED(67)
+	/*
+	 * AMR is going to be mostly the same since we are
+	 * returning to the kernel. Compare and do a mtspr.
+	 */
 	ld	\gpr2, STACK_REGS_AMR(r1)
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
 	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUAP, 67)
 #endif
 .endm
@@ -42,23 +71,98 @@
 .endm
 #endif
 
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
+	END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY | MMU_FTR_BOOK3S_KUAP, 68)
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
 	std	\gpr1, STACK_REGS_AMR(r1)
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
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUAP, 67)
+102:
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUAP, 69)
+
+	/*
+	 * if entering from kernel we don't need save IAMR
+	 */
+	.ifnb \msr_pr_cr
+	beq	\msr_pr_cr, 100f // from kernel space
+	mfspr	\gpr1, SPRN_IAMR
+	std	\gpr1, STACK_REGS_IAMR(r1)
+
+	/*
+	 * update kernel IAMR with AMR_KUEP_BLOCKED only
+	 * if KUEP feature is enabled
+	 */
+	BEGIN_MMU_FTR_SECTION_NESTED(70)
+	LOAD_REG_IMMEDIATE(\gpr2, AMR_KUEP_BLOCKED)
+	mtspr	SPRN_IAMR, \gpr2
+	isync
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUEP, 70)
+	.endif
+
+100: // skip_save_amr
 #endif
 .endm
 
@@ -66,22 +170,42 @@
 
 DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
 
-#ifdef CONFIG_PPC_KUAP
+#ifdef CONFIG_PPC_PKEY
 
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
-static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
+static inline void kuap_user_restore(struct pt_regs *regs)
+{
+	if (!mmu_has_feature(MMU_FTR_PKEY))
+		return;
+
+	isync();
+	mtspr(SPRN_AMR, regs->amr);
+	mtspr(SPRN_IAMR, regs->iamr);
+	/*
+	 * No isync required here because we are about to rfi
+	 * back to previous context before any user accesses
+	 * would be made, which is a CSI.
+	 */
+}
+static inline void kuap_kernel_restore(struct pt_regs *regs,
+					   unsigned long amr)
 {
-	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP) && unlikely(regs->kuap != amr)) {
-		isync();
-		mtspr(SPRN_AMR, regs->kuap);
-		/*
-		 * No isync required here because we are about to RFI back to
-		 * previous context before any user accesses would be made,
-		 * which is a CSI.
-		 */
+	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
+		if (unlikely(regs->amr != amr)) {
+			isync();
+			mtspr(SPRN_AMR, regs->amr);
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
@@ -95,6 +219,26 @@ static inline unsigned long kuap_get_and_check_amr(void)
 	return 0;
 }
 
+#else /* CONFIG_PPC_PKEY */
+
+static inline void kuap_user_restore(struct pt_regs *regs)
+{
+}
+
+static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long amr)
+{
+}
+
+static inline unsigned long kuap_get_and_check_amr(void)
+{
+	return 0;
+}
+
+#endif /* CONFIG_PPC_PKEY */
+
+
+#ifdef CONFIG_PPC_KUAP
+
 static inline void kuap_check_amr(void)
 {
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
@@ -143,21 +287,6 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
 		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
 }
-#else /* CONFIG_PPC_KUAP */
-static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr) { }
-
-static inline unsigned long kuap_get_and_check_amr(void)
-{
-	return 0UL;
-}
-
-static inline unsigned long get_kuap(void)
-{
-	return AMR_KUAP_BLOCKED;
-}
-
-static inline void set_kuap(unsigned long value) { }
-#endif /* !CONFIG_PPC_KUAP */
 
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
 					      unsigned long size, unsigned long dir)
@@ -174,6 +303,21 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 		BUILD_BUG();
 }
 
+#else /* CONFIG_PPC_KUAP */
+
+static inline unsigned long get_kuap(void)
+{
+	return AMR_KUAP_BLOCKED;
+}
+
+static inline void set_kuap(unsigned long value) { }
+
+static __always_inline void allow_user_access(void __user *to, const void __user *from,
+					      unsigned long size, unsigned long dir)
+{ }
+
+#endif /* !CONFIG_PPC_KUAP */
+
 static inline void prevent_user_access(void __user *to, const void __user *from,
 				       unsigned long size, unsigned long dir)
 {
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index e7f1caa007a4..f240f0cdcec2 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -61,8 +61,11 @@ struct pt_regs
 				unsigned long amr;
 #endif
 			};
+#ifdef CONFIG_PPC_PKEY
+			unsigned long iamr;
+#endif
 		};
-		unsigned long __pad[2];	/* Maintain 16 byte interrupt stack alignment */
+		unsigned long __pad[4];	/* Maintain 16 byte interrupt stack alignment */
 	};
 };
 #endif
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 418a0b314a33..76545cdc7f8a 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -356,11 +356,13 @@ int main(void)
 
 #ifdef CONFIG_PPC_PKEY
 	STACK_PT_REGS_OFFSET(STACK_REGS_AMR, amr);
+	STACK_PT_REGS_OFFSET(STACK_REGS_IAMR, iamr);
 #endif
 #ifdef CONFIG_PPC_KUAP
 	STACK_PT_REGS_OFFSET(STACK_REGS_KUAP, kuap);
 #endif
 
+
 #if defined(CONFIG_PPC32)
 #if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
 	DEFINE(EXC_LVL_SIZE, STACK_EXC_LVL_FRAME_SIZE);
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 2f3846192ec7..da23c397ceb2 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -653,8 +653,8 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
 	kuap_check_amr r3, r4
 	ld	r5,_MSR(r1)
 	andi.	r0,r5,MSR_PR
-	bne	.Lfast_user_interrupt_return
-	kuap_restore_amr r3, r4
+	bne	.Lfast_user_interrupt_return_amr
+	kuap_kernel_restore r3, r4
 	andi.	r0,r5,MSR_RI
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
 	bne+	.Lfast_kernel_interrupt_return
@@ -674,6 +674,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs
 
+.Lfast_user_interrupt_return_amr:
+	kuap_user_restore r3
 .Lfast_user_interrupt_return:
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 4d01f09ecf80..1c8f1b90e174 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1059,7 +1059,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	kuap_restore_amr r9, r10
+	kuap_kernel_restore r9, r10
 	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
 
@@ -2875,7 +2875,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	kuap_restore_amr r9, r10
+	kuap_kernel_restore r9, r10
 	EXCEPTION_RESTORE_REGS hsrr=0
 	RFI_TO_KERNEL
 
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 310bcd768cd5..11f1c6360291 100644
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
+		regs->amr  = amr;
+		regs->iamr = iamr;
+		if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
+			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP))
+			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
+		isync();
+	} else
+#endif
+		kuap_check_amr();
 
 	account_cpu_user_entry();
 
@@ -245,6 +263,12 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	account_cpu_user_exit();
 
+#ifdef CONFIG_PPC_BOOK3S /* BOOK3E not yet using this */
+	/*
+	 * We do this at the end so that we do context switch with KERNEL AMR
+	 */
+	kuap_user_restore(regs);
+#endif
 	return ret;
 }
 
@@ -330,6 +354,10 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 
 	account_cpu_user_exit();
 
+	/*
+	 * We do this at the end so that we do context switch with KERNEL AMR
+	 */
+	kuap_user_restore(regs);
 	return ret;
 }
 
@@ -400,7 +428,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * which would cause Read-After-Write stalls. Hence, we take the AMR
 	 * value from the check above.
 	 */
-	kuap_restore_amr(regs, amr);
+	kuap_kernel_restore(regs, amr);
 
 	return ret;
 }
-- 
2.28.0

