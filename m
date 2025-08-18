Return-Path: <linuxppc-dev+bounces-11084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAC8B2A038
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 13:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c59Hr71tzz3cYj;
	Mon, 18 Aug 2025 21:20:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755516040;
	cv=none; b=kfoKqpiYsWhwbLz72oNA2dSBPgNw08wLayljuBehhRyeWI4S0NXnZDKuc/1fAqEdrTR889rt2tYT4jZsuAvt/572G4mB0p0ZN8ZJmNE9uT8B6eb0gLxxpSQ+W1D7PJHmn/q+pp5rVZLKcda+kGhRjffCKjfTdkU7FIOIw8DbuLO3jnlE0aR/UaFYerg9afAUu+9c1eXDujS7oHFf6cupBiQTAGKA4oA0oOWMLOkQgCFnTYnhRjn9B14Vu1kWqFlO+ZPZwUQUwz75trT2WFq3WWv4mKsR/sm5sMLHHLkPtborMSkk/yv/nE3T1EhYTMZAyZAKP3d8CMlf5Z8oZ9+zPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755516040; c=relaxed/relaxed;
	bh=cS7e/HQevIrccMFTNXzNxeT6ogcMW66459VZ7IEMmTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bt77Ld/rmalw9xhpyWn/6aTEIVUFPJHo2u9MVP7wIrdASPt8X+FU7CMX4VTKhSPLM8P+DqAxNbRmJRPYJwvzfLFlfiufhqLeVdGY5Igb1ffm6b8VC4oOlCgnlpJhpcupPw8plIuE2/HUgnjeM+k/nPJ8RaHOreLk7PVJDIXthRqgAGAg0NsVdAwAHOHS0fQUe+Yu8zpZMfDU5Er3BhCvRw9MFx8OPGbEwd+Wi2PoRc1Yov5QcTIo9/YMJyX7l2PZPgG/f251uFDLABebSVOOwY9ZVo90GHBsBSV1gl/c/QlHxgIdIbciCCy4UveK9F7+yvJFNrEdGk1ptJYc8NknAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c59Hr3gvdz3cYd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 21:20:40 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c56jh6bZ5z9sSb;
	Mon, 18 Aug 2025 11:24:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrRcsrkZHasd; Mon, 18 Aug 2025 11:24:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c56jh5Kwwz9sSL;
	Mon, 18 Aug 2025 11:24:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A19568B764;
	Mon, 18 Aug 2025 11:24:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id iktC4Suv_m60; Mon, 18 Aug 2025 11:24:24 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F5358B763;
	Mon, 18 Aug 2025 11:24:24 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/8xx: Remove offset in SPRN_M_TWB
