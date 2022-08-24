Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B49759F156
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8qs2Q0Bz3f2l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 12:17:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SSmW87PQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SSmW87PQ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8cY4Y3Wz3cB7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 12:07:25 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O201E6009206;
	Wed, 24 Aug 2022 02:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EsaSD6Nb6j/4nUWEGW1nsigmGn3CzUMID7nASZFesJ0=;
 b=SSmW87PQMUsyu7AHHUSs4MUELicq/VmFYfO8qhijPKQgpt6BK6JNA5N4+MjdhFsEJRCZ
 f/yVR97QcSJhDJhcyhKc5aWtNCMQrm8dSurNoyA5kOhuIXQaK2Ur8IeuZXUIKNsoBQrc
 mCsiJyeLTkTCHO7rHFtU/T0YOwn7Ydw+WYv+F4magxXcLUD69h3mLVryRLGavWNWTTqp
 i/n55PzaBPRaciBoMjkPfjwpoY2CQxu3Q+JDzTw3psNs3/fQrENF3vB6bfds/l+1UJgT
 bIBQCTgI9PSx0dVBKTqx9b2e0DH++6HAtuJLmsj5o7RHg+/cFrqlj0KsKC+ylBwdiAbA Cg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5atag5qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:07:19 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O25Q1V013960;
	Wed, 24 Aug 2022 02:07:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3j2pvj4gkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:07:17 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27O27Fw128574194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Aug 2022 02:07:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 501A952050;
	Wed, 24 Aug 2022 02:07:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A4D8F5204F;
	Wed, 24 Aug 2022 02:07:14 +0000 (GMT)
