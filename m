Return-Path: <linuxppc-dev+bounces-12030-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C552EB532C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 14:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMy8Y2fPZz2yFJ;
	Thu, 11 Sep 2025 22:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757595037;
	cv=none; b=IvmQtdb+JdsRl6QaSNY4HuKGgK7qsoagCQiDUatTIGjMt73ONbSnXN0JLECPf2VwUL1dXgUgNmTcrfsdiGgp1qylS3WAW21WC9gzJFONT6SMRiWAPxrcd7NoNgCVwpTPI48QXZkg91mh9rNi5O3lFeDvq6RKzNvlSRJpGAnTdn3KCmX7dcM0qu5XD4pBrvU2WL0S5M+gtMLctTx4RQ/dNPjs9c5I9ARpQBrHB41oHtHiApHIsqKk8sxe5DjQs3bQ99Y7jPV4QVm1glUpT0/Ntuiv0dEHaDU76BkMjsipXSGvm+v3/ijkZb24xYUDH/SuUdJoqEDgndFjuLdwRjhS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757595037; c=relaxed/relaxed;
	bh=1/Go14FVRlnXBCL/fTBSMb+V7V+GwEg5C+NZOZIuZd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CBvT64i7eFgpdnzKwPNTuMpeTQ7pkt/J+BIW1B2ViHAy+fnUE1sM+6DS1sMOaAIg4HPar1fyPDocVevTZknGUUzhSLBg+YZBSYSejR4iOsYTFGWGlK65DDekcM/WXM2Mzeyi+82O0pcOH04IzVOxOzDk1MHu0kOU9jyt/LjWJ8+qmp8LYXPTCeMQ3txAjhbUdSsyGpF7LA8tSUOexvo/jiS6+ddDpXaXBzFx0q9e1apwI/KRBBgjwGObhzVlNYn4wI3KRIKKtaAo4qK7YHDjlJEIDiKW9DwUJhs9b66LiLNVKXX7tHBxIgTlujMRyATS5Lran6GrslY3CGdqNTu9bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMy8X3ddQz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 22:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cMxjb6Cb5z9sj9;
	Thu, 11 Sep 2025 14:30:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rohlHAx5DXGK; Thu, 11 Sep 2025 14:30:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cMxjZ03x8z9sjB;
	Thu, 11 Sep 2025 14:30:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DE8CC8B7A7;
	Thu, 11 Sep 2025 14:30:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id obEC7Z_HFJXJ; Thu, 11 Sep 2025 14:30:41 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 986958B764;
	Thu, 11 Sep 2025 14:30:41 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit
Date: Thu, 11 Sep 2025 14:30:12 +0200
Message-ID: <66d0ab070563ad460ed481328ab0887c27f21a2c.1757593807.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757593814; l=3541; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Y2VsstfCYQSjNLkadzNiJFV+r4Li8EgPQiOKkwciHnI=; b=wcihNTn6ThrJFc/HKm+48uiC25s2PwFT0YcZbpDrPAORdV2YZOfQvc2kSIHQ39gbOQtw4lI/e RJMCOlWGintARmyBAUOq8wMdu0CV8Ck0Mk6b5AD+jXWXDvcALOWQOQL
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 13799748b957 ("powerpc/64: use interrupt restart table to speed
up return from interrupt") removed the inconditional clearing of
MSR[RI] when returning from interrupt into kernel. But powerpc/32
doesn't implement interrupt restart table hence still need MSR[RI]
to be cleared.

It could be added back in interrupt_exit_kernel_prepare() but it is
easier and better to add it back in entry_32.S for following reasons:
- Writing to MSR must be followed by a synchronising instruction
- The smaller the non recoverable section is the better it is

So add a macro called clr_ri and use it in the three places that play
up with SRR0/SRR1. Use it just before another mtspr for synchronisation
to avoid having to add an isync.

Now that's done in entry_32.S, exit_must_hard_disable() can return
false for non book3s/64, taking into account that BOOKE doesn't have
MSR_RI.

Also add back blacklisting syscall_exit_finish for kprobe. This was
initially added by commit 7cdf44013885 ("powerpc/entry32: Blacklist
syscall exit points for kprobe.") then lost with
commit 6f76a01173cc ("powerpc/syscall: implement system call
entry/exit logic in C for PPC32").

Fixes: 6f76a01173cc ("powerpc/syscall: implement system call entry/exit logic in C for PPC32")
Fixes: 13799748b957 ("powerpc/64: use interrupt restart table to speed up return from interrupt")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S  | 18 +++++++++++++++++-
 arch/powerpc/kernel/interrupt.c |  2 +-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index c37480176a1c..16f8ee6cb2cd 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -101,6 +101,17 @@ SYM_FUNC_END(__kuep_unlock)
 .endm
 #endif
 
+.macro	clr_ri trash
+#ifndef CONFIG_BOOKE
+#ifdef CONFIG_PPC_8xx
+	mtspr   SPRN_NRI, \trash
+#else
+	li	\trash, MSR_KERNEL & ~MSR_RI
+	mtmsr	\trash
+#endif
+#endif
+.endm
+
 	.globl	transfer_to_syscall
 transfer_to_syscall:
 	stw	r3, ORIG_GPR3(r1)
@@ -149,6 +160,7 @@ ret_from_syscall:
 	cmpwi	r3,0
 	REST_GPR(3, r1)
 syscall_exit_finish:
+	clr_ri	r4
 	mtspr	SPRN_SRR0,r7
 	mtspr	SPRN_SRR1,r8
 
@@ -168,6 +180,7 @@ syscall_exit_finish:
 	REST_GPR(0, r1)
 	REST_GPRS(3, 12, r1)
 	b	1b
+_ASM_NOKPROBE_SYMBOL(syscall_exit_finish)
 
 #ifdef CONFIG_44x
 .L44x_icache_flush:
@@ -224,10 +237,11 @@ fast_exception_return:
 	/* Clear the exception marker on the stack to avoid confusing stacktrace */
 	li	r10, 0
 	stw	r10, 8(r11)
-	REST_GPR(10, r11)
+	clr_ri	r10
 	mtspr	SPRN_SRR1,r9
 	mtspr	SPRN_SRR0,r12
 	REST_GPR(9, r11)
+	REST_GPR(10, r11)
 	REST_GPR(12, r11)
 	REST_GPR(11, r11)
 	rfi
@@ -256,6 +270,7 @@ interrupt_return:
 .Lfast_user_interrupt_return:
 	lwz	r11,_NIP(r1)
 	lwz	r12,_MSR(r1)
+	clr_ri	r4
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
 
@@ -298,6 +313,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	cmpwi	cr1,r3,0
 	lwz	r11,_NIP(r1)
 	lwz	r12,_MSR(r1)
+	clr_ri	r4
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
 
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index e0c681d0b076..aea6f7e8e9c6 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -38,7 +38,7 @@ static inline bool exit_must_hard_disable(void)
 #else
 static inline bool exit_must_hard_disable(void)
 {
-	return true;
+	return false;
 }
 #endif
 
-- 
2.49.0


