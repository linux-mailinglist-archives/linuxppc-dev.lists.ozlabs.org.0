Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE57E5BF6E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:00:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTnx2y2Fz3fBM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:00:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rq76WEbf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rq76WEbf;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTkm6wrYz3cCV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:57:52 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6iIFV029760;
	Wed, 21 Sep 2022 06:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Q9mYPi0O2NefTV2pP079A7EZC0odhnGSUbG0hZeFMpU=;
 b=Rq76WEbfTe7GJAF/Xu1L888ZY6DNscIurxyFbdmSa4vXIbEgB6/B/NRhpOnsjdYpjtnI
 BzT0r0L9urbxxyZ9ljNT2Hc7Zz+OhyHX3U2ztjn+A3Ids5J2yRzyY9ort6sNLhUNmUfv
 3SjzhQk9Pu3X2Ph2jUZzeqXr82p+HZNXTVp5zMtnQzmEI/16CxrjlhN9/g9t+SmDaNo7
 en8IwzSX9LY0+JmvKhSEsKiUrIHd1hBj13E997TR1eNoDS3p+C+ulirUCrrclaQi9DDr
 1J9aJeDlvf7yqiHQspr+EpSt8IwL1FwhJ3OFSXcIfFTCf8fH8E2T+XqEmKO42zAskzTq 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqwkv8anq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:57:48 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L6jkwH001352;
	Wed, 21 Sep 2022 06:57:47 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqwkv8an8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:57:47 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6qHXk002807;
	Wed, 21 Sep 2022 06:57:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06fra.de.ibm.com with ESMTP id 3jn5ghkm3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:57:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6vhbQ15598056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:57:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84908A4062;
	Wed, 21 Sep 2022 06:57:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D86ACA4054;
	Wed, 21 Sep 2022 06:57:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:57:42 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8836A60060;
	Wed, 21 Sep 2022 16:57:39 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 04/25] powerpc/64s: Use {ZEROIZE,SAVE,REST}_GPRS macros in sc, scv 0 handlers
Date: Wed, 21 Sep 2022 16:55:44 +1000
Message-Id: <20220921065605.1051927-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UN80bAfCNCrfo8qMJhT9aGF1rdtdOz9n
X-Proofpoint-ORIG-GUID: BkkQcBkEBfGB1CqZwmxUshnYLCNOkJ-V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_03,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=895 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210043
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
V2: Update summary
V3: Update summary regarding exclusions for the SAVE_GPR marco.
ledge new name for ZEROIZE_GPR{,S} macros.
V5: Move to beginning of series
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

