Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB1257F97A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:34:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrqyM645Nz3fN5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:34:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NyarSz2D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NyarSz2D;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrqwH4zczz3f1k
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:32:31 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P5LpM5024470;
	Mon, 25 Jul 2022 06:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=n2FHSNjWlgCKw/gZbumSTKVFFYskNGYDqjOCaeaID7Q=;
 b=NyarSz2DrmnjcZAj88ZiYHitAmfH/sM9Jf+7OAA6GsUxR1BShQHSVZ1rjY8jfbdRqeI+
 pVIjW3T6EU9URPR2Lb96q93ucW96YKHP36iSjtH6AIg2WkYU2DLeRv/hmjRKajGIeIHm
 dX5GjrbVQ0DfCLv5CuVymOzJUiVJbTw8ZsBjwoUtMCpPM+lnuMwKcyKX9ZL/loJc1cN1
 2R0xbc20pqhId+Ls5SA9JUakYTXltZb3Cw2XiaVE0IWI3xcjEjOzAVEASa4/yy72e9El
 e8kvajPuYlkmIR/jX0rifvxBJYVeL3PrLelSgDBjbQUYnny8zdE2Mvuic5OESUcBg1NV pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhmyb1rtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:32:27 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P5x8ul016571;
	Mon, 25 Jul 2022 06:32:27 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhmyb1rs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:32:27 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26P6LoSn003492;
	Mon, 25 Jul 2022 06:32:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06fra.de.ibm.com with ESMTP id 3hg98fguty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:32:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26P6WMMq21102920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 06:32:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 723FC42041;
	Mon, 25 Jul 2022 06:32:22 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEE694203F;
	Mon, 25 Jul 2022 06:32:20 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.53])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jul 2022 06:32:20 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 14/14] powerpc/64s: Clear gprs on interrupt routine entry
Date: Mon, 25 Jul 2022 16:32:17 +1000
Message-Id: <20220725063217.121476-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ulyN9nVR1KbppNdvrCY_98qRJmJAdmm4
X-Proofpoint-ORIG-GUID: ybHBGXL-qhEJwiGnZQI2c-TjO99-0Mtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=950 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250028
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

Zero GPRS r0, r2-r11, r14-r31, on entry into the kernel for all
other interrupt sources to limit influence of user-space values
in potential speculation gadgets. The remaining gprs are overwritten by
entry macros to interrupt handlers, irrespective of whether or not a
given handler consumes these register values.

Prior to this commit, r14-r31 are restored on a per-interrupt basis at
exit, but now they are always restored. Remove explicit REST_NVGPRS
invocations on interrupt entry and simplify exit logic. 32-bit systems
will still conditionally need to restore NVGPRS so keep return value for
interrupt_exit_user_prepare.

The mmap_bench benchmark in selftests should rapidly invoke pagefaults.
See ~0.8% performance regression with this mitigation, but this
indicates the worst-case performance due to heavier-weight interrupt
handlers.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Add benchmark data
---
 arch/powerpc/kernel/exceptions-64s.S | 21 ++++++++-------------
 arch/powerpc/kernel/interrupt_64.S   |  9 ++-------
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 102896fc6a86..62dd6270852e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -502,6 +502,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 	std	r10,0(r1)		/* make stack chain pointer	*/
 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
+	NULLIFY_GPR(0)
 
 	/* Mark our [H]SRRs valid for return */
 	li	r10,1
@@ -538,14 +539,18 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r10,IAREA+EX_R10(r13)
 	std	r9,GPR9(r1)
 	std	r10,GPR10(r1)
+	NULLIFY_GPRS(9, 10)
 	ld	r9,IAREA+EX_R11(r13)	/* move r11 - r13 to stackframe	*/
 	ld	r10,IAREA+EX_R12(r13)
 	ld	r11,IAREA+EX_R13(r13)
 	std	r9,GPR11(r1)
 	std	r10,GPR12(r1)
 	std	r11,GPR13(r1)
+	/* keep r12 ([H]SRR1/MSR), r13 (PACA) for interrupt routine */
+	NULLIFY_GPR(11)
 
 	SAVE_NVGPRS(r1)
+	NULLIFY_NVGPRS()
 
 	.if IDAR
 	.if IISIDE
@@ -577,8 +582,8 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r10,IAREA+EX_CTR(r13)
 	std	r10,_CTR(r1)
-	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
-	SAVE_GPRS(3, 8, r1)		/* save r3 - r8 in stackframe   */
+	SAVE_GPRS(2, 8, r1)		/* save r2 - r8 in stackframe   */
+	NULLIFY_GPRS(2, 8)
 	mflr	r9			/* Get LR, later save to stack	*/
 	ld	r2,PACATOC(r13)		/* get kernel TOC into r2	*/
 	std	r9,_LINK(r1)
@@ -696,6 +701,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	mtlr	r9
 	ld	r9,_CCR(r1)
 	mtcr	r9
+	REST_NVGPRS(r1)
 	REST_GPRS(2, 13, r1)
 	REST_GPR(0, r1)
 	/* restore original r1. */
@@ -1368,11 +1374,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	b	interrupt_return_srr
 
 1:	bl	do_break
-	/*
-	 * do_break() may have changed the NV GPRS while handling a breakpoint.
-	 * If so, we need to restore them with their updated values.
-	 */
-	REST_NVGPRS(r1)
 	b	interrupt_return_srr
 
 
@@ -1598,7 +1599,6 @@ EXC_COMMON_BEGIN(alignment_common)
 	GEN_COMMON alignment
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -1708,7 +1708,6 @@ EXC_COMMON_BEGIN(program_check_common)
 .Ldo_program_check:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -2139,7 +2138,6 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_COMMON emulation_assist
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	emulation_assist_interrupt
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_hsrr
 
 
@@ -2457,7 +2455,6 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_COMMON facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
 
@@ -2485,7 +2482,6 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	GEN_COMMON h_facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
-	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
 	b	interrupt_return_hsrr
 
 
@@ -2711,7 +2707,6 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
 	bl	altivec_assist_exception
-	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 #else
 	bl	unknown_exception
 #endif
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index efaf162fa772..083a94604072 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -430,9 +430,6 @@ interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_user_prepare
-	cmpdi	r3,0
-	bne-	.Lrestore_nvgprs_\srr
-.Lrestore_nvgprs_\srr\()_cont:
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 #ifdef CONFIG_PPC_BOOK3S
 .Linterrupt_return_\srr\()_user_rst_start:
@@ -446,6 +443,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 .Lfast_user_interrupt_return_\srr\():
+	REST_NVGPRS(r1)
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
 	lbz	r4,PACASRR_VALID(r13)
@@ -515,10 +513,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	b	.	/* prevent speculative execution */
 .Linterrupt_return_\srr\()_user_rst_end:
 
-.Lrestore_nvgprs_\srr\():
-	REST_NVGPRS(r1)
-	b	.Lrestore_nvgprs_\srr\()_cont
-
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_user_restart:
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user_restart)
@@ -559,6 +553,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 1:
 
 .Lfast_kernel_interrupt_return_\srr\():
+	REST_NVGPRS(r1)
 	cmpdi	cr1,r3,0
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
-- 
2.34.1