Date: Mon, 18 Aug 2025 11:24:22 +0200
Message-ID: <9710d960b512996e64beebfd368cfeaadb28b3ba.1755509047.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755509062; l=3826; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=TAsscSyJtpUCGKm9ZAZDquJX675SP3WAqWe4d5FCqsY=; b=RWSzwQK+jm9lIDUEzWeDOAVOPN+4fOow1YA3gENnqhWmpUJzpyJT8NKCSyZib+NMG+3ptGUcT 3jvCrlaLhTjCoCZHpuEYabHWnWnpcpW39JpthwYDm7O4y4Vo+lUyT9H
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SPRN_M_TWB contains the address of task PGD minus an offset which
compensates the offset required when accessing the kernel PGDIR.
However, since commit ac9f97ff8b32 ("powerpc/8xx: Inconditionally use
task PGDIR in DTLB misses") and commit 33c527522f39 ("powerpc/8xx:
Inconditionally use task PGDIR in ITLB misses") kernel PGDIR is not
used anymore in hot pathes.

Remove this offset which was added by
commit fde5a9057fcf ("powerpc/8xx: Optimise access to swapper_pg_dir")

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_8xx.S       | 16 +++++++++-------
 arch/powerpc/mm/nohash/mmu_context.c | 10 +---------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 56c5ebe21b99..78942fd6b4b9 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -190,7 +190,7 @@ instruction_counter:
 	INVALIDATE_ADJACENT_PAGES_CPU15(r10, r11)
 	mtspr	SPRN_MD_EPN, r10
 	mfspr	r10, SPRN_M_TWB	/* Get level 1 table */
-	lwz	r11, (swapper_pg_dir-PAGE_OFFSET)@l(r10)	/* Get level 1 entry */
+	lwz	r11, 0(r10)	/* Get level 1 entry */
 	mtspr	SPRN_MD_TWC, r11
 	mfspr	r10, SPRN_MD_TWC
 	lwz	r10, 0(r10)	/* Get the pte */
@@ -233,7 +233,7 @@ instruction_counter:
 	 */
 	mfspr	r10, SPRN_MD_EPN
 	mfspr	r10, SPRN_M_TWB	/* Get level 1 table */
-	lwz	r11, (swapper_pg_dir-PAGE_OFFSET)@l(r10)	/* Get level 1 entry */
+	lwz	r11, 0(r10)	/* Get level 1 entry */
 
 	mtspr	SPRN_MD_TWC, r11
 	mfspr	r10, SPRN_MD_TWC
@@ -375,7 +375,7 @@ FixupPGD:
 	mfspr	r10, SPRN_DAR
 	mtspr	SPRN_MD_EPN, r10
 	mfspr	r11, SPRN_M_TWB	/* Get level 1 table */
-	lwz	r10, (swapper_pg_dir - PAGE_OFFSET)@l(r11)	/* Get the level 1 entry */
+	lwz	r10, 0(r11)	/* Get the level 1 entry */
 	cmpwi	cr1, r10, 0
 	bne	cr1, 1f
 
@@ -384,7 +384,7 @@ FixupPGD:
 	lwz	r10, (swapper_pg_dir - PAGE_OFFSET)@l(r10)	/* Get the level 1 entry */
 	cmpwi	cr1, r10, 0
 	beq	cr1, 1f
-	stw	r10, (swapper_pg_dir - PAGE_OFFSET)@l(r11)	/* Set the level 1 entry */
+	stw	r10, 0(r11)	/* Set the level 1 entry */
 	mfspr	r10, SPRN_M_TW
 	mtcr	r10
 	mfspr	r10, SPRN_SPRG_SCRATCH0
@@ -412,9 +412,10 @@ FixupDAR:/* Entry point for dcbx workaround. */
 	tophys(r11, r10)
 	mfspr	r11, SPRN_M_TWB	/* Get level 1 table */
 	rlwinm	r11, r11, 0, 20, 31
-	oris	r11, r11, (swapper_pg_dir - PAGE_OFFSET)@ha
+	oris	r11, r11, (swapper_pg_dir - PAGE_OFFSET)@h
+	ori	r11, r11, (swapper_pg_dir - PAGE_OFFSET)@l
 3:
-	lwz	r11, (swapper_pg_dir-PAGE_OFFSET)@l(r11)	/* Get the level 1 entry */
+	lwz	r11, 0(r11)	/* Get the level 1 entry */
 	rlwinm	r11, r11, 0, ~_PMD_PAGE_8M
 	mtspr	SPRN_MD_TWC, r11
 	mfspr	r11, SPRN_MD_TWC
@@ -535,7 +536,8 @@ start_here:
 	li	r0,0
 	stwu	r0,THREAD_SIZE-STACK_FRAME_MIN_SIZE(r1)
 
-	lis	r6, swapper_pg_dir@ha
+	lis	r6, swapper_pg_dir@h
+	ori	r6, r6, swapper_pg_dir@l
 	tophys(r6,r6)
 	mtspr	SPRN_M_TWB, r6
 
diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index a1a4e697251a..28a96a10c907 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -203,15 +203,7 @@ static unsigned int steal_context_up(unsigned int id)
 static void set_context(unsigned long id, pgd_t *pgd)
 {
 	if (IS_ENABLED(CONFIG_PPC_8xx)) {
-		s16 offset = (s16)(__pa(swapper_pg_dir));
-
-		/*
-		 * Register M_TWB will contain base address of level 1 table minus the
-		 * lower part of the kernel PGDIR base address, so that all accesses to
-		 * level 1 table are done relative to lower part of kernel PGDIR base
-		 * address.
-		 */
-		mtspr(SPRN_M_TWB, __pa(pgd) - offset);
+		mtspr(SPRN_M_TWB, __pa(pgd));
 
 		/* Update context */
 		mtspr(SPRN_M_CASID, id - 1);
-- 
2.49.0


