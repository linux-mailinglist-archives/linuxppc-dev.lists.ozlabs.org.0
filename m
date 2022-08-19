Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 302E25993AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M872T0gSVz3f0b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:45:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nXwOR/KI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nXwOR/KI;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M86vN0j8yz3c9L
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 13:39:42 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3ZEFg031648;
	Fri, 19 Aug 2022 03:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dWo9aQYG3dPp1I2xdVIdiHppd0KXvmVGPQy2wqfCMf0=;
 b=nXwOR/KIz5Q3cDGq40XifXxqdkuzDUJgzLdOOEudEqyz0GE166IeVtHo4XtQiLUmGrn7
 I4v9VyyJbwNgvKykGlyjFT6ef3uongJhHOH72jczuCqrFWVYAKHAJQzj8vguqSwPX0Nn
 mUA0v363JRp+CEDqmBcvdStbaPN2ZCUNZ0MsEzilvwBerDkMREdTBY0DFFeOUEciFr+b
 yj9tm8NqDcg5EElx5jsEtAXDutVp83tRj4g7pH0zwtVsdkkQJqX0km5eCKjuYxfHS4uu
 NJE09GdwpRYgeAK28O5CeqWAsIYBEHQmaCVxHnF6oAzRzvL8gA/sBX8cOuOWcljYUCw6 xA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j22dc0e4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:38 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J3daBR020350;
	Fri, 19 Aug 2022 03:39:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3hx3k8xpmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:36 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J3aj7d31654296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 03:36:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7493042041;
	Fri, 19 Aug 2022 03:39:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C72764203F;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A79C5604D1;
	Fri, 19 Aug 2022 13:39:29 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 15/18] powerpc/64s: Use {ZEROIZE,SAVE,REST}_GPRS macros in sc, scv 0 handlers
Date: Fri, 19 Aug 2022 13:38:03 +1000
Message-Id: <20220819033806.162054-16-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819033806.162054-1-rmclure@linux.ibm.com>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: POOxEpFAo9L41TcRaOPXDG_7Btt5IXgs
X-Proofpoint-GUID: POOxEpFAo9L41TcRaOPXDG_7Btt5IXgs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 mlxlogscore=909 malwarescore=0
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

Use the convenience macros for saving/clearing/restoring gprs in keeping
with syscall calling conventions. The plural variants of these macros
can store a range of registers for concision.

This works well when the user gpr value we are hoping to save is still
live. In the syscall interrupt handlers, user register state is
sometimes juggled between registers. Hold-off from issuing the SAVE_GPR
macro for applicable neighbouring lines to highlight the delicate
register save logic.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Update summary
V2 -> V3: Update summary regarding exclusions for the SAVE_GPR marco.
Acknowledge new name for ZEROIZE_GPR{,S} macros.
---
 arch/powerpc/kernel/interrupt_64.S | 51 +++++++---------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index d9625113c7a5..ad302ad93433 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -71,12 +71,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	mfcr	r12
 	li	r11,0
 	/* Save syscall parameters in r3-r8 */
-	std	r3,GPR3(r1)
-	std	r4,GPR4(r1)
-	std	r5,GPR5(r1)
-	std	r6,GPR6(r1)
-	std	r7,GPR7(r1)
-	std	r8,GPR8(r1)
+	SAVE_GPRS(3, 8, r1)
 	/* Zero r9-r12, this should only be required when restoring all GPRs */
 	std	r11,GPR9(r1)
 	std	r11,GPR10(r1)
@@ -113,8 +108,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * Zero user registers to prevent influencing speculative execution
 	 * state of kernel code.
 	 */
-	NULLIFY_GPRS(5, 12)
-	NULLIFY_NVGPRS()
+	ZEROIZE_GPRS(5, 12)
+	ZEROIZE_NVGPRS()
 
 	/* Calling convention has r3 = orig r0, r4 = regs */
 	mr	r3,r0
@@ -157,17 +152,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	/* Could zero these as per ABI, but we may consider a stricter ABI
 	 * which preserves these if libc implementations can benefit, so
 	 * restore them for now until further measurement is done. */
-	ld	r0,GPR0(r1)
-	ld	r4,GPR4(r1)
-	ld	r5,GPR5(r1)
-	ld	r6,GPR6(r1)
-	ld	r7,GPR7(r1)
-	ld	r8,GPR8(r1)
+	REST_GPR(0, r1)
+	REST_GPRS(4, 8, r1)
 	/* Zero volatile regs that may contain sensitive kernel data */
-	li	r9,0
-	li	r10,0
-	li	r11,0
-	li	r12,0
+	ZEROIZE_GPRS(9, 12)
 	mtspr	SPRN_XER,r0
 
 	/*
@@ -189,7 +177,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r4,_LINK(r1)
 	ld	r5,_XER(r1)
 
-	ld	r0,GPR0(r1)
+	REST_GPR(0, r1)
 	mtcr	r2
 	mtctr	r3
 	mtlr	r4
@@ -257,12 +245,7 @@ END_BTB_FLUSH_SECTION
 	mfcr	r12
 	li	r11,0
 	/* Save syscall parameters in r3-r8 */
-	std	r3,GPR3(r1)
-	std	r4,GPR4(r1)
-	std	r5,GPR5(r1)
-	std	r6,GPR6(r1)
-	std	r7,GPR7(r1)
-	std	r8,GPR8(r1)
+	SAVE_GPRS(3, 8, r1)
 	/* Zero r9-r12, this should only be required when restoring all GPRs */
 	std	r11,GPR9(r1)
 	std	r11,GPR10(r1)
@@ -311,8 +294,8 @@ END_BTB_FLUSH_SECTION
 	 * Zero user registers to prevent influencing speculative execution
 	 * state of kernel code.
 	 */
-	NULLIFY_GPRS(5, 12)
-	NULLIFY_NVGPRS()
+	ZEROIZE_GPRS(5, 12)
+	ZEROIZE_NVGPRS()
 
 	/* Calling convention has r3 = orig r0, r4 = regs */
 	mr	r3,r0
@@ -360,16 +343,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	cmpdi	r3,0
 	bne	.Lsyscall_restore_regs
 	/* Zero volatile regs that may contain sensitive kernel data */
-	li	r0,0
-	li	r4,0
-	li	r5,0
-	li	r6,0
-	li	r7,0
-	li	r8,0
-	li	r9,0
-	li	r10,0
-	li	r11,0
-	li	r12,0
+	ZEROIZE_GPR(0)
+	ZEROIZE_GPRS(4, 12)
 	mtctr	r0
 	mtspr	SPRN_XER,r0
 .Lsyscall_restore_regs_cont:
@@ -394,7 +369,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r4,_XER(r1)
 	mtctr	r3
 	mtspr	SPRN_XER,r4
-	ld	r0,GPR0(r1)
+	REST_GPR(0, r1)
 	REST_GPRS(4, 12, r1)
 	b	.Lsyscall_restore_regs_cont
 .Lsyscall_rst_end:
-- 
2.34.1

