Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2684963EA26
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 08:11:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN6h00144z3bZ4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:11:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FsPSia7V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FsPSia7V;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN6g147dDz3bTB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 18:10:53 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B16vfUl016579;
	Thu, 1 Dec 2022 07:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BtA8luv1JJj9KvbT8okcOP474GnAtFsfvnPKp5o7sfM=;
 b=FsPSia7VVHeZveSW7NzYazgAvzy/8AAR44aGe/RPuP89XA7u7IflikgPziIEYLy5zy/K
 LHMNn8BKNIUAWTdkVTRm/z37KTDJ4xihFSgpTdorOUXZhktv7xoHnYUpRWSi+1f4AjuW
 YmUurHxmZL+9ibdIrSRQO5i9rTDzlGz4rCf5s2SyVatpAgSy6+SDg4EMw73gLATUlxyo
 9PlHCFSx1ubuUdnh+EhNS3KMt6b+7D25l86vO3E5vI7y1P8ScJUqt5BkXHa8KYrerltL
 HNF+6xkmceXO33G+6u9nE7XynTrRQbArwiSRR+F+7W7x4bwKoMEN4nSkG3naKvZy4Nze 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6qf8rakx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:48 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B16wWUX018897;
	Thu, 1 Dec 2022 07:10:48 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6qf8rajy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:48 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B175j5C023885;
	Thu, 1 Dec 2022 07:10:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3m3ae9ewym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B17AhaN4194920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Dec 2022 07:10:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BC40A405B;
	Thu,  1 Dec 2022 07:10:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAF2EA4054;
	Thu,  1 Dec 2022 07:10:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  1 Dec 2022 07:10:42 +0000 (GMT)
Received: from civic.. (unknown [9.177.92.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5CD1D6010B;
	Thu,  1 Dec 2022 18:10:38 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 3/7] powerpc/64: Sanitise common exit code for interrupts
Date: Thu,  1 Dec 2022 18:10:15 +1100
Message-Id: <20221201071019.1953023-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221201071019.1953023-1-rmclure@linux.ibm.com>
References: <20221201071019.1953023-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7tmFJGlHGoan5ZZYykaxSu6_o3r2Cuae
X-Proofpoint-GUID: 1H2f3mhdU4jzbq19wPSZKG3RH5Xthgif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=678 suspectscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010048
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

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
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

