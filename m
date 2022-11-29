Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5824263B92F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 05:46:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLqYq15rXz3f3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 15:46:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Og/Rj4Xl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Og/Rj4Xl;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLqVs27VFz3cF7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 15:44:21 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AT47bla030064;
	Tue, 29 Nov 2022 04:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=g/xqmgaZ9hLCOrY9O9obXe38BV3o+CYJd7R7g9iaH+8=;
 b=Og/Rj4Xl0GlrtUTRkPs8lrN5vxri9oXt5aaKgBBFa/P/RaVZcPKeh1ZS9zdNW9cK6y6R
 scadxcfb7TAm84lhvHxApzVca/Qq3/orx3Q2G9/a3uDoIC7uZEqI4svB0IraGLJxOR+M
 nycQ8A1Nn4vZEcJ1m7ntBANUxEvyUkkV3PtK6sV1iG9ahwxOyZQaZF9E39nzS4yAFFcX
 hetbbChpFe/VPg6qXevY19Un6r81UsAV29DV1YY6yGMyfx+Y1fgTla/RISB0erdTfyal
 NGoJa3i4ar3SKjKMJw/dgcUVQR/13nH05JhwfjpitOhkIVMgr6AeyLQAVDViAcaSdOx6 NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5410spxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:15 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AT4bkMc001049;
	Tue, 29 Nov 2022 04:44:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5410spxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT4aGj4031374;
	Tue, 29 Nov 2022 04:44:13 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3m3ae9bf5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AT4iBaJ9962020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 04:44:11 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3043E52050;
	Tue, 29 Nov 2022 04:44:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id CFCC95204F;
	Tue, 29 Nov 2022 04:44:10 +0000 (GMT)
Received: from civic.. (unknown [9.177.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8EE0E600D5;
	Tue, 29 Nov 2022 15:44:07 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 3/7] powerpc/64: Sanitise common exit code for interrupts
Date: Tue, 29 Nov 2022 15:43:50 +1100
Message-Id: <20221129044354.1836018-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221129044354.1836018-1-rmclure@linux.ibm.com>
References: <20221129044354.1836018-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cobFRlqOUJ1XmbaJtY7ppeG8zoJHmpYn
X-Proofpoint-ORIG-GUID: bLGi7jRQkTxYrxcbSsxOZMmoid550-vZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_02,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxlogscore=679
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290029
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

Interrupt code is shared between Book3E/S 64-bit systems for interrupt
handlers. Ensure that exit code correctly restores non-volatile gprs on
each system when CONFIG_INTERRUPT_SANITIZE_REGISTERS is enabled.

Also introduce macros for clearing/restoring registers on interrupt
entry for when this configuration option is either disabled or enabled.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v4: New patch
---
 arch/powerpc/kernel/interrupt_64.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 978a173eb339..1ef4fdef74fb 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -408,9 +408,11 @@ interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_user_prepare
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs_\srr
 .Lrestore_nvgprs_\srr\()_cont:
+#endif
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 #ifdef CONFIG_PPC_BOOK3S
 .Linterrupt_return_\srr\()_user_rst_start:
@@ -424,6 +426,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 .Lfast_user_interrupt_return_\srr\():
+	SANITIZE_RESTORE_NVGPRS()
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
 	lbz	r4,PACASRR_VALID(r13)
@@ -493,9 +496,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	b	.	/* prevent speculative execution */
 .Linterrupt_return_\srr\()_user_rst_end:
 
+#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 .Lrestore_nvgprs_\srr\():
 	REST_NVGPRS(r1)
 	b	.Lrestore_nvgprs_\srr\()_cont
+#endif
 
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_user_restart:
@@ -576,6 +581,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 	stb	r11,PACAIRQHAPPENED(r13) // clear the possible HARD_DIS
 
 .Lfast_kernel_interrupt_return_\srr\():
+	SANITIZE_RESTORE_NVGPRS()
 	cmpdi	cr1,r3,0
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
-- 
2.37.2

