Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1E95BA672
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:42:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNJX5zJZz3f6V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:42:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QL9BokKb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QL9BokKb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5l2B2Rz3bZg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:30 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5VHaJ003986;
	Fri, 16 Sep 2022 05:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QruuydaSVudLup+Ut9EhNNGelssU4AF7YTEDgq3WIrY=;
 b=QL9BokKb//4J5Mt74ng38xdNQEJ7JrKEL3f1aLKx/E1ULFuNwtEcV6SlSy5uzRc6KM1n
 lzqpUm5AG3BJGURMrAiJtR7yes0qR3reDi1G5fdPY5nck1iU+ZzYkhOC8SdwjqjvzClh
 r9gIOLH8q0XQvQeh5HQSIXuj+q3oUoO5cxYcevJdv4TVehXGft3JrQI/FNzPWLYonF6f
 EnH8Ia0x6CY6tC5TTWPSH6Dxzwh03BNUiSJ4YwHuCKtB6CImseodHg8ddr2D4n2ATrtj
 C/mfFjJC2NDz1KKcWoqZFDdn5eXfw/abdABe4Ws1tdEGEZpqf6t4TBHRZgNjq64EkA8g Sg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk2f81y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:24 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5KgSE021856;
	Fri, 16 Sep 2022 05:33:22 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3jm921gh8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:22 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5XKR616318972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A49D52052;
	Fri, 16 Sep 2022 05:33:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9221452050;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B539E605A7;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 22/23] powerpc/64s: Clear gprs on interrupt routine entry in Book3S
Date: Fri, 16 Sep 2022 15:32:59 +1000
Message-Id: <20220916053300.786330-23-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8DrRkK4EqukxM5GTvFCsQPUIFgIpl_gy
X-Proofpoint-GUID: 8DrRkK4EqukxM5GTvFCsQPUIFgIpl_gy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160041
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
V1 -> V2: Add benchmark data
V2 -> V3: Use ZEROIZE_GPR{,S} macro renames, clarify
interrupt_exit_user_prepare changes in summary.
V4 -> V5: Configurable now with INTERRUPT_SANITIZE_REGISTERS. Zero r12
(containing MSR) from common macro on per-interrupt basis with IOPTION.
---
 arch/powerpc/kernel/exceptions-64s.S | 37 ++++++++++++++++++++++++--
 arch/powerpc/kernel/interrupt_64.S   | 10 +++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a3b51441b039..be5e72caada1 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -111,6 +111,7 @@ name:
 #define ISTACK		.L_ISTACK_\name\()	/* Set regular kernel stack */
 #define __ISTACK(name)	.L_ISTACK_ ## name
 #define IKUAP		.L_IKUAP_\name\()	/* Do KUAP lock */
+#define IMSR_R12	.L_IMSR_R12_\name\()	/* Assumes MSR saved to r12 */
 
 #define INT_DEFINE_BEGIN(n)						\
 .macro int_define_ ## n name
@@ -176,6 +177,9 @@ do_define_int n
 	.ifndef IKUAP
 		IKUAP=1
 	.endif
+	.ifndef IMSR_R12
+		IMSR_R12=0
+	.endif
 .endm
 
 /*
@@ -502,6 +506,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 	std	r10,0(r1)		/* make stack chain pointer	*/
 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
+	ZEROIZE_GPR(0)
 
 	/* Mark our [H]SRRs valid for return */
 	li	r10,1
@@ -544,8 +549,16 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	std	r9,GPR11(r1)
 	std	r10,GPR12(r1)
 	std	r11,GPR13(r1)
+	.if !IMSR_R12
+	ZEROIZE_GPRS(9, 12)
+	.else
+	ZEROIZE_GPRS(9, 11)
+	.endif
 
 	SAVE_NVGPRS(r1)
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+	ZEROIZE_NVGPRS()
+#endif
 
 	.if IDAR
 	.if IISIDE
@@ -577,8 +590,8 @@ BEGIN_FTR_SECTION
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
@@ -696,6 +709,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	mtlr	r9
 	ld	r9,_CCR(r1)
 	mtcr	r9
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+	REST_NVGPRS(r1)
+#endif
 	REST_GPRS(2, 13, r1)
 	REST_GPR(0, r1)
 	/* restore original r1. */
@@ -1368,11 +1384,13 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	b	interrupt_return_srr
 
 1:	bl	do_break
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 	/*
 	 * do_break() may have changed the NV GPRS while handling a breakpoint.
 	 * If so, we need to restore them with their updated values.
 	 */
 	REST_NVGPRS(r1)
+#endif
 	b	interrupt_return_srr
 
 
@@ -1598,7 +1616,9 @@ EXC_COMMON_BEGIN(alignment_common)
 	GEN_COMMON alignment
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+#endif
 	b	interrupt_return_srr
 
 
@@ -1708,7 +1728,9 @@ EXC_COMMON_BEGIN(program_check_common)
 .Ldo_program_check:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+#endif
 	b	interrupt_return_srr
 
 
@@ -1726,6 +1748,7 @@ INT_DEFINE_BEGIN(fp_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(fp_unavailable)
 
 EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
@@ -2139,7 +2162,9 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_COMMON emulation_assist
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	emulation_assist_interrupt
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+#endif
 	b	interrupt_return_hsrr
 
 
@@ -2347,6 +2372,7 @@ INT_DEFINE_BEGIN(altivec_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(altivec_unavailable)
 
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
@@ -2396,6 +2422,7 @@ INT_DEFINE_BEGIN(vsx_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(vsx_unavailable)
 
 EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
@@ -2457,7 +2484,9 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_COMMON facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+#endif
 	b	interrupt_return_srr
 
 
@@ -2485,7 +2514,9 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	GEN_COMMON h_facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
+#endif
 	b	interrupt_return_hsrr
 
 
@@ -2711,7 +2742,9 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
 	bl	altivec_assist_exception
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+#endif
 #else
 	bl	unknown_exception
 #endif
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 40147558e1a6..edad0c17e47a 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -433,9 +433,11 @@ interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
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
@@ -449,6 +451,9 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 .Lfast_user_interrupt_return_\srr\():
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+	REST_NVGPRS(r1)
+#endif
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
 	lbz	r4,PACASRR_VALID(r13)
@@ -518,9 +523,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	b	.	/* prevent speculative execution */
 .Linterrupt_return_\srr\()_user_rst_end:
 
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 .Lrestore_nvgprs_\srr\():
 	REST_NVGPRS(r1)
 	b	.Lrestore_nvgprs_\srr\()_cont
+#endif
 
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_user_restart:
@@ -562,6 +569,9 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 1:
 
 .Lfast_kernel_interrupt_return_\srr\():
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+	REST_NVGPRS(r1)
+#endif
 	cmpdi	cr1,r3,0
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
-- 
2.34.1

