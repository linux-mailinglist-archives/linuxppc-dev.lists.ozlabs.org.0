Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D435BF74D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:13:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXV4p6GS6z3gFk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:13:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oE62gsrv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oE62gsrv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTmV6bbNz3f4W
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:59:22 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6oql6012686;
	Wed, 21 Sep 2022 06:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JDlzFS0TgJlkx3UIEPXnWLlrqRrsFTn+kCK+Wh0p18o=;
 b=oE62gsrv9WQ5wjfd/Ra1zWfjk52MKLwhT1qkR9pmMB2CvmyRYKAi+3ClKuRfmS6ZQBQm
 fpsWJWZISectZKkUgic19x3AoexSo2SSxEH4oNY3kFId7ODeQ1uf33oYDCCUDl3N4hbo
 /y1L32otvD+gJ+r1Ymqt6rnGf5Y7LfgmhcywZf3l6rtgx1p57ouxtTZky4geljcVosS3
 gkbbZqSJ19gKJ4xTB/EzdubhCUqIKIGyTKz8bK2gwvMrS21NvJjLjz2U66NidsAwm+aP
 HUoU+Lx1MgGo2EA0L+Zb5qqRMQVSPwgtbndpmWNB4Fyv2ohdMnD5DJO8truWxL+YTBA9 2A== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqwpt06px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:59:18 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6pqSI002721;
	Wed, 21 Sep 2022 06:59:16 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06fra.de.ibm.com with ESMTP id 3jn5ghkm4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:59:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6xeet38994310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:59:40 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14FCA5205A;
	Wed, 21 Sep 2022 06:59:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 699E752052;
	Wed, 21 Sep 2022 06:59:13 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 838C7600EE;
	Wed, 21 Sep 2022 16:59:10 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 24/25] powerpc/64s: Clear gprs on interrupt routine entry in Book3S
Date: Wed, 21 Sep 2022 16:56:04 +1000
Message-Id: <20220921065605.1051927-25-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ysTtABnl5nvO0Q-jc0_WX-7hALTnulpB
X-Proofpoint-ORIG-GUID: ysTtABnl5nvO0Q-jc0_WX-7hALTnulpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_03,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=972 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209210043
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zero GPRS r0, r2-r11, r14-r31, on entry into the kernel for all
other interrupt sources to limit influence of user-space values
in potential speculation gadgets. The remaining gprs are overwritten by
entry macros to interrupt handlers, irrespective of whether or not a
given handler consumes these register values.

Prior to this commit, r14-r31 are restored on a per-interrupt basis at
exit, but now they are always restored. Remove explicit REST_NVGPRS
invocations as non-volatiles must now always be restored. 32-bit systems
do not clear user registers on interrupt, and continue to depend on the
return value of interrupt_exit_user_prepare to determine whether or not
to restore non-volatiles.

The mmap_bench benchmark in selftests should rapidly invoke pagefaults.
See ~0.8% performance regression with this mitigation, but this
indicates the worst-case performance due to heavier-weight interrupt
handlers. This mitigation is disabled by default, but enabled with
CONFIG_INTERRUPT_SANITIZE_REGISTERS.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V2: Add benchmark data
V3: Use ZEROIZE_GPR{,S} macro renames, clarify
upt_exit_user_prepare changes in summary.
V5: Configurable now with INTERRUPT_SANITIZE_REGISTERS. Zero r12
(containing MSR) from common macro on per-interrupt basis with IOPTION.
V6: Replace ifdefs with invocations of conditionally defined macros.
---
 arch/powerpc/kernel/exceptions-64s.S | 47 +++++++++++++++++++++-----
 arch/powerpc/kernel/interrupt_64.S   | 15 ++++++++
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a3b51441b039..b3f5ef1c712f 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -21,6 +21,19 @@
 #include <asm/feature-fixups.h>
 #include <asm/kup.h>
 
+/*
+ * macros for handling user register sanitisation
+ */
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+#define SANITIZE_ZEROIZE_NVGPRS()	ZEROIZE_NVGPRS()
+#define SANITIZE_RESTORE_NVGPRS()	REST_NVGPRS(r1)
+#define HANDLER_RESTORE_NVGPRS()
+#else
+#define SANITIZE_ZEROIZE_NVGPRS()
+#define SANITIZE_RESTORE_NVGPRS()
+#define HANDLER_RESTORE_NVGPRS()	REST_NVGPRS(r1)
+#endif /* CONFIG_INTERRUPT_SANITIZE_REGISTERS */
+
 /*
  * Following are fixed section helper macros.
  *
@@ -111,6 +124,7 @@ name:
 #define ISTACK		.L_ISTACK_\name\()	/* Set regular kernel stack */
 #define __ISTACK(name)	.L_ISTACK_ ## name
 #define IKUAP		.L_IKUAP_\name\()	/* Do KUAP lock */
+#define IMSR_R12	.L_IMSR_R12_\name\()	/* Assumes MSR saved to r12 */
 
 #define INT_DEFINE_BEGIN(n)						\
 .macro int_define_ ## n name
