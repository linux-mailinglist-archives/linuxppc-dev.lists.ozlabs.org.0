Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D2539CC9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 07:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCdYS6Pgdz3bkK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 15:51:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JzxpJiol;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JzxpJiol;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCdWM354jz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 15:49:19 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2515Bt67017174;
	Wed, 1 Jun 2022 05:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7w5NSoT8KSn5Ga8wk4mNxWCrVyMb4qsBVltwtWJlrsA=;
 b=JzxpJiolO45boVTIjGlJnKpli+YPFTDmB6tBWhPdC9Mdm+uEn4nhgOwN2Y+4Ro/Xuwvo
 n+u2wYLzGE/XIai7B6omsn0tCj5K5sLr6Nqzi2Wr/Jdyio3+0WlYN8BGNJjcbKtACKkd
 L0xw4EXDG2EHedOcyjXW0ZbbhT/cJ+g3Xl2FlwN3RKLH3G71B4IceqAa9/+AzPf+6Mk+
 tTKvBtpvoGIRIhqw7QBs7xVEqJJya10FvpYFFTSdQiUbHKXl0sjNweOfZKFk//+pBmLa
 kkZl0IrXdla4Wk2tKmW3/imcoqVqBPqL5wmz0LB84fidm4+o5SH2//jrM04dLxedhvfZ XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ge1rggjge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:49:13 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2515HUs6001246;
	Wed, 1 Jun 2022 05:49:13 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ge1rggjfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:49:13 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2515ZMsZ002044;
	Wed, 1 Jun 2022 05:49:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3gbcae530g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:49:10 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2515n7UR19857756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jun 2022 05:49:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C46C11C04A;
	Wed,  1 Jun 2022 05:49:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E202411C04C;
	Wed,  1 Jun 2022 05:49:06 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.94])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jun 2022 05:49:06 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc: Make syscalls save and restore gprs
Date: Wed,  1 Jun 2022 15:48:47 +1000
Message-Id: <20220601054850.250287-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601054850.250287-1-rmclure@linux.ibm.com>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gkDWl4a8ajEWnil2jtG-ShLjjG7u90dS
X-Proofpoint-ORIG-GUID: ko5luo9luniPvKBfpc3hn8d5ytjj2AuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_01,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=526 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010025
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

Clears user state in gprs to reduce the influence of user registers on
speculation within kernel syscall handlers.

Remove conditional branches on result of `syscall_exit_prepare` to
restore non-volatile gprs, as these registers are always cleared and
hence always must be restored.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/kernel/interrupt_64.S | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index b11c2bd84827..e601ed999798 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -108,6 +108,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * but this is the best we can do.
 	 */
 
+	ZERO_GPRS(5, 12)
+	ZERO_NVGPRS()
+
 	/* Calling convention has r3 = orig r0, r4 = regs */
 	mr	r3,r0
 	bl	system_call_exception
@@ -138,6 +141,7 @@ BEGIN_FTR_SECTION
 	HMT_MEDIUM_LOW
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
+	REST_NVGPRS(r1)
 	cmpdi	r3,0
 	bne	.Lsyscall_vectored_\name\()_restore_regs
 
@@ -180,7 +184,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r4,_LINK(r1)
 	ld	r5,_XER(r1)
 
-	REST_NVGPRS(r1)
 	ld	r0,GPR0(r1)
 	mtcr	r2
 	mtctr	r3
@@ -308,6 +311,9 @@ END_BTB_FLUSH_SECTION
 	wrteei	1
 #endif
 
+	ZERO_GPRS(5, 12)
+	ZERO_NVGPRS()
+
 	/* Calling convention has r3 = orig r0, r4 = regs */
 	mr	r3,r0
 	bl	system_call_exception
@@ -350,6 +356,7 @@ BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1			/* to clear the reservation */
 END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
+	REST_NVGPRS(r1)
 	cmpdi	r3,0
 	bne	.Lsyscall_restore_regs
 	/* Zero volatile regs that may contain sensitive kernel data */
@@ -377,7 +384,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 .Lsyscall_restore_regs:
 	ld	r3,_CTR(r1)
 	ld	r4,_XER(r1)
-	REST_NVGPRS(r1)
 	mtctr	r3
 	mtspr	SPRN_XER,r4
 	REST_GPR(0, r1)
@@ -445,7 +451,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	bl	interrupt_exit_user_prepare
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs_\srr
-.Lrestore_nvgprs_\srr\()_cont:
+	.Lrestore_nvgprs_\srr\()_cont:
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 #ifdef CONFIG_PPC_BOOK3S
 .Linterrupt_return_\srr\()_user_rst_start:
-- 
2.34.1

