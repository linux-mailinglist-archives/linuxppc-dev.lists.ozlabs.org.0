Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6B857F973
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:32:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrqwm3Cs5z3fHZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:32:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lgj0dDgd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lgj0dDgd;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrqvW3hXDz3d9p
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:31:51 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P6BxtI008754;
	Mon, 25 Jul 2022 06:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=cgISPX9Kpc88TeOKqvzi346iFEvOqpKyPFI/ZJ0t2qE=;
 b=Lgj0dDgdy2RTfdmS7FyMHCggpIvR/ioFJVX+6NlUgGYQZg2kqjM5kpaB34VRVLkjTJOF
 MQ/5vna/RptKWfdIJOdmb9CDCjN1b4PIW78d44880tpfyYgKvbvG3NVfwnxXMswG2Oqw
 Zm69bzsTxCQqc36DYLK7rJW4ltjCFV14sUm8YJmFB5f6X7pU4aTRAwUTSer1tZeV5DkI
 bsF1OteZ47DC6HWdHWGdywqF+6l9x9Na+hyCZtwG4DcAG9lQnVHCbYSoD0BKwdTHRklR
 fLsCSLD5+qG02gSyvrlisZQ1sSzfJSzmZ8hO0XGp8BROD6EveAqmEaqvrGZ9FoyCShnY mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnpp8fdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:31:47 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P6FoNK027255;
	Mon, 25 Jul 2022 06:31:46 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnpp8fbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:31:46 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26P6K57R001333;
	Mon, 25 Jul 2022 06:31:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03fra.de.ibm.com with ESMTP id 3hg95y9fm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:31:43 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26P6VfKv24510960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 06:31:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31248AE055;
	Mon, 25 Jul 2022 06:31:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54CD7AE045;
	Mon, 25 Jul 2022 06:31:39 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.53])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jul 2022 06:31:38 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/14] powerpc/64s: Use {NULLIFY,SAVE,REST}_GPRS macros in sc, scv 0 handlers
Date: Mon, 25 Jul 2022 16:31:36 +1000
Message-Id: <20220725063136.121108-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6R7hZFBIV_rKQRP77ldxnK-AqLc2KgCe
X-Proofpoint-ORIG-GUID: diMFdCEcT2FzvviSMwyXqNgRZX1z4wHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=875 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Use the convenience macros for saving/clearing/restoring gprs in keeping
with syscall calling conventions. The plural variants of these macros
can store a range of registers for concision.

This works well when the save-to-stack logic is simple (a gpr is saved
to its corresponding offset in the struct pt_regs on the stack).
Wherever a different gpr is storing the initial value of another gpr at
the interrupt location, care must be taken to issue the correct save
instruction and so the macros are not applied in neighbouring stores.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Update summary
---
 arch/powerpc/kernel/interrupt_64.S | 29 ++++++----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 34167cfa5d60..efaf162fa772 100644
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
@@ -156,17 +151,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
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
+	NULLIFY_GPRS(9, 12)
 	mtspr	SPRN_XER,r0
 
 	/*
@@ -188,7 +176,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r4,_LINK(r1)
 	ld	r5,_XER(r1)
 
-	ld	r0,GPR0(r1)
+	REST_GPR(0, r1)
 	mtcr	r2
 	mtctr	r3
 	mtlr	r4
@@ -256,12 +244,7 @@ END_BTB_FLUSH_SECTION
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
-- 
2.34.1

