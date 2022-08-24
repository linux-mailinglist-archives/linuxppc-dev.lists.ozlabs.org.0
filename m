Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6816259F15B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:19:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8t521Blz3cj5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 12:19:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GL79rBO0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GL79rBO0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8cb1bbdz3cCP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 12:07:27 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O0xE6T024156;
	Wed, 24 Aug 2022 02:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xFIMCVV8Z0cKjGL0VGII2UwzJsPsZiS3+ss0jio41mA=;
 b=GL79rBO0iQm+OaZ9L6HVaN/NwQB4/KWdPZiRj9IdluwdDm/40/MpkwYOkxrm9Z7pNUAu
 XxVGQ71/T+GL8nlhI14Ys/IOxKgo9wRUtGjGR/qUKK6pbS49Ot1MAfWDleAIpcMr3lbj
 JYn2pd3L3HuYgnSODjT1RZzlDVDKmkIq31k48c7uFhszw/Pzu2YyzdvZ/jeKm0GMXVh9
 qM0RTJF+j24DlF4Gwe7mg0P2+haLZAk3eEfopetHt/9T3Z5pUtWwQvXW8dThJy4CzQGy
 cHLxJSrufamC1s86BrkHWKADHo8dRzI9yDvE0IlIz+t+ABL0oBV/XV8SbbIJCxu6X7AP yQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j59x61e6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:07:10 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O25pXK014373;
	Wed, 24 Aug 2022 02:07:08 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3j2pvj4gke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:07:08 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27O27Qq136307254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Aug 2022 02:07:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6453C52054;
	Wed, 24 Aug 2022 02:07:06 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0DFB452050;
	Wed, 24 Aug 2022 02:07:06 +0000 (GMT)
Received: from civic.. (unknown [9.177.18.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1DC7760151;
	Wed, 24 Aug 2022 12:07:02 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 14/20] powerpc/64s: Clear/restore caller gprs in syscall interrupt/return
Date: Wed, 24 Aug 2022 12:05:42 +1000
Message-Id: <20220824020548.62625-15-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824020548.62625-1-rmclure@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t4DjwRLMTDwruYYk7uSX3PvcLcKs0s62
X-Proofpoint-ORIG-GUID: t4DjwRLMTDwruYYk7uSX3PvcLcKs0s62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=536 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240005
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

Clear user state in gprs (assign to zero) to reduce the influence of user
registers on speculation within kernel syscall handlers. Clears occur
at the very beginning of the sc and scv 0 interrupt handlers, with
restores occurring following the execution of the syscall handler.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Update summary
V2 -> V3: Remove erroneous summary paragraph on syscall_exit_prepare
V3 -> V4: Use ZEROIZE instead of NULLIFY
---
 arch/powerpc/kernel/interrupt_64.S | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 0178aeba3820..a8065209dd8c 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -70,7 +70,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	ld	r2,PACATOC(r13)
 	mfcr	r12
 	li	r11,0
-	/* Can we avoid saving r3-r8 in common case? */
+	/* Save syscall parameters in r3-r8 */
 	std	r3,GPR3(r1)
 	std	r4,GPR4(r1)
 	std	r5,GPR5(r1)
@@ -109,6 +109,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * but this is the best we can do.
 	 */
 
+	/*
+	 * Zero user registers to prevent influencing speculative execution
+	 * state of kernel code.
+	 */
+	ZEROIZE_GPRS(5, 12)
+	ZEROIZE_NVGPRS()
+
 	/* Calling convention has r3 = orig r0, r4 = regs */
 	mr	r3,r0
 	bl	system_call_exception
@@ -139,6 +146,7 @@ BEGIN_FTR_SECTION
 	HMT_MEDIUM_LOW
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
+	REST_NVGPRS(r1)
 	cmpdi	r3,0
 	bne	.Lsyscall_vectored_\name\()_restore_regs
 
@@ -181,7 +189,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r4,_LINK(r1)
 	ld	r5,_XER(r1)
 
-	REST_NVGPRS(r1)
 	ld	r0,GPR0(r1)
 	mtcr	r2
 	mtctr	r3
@@ -249,7 +256,7 @@ END_BTB_FLUSH_SECTION
 	ld	r2,PACATOC(r13)
 	mfcr	r12
 	li	r11,0
-	/* Can we avoid saving r3-r8 in common case? */
+	/* Save syscall parameters in r3-r8 */
 	std	r3,GPR3(r1)
 	std	r4,GPR4(r1)
 	std	r5,GPR5(r1)
@@ -300,6 +307,13 @@ END_BTB_FLUSH_SECTION
 	wrteei	1
 #endif
 
+	/*
+	 * Zero user registers to prevent influencing speculative execution
+	 * state of kernel code.
+	 */
+	ZEROIZE_GPRS(5, 12)
+	ZEROIZE_NVGPRS()
+
 	/* Calling convention has r3 = orig r0, r4 = regs */
 	mr	r3,r0
 	bl	system_call_exception
@@ -342,6 +356,7 @@ BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1			/* to clear the reservation */
 END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
+	REST_NVGPRS(r1)
 	cmpdi	r3,0
 	bne	.Lsyscall_restore_regs
 	/* Zero volatile regs that may contain sensitive kernel data */
@@ -377,7 +392,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 .Lsyscall_restore_regs:
 	ld	r3,_CTR(r1)
 	ld	r4,_XER(r1)
-	REST_NVGPRS(r1)
 	mtctr	r3
 	mtspr	SPRN_XER,r4
 	ld	r0,GPR0(r1)
-- 
2.34.1

