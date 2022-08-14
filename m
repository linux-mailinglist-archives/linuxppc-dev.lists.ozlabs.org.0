Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFAC5923B2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 18:23:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5N5L1ddFz3dwZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 02:23:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aiC5eRjJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aiC5eRjJ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5N3n35z4z3c1n
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 02:22:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1F66EB80B7C;
	Sun, 14 Aug 2022 16:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3FEC433C1;
	Sun, 14 Aug 2022 16:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494144;
	bh=txqmN+YAfMMR2TvIi5EB/XRuqWPGhCXHEhadMv2AIf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aiC5eRjJGc1z09uj6ZWVfv8taqhNH4K0EiSDmybvjxnFeE8aPQrx0mJojh7dlIG8L
	 G87/x1zwUtHS13F63tY911FFmnjGyPFCQ47PbyZrTvuC4SqWMIf0RKoUnT6qCnfnTU
	 zMEJsVfmMmjviJp1l4rpi94lyTrV/z6mNxCMj5GUZ/221GD4rcujAiIgL0mdcICTOi
	 bjqDZujJQ0CoiXrUDx2jfGXQihzhL7HshnU2+AZXEn5ZHPDXUOjOg664GRd07ilqJi
	 MouHSuOe3mko1grLyFYAia7GBct2h3ixnJEcBrdK+M3QJ22hnrc8ANLlQ4rvdzaJHz
	 Cias2+Ssm8Jnw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 31/48] powerpc/32: Set an IBAT covering up to _einittext during init
Date: Sun, 14 Aug 2022 12:19:24 -0400
Message-Id: <20220814161943.2394452-31-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814161943.2394452-1-sashal@kernel.org>
References: <20220814161943.2394452-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, nick.child@ibm.com, Maxime Bizon <mbizon@freebox.fr>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit 2a0fb3c155c97c75176e557d61f8e66c1bd9b735 ]

Always set an IBAT covering up to _einittext during init because when
CONFIG_MODULES is not selected there is no reason to have an exception
handler for kernel instruction TLB misses.

It implies DBAT and IBAT are now totaly independent, IBATs are set
by setibat() and DBAT by setbat().

This allows to revert commit 9bb162fa26ed ("powerpc/603: Fix
boot failure with DEBUG_PAGEALLOC and KFENCE")

Reported-by: Maxime Bizon <mbizon@freebox.fr>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/ce7f04a39593934d9b1ee68c69144ccd3d4da4a1.1655202804.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/head_book3s_32.S |  4 ++--
 arch/powerpc/mm/book3s32/mmu.c       | 10 ++++------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 6c739beb938c..519b60695167 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -418,14 +418,14 @@ InstructionTLBMiss:
  */
 	/* Get PTE (linux-style) and check access */
 	mfspr	r3,SPRN_IMISS
-#if defined(CONFIG_MODULES) || defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
+#ifdef CONFIG_MODULES
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 #endif
 	mfspr	r2, SPRN_SDR1
 	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC | _PAGE_USER
 	rlwinm	r2, r2, 28, 0xfffff000
-#if defined(CONFIG_MODULES) || defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
+#ifdef CONFIG_MODULES
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
 	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 49a737fbbd18..40029280c320 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -159,7 +159,10 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 {
 	unsigned long done;
 	unsigned long border = (unsigned long)__init_begin - PAGE_OFFSET;
+	unsigned long size;
 
+	size = roundup_pow_of_two((unsigned long)_einittext - PAGE_OFFSET);
+	setibat(0, PAGE_OFFSET, 0, size, PAGE_KERNEL_X);
 
 	if (debug_pagealloc_enabled_or_kfence() || __map_without_bats) {
 		pr_debug_once("Read-Write memory mapped without BATs\n");
@@ -245,10 +248,9 @@ void mmu_mark_rodata_ro(void)
 }
 
 /*
- * Set up one of the I/D BAT (block address translation) register pairs.
+ * Set up one of the D BAT (block address translation) register pairs.
  * The parameters are not checked; in particular size must be a power
  * of 2 between 128k and 256M.
- * On 603+, only set IBAT when _PAGE_EXEC is set
  */
 void __init setbat(int index, unsigned long virt, phys_addr_t phys,
 		   unsigned int size, pgprot_t prot)
@@ -284,10 +286,6 @@ void __init setbat(int index, unsigned long virt, phys_addr_t phys,
 		/* G bit must be zero in IBATs */
 		flags &= ~_PAGE_EXEC;
 	}
-	if (flags & _PAGE_EXEC)
-		bat[0] = bat[1];
-	else
-		bat[0].batu = bat[0].batl = 0;
 
 	bat_addrs[index].start = virt;
 	bat_addrs[index].limit = virt + ((bl + 1) << 17) - 1;
-- 
2.35.1

