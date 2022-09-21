Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544085BF6E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:01:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTqN6x5pz3fKk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:01:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aXisOc2a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aXisOc2a;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTl904mlz3cdc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:58:12 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6gTMC025684;
	Wed, 21 Sep 2022 06:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GcvPoQOndk8Z0TJUTGNSKhBUOgfnOBy8791Un8Li6+Q=;
 b=aXisOc2a5oLz3EVaiHLY6860wF0dDHeJraijyzUlosW9RVN+lF9a1pGEQbxlKFwOv9fX
 GP4Bf3oZruvgSl2HjjAlMi9PFOwIPjXSXI8UCyy4BYYr8Bh2krPLcI/CkVHPvqzTATwN
 67Rj+8Ettv2MJHLTRikm96ttsGZyU/cwmwhvOzOmxYXpKw7cBQnGqG+otqtCtRmIcrlL
 KhTLEu/YwCOetD8qFwa4WtjSfR0RDrWQX/IiZRqVtJvUKygCRGrcJ32TGqQEQnxtMBA8
 6qLUC9bsBdykgeQZYwe5etUjU4usKTGVspkVeTrj5FYJA8y/55SDcczqbruYCpPCc5J9 bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqwju8dea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:08 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L6hJaG030895;
	Wed, 21 Sep 2022 06:58:08 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqwju8ddb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:08 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6pqSE002721;
	Wed, 21 Sep 2022 06:58:06 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06fra.de.ibm.com with ESMTP id 3jn5ghkm3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:05 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6s3We37683676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:54:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95E4211C050;
	Wed, 21 Sep 2022 06:58:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA04F11C058;
	Wed, 21 Sep 2022 06:58:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:58:02 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7D965600EE;
	Wed, 21 Sep 2022 16:57:59 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 06/25] powerpc/64e: Clarify register saves and clears with {SAVE,ZEROIZE}_GPRS
Date: Wed, 21 Sep 2022 16:55:46 +1000
Message-Id: <20220921065605.1051927-7-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GLvknxeQ6y_GQJuJ_zvPQ6Rc3in6ZTx9
X-Proofpoint-ORIG-GUID: K1PebvQO7LoDWyY9-DYZMAFmm-Rp5dTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_03,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 mlxlogscore=796 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The common interrupt handler prologue macro and the bad_stack
trampolines include consecutive sequences of register saves, and some
register clears. Neaten such instances by expanding use of the SAVE_GPRS
macro and employing the ZEROIZE_GPR macro when appropriate.

Also simplify an invocation of SAVE_GPRS targetting all non-volatile
registers to SAVE_NVGPRS.

Signed-off-by: Rohan Mclure <rmclure@linux.ibm.com>
Reported-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
V4: New commit.
V6: Split REST_GPRS(0, 1, r1) to remove dependence on macro
implementation ordering the r0 restore before r1 restore.
---
 arch/powerpc/kernel/exceptions-64e.S | 28 +++++++++++---------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 67dc4e3179a0..f1d714acc945 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -216,17 +216,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
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
+	REST_GPR(0, r1)
+	REST_GPR(1, r1)
 	mtspr	\srr0,r10
 	mtspr	\srr1,r11
 	ld	r10,\paca_ex+EX_R10(r13)
@@ -372,16 +370,15 @@ ret_from_mc_except:
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
@@ -390,7 +387,7 @@ exc_##n##_common:							    \
 	lwz	r10,excf+EX_CR(r13);	/* load orig CR back from PACA	*/  \
 	lbz	r11,PACAIRQSOFTMASK(r13); /* get current IRQ softe */	    \
 	ld	r12,exception_marker@toc(r2);				    \
-	li	r0,0;							    \
+	ZEROIZE_GPR(0);							    \
 	std	r3,GPR10(r1);		/* save r10 to stackframe */	    \
 	std	r4,GPR11(r1);		/* save r11 to stackframe */	    \
 	std	r5,GPR13(r1);		/* save it to stackframe */	    \
@@ -1056,15 +1053,14 @@ bad_stack_book3e:
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
@@ -1072,12 +1068,12 @@ bad_stack_book3e:
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

