Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C81EC5993C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:50:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M878K5CTgz3dxB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:50:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dhhmf1iJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dhhmf1iJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M86vQ2C30z3c7y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 13:39:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3S4KO024484;
	Fri, 19 Aug 2022 03:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VRILVZsWz05WbtIY2Xgod2X4s7yvNXhDGiouEL289/8=;
 b=dhhmf1iJXGXHH9S4Rd7yn9ZRmjLN8AcmdVJA8NUbq8srqFc/eHFfdyn1i/7zutoGlNdb
 kLerWcfTAoz4AWeWcu0k3NLsHwrgnMDXk6URfJAEOdUIq7SFeAjge3S4Fg9cKDJAAArZ
 YY90MFGrngpMTEZ/akQn1kb4wE9fdoreQXc0/zLW+3+8RjFmNy7+oGAB6RAimz2bQH30
 0Tg8APGs6mUQ1KC5gIBWuKu8ze9R1b0VA7CtaVjXu6DUbNlfiiSxNb7aZqLcDq7UVRIw
 yD+EIUXD0smUr9fjAnIYtko+7kKjZRJaOYSck7E0EzqoGC9Gp0WX4sd97xocNuA6E6nm 6Q== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j22mwgacw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:39 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J3b13l003241;
	Fri, 19 Aug 2022 03:39:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04fra.de.ibm.com with ESMTP id 3hx3k8vynp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:37 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J3dZk530343466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 03:39:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 171E111C052;
	Fri, 19 Aug 2022 03:39:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 696E511C04A;
	Fri, 19 Aug 2022 03:39:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 03:39:34 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AA289604D2;
	Fri, 19 Aug 2022 13:39:29 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 16/18] powerpc/32: Clarify interrupt restores with REST_GPR macro in entry_32.S
Date: Fri, 19 Aug 2022 13:38:04 +1000
Message-Id: <20220819033806.162054-17-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819033806.162054-1-rmclure@linux.ibm.com>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tplPmbZiPabd0g0QS3_-_a626jEoxDsi
X-Proofpoint-ORIG-GUID: tplPmbZiPabd0g0QS3_-_a626jEoxDsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=931
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Restoring the register state of the interrupted thread involves issuing
a large number of predictable loads to the kernel stack frame. Issue the
REST_GPR{,S} macros to clearly signal when this is happening, and bunch
together restores at the end of the interrupt handler where the saved
value is not consumed earlier in the handler code.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
V2 -> V3: New patch.
---
 arch/powerpc/kernel/entry_32.S | 35 ++++++++++++--------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 8d6e02ef5dc0..03a105a5806a 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -68,7 +68,7 @@ prepare_transfer_to_handler:
 	lwz	r9,_MSR(r11)		/* if sleeping, clear MSR.EE */
 	rlwinm	r9,r9,0,~MSR_EE
 	lwz	r12,_LINK(r11)		/* and return to address in LR */
-	lwz	r2, GPR2(r11)
+	REST_GPR(2, r11)
 	b	fast_exception_return
 _ASM_NOKPROBE_SYMBOL(prepare_transfer_to_handler)
 #endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_E500 */
@@ -144,7 +144,7 @@ ret_from_syscall:
 	lwz	r7,_NIP(r1)
 	lwz	r8,_MSR(r1)
 	cmpwi	r3,0
-	lwz	r3,GPR3(r1)
+	REST_GPR(3, r1)
 syscall_exit_finish:
 	mtspr	SPRN_SRR0,r7
 	mtspr	SPRN_SRR1,r8
@@ -152,8 +152,8 @@ syscall_exit_finish:
 	bne	3f
 	mtcr	r5
 
-1:	lwz	r2,GPR2(r1)
-	lwz	r1,GPR1(r1)
+1:	REST_GPR(2, r1)
+	REST_GPR(1, r1)
 	rfi
 #ifdef CONFIG_40x
 	b .	/* Prevent prefetch past rfi */
@@ -165,10 +165,8 @@ syscall_exit_finish:
 	REST_NVGPRS(r1)
 	mtctr	r4
 	mtxer	r5
-	lwz	r0,GPR0(r1)
-	lwz	r3,GPR3(r1)
-	REST_GPRS(4, 11, r1)
-	lwz	r12,GPR12(r1)
+	REST_GPR(0, r1)
+	REST_GPRS(3, 12, r1)
 	b	1b
 
 #ifdef CONFIG_44x
@@ -260,24 +258,22 @@ fast_exception_return:
 	beq	3f			/* if not, we've got problems */
 #endif
 
-2:	REST_GPRS(3, 6, r11)
-	lwz	r10,_CCR(r11)
-	REST_GPRS(1, 2, r11)
+2:	lwz	r10,_CCR(r11)
 	mtcr	r10
 	lwz	r10,_LINK(r11)
 	mtlr	r10
 	/* Clear the exception_marker on the stack to avoid confusing stacktrace */
 	li	r10, 0
 	stw	r10, 8(r11)
-	REST_GPR(10, r11)
 #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
 	mtspr	SPRN_NRI, r0
 #endif
 	mtspr	SPRN_SRR1,r9
 	mtspr	SPRN_SRR0,r12
-	REST_GPR(9, r11)
+	REST_GPRS(1, 6, r11)
+	REST_GPRS(9, 10, r11)
 	REST_GPR(12, r11)
-	lwz	r11,GPR11(r11)
+	REST_GPR(11, r11)
 	rfi
 #ifdef CONFIG_40x
 	b .	/* Prevent prefetch past rfi */
@@ -454,9 +450,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	lwz	r3,_MSR(r1);						\
 	andi.	r3,r3,MSR_PR;						\
 	bne	interrupt_return;					\
-	lwz	r0,GPR0(r1);						\
-	lwz	r2,GPR2(r1);						\
-	REST_GPRS(3, 8, r1);						\
+	REST_GPR(0, r1);						\
 	lwz	r10,_XER(r1);						\
 	lwz	r11,_CTR(r1);						\
 	mtspr	SPRN_XER,r10;						\
@@ -475,11 +469,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	lwz	r12,_MSR(r1);						\
 	mtspr	exc_lvl_srr0,r11;					\
 	mtspr	exc_lvl_srr1,r12;					\
-	lwz	r9,GPR9(r1);						\
-	lwz	r12,GPR12(r1);						\
-	lwz	r10,GPR10(r1);						\
-	lwz	r11,GPR11(r1);						\
-	lwz	r1,GPR1(r1);						\
+	REST_GPRS(2, 12, r1);						\
+	REST_GPR(1, r1);						\
 	exc_lvl_rfi;							\
 	b	.;		/* prevent prefetch past exc_lvl_rfi */
 
-- 
2.34.1

