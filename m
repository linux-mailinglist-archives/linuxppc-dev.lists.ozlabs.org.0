Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D887BFA44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 13:48:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LPvG7yFk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Z1F4s1Kz3c8L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 22:48:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LPvG7yFk;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Z0N2lzJz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 22:48:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1696938483;
	bh=3RrloAUYJLow9MEEKipUVgFNIUhEqEFkUDg4lS5JExc=;
	h=From:To:Cc:Subject:Date:From;
	b=LPvG7yFk1fKyqCYtrapmvIJH4id2RpfVMEsSnkUExJJgunZOG+vQkcjE7qrH/z7BN
	 q7usNqYKA1hpDDQesgqmP1cWZm5XI899V3JyfEeMI7AkT5ZBGZmst4SVOPZgNP2z/p
	 opeddfQ/lkBci3viSHAPjMz8qNBgG2P5sQToAOG7hyiyXl6LA4bgW6xwPzcZq+96X0
	 KP8El130xk2EteaapoKvXIC6WuTbs1fvsShgUcnv0WOmxFBhKzD6TZXnLK6sslrthk
	 KoM/litFRh4XlE9lg5Xx4cSfGNzbva+c7tEz9T/GYS5yyKUEf0fTgBhRuOK49BjxO3
	 XVlduBfU3LIiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S4Z0L6ycZz4x3H;
	Tue, 10 Oct 2023 22:48:02 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/47x: Fix 47x syscall return crash
Date: Tue, 10 Oct 2023 22:47:50 +1100
Message-ID: <20231010114750.847794-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: eajames@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eddie reported that newer kernels were crashing during boot on his 476
FSP2 system:

  kernel tried to execute user page (b7ee2000) - exploit attempt? (uid: 0)
  BUG: Unable to handle kernel instruction fetch
  Faulting instruction address: 0xb7ee2000
  Oops: Kernel access of bad area, sig: 11 [#1]
  BE PAGE_SIZE=4K FSP-2
  Modules linked in:
  CPU: 0 PID: 61 Comm: mount Not tainted 6.1.55-d23900f.ppcnf-fsp2 #1
  Hardware name: ibm,fsp2 476fpe 0x7ff520c0 FSP-2
  NIP:  b7ee2000 LR: 8c008000 CTR: 00000000
  REGS: bffebd83 TRAP: 0400   Not tainted (6.1.55-d23900f.ppcnf-fs p2)
  MSR:  00000030 <IR,DR>  CR: 00001000  XER: 20000000
  GPR00: c00110ac bffebe63 bffebe7e bffebe88 8c008000 00001000 00000d12 b7ee2000
  GPR08: 00000033 00000000 00000000 c139df10 48224824 1016c314 10160000 00000000
  GPR16: 10160000 10160000 00000008 00000000 10160000 00000000 10160000 1017f5b0
  GPR24: 1017fa50 1017f4f0 1017fa50 1017f740 1017f630 00000000 00000000 1017f4f0
  NIP [b7ee2000] 0xb7ee2000
  LR [8c008000] 0x8c008000
  Call Trace:
  Instruction dump:
  XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
  XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
  ---[ end trace 0000000000000000 ]---

The problem is in ret_from_syscall where the check for
icache_44x_need_flush is done. When the flush is needed the code jumps
out-of-line to do the flush, and then intends to jump back to continue
the syscall return.

However the branch back to label 1b doesn't return to the correct
location, instead branching back just prior to the return to userspace,
causing bogus register values to be used by the rfi.

The breakage was introduced by commit 6f76a01173cc
("powerpc/syscall: implement system call entry/exit logic in C for PPC32") which
inadvertently removed the "1" label and reused it elsewhere.

Fix it by adding named local labels in the correct locations. Note that
the return label needs to be outside the ifdef so that CONFIG_PPC_47x=n
compiles.

Fixes: 6f76a01173cc ("powerpc/syscall: implement system call entry/exit logic in C for PPC32")
Cc: stable@vger.kernel.org # v5.12+
Reported-by: Eddie James <eajames@linux.ibm.com>
Link: https://lore.kernel.org/linuxppc-dev/fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com/
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Tested-by: Eddie James <eajames@linux.ibm.com>
---
 arch/powerpc/kernel/entry_32.S | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 9692acb0361f..7eda33a24bb4 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -137,8 +137,9 @@ ret_from_syscall:
 	lis	r4,icache_44x_need_flush@ha
 	lwz	r5,icache_44x_need_flush@l(r4)
 	cmplwi	cr0,r5,0
-	bne-	2f
+	bne-	.L44x_icache_flush
 #endif /* CONFIG_PPC_47x */
+.L44x_icache_flush_return:
 	kuep_unlock
 	lwz	r4,_LINK(r1)
 	lwz	r5,_CCR(r1)
@@ -172,10 +173,11 @@ syscall_exit_finish:
 	b	1b
 
 #ifdef CONFIG_44x
-2:	li	r7,0
+.L44x_icache_flush:
+	li	r7,0
 	iccci	r0,r0
 	stw	r7,icache_44x_need_flush@l(r4)
-	b	1b
+	b	.L44x_icache_flush_return
 #endif  /* CONFIG_44x */
 
 	.globl	ret_from_fork
-- 
2.41.0

