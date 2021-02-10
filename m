Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DFB316B96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 17:47:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbQf345cnzDwh5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 03:47:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbQbG3KzTzDwgq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 03:44:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DbQZt3LxLz9v01Z;
 Wed, 10 Feb 2021 17:44:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HUnBMywYAq1W; Wed, 10 Feb 2021 17:44:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DbQZt2Snyz9v01Y;
 Wed, 10 Feb 2021 17:44:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 15FDE8B80C;
 Wed, 10 Feb 2021 17:44:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id O6RicHwjWl1R; Wed, 10 Feb 2021 17:44:23 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B61448B807;
 Wed, 10 Feb 2021 17:44:23 +0100 (CET)
To: Nicholas Piggin <npiggin@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Declaring unrecoverable_exception() as __noreturn ?
Message-ID: <5ecc1a9a-92eb-7006-6c94-2b7b700d182a@csgroup.eu>
Date: Wed, 10 Feb 2021 17:44:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As far as I can see, almost all callers of unrecoverable_exception() expect it to never return.

Can we mark it __noreturn ?

Below is interrupt_exit_kernel_prepare() with then without unrecoverable_exception() declared as 
__noreturn. (CONFIG_PREEMPT_NONE, and with the BUG_ON() removed)

With the __noreturn added, we get no stack frame on the likely path

000003a8 <interrupt_exit_kernel_prepare>:
  3a8:	81 43 00 84 	lwz     r10,132(r3)
  3ac:	71 4a 00 02 	andi.   r10,r10,2
  3b0:	41 82 00 30 	beq     3e0 <interrupt_exit_kernel_prepare+0x38>
  3b4:	80 62 00 70 	lwz     r3,112(r2)
  3b8:	74 63 00 01 	andis.  r3,r3,1
  3bc:	40 82 00 34 	bne     3f0 <interrupt_exit_kernel_prepare+0x48>
  3c0:	7d 40 00 a6 	mfmsr   r10
  3c4:	55 4a 04 5e 	rlwinm  r10,r10,0,17,15
  3c8:	7d 40 01 24 	mtmsr   r10
  3cc:	7d 20 00 a6 	mfmsr   r9
  3d0:	55 29 07 fa 	rlwinm  r9,r9,0,31,29
  3d4:	55 29 04 5e 	rlwinm  r9,r9,0,17,15
  3d8:	7d 20 01 24 	mtmsr   r9
  3dc:	4e 80 00 20 	blr
  3e0:	94 21 ff f0 	stwu    r1,-16(r1)
  3e4:	7c 08 02 a6 	mflr    r0
  3e8:	90 01 00 14 	stw     r0,20(r1)
  3ec:	48 00 00 01 	bl      3ec <interrupt_exit_kernel_prepare+0x44>
			3ec: R_PPC_REL24	unrecoverable_exception
  3f0:	38 e2 00 70 	addi    r7,r2,112
  3f4:	3d 00 00 01 	lis     r8,1
  3f8:	7c c0 38 28 	lwarx   r6,0,r7
  3fc:	7c c6 40 78 	andc    r6,r6,r8
  400:	7c c0 39 2d 	stwcx.  r6,0,r7
  404:	40 a2 ff f4 	bne     3f8 <interrupt_exit_kernel_prepare+0x50>
  408:	38 60 00 01 	li      r3,1
  40c:	4b ff ff b4 	b       3c0 <interrupt_exit_kernel_prepare+0x18>

Without the modification:

000003a8 <interrupt_exit_kernel_prepare>:
  3a8:	94 21 ff f0 	stwu    r1,-16(r1)
  3ac:	93 e1 00 0c 	stw     r31,12(r1)
  3b0:	81 23 00 84 	lwz     r9,132(r3)
  3b4:	71 29 00 02 	andi.   r9,r9,2
  3b8:	41 82 00 38 	beq     3f0 <interrupt_exit_kernel_prepare+0x48>
  3bc:	81 22 00 70 	lwz     r9,112(r2)
  3c0:	75 23 00 01 	andis.  r3,r9,1
  3c4:	40 82 00 4c 	bne     410 <interrupt_exit_kernel_prepare+0x68>
  3c8:	7d 20 00 a6 	mfmsr   r9
  3cc:	55 29 04 5e 	rlwinm  r9,r9,0,17,15
  3d0:	7d 20 01 24 	mtmsr   r9
  3d4:	7d 20 00 a6 	mfmsr   r9
  3d8:	55 29 07 fa 	rlwinm  r9,r9,0,31,29
  3dc:	55 29 04 5e 	rlwinm  r9,r9,0,17,15
  3e0:	7d 20 01 24 	mtmsr   r9
  3e4:	83 e1 00 0c 	lwz     r31,12(r1)
  3e8:	38 21 00 10 	addi    r1,r1,16
  3ec:	4e 80 00 20 	blr
  3f0:	7c 08 02 a6 	mflr    r0
  3f4:	90 01 00 14 	stw     r0,20(r1)
  3f8:	48 00 00 01 	bl      3f8 <interrupt_exit_kernel_prepare+0x50>
			3f8: R_PPC_REL24	unrecoverable_exception
  3fc:	81 22 00 70 	lwz     r9,112(r2)
  400:	80 01 00 14 	lwz     r0,20(r1)
  404:	75 23 00 01 	andis.  r3,r9,1
  408:	7c 08 03 a6 	mtlr    r0
  40c:	41 82 ff bc 	beq     3c8 <interrupt_exit_kernel_prepare+0x20>
  410:	39 02 00 70 	addi    r8,r2,112
  414:	3d 20 00 01 	lis     r9,1
  418:	7c e0 40 28 	lwarx   r7,0,r8
  41c:	7c e7 48 78 	andc    r7,r7,r9
  420:	7c e0 41 2d 	stwcx.  r7,0,r8
  424:	40 a2 ff f4 	bne     418 <interrupt_exit_kernel_prepare+0x70>
  428:	38 60 00 01 	li      r3,1
  42c:	7d 20 00 a6 	mfmsr   r9
  430:	55 29 04 5e 	rlwinm  r9,r9,0,17,15
  434:	7d 20 01 24 	mtmsr   r9
  438:	7d 20 00 a6 	mfmsr   r9
  43c:	55 29 07 fa 	rlwinm  r9,r9,0,31,29
  440:	55 29 04 5e 	rlwinm  r9,r9,0,17,15
  444:	7d 20 01 24 	mtmsr   r9
  448:	83 e1 00 0c 	lwz     r31,12(r1)
  44c:	38 21 00 10 	addi    r1,r1,16
  450:	4e 80 00 20 	blr