Received: from civic.. (unknown [9.177.18.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B5E3160151;
	Wed, 24 Aug 2022 12:07:11 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 17/20] powerpc/64e: Clarify register saves and clears with {SAVE,ZEROIZE}_GPRS
Date: Wed, 24 Aug 2022 12:05:45 +1000
Message-Id: <20220824020548.62625-18-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824020548.62625-1-rmclure@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6QLJ8WRd4pTfP776B8lUkvSdgba7wWCP
X-Proofpoint-ORIG-GUID: 6QLJ8WRd4pTfP776B8lUkvSdgba7wWCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=712 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208240005
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

The common interrupt handler prologue macro and the bad_stack
trampolines include consecutive sequences of register saves, and some
register clears. Neaten such instances by expanding use of the SAVE_GPRS
macro and employing the ZEROIZE_GPR macro when appropriate.

Also simplify an invocation of SAVE_GPRS targetting all non-volatile
registers to SAVE_NVGPRS.

Signed-off-by: Rohan Mclure <rmclure@linux.ibm.com>
---
V3 -> V4: New commit.
---
 arch/powerpc/kernel/exceptions-64e.S | 27 +++++++++++---------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 67dc4e3179a0..48c640ca425d 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -216,17 +216,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
 	mtlr	r10
 	mtcr	r11
 
-	ld	r10,GPR10(r1)
-	ld	r11,GPR11(r1)
-	ld	r12,GPR12(r1)
+	REST_GPRS(10, 12, r1)
 	mtspr	\scratch,r0
 
 	std	r10,\paca_ex+EX_R10(r13);
 	std	r11,\paca_ex+EX_R11(r13);
 	ld	r10,_NIP(r1)
 	ld	r11,_MSR(r1)
-	ld	r0,GPR0(r1)
-	ld	r1,GPR1(r1)
+	REST_GPRS(0, 1, r1)
 	mtspr	\srr0,r10
 	mtspr	\srr1,r11
 	ld	r10,\paca_ex+EX_R10(r13)
@@ -372,16 +369,15 @@ ret_from_mc_except:
 /* Core exception code for all exceptions except TLB misses. */
 #define EXCEPTION_COMMON_LVL(n, scratch, excf)				    \
 exc_##n##_common:							    \
-	std	r0,GPR0(r1);		/* save r0 in stackframe */	    \
-	std	r2,GPR2(r1);		/* save r2 in stackframe */	    \
-	SAVE_GPRS(3, 9, r1);		/* save r3 - r9 in stackframe */    \
+	SAVE_GPR(0, r1);		/* save r0 in stackframe */	    \
+	SAVE_GPRS(2, 9, r1);		/* save r2 - r9 in stackframe */    \
 	std	r10,_NIP(r1);		/* save SRR0 to stackframe */	    \
 	std	r11,_MSR(r1);		/* save SRR1 to stackframe */	    \
 	beq	2f;			/* if from kernel mode */	    \
 2:	ld	r3,excf+EX_R10(r13);	/* get back r10 */		    \
 	ld	r4,excf+EX_R11(r13);	/* get back r11 */		    \
 	mfspr	r5,scratch;		/* get back r13 */		    \
-	std	r12,GPR12(r1);		/* save r12 in stackframe */	    \
+	SAVE_GPR(12, r1);		/* save r12 in stackframe */	    \
 	ld	r2,PACATOC(r13);	/* get kernel TOC into r2 */	    \
 	mflr	r6;			/* save LR in stackframe */	    \
 	mfctr	r7;			/* save CTR in stackframe */	    \
@@ -390,7 +386,7 @@ exc_##n##_common:							    \
 	lwz	r10,excf+EX_CR(r13);	/* load orig CR back from PACA	*/  \
 	lbz	r11,PACAIRQSOFTMASK(r13); /* get current IRQ softe */	    \
 	ld	r12,exception_marker@toc(r2);				    \
-	li	r0,0;							    \
+	ZEROIZE_GPR(0);							    \
 	std	r3,GPR10(r1);		/* save r10 to stackframe */	    \
 	std	r4,GPR11(r1);		/* save r11 to stackframe */	    \
 	std	r5,GPR13(r1);		/* save it to stackframe */	    \
@@ -1056,15 +1052,14 @@ bad_stack_book3e:
 	mfspr	r11,SPRN_ESR
 	std	r10,_DEAR(r1)
 	std	r11,_ESR(r1)
-	std	r0,GPR0(r1);		/* save r0 in stackframe */	    \
-	std	r2,GPR2(r1);		/* save r2 in stackframe */	    \
-	SAVE_GPRS(3, 9, r1);		/* save r3 - r9 in stackframe */    \
+	SAVE_GPR(0, r1);		/* save r0 in stackframe */	    \
+	SAVE_GPRS(2, 9, r1);		/* save r2 - r9 in stackframe */    \
 	ld	r3,PACA_EXGEN+EX_R10(r13);/* get back r10 */		    \
 	ld	r4,PACA_EXGEN+EX_R11(r13);/* get back r11 */		    \
 	mfspr	r5,SPRN_SPRG_GEN_SCRATCH;/* get back r13 XXX can be wrong */ \
 	std	r3,GPR10(r1);		/* save r10 to stackframe */	    \
 	std	r4,GPR11(r1);		/* save r11 to stackframe */	    \
-	std	r12,GPR12(r1);		/* save r12 in stackframe */	    \
+	SAVE_GPR(12, r1);		/* save r12 in stackframe */	    \
 	std	r5,GPR13(r1);		/* save it to stackframe */	    \
 	mflr	r10
 	mfctr	r11
@@ -1072,12 +1067,12 @@ bad_stack_book3e:
 	std	r10,_LINK(r1)
 	std	r11,_CTR(r1)
 	std	r12,_XER(r1)
-	SAVE_GPRS(14, 31, r1)
+	SAVE_NVGPRS(r1)
 	lhz	r12,PACA_TRAP_SAVE(r13)
 	std	r12,_TRAP(r1)
 	addi	r11,r1,INT_FRAME_SIZE
 	std	r11,0(r1)
-	li	r12,0
+	ZEROIZE_GPR(12)
 	std	r12,0(r11)
 	ld	r2,PACATOC(r13)
 1:	addi	r3,r1,STACK_FRAME_OVERHEAD
-- 
2.34.1

