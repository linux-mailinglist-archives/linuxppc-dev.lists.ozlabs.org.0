Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EC65BA66F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:41:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNH24VLsz3fTw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:41:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ek9eVZHi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ek9eVZHi;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5k735Pz3bf5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:29 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G4kRZB011434;
	Fri, 16 Sep 2022 05:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4926VnHpQh3Kq1re0+wYPCtHEOlsY5QtjgmFnk6fbmE=;
 b=Ek9eVZHi3vHxf9DF75w9WEH5BRTq+9G/4ykdOmu/EvGsCbC65iQeEr45m2D/hpnV7AV3
 oi/UDqhuxb1+CTfD1qx8eSm3QMxwREZM09NF5cw63ee0zYJMSPpt0C+NG9263JQYbrcB
 qXX5hOGPuPnNjKvvnNCAFKLlE9JTln00fXkmX4VKh425Kq+eVczFol9hvD05OLxw3os2
 j7RYRPvSnPGdz26y9E8VlscyqAC9PQRVqBDYt3Q2hksVpCpH5Tgbrx9QHZ/epIfYQjEX
 hl/1bH6HLNqRx2CXR9nWLuuz5PUuWqWSK52cZIi7iz0V52eZoBHdRkRmeibN21Rpqeqk Sw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmjdg99rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5Kia2020998;
	Fri, 16 Sep 2022 05:33:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3jm9218gwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5XIp539190814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74DA211C052;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA8CA11C04A;
	Fri, 16 Sep 2022 05:33:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:17 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3C08160434;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/23] powerpc/32: Clarify interrupt restores with REST_GPR macro in entry_32.S
Date: Fri, 16 Sep 2022 15:32:42 +1000
Message-Id: <20220916053300.786330-6-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: txnoUP8dES1AucagU_UWDk1ONDcFoZUK
X-Proofpoint-ORIG-GUID: txnoUP8dES1AucagU_UWDk1ONDcFoZUK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=872
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160041
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
V3 -> V4: Minimise restores in the unrecoverable window between
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

