Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560A747C109
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 14:52:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJHvY186sz3c6G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 00:52:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=N1FiICVc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJHtD4nWKz2y7Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 00:51:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=N1FiICVc; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JJHtC6LY0z4xmt;
 Wed, 22 Dec 2021 00:51:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1640094675;
 bh=KGm9yAdRziTc3fhSEw2QONkq+jyW00Ryj2RH7aVCgt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N1FiICVccunsR8GIxWDcdfNVFtmZzNOcDr+WFUfqY68ksPhYuFex4SHFhvobweyGZ
 ofVahvKp4TQrOz9Tt0Klo7d3YSM6lTjN6ElxOlzQc6L9atUzeGP9UteXHePZ78/AYI
 zyJatK61VY5BX//zU6qGKz2IVNxKFCBp24e3MJaZWGY3BqjOj8NsRRImOIG3cXvplf
 JXyssJFNJdCAlbeujTbwqBw1NDLgjxqusY8b+6njSkgAzl9S2O26ElNwgfsoQKVWZM
 z4E60GWT7qljDqwfwdflZkVWIvjQin3f/nDB/ShhB/U2/O4TngphjAybRaqY1tKnxG
 n3H0NFiiN4tCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] powerpc/64s: Use EMIT_WARN_ENTRY for SRR debug warnings
Date: Wed, 22 Dec 2021 00:51:00 +1100
Message-Id: <20211221135101.2085547-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211221135101.2085547-1-mpe@ellerman.id.au>
References: <20211221135101.2085547-1-mpe@ellerman.id.au>
MIME-Version: 1.0
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
Cc: sachinp@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_PPC_RFI_SRR_DEBUG=y we check the SRR values before returning
from interrupts. This is done in asm using EMIT_BUG_ENTRY, and passing
BUGFLAG_WARNING.

However that fails to create an exception table entry for the warning,
and so do_program_check() fails the exception table search and proceeds
to call _exception(), resulting in an oops like:

  Oops: Exception in kernel mode, sig: 5 [#1]
  LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
  Modules linked in:
  CPU: 2 PID: 1204 Comm: sigreturn_unali Tainted: P                  5.16.0-rc2-00194-g91ca3d4f77c5 #12
  NIP:  c00000000000c5b0 LR: 0000000000000000 CTR: 0000000000000000
  ...
  NIP [c00000000000c5b0] system_call_common+0x150/0x268
  LR [0000000000000000] 0x0
  Call Trace:
  [c00000000db73e10] [c00000000000c558] system_call_common+0xf8/0x268 (unreliable)
  ...
  Instruction dump:
  7cc803a6 888d0931 2c240000 4082001c 38800000 988d0931 e8810170 e8a10178
  7c9a03a6 7cbb03a6 7d7a02a6 e9810170 <7f0b6088> 7d7b02a6 e9810178 7f0b6088

We should instead use EMIT_WARN_ENTRY, which creates an exception table
entry for the warning, allowing the warning to be correctly recognised,
and the code to resume after printing the warning.

Note however that because this warning is buried deep in the interrupt
return path, we are not able to recover from it (due to MSR_RI being
clear), so we still end up in die() with an unrecoverable exception.

Fixes: 59dc5bfca0cb ("powerpc/64s: avoid reloading (H)SRR registers if they are still valid")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/interrupt_64.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 4fd65d39d5d3..be5ff1521505 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -32,21 +32,21 @@
 	ld	r12,_NIP(r1)
 	clrrdi  r12,r12,2
 100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	EMIT_WARN_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
 	mfspr	r11,SPRN_SRR1
 	ld	r12,_MSR(r1)
 100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	EMIT_WARN_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
 	.else
 	mfspr	r11,SPRN_HSRR0
 	ld	r12,_NIP(r1)
 	clrrdi  r12,r12,2
 100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	EMIT_WARN_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
 	mfspr	r11,SPRN_HSRR1
 	ld	r12,_MSR(r1)
 100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	EMIT_WARN_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
 	.endif
 #endif
 .endm
-- 
2.31.1

