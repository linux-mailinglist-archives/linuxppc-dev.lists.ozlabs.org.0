Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F20E6170CE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 23:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2hpZ2h0mz3cLh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:47:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rV8eSkgz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rV8eSkgz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2hnc4Jzmz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 09:46:12 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A2MaQuH008223;
	Wed, 2 Nov 2022 22:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=yZySNGWM9ThxSKK5Jdv0KzvDsdU5h/5JaLJvMiGFZAw=;
 b=rV8eSkgzYQ+ngJb0mJfCdYxPbwP5Yzr9pJUGqSr1UH+CNXNtj3TkYc+rqNZ8AAhUHZrV
 lJqKjtk+6L5bMI520msdH2qXk0LNCDsyxELC9VV1qusrpC3ZhD1AZEGHI+gJSbHtjPTi
 PVMWr08YEaiiTwzn0pnDcfF1Q72pXWtUbEctUwv23n2lMjUyrY4mTrV1ctyk5qdUcjjF
 c57ayY4/kNKoQm3VxhnaNZhgEfoziPLyt41+xT2TH+HAyllYblxL2CWmqRBK9uOeloM5
 vYrGCvz9edsd9fpjBzKZpM+F3mOB1j0n7sugJtCLF0KFfxQMqhFCJ9TzTgund02VkFXa Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkwetfdug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:46:07 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2MbelS011700;
	Wed, 2 Nov 2022 22:46:07 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkwetfdtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:46:07 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A2MZXK4020026;
	Wed, 2 Nov 2022 22:46:05 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03fra.de.ibm.com with ESMTP id 3kgut8nq9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:46:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A2MeVGc41550226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:40:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B48FD42049;
	Wed,  2 Nov 2022 22:46:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15B1242041;
	Wed,  2 Nov 2022 22:46:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  2 Nov 2022 22:46:02 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DE9AB6038E;
	Thu,  3 Nov 2022 09:46:00 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/64s: Clear gprs on interrupt routine entry on Book3S
Date: Thu,  3 Nov 2022 09:45:26 +1100
Message-Id: <20221102224528.639894-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102224528.639894-1-rmclure@linux.ibm.com>
References: <20221102224528.639894-1-rmclure@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pticQWku6PHpg8UsAj7pWdankXZ6uKfu
X-Proofpoint-GUID: 0SooAj68eIfX2rwmHZakZhb56e5O2vO_
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211020149
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zero user state in gprs (assign to zero) to reduce the influence of user
registers on speculation within kernel syscall handlers. Clears occur
at the very beginning of the sc and scv 0 interrupt handlers, with
restores occurring following the execution of the syscall handler.

Zero GPRS r0, r2-r11, r14-r31, on entry into the kernel for all
other interrupt sources. The remaining gprs are overwritten by
entry macros to interrupt handlers, irrespective of whether or not a
given handler consumes these register values.

Prior to this commit, r14-r31 are restored on a per-interrupt basis at
exit, but now they are always restored on 64bit Book3S. Remove explicit
REST_NVGPRS invocations on 64-bit Book3S. 32-bit systems do not clear
user registers on interrupt, and continue to depend on the return value
of interrupt_exit_user_prepare to determine whether or not to restore
non-volatiles.

The mmap_bench benchmark in selftests should rapidly invoke pagefaults.
See ~0.8% performance regression with this mitigation, but this
indicates the worst-case performance due to heavier-weight interrupt
handlers. This mitigation is able to be enabled/disabled through
CONFIG_INTERRUPT_SANITIZE_REGISTERS.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
Resubmitting patches as their own series after v6 partially merged:
Link: https://lore.kernel.org/all/166488988686.779920.13794870102696416283.b4-ty@ellerman.id.au/t/

Standalone series: Now syscall register clearing is included
under the same configuration option. This now matches the
description given for CONFIG_INTERRUPT_SANITIZE_REGISTERS.
---
 arch/powerpc/kernel/exceptions-64s.S | 47 +++++++++++++++++++++-----
 arch/powerpc/kernel/interrupt_64.S   | 34 +++++++++++++++++++
 2 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 651c36b056bd..0605018762d1 100644
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
 	LOAD_PACA_TOC()			/* get kernel TOC into r2	*/
 	std	r9,_LINK(r1)
@@ -696,6 +720,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	mtlr	r9
 	ld	r9,_CCR(r1)
 	mtcr	r9
+	SANITIZE_RESTORE_NVGPRS()
 	REST_GPRS(2, 13, r1)
 	REST_GPR(0, r1)
 	/* restore original r1. */
@@ -1441,7 +1466,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	 * do_break() may have changed the NV GPRS while handling a breakpoint.
 	 * If so, we need to restore them with their updated values.
 	 */