@@ -176,6 +190,9 @@ do_define_int n
 	.ifndef IKUAP
 		IKUAP=1
 	.endif
+	.ifndef IMSR_R12
+		IMSR_R12=0
+	.endif
 .endm
 
 /*
@@ -502,6 +519,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 	std	r10,0(r1)		/* make stack chain pointer	*/
 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
+	ZEROIZE_GPR(0)
 
 	/* Mark our [H]SRRs valid for return */
 	li	r10,1
@@ -544,8 +562,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	std	r9,GPR11(r1)
 	std	r10,GPR12(r1)
 	std	r11,GPR13(r1)
+	.if !IMSR_R12
+	ZEROIZE_GPRS(9, 12)
+	.else
+	ZEROIZE_GPRS(9, 11)
+	.endif
 
 	SAVE_NVGPRS(r1)
+	SANITIZE_ZEROIZE_NVGPRS()
 
 	.if IDAR
 	.if IISIDE
@@ -577,8 +601,8 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r10,IAREA+EX_CTR(r13)
 	std	r10,_CTR(r1)
-	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
-	SAVE_GPRS(3, 8, r1)		/* save r3 - r8 in stackframe   */
+	SAVE_GPRS(2, 8, r1)		/* save r2 - r8 in stackframe   */
+	ZEROIZE_GPRS(2, 8)
 	mflr	r9			/* Get LR, later save to stack	*/
 	ld	r2,PACATOC(r13)		/* get kernel TOC into r2	*/
 	std	r9,_LINK(r1)
@@ -696,6 +720,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	mtlr	r9
 	ld	r9,_CCR(r1)
 	mtcr	r9
+	SANITIZE_RESTORE_NVGPRS()
 	REST_GPRS(2, 13, r1)
 	REST_GPR(0, r1)
 	/* restore original r1. */
@@ -1372,7 +1397,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	 * do_break() may have changed the NV GPRS while handling a breakpoint.
 	 * If so, we need to restore them with their updated values.
 	 */
-	REST_NVGPRS(r1)
+	HANDLER_RESTORE_NVGPRS()
 	b	interrupt_return_srr
 
 
@@ -1598,7 +1623,7 @@ EXC_COMMON_BEGIN(alignment_common)
 	GEN_COMMON alignment
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -1708,7 +1733,7 @@ EXC_COMMON_BEGIN(program_check_common)
 .Ldo_program_check:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -1726,6 +1751,7 @@ INT_DEFINE_BEGIN(fp_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(fp_unavailable)
 
 EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
@@ -2139,7 +2165,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_COMMON emulation_assist
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	emulation_assist_interrupt
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_hsrr
 
 
@@ -2347,6 +2373,7 @@ INT_DEFINE_BEGIN(altivec_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(altivec_unavailable)
 
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
@@ -2396,6 +2423,7 @@ INT_DEFINE_BEGIN(vsx_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(vsx_unavailable)
 
 EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
@@ -2457,7 +2485,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_COMMON facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -2485,7 +2513,8 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	GEN_COMMON h_facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
-	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
+	/* XXX Shouldn't be necessary in practice */
+	HANDLER_RESTORE_NVGPRS()
 	b	interrupt_return_hsrr
 
 
@@ -2711,7 +2740,7 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
 	bl	altivec_assist_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 #else
 	bl	unknown_exception
 #endif
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 40147558e1a6..6b60d39f113b 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -13,6 +13,15 @@
 #include <asm/ppc_asm.h>
 #include <asm/ptrace.h>
 
+/*
+ * macros for handling user register sanitisation
+ */
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+#define SANITIZE_RESTORE_NVGPRS()	REST_NVGPRS(r1)
+#else
+#define SANITIZE_RESTORE_NVGPRS()
+#endif /* CONFIG_INTERRUPT_SANITIZE_REGISTERS */
+
 	.section	".toc","aw"
 SYS_CALL_TABLE:
 	.tc sys_call_table[TC],sys_call_table
@@ -433,9 +442,11 @@ interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_user_prepare
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs_\srr
 .Lrestore_nvgprs_\srr\()_cont:
+#endif
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 #ifdef CONFIG_PPC_BOOK3S
 .Linterrupt_return_\srr\()_user_rst_start:
@@ -449,6 +460,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 .Lfast_user_interrupt_return_\srr\():
+	SANITIZE_RESTORE_NVGPRS()
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
 	lbz	r4,PACASRR_VALID(r13)
@@ -518,9 +530,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	b	.	/* prevent speculative execution */
 .Linterrupt_return_\srr\()_user_rst_end:
 
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 .Lrestore_nvgprs_\srr\():
 	REST_NVGPRS(r1)
 	b	.Lrestore_nvgprs_\srr\()_cont
+#endif
 
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_user_restart:
@@ -562,6 +576,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 1:
 
 .Lfast_kernel_interrupt_return_\srr\():
+	SANITIZE_RESTORE_NVGPRS()
 	cmpdi	cr1,r3,0
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
-- 
2.34.1

