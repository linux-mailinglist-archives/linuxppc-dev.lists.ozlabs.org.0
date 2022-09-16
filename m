Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652D25BA66B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:40:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNFY5Chqz3fFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:40:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X1h+tY6S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X1h+tY6S;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5k5Dg0z3bd5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:29 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5M8pm010242;
	Fri, 16 Sep 2022 05:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MqDfa9+oQZlTfQXjOGlYzU4iBNV4NiAlSpTWYSMJtOs=;
 b=X1h+tY6SlTnqmzQ5kkKjW/y8ZaSTWZrRfYjBvXkpfoqUECgnBtlYe1/xFbZQzv+vcTZw
 5MJyZWjmwqglEi38PNo1hC6YCxWNl5iPLm9gwS96QKd7v6PeVLwR2BjanaGEgeYQE/5m
 jqmTyBbWyXpBQx91wdsmmU2MjTyeAG/C8meiVUvCa/0KdrNKHQMAuoJP2gOw2ANteSVl
 MrDyMGylrY5XIL3IsAx93AQOJfsJQmoFcYs03N7ID29voYuhQ5eWRrXya51Ik+lyVOdp
 FoS7OpzUz3mSxlPwLRZmUL+LR7qKExg0cegFU7elRXbUpSHqLe4XNW1wjbBOIMEQCWGN ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmjxe88rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:21 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28G5O2fP015585;
	Fri, 16 Sep 2022 05:33:21 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmjxe88qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:20 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5LCYA017451;
	Fri, 16 Sep 2022 05:33:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma05fra.de.ibm.com with ESMTP id 3jm91crcnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:19 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5Xgd529425924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E172B11C050;
	Fri, 16 Sep 2022 05:33:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 433D211C04C;
	Fri, 16 Sep 2022 05:33:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:16 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 349EC60425;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/23] powerpc/64s: Use {ZEROIZE,SAVE,REST}_GPRS macros in sc, scv 0 handlers
Date: Fri, 16 Sep 2022 15:32:41 +1000
Message-Id: <20220916053300.786330-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zIiGqm4uP35EoeqfNv9Nul-ntWcVsuZL
X-Proofpoint-ORIG-GUID: qg0Bv9QHh7nbqY8Z2L0BVecmrj0myamo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=876 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160041
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
V1 -> V2: Update summary
V2 -> V3: Update summary regarding exclusions for the SAVE_GPR marco.
Acknowledge new name for ZEROIZE_GPR{,S} macros.
V4 -> V5: Move to beginning of series
---
 arch/powerpc/kernel/interrupt_64.S | 43 ++++++----------------------
 1 file changed, 9 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 71d2d9497283..7d92a7a54727 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -71,12 +71,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	mfcr	r12
 	li	r11,0
 	/* Can we avoid saving r3-r8 in common case? */
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
@@ -149,17 +144,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
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
@@ -182,7 +170,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r5,_XER(r1)
 
 	REST_NVGPRS(r1)
-	ld	r0,GPR0(r1)
+	REST_GPR(0, r1)
 	mtcr	r2
 	mtctr	r3
 	mtlr	r4
@@ -250,12 +238,7 @@ END_BTB_FLUSH_SECTION
 	mfcr	r12
 	li	r11,0
 	/* Can we avoid saving r3-r8 in common case? */
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
@@ -345,16 +328,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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
@@ -380,7 +355,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	REST_NVGPRS(r1)
 	mtctr	r3
 	mtspr	SPRN_XER,r4
-	ld	r0,GPR0(r1)
+	REST_GPR(0, r1)
 	REST_GPRS(4, 12, r1)
 	b	.Lsyscall_restore_regs_cont
 .Lsyscall_rst_end:
-- 
2.34.1

