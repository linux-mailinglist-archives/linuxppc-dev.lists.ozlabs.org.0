Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E715993AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:47:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M874h2m5lz3fXF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:47:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dKxUbHj3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dKxUbHj3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M86vP0dMNz3c1p
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 13:39:43 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3CLUd003016;
	Fri, 19 Aug 2022 03:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aMdDRDRCmgo66d9PdcMiOXSM2TDnbwHmR0ukfDJP3Ws=;
 b=dKxUbHj3qz5EHoTSjp+nM1aQi8TxQ67CZ5LEfcotsTGYyhTyKzjBvkIt9/TLp/WbOmNj
 RAxJhmVpmiqQ5P6LRxB+UnC9J/u4peljQ+o32iir722bb9Dgf0LUcjfMoB/a9XTmELB4
 ONyZjUWxre58EbRA5E0PyYTi846ajIP0wpcjIxMaq3Kq5KRwZzxD46T+SRHaH82+FH9S
 et56BWQjNud/tdhkkxPc+EYHYphEOAmEnRxKXIjMxrmzEA3pnEzQryp1eyIFR8mdNahY
 X2edzDYFfZoLy5QwvcEdR61IpY3qJihsyjIoiC/NLv89Fk4lpongH+xl2WrDBJwU+5mR pA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j22dc0e4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J3b4kt017570;
	Fri, 19 Aug 2022 03:39:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3hx37jeqg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:37 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J3dZOu32047428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 03:39:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 173EE11C054;
	Fri, 19 Aug 2022 03:39:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69F0111C04C;
	Fri, 19 Aug 2022 03:39:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 03:39:34 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id ADF89604C4;
	Fri, 19 Aug 2022 13:39:29 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 18/18] powerpc/64s: Clear gprs on interrupt routine entry
Date: Fri, 19 Aug 2022 13:38:06 +1000
Message-Id: <20220819033806.162054-19-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819033806.162054-1-rmclure@linux.ibm.com>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y5WCyaV0hXwa3tOFAiFRVrUlvQixWXV5
X-Proofpoint-GUID: Y5WCyaV0hXwa3tOFAiFRVrUlvQixWXV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 mlxlogscore=942 malwarescore=0
 mlxscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190013
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
handlers.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Add benchmark data
V2 -> V3: Use ZEROIZE_GPR{,S} macro renames, clarify
interrupt_exit_user_prepare changes in summary.
---
 arch/powerpc/kernel/exceptions-64s.S | 21 ++++++++-------------
 arch/powerpc/kernel/interrupt_64.S   |  9 ++-------
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a3b51441b039..038e42fb2182 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -502,6 +502,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 	std	r10,0(r1)		/* make stack chain pointer	*/
 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
+	ZEROIZE_GPR(0)
 
 	/* Mark our [H]SRRs valid for return */
 	li	r10,1
@@ -538,14 +539,18 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r10,IAREA+EX_R10(r13)
 	std	r9,GPR9(r1)
 	std	r10,GPR10(r1)
+	ZEROIZE_GPRS(9, 10)
 	ld	r9,IAREA+EX_R11(r13)	/* move r11 - r13 to stackframe	*/
 	ld	r10,IAREA+EX_R12(r13)
 	ld	r11,IAREA+EX_R13(r13)
 	std	r9,GPR11(r1)
 	std	r10,GPR12(r1)
 	std	r11,GPR13(r1)
+	/* keep r12 ([H]SRR1/MSR), r13 (PACA) for interrupt routine */
+	ZEROIZE_GPR(11)
 
 	SAVE_NVGPRS(r1)
+	ZEROIZE_NVGPRS()
 
 	.if IDAR
 	.if IISIDE
@@ -577,8 +582,8 @@ BEGIN_FTR_SECTION
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
index ad302ad93433..f9ee93e3a0d3 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -432,9 +432,6 @@ interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_user_prepare
-	cmpdi	r3,0
-	bne-	.Lrestore_nvgprs_\srr
-.Lrestore_nvgprs_\srr\()_cont:
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 #ifdef CONFIG_PPC_BOOK3S
 .Linterrupt_return_\srr\()_user_rst_start:
@@ -448,6 +445,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 .Lfast_user_interrupt_return_\srr\():
+	REST_NVGPRS(r1)
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
 	lbz	r4,PACASRR_VALID(r13)
@@ -517,10 +515,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	b	.	/* prevent speculative execution */
 .Linterrupt_return_\srr\()_user_rst_end:
 
-.Lrestore_nvgprs_\srr\():
-	REST_NVGPRS(r1)
-	b	.Lrestore_nvgprs_\srr\()_cont
-
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_user_restart:
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user_restart)
@@ -561,6 +555,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 1:
 
 .Lfast_kernel_interrupt_return_\srr\():
+	REST_NVGPRS(r1)
 	cmpdi	cr1,r3,0
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
-- 
2.34.1

