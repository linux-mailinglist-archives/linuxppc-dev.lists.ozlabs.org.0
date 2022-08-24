Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426359F152
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:15:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8nV0XbSz3bcv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 12:15:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fl7POqRI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fl7POqRI;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8cG5MCdz3bqv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 12:07:10 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O200Mc008909;
	Wed, 24 Aug 2022 02:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hK4euzlo0uobsoL23RNLiPSyBYbXlxW19YymMUJxeI4=;
 b=Fl7POqRICtt+IWP63JuujT/wdGDJidXxdxFVy/vf9nPjYZN3THeLM0h5UDSgfSOuTTgS
 Uo9hd2IRlTyaXOziSmXHQCTxaUJEmnDcP1KZAZ3d7jQpGW658EwyzO1mwSLnm+vDsxPo
 77BtSLYCR2rHnR7tJxlVYsvNWMIer7CVHN7ScowSYuahM1s/3ZiKiOconAFUfKTIwl8H
 SuynNkmZioXMCUtTkx/3ap2wgaEuc2e4j+9dXjXlxZ2NG7h2VKJjJGMd9HriMqWGT7Kl
 QARxlAGYDUrXd0ln6aXbkAINUip0uqSc6AQmfqhBFaC3cESJlBTH8vHs64RHXlxhZ8aC BQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5atag5ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:07:04 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O25W5U027134;
	Wed, 24 Aug 2022 02:07:03 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3j2q88u9v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:07:02 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27O270pw32965008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Aug 2022 02:07:00 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82C59AE051;
	Wed, 24 Aug 2022 02:07:00 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D12BAE045;
	Wed, 24 Aug 2022 02:07:00 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 24 Aug 2022 02:07:00 +0000 (GMT)
Received: from civic.. (unknown [9.177.18.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 34D6F60430;
	Wed, 24 Aug 2022 12:06:56 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 12/20] Revert "powerpc/syscall: Save r3 in regs->orig_r3"
Date: Wed, 24 Aug 2022 12:05:40 +1000
Message-Id: <20220824020548.62625-13-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824020548.62625-1-rmclure@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4NW7oqIQaOEo-ldI9AhUVa-Nx6ZvEFmB
X-Proofpoint-ORIG-GUID: 4NW7oqIQaOEo-ldI9AhUVa-Nx6ZvEFmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=869 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208240005
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
commit 6f76a01173cc ("powerpc/syscall: implement system call entry/exit logic in C for PPC32")
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