-	REST_NVGPRS(r1)
+	HANDLER_RESTORE_NVGPRS()
 	b	interrupt_return_srr
 
 
@@ -1667,7 +1692,7 @@ EXC_COMMON_BEGIN(alignment_common)
 	GEN_COMMON alignment
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -1733,7 +1758,7 @@ EXC_COMMON_BEGIN(program_check_common)
 .Ldo_program_check:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -1751,6 +1776,7 @@ INT_DEFINE_BEGIN(fp_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(fp_unavailable)
 
 EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
@@ -2164,7 +2190,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_COMMON emulation_assist
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	emulation_assist_interrupt
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_hsrr
 
 
@@ -2384,6 +2410,7 @@ INT_DEFINE_BEGIN(altivec_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(altivec_unavailable)
 
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
@@ -2433,6 +2460,7 @@ INT_DEFINE_BEGIN(vsx_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(vsx_unavailable)
 
 EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
@@ -2494,7 +2522,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_COMMON facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -2522,7 +2550,8 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	GEN_COMMON h_facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
-	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
+	/* XXX Shouldn't be necessary in practice */
+	HANDLER_RESTORE_NVGPRS()
 	b	interrupt_return_hsrr
 
 
@@ -2748,7 +2777,7 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
 	bl	altivec_assist_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 #else
 	bl	unknown_exception
 #endif
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index a019ed6fc839..26c04b83da1b 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -13,6 +13,20 @@
 #include <asm/ppc_asm.h>
 #include <asm/ptrace.h>
 
+/*
+ * macros for handling user register sanitisation
+ */
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+#define SANITIZE_ZEROIZE_SYSCALL_GPRS()	\
+	ZEROIZE_GPR(0)			\	
+	ZEROIZE_GPRS(5, 12)		\
+	ZEROIZE_NVGPRS()
+#define SANITIZE_RESTORE_NVGPRS()	REST_NVGPRS(r1)
+#else
+#define SANITIZE_ZEROIZE_SYSCALL_GPRS()
+#define SANITIZE_RESTORE_NVGPRS()
+#endif /* CONFIG_INTERRUPT_SANITIZE_REGISTERS */
+
 	.align 7
 
 .macro DEBUG_SRR_VALID srr
@@ -96,6 +110,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * but this is the best we can do.
 	 */
 
+	/*
+	 * Zero user registers to prevent influencing speculative execution
+	 * state of kernel code.
+	 */
+	SANITIZE_ZEROIZE_SYSCALL_GPRS()
 	bl	system_call_exception
 
 .Lsyscall_vectored_\name\()_exit:
@@ -124,6 +143,7 @@ BEGIN_FTR_SECTION
 	HMT_MEDIUM_LOW
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
+	REST_NVGPRS(r1)
 	cmpdi	r3,0
 	bne	.Lsyscall_vectored_\name\()_restore_regs
 
@@ -275,6 +295,11 @@ END_BTB_FLUSH_SECTION
 	wrteei	1
 #endif
 
+	/*
+	 * Zero user registers to prevent influencing speculative execution
+	 * state of kernel code.
+	 */
+	SANITIZE_ZEROIZE_SYSCALL_GPRS()
 	bl	system_call_exception
 
 .Lsyscall_exit:
@@ -315,6 +340,7 @@ BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1			/* to clear the reservation */
 END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
+	SANITIZE_RESTORE_NVGPRS()
 	cmpdi	r3,0
 	bne	.Lsyscall_restore_regs
 	/* Zero volatile regs that may contain sensitive kernel data */
@@ -342,7 +368,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 .Lsyscall_restore_regs:
 	ld	r3,_CTR(r1)
 	ld	r4,_XER(r1)
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 	REST_NVGPRS(r1)
+#endif
 	mtctr	r3
 	mtspr	SPRN_XER,r4
 	REST_GPR(0, r1)
@@ -408,9 +436,11 @@ interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
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
@@ -424,6 +454,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 .Lfast_user_interrupt_return_\srr\():
+	SANITIZE_RESTORE_NVGPRS()
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
 	lbz	r4,PACASRR_VALID(r13)
@@ -493,9 +524,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	b	.	/* prevent speculative execution */
 .Linterrupt_return_\srr\()_user_rst_end:
 
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 .Lrestore_nvgprs_\srr\():
 	REST_NVGPRS(r1)
 	b	.Lrestore_nvgprs_\srr\()_cont
+#endif
 
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_user_restart:
@@ -585,6 +618,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 	stb	r11,PACAIRQHAPPENED(r13) // clear the possible HARD_DIS
 
 .Lfast_kernel_interrupt_return_\srr\():
+	SANITIZE_RESTORE_NVGPRS()
 	cmpdi	cr1,r3,0
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
-- 
2.34.1

