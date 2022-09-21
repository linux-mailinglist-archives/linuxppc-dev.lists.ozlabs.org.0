Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4EB5BF6E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:01:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTpj39SMz3fG9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:01:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rI0zi7cT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rI0zi7cT;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTl467qqz3cJC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:58:08 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6jGxs020678;
	Wed, 21 Sep 2022 06:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WBLlUqrLv82d0hlhOSwtfygz1BX2oMYXIZxghkR+K3E=;
 b=rI0zi7cTslBDX0lRLt8naosfbMQe0gLwBrxa5WZvBu7Wg00veeyeVPt6KJemVfAQIFcZ
 dE9IgJFVnB6xYE6uDtVIYKovyuI5h9YCVx8ZbX++voLGaQvUB2NVDdz9MmysI3Z1Ywet
 R2Nru4Ndc8hTqE1ssJ6V4VaU32H6ISGvTrW1MvGRjNrDkakjAFQDHhg3mtjfiTnl+m73
 O7BLTCWnFtcKB6fWsDaQEzW9nnNFfsmEciKNdgMnAvXhrh7QaY44s5VwvN2WUnZBP67d
 4vv6H/zh3tzTQJG80lbQOPrAkJLT/Ga3FG4qEvA3QeJUVpHHTgAc0/+xsD2cEsrOGIm/ 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvj6twbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:02 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L6av81011166;
	Wed, 21 Sep 2022 06:58:01 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvj6twb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:01 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6rT2j004612;
	Wed, 21 Sep 2022 06:57:59 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3jn5v8mvhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:57:59 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6wNpD34472200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:58:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 977E95204F;
	Wed, 21 Sep 2022 06:57:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EBD6152050;
	Wed, 21 Sep 2022 06:57:56 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 39B2F600EE;
	Wed, 21 Sep 2022 16:57:52 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 05/25] powerpc/32: Clarify interrupt restores with REST_GPR macro in entry_32.S
Date: Wed, 21 Sep 2022 16:55:45 +1000
Message-Id: <20220921065605.1051927-6-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RnlV6y3tadCS0gGy4WpeLPbhrZRdxpkX
X-Proofpoint-GUID: iI2Hyp1oA4e9ArXuo1-GiSxr-ndux2AL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Restoring the register state of the interrupted thread involves issuing
a large number of predictable loads to the kernel stack frame. Issue the
REST_GPR{,S} macros to clearly signal when this is happening, and bunch
together restores at the end of the interrupt handler where the saved
value is not consumed earlier in the handler code.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
V3: New patch.
V4: Minimise restores in the unrecoverable window between
restoring SRR0/1 and return from interrupt.
---
 arch/powerpc/kernel/entry_32.S | 33 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 44dfce9a60c5..e4b694cebc44 100644
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
@@ -260,9 +258,8 @@ fast_exception_return:
 	beq	3f			/* if not, we've got problems */
 #endif
 
-2:	REST_GPRS(3, 6, r11)
-	lwz	r10,_CCR(r11)
-	REST_GPRS(1, 2, r11)
+2:	lwz	r10,_CCR(r11)
+	REST_GPRS(1, 6, r11)
 	mtcr	r10
 	lwz	r10,_LINK(r11)
 	mtlr	r10
@@ -277,7 +274,7 @@ fast_exception_return:
 	mtspr	SPRN_SRR0,r12
 	REST_GPR(9, r11)
 	REST_GPR(12, r11)
-	lwz	r11,GPR11(r11)
+	REST_GPR(11, r11)
 	rfi
 #ifdef CONFIG_40x
 	b .	/* Prevent prefetch past rfi */
@@ -454,9 +451,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	lwz	r3,_MSR(r1);						\
 	andi.	r3,r3,MSR_PR;						\
 	bne	interrupt_return;					\
-	lwz	r0,GPR0(r1);						\
-	lwz	r2,GPR2(r1);						\
-	REST_GPRS(3, 8, r1);						\
+	REST_GPR(0, r1);						\
+	REST_GPRS(2, 8, r1);						\
 	lwz	r10,_XER(r1);						\
 	lwz	r11,_CTR(r1);						\
 	mtspr	SPRN_XER,r10;						\
@@ -475,11 +471,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	lwz	r12,_MSR(r1);						\
 	mtspr	exc_lvl_srr0,r11;					\
 	mtspr	exc_lvl_srr1,r12;					\
-	lwz	r9,GPR9(r1);						\
-	lwz	r12,GPR12(r1);						\
-	lwz	r10,GPR10(r1);						\
-	lwz	r11,GPR11(r1);						\
-	lwz	r1,GPR1(r1);						\
+	REST_GPRS(9, 12, r1);						\
+	REST_GPR(1, r1);						\
 	exc_lvl_rfi;							\
 	b	.;		/* prevent prefetch past exc_lvl_rfi */
 
-- 
2.34.1

