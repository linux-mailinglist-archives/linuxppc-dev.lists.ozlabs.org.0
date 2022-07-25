Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F7157F972
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:32:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrqw26b4kz3f2P
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:32:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RgtqyQUx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RgtqyQUx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrqvP6fKrz3bhQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:31:45 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P6LEJq002619;
	Mon, 25 Jul 2022 06:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=FPzIDVARW/8OCeYP66S+KjDsxr4x/JtGD7PQgBaE9io=;
 b=RgtqyQUxZtfOArkImGirT+WfkZYYuQjJzrlWW0+IDgaCb119EkFribD9k7QWsXfbKD2X
 i+Ehpw2MwW5R7Z+z7J7SWrRMct5iaivqWy7SFdXxuOFGSKpUZFCpn7WBidBjlOopGcNS
 lOuICEdAs2vaPpFA+MCv1ZODQ5oRPrbaixl+6qBBMgeFlmeG5fxhW/2C8QxGZavaa6wa
 xnTidwA1Qv4PAaxHtsccCl0G/qnBrivzhR7kfoQ9zouNZcNDUX8QcRvKlSIIS38yu8XU
 wafQrKlCxCmiwvroCJT9FgtDQz5fH1+aytShoPYYpRY/Lwc04CRqNuVr84UgTV4annyc Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnu4g88p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:31:40 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P6LnKu003757;
	Mon, 25 Jul 2022 06:31:40 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnu4g815-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:31:39 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26P6LiIM003488;
	Mon, 25 Jul 2022 06:31:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06fra.de.ibm.com with ESMTP id 3hg98fgutm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:31:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26P6VGYw17170826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 06:31:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 979FD5204F;
	Mon, 25 Jul 2022 06:31:16 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.53])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B52795204E;
	Mon, 25 Jul 2022 06:31:14 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/14] powerpc/64s: Clear/restore caller gprs in syscall interrupt/return
Date: Mon, 25 Jul 2022 16:31:11 +1000
Message-Id: <20220725063111.120926-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5W4VFQJ75F9a1w3Qg2NQd-U-NSHPh77x
X-Proofpoint-GUID: UNJVx_M66NxXiZu-7sXhDbaO4TxLOZ8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxlogscore=539 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250026
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

Clear user state in gprs (assign to zero) to reduce the influence of user
registers on speculation within kernel syscall handlers. Clears occur
at the very beginning of the sc and scv 0 interrupt handlers, with
restores occurring following the execution of the syscall handler.

One function of syscall_exit_prepare is to determine when non-volatile
regs must be restored, and it still serves that purpose on 32-bit. Use
it now for determining where to find XER, CTR, CR.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Update summary
---
 arch/powerpc/kernel/interrupt_64.S | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 3e8a811e09c4..34167cfa5d60 100644
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
@@ -108,6 +108,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * but this is the best we can do.
 	 */
 
+	/*
+	 * Zero user registers to prevent influencing speculative execution
+	 * state of kernel code.
+	 */
+	NULLIFY_GPRS(5, 12)
+	NULLIFY_NVGPRS()
+
 	/* Calling convention has r3 = orig r0, r4 = regs */
 	mr	r3,r0
 	bl	system_call_exception
@@ -138,6 +145,7 @@ BEGIN_FTR_SECTION
 	HMT_MEDIUM_LOW
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
+	REST_NVGPRS(r1)
 	cmpdi	r3,0
 	bne	.Lsyscall_vectored_\name\()_restore_regs
 
@@ -180,7 +188,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r4,_LINK(r1)
 	ld	r5,_XER(r1)
 
-	REST_NVGPRS(r1)
 	ld	r0,GPR0(r1)
 	mtcr	r2
 	mtctr	r3
@@ -248,7 +255,7 @@ END_BTB_FLUSH_SECTION
 	ld	r2,PACATOC(r13)
 	mfcr	r12
 	li	r11,0
-	/* Can we avoid saving r3-r8 in common case? */
+	/* Save syscall parameters in r3-r8 */
 	std	r3,GPR3(r1)
 	std	r4,GPR4(r1)
 	std	r5,GPR5(r1)
@@ -298,6 +305,13 @@ END_BTB_FLUSH_SECTION
 	wrteei	1
 #endif
 
+	/*
+	 * Zero user registers to prevent influencing speculative execution
+	 * state of kernel code.
+	 */
+	NULLIFY_GPRS(5, 12)
+	NULLIFY_NVGPRS()
+
 	/* Calling convention has r3 = orig r0, r4 = regs */
 	mr	r3,r0
 	bl	system_call_exception
@@ -340,6 +354,7 @@ BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1			/* to clear the reservation */
 END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
+	REST_NVGPRS(r1)
 	cmpdi	r3,0
 	bne	.Lsyscall_restore_regs
 	/* Zero volatile regs that may contain sensitive kernel data */
@@ -367,7 +382,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 .Lsyscall_restore_regs:
 	ld	r3,_CTR(r1)
 	ld	r4,_XER(r1)
-	REST_NVGPRS(r1)
 	mtctr	r3
 	mtspr	SPRN_XER,r4
 	REST_GPR(0, r1)
-- 
2.34.1

