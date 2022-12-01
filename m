Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA0863EA2E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 08:15:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN6mF2Bpmz3bdf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:15:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z2eY05Et;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z2eY05Et;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN6g82qfwz3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 18:11:00 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B15fLom020858;
	Thu, 1 Dec 2022 07:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MlcPBOFqadMdlG5ODBcmHqFxbI0KblmKjawkXObtxSY=;
 b=Z2eY05EtGnuvynKEvCWu8F1QV0mYn8u9DKNkUZFAyvrTFNACQkFUC4OtjYZmz7T4XexA
 nbWb7UfNqoqq/L0debZcUd99tE0tBZhy241NackWHfVK2dl5zEbqNs18HMeG1ayv9a6q
 rjqOJMd+QfsrETEozmnbApYBqIaAal2vyoYpdrhGJzsEekInEhtKqMeXvFq3OWRCKprO
 G0lsC21R/4hsJeYuuglQLsdGEvxG15cw1+3wxuidnNTehh/TNO//YTW+4x9KlRqAb9sn
 RMOMAKgn7NmDiJoMk8ZTpoPYiIqdAsNGJV0lQTmEKZBmzPOcpiPs4dgA11wmWongAf97 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6nyc2byp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:55 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B17AOPc001989;
	Thu, 1 Dec 2022 07:10:54 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6nyc2bxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:54 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B175MGB005450;
	Thu, 1 Dec 2022 07:10:52 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3m3ae9exg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B17AoUo8651490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Dec 2022 07:10:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B792AE051;
	Thu,  1 Dec 2022 07:10:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B101AAE04D;
	Thu,  1 Dec 2022 07:10:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  1 Dec 2022 07:10:49 +0000 (GMT)
Received: from civic.. (unknown [9.177.92.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 062CB600F0;
	Thu,  1 Dec 2022 18:10:45 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 5/7] powerpc/64s: Zeroise gprs on interrupt routine entry on Book3S
Date: Thu,  1 Dec 2022 18:10:17 +1100
Message-Id: <20221201071019.1953023-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221201071019.1953023-1-rmclure@linux.ibm.com>
References: <20221201071019.1953023-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: li2f7pz0UJjRKjjDwbwyyfmZH3762DI5
X-Proofpoint-GUID: D6tcGDNBbQakHEL6ug8U-QApWwC8GJpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=687 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010048
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
v5: Replace unconditional ZEROIZE_... with conditional SANITIZE_...
counterparts
---
 arch/powerpc/kernel/exceptions-64s.S | 27 ++++++++++++++++++---------
 arch/powerpc/kernel/interrupt_64.S   | 16 ++++++++++++++--
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 58d72db1d484..68de42e42268 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -506,6 +506,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 	std	r10,0(r1)		/* make stack chain pointer	*/
 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
+	SANITIZE_GPR(0)
 
 	/* Mark our [H]SRRs valid for return */
 	li	r10,1
@@ -548,8 +549,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	std	r9,GPR11(r1)
 	std	r10,GPR12(r1)
 	std	r11,GPR13(r1)
+	.if !IMSR_R12
+	SANITIZE_GPRS(9, 12)
+	.else
+	SANITIZE_GPRS(9, 11)
+	.endif
 
 	SAVE_NVGPRS(r1)
+	SANITIZE_NVGPRS()
 
 	.if IDAR
 	.if IISIDE
@@ -581,8 +588,8 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r10,IAREA+EX_CTR(r13)
 	std	r10,_CTR(r1)
-	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
-	SAVE_GPRS(3, 8, r1)		/* save r3 - r8 in stackframe   */
+	SAVE_GPRS(2, 8, r1)		/* save r2 - r8 in stackframe   */
+	SANITIZE_GPRS(2, 8)
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
index 1ef4fdef74fb..89ca1d9091f1 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -96,6 +96,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * but this is the best we can do.
 	 */
 
+	/*
+	 * Zero user registers to prevent influencing speculative execution
+	 * state of kernel code.
+	 */
+	SANITIZE_SYSCALL_GPRS()
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
+	SANITIZE_SYSCALL_GPRS()
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

