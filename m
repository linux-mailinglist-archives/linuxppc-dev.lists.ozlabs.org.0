Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA363B931
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 05:48:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLqbt3gCpz3f3r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 15:48:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H5m2k6RC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H5m2k6RC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLqVz4VxHz3cLW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 15:44:27 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AT2u0Kw021399;
	Tue, 29 Nov 2022 04:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gQZ/i9SJnjpXMOvcYamJmCRCoY6cPCbQK6nseNf4gOc=;
 b=H5m2k6RC6/cVPvUV+ZjxGn/KXVAKAzFFrE9Gq3xWtbT7r0qNbQ5CtYBNtiW2fuXoYE0z
 Y9PyB88qcuCFOlN/KfhXgSJSh0dBQ9vmxizsmTlvx7itPUj8W5BnbFSTnqmmN8M5Uexy
 zWMW7Jv4/CdYopsTp13qJWD6DdN1Pz+8C/KhM1cDGaLOkG+TUFuqtg8gxM7Pz4L7idHw
 ArENZGIBwl/KOagiXZf+dwdZzBjkgbfXwam7KOPx8OiGh7qs/NdyFumVgmfF0Hjft9Er
 LYac3Eoa634noV5ekazAwOMWN3XirkdzXNAp0/JD69gDlV3l3jBhQvzF3Uz/B1y1Fk92 wA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m59qx1xsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:22 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AT3jqvs024037;
	Tue, 29 Nov 2022 04:44:21 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m59qx1xsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:21 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT4bTYd020856;
	Tue, 29 Nov 2022 04:44:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3m3ae92h1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:19 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AT4boIB3015244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 04:37:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58BB0AE04D;
	Tue, 29 Nov 2022 04:44:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4C2AAE045;
	Tue, 29 Nov 2022 04:44:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 04:44:16 +0000 (GMT)
Received: from civic.. (unknown [9.177.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7AB45600A5;
	Tue, 29 Nov 2022 15:44:13 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 5/7] powerpc/64s: Zeroise gprs on interrupt routine entry on Book3S
Date: Tue, 29 Nov 2022 15:43:52 +1100
Message-Id: <20221129044354.1836018-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221129044354.1836018-1-rmclure@linux.ibm.com>
References: <20221129044354.1836018-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 13l6htqQaV1QvmnaR5DimSKE0qmjShjZ
X-Proofpoint-ORIG-GUID: ZIPgH0YLSM7iyq293vBxag02QLvwre-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_02,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=679 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290029
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

Zeroise user state in gprs (assign to zero) to reduce the influence of user
registers on speculation within kernel syscall handlers. Clears occur
at the very beginning of the sc and scv 0 interrupt handlers, with
restores occurring following the execution of the syscall handler.

Zeroise GPRS r0, r2-r11, r14-r31, on entry into the kernel for all
other interrupt sources. The remaining gprs are overwritten by
entry macros to interrupt handlers, irrespective of whether or not a
given handler consumes these register values. If an interrupt does not
select the IMSR_R12 IOption, zeroise r12.

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

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v2: REST_NVGPRS should be conditional on mitigation in scv handler. Fix
improper multi-line preprocessor macro in interrupt_64.S
v4: Split off IMSR_R12 definition into its own patch. Move macro
definitions for register sanitisation into asm/ppc_asm.h
---
 arch/powerpc/kernel/exceptions-64s.S | 27 ++++++++++++++++++---------
 arch/powerpc/kernel/interrupt_64.S   | 16 ++++++++++++++--
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 58d72db1d484..8ee3db3b6595 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -506,6 +506,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 	std	r10,0(r1)		/* make stack chain pointer	*/
 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
+	ZEROIZE_GPR(0)
 
 	/* Mark our [H]SRRs valid for return */
 	li	r10,1
@@ -548,8 +549,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
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
@@ -581,8 +588,8 @@ BEGIN_FTR_SECTION
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
@@ -700,6 +707,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	mtlr	r9
 	ld	r9,_CCR(r1)
 	mtcr	r9
+	SANITIZE_RESTORE_NVGPRS()
 	REST_GPRS(2, 13, r1)
 	REST_GPR(0, r1)
 	/* restore original r1. */
@@ -1445,7 +1453,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	 * do_break() may have changed the NV GPRS while handling a breakpoint.
 	 * If so, we need to restore them with their updated values.
 	 */
-	REST_NVGPRS(r1)
+	HANDLER_RESTORE_NVGPRS()
 	b	interrupt_return_srr
 
 
@@ -1671,7 +1679,7 @@ EXC_COMMON_BEGIN(alignment_common)
 	GEN_COMMON alignment
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -1737,7 +1745,7 @@ EXC_COMMON_BEGIN(program_check_common)
 .Ldo_program_check:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -2169,7 +2177,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_COMMON emulation_assist
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	emulation_assist_interrupt
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_hsrr
 
 
@@ -2489,7 +2497,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_COMMON facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -2517,7 +2525,8 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	GEN_COMMON h_facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
-	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
+	/* XXX Shouldn't be necessary in practice */
+	HANDLER_RESTORE_NVGPRS()
 	b	interrupt_return_hsrr
 
 
@@ -2743,7 +2752,7 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
 	bl	altivec_assist_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
+	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 #else
 	bl	unknown_exception
 #endif
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 1ef4fdef74fb..66a56659e8c8 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -96,6 +96,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * but this is the best we can do.
 	 */
 
+	/*
+	 * Zero user registers to prevent influencing speculative execution
+	 * state of kernel code.
+	 */
+	SANITIZE_ZEROIZE_SYSCALL_GPRS()
 	bl	system_call_exception
 
 .Lsyscall_vectored_\name\()_exit:
@@ -124,6 +129,7 @@ BEGIN_FTR_SECTION
 	HMT_MEDIUM_LOW
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
+	SANITIZE_RESTORE_NVGPRS()
 	cmpdi	r3,0
 	bne	.Lsyscall_vectored_\name\()_restore_regs
 
@@ -159,7 +165,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r4,_LINK(r1)
 	ld	r5,_XER(r1)
 
-	REST_NVGPRS(r1)
+	HANDLER_RESTORE_NVGPRS()
 	REST_GPR(0, r1)
 	mtcr	r2
 	mtctr	r3
@@ -275,6 +281,11 @@ END_BTB_FLUSH_SECTION
 	wrteei	1
 #endif
 
+	/*
+	 * Zero user registers to prevent influencing speculative execution
+	 * state of kernel code.
+	 */
+	SANITIZE_ZEROIZE_SYSCALL_GPRS()
 	bl	system_call_exception
 
 .Lsyscall_exit:
@@ -315,6 +326,7 @@ BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1			/* to clear the reservation */
 END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
+	SANITIZE_RESTORE_NVGPRS()
 	cmpdi	r3,0
 	bne	.Lsyscall_restore_regs
 	/* Zero volatile regs that may contain sensitive kernel data */
@@ -342,7 +354,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 .Lsyscall_restore_regs:
 	ld	r3,_CTR(r1)
 	ld	r4,_XER(r1)
-	REST_NVGPRS(r1)
+	HANDLER_RESTORE_NVGPRS()
 	mtctr	r3
 	mtspr	SPRN_XER,r4
 	REST_GPR(0, r1)
-- 
2.37.2

