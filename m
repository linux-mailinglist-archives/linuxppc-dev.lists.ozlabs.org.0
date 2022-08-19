Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F0159939D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:40:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M86wb2q3dz3f0r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:40:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oe3BNrKj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oe3BNrKj;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M86vM1lG2z3bxt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 13:39:42 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3CRev003221;
	Fri, 19 Aug 2022 03:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FknbODaUcb0Jvv8uYNpPXmvqVEXDKl6n4aHiQn0OiW8=;
 b=Oe3BNrKjAZ5g6WDlQaOWox9/2zvQgRsnljkjdm3y2JsaE5AcZJeUbCDxzJ0X9BH173sG
 RFCRBLXtTYh+KgpdWwzNvHSVppku9y/EzMBqgbS8K+586lcF02cGyXmmWzyJmqtzEkZu
 w5HbvNZbfuwJSG6IFDhTXK9mw9quUheKfIqiiyl65dtMBG1LIPzy2T3BCe4hA3rOOmHZ
 8BnLiLKIkV5kVyLFKe6lVGvUdBxfhlICjpctK9NUlzTNrXSint87VQ0gQWcwkjVECn/m
 OZaO/lGM44obXCnD+8lvcbDPfdlBXyH9b2jF3VftLFRrk2HCR6MgawW2flBJ2hgVAQy1 xA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j22dc0e42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:38 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J3dZlH014746;
	Fri, 19 Aug 2022 03:39:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma02fra.de.ibm.com with ESMTP id 3j0dc3afdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:35 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J3dXjm34603400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 03:39:33 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77FAFA404D;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21DA9A4040;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9E5B6604BE;
	Fri, 19 Aug 2022 13:39:29 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 12/18] Revert "powerpc/syscall: Save r3 in regs->orig_r3"
Date: Fri, 19 Aug 2022 13:38:00 +1000
Message-Id: <20220819033806.162054-13-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819033806.162054-1-rmclure@linux.ibm.com>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GLaNmgp_-pogCV73dcPVD6oY6XB5iDS6
X-Proofpoint-GUID: GLaNmgp_-pogCV73dcPVD6oY6XB5iDS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 mlxlogscore=864 malwarescore=0
 mlxscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This reverts commit 8875f47b7681aa4e4484a9b612577b044725f839.

Save caller's original r3 state to the kernel stackframe before entering
system_call_exception. This allows for user registers to be cleared by
the time system_call_exception is entered, reducing the influence of
user registers on speculation within the kernel.

Prior to this commit, orig_r3 was saved at the beginning of
system_call_exception. Instead, save orig_r3 while the user value is
still live in r3.

Also replicate this early save in 32-bit. A similar save was removed in
6f76a01173cc
("powerpc/syscall: implement system call entry/exit logic in C for PPC32")
when 32-bit adopted system_call_exception. Revert its removal of orig_r3
saves.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V2 -> V3: New commit.
---
 arch/powerpc/kernel/entry_32.S     | 1 +
 arch/powerpc/kernel/interrupt_64.S | 2 ++
 arch/powerpc/kernel/syscall.c      | 1 -
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 1d599df6f169..44dfce9a60c5 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -101,6 +101,7 @@ __kuep_unlock:
 
 	.globl	transfer_to_syscall
 transfer_to_syscall:
+	stw	r3, ORIG_GPR3(r1)
 	stw	r11, GPR1(r1)
 	stw	r11, 0(r1)
 	mflr	r12
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index ce25b28cf418..71d2d9497283 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -91,6 +91,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	li	r11,\trapnr
 	std	r11,_TRAP(r1)
 	std	r12,_CCR(r1)
+	std	r3,ORIG_GPR3(r1)
 	addi	r10,r1,STACK_FRAME_OVERHEAD
 	ld	r11,exception_marker@toc(r2)
 	std	r11,-16(r10)		/* "regshere" marker */
@@ -275,6 +276,7 @@ END_BTB_FLUSH_SECTION
 	std	r10,_LINK(r1)
 	std	r11,_TRAP(r1)
 	std	r12,_CCR(r1)
+	std	r3,ORIG_GPR3(r1)
 	addi	r10,r1,STACK_FRAME_OVERHEAD
 	ld	r11,exception_marker@toc(r2)
 	std	r11,-16(r10)		/* "regshere" marker */
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index 81ace9e8b72b..64102a64fd84 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -25,7 +25,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	kuap_lock();
 
 	add_random_kstack_offset();
-	regs->orig_gpr3 = r3;
 
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
-- 
2.34.1

