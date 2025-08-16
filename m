Return-Path: <linuxppc-dev+bounces-11068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 887DEB28FA0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Aug 2025 18:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c44jT6qMWz2xQ4;
	Sun, 17 Aug 2025 02:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755363037;
	cv=none; b=Pg/Mz6pZCTvu0pNLJf5n8q+nQUbAlzogBfT6LnFrEJPgAHxgj4cIPBEtyT58Heb4y/0vppMfA8R5jIqyLiE0V+Cccm6B1a6jCh4vmnZ8P5aXDpm4wQD4plL2AxIxmNOJVZeay9B/FLkB/2FVuC+RNcgo9iloKnwMzGSY42VuV7pIbJRPlaLoO8DOGOfqb/ezWS+Jk6XqWQ4ZmPqLSY4TDTwgE4bsiGw6Sz1qvw83VQ6htAlsqvJ+6FmTjADqRRrRR28Gi3kfZBAySIEhf74gmmda/JQc+hpP8UrSbelJNZ49K0EkKhhAFh838c/bmfdvl598EKjWr/hLreHysl/zeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755363037; c=relaxed/relaxed;
	bh=XUxIsoBIflvNhY8xVZqwlRmv6USwgUVpJCMVDG9g/0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FQVuDY/lj8EDfjCUaDAaC+GrO4ztw9NtkrZnZZGbZ+3RouRUd1PPAJDb6Bea0fUhXXCrlasN6VlT70FJybmaPFIUUOiBqlSg4J2NeSD9IiQ8ruT7NRvFS379Up9mdeiKc6QyZXKzIzMyGIirfKxjwKL6LOXEVsprJynfb/9756Y+g+pOnZJ9m8WBmAY8kCUD5QgIkws4wz+QMFhDoJMTipoKwYpo3bvr1IJm3YCvkpBs7bTsgJzw/4LvqgDEpt3kEWupcl54F2ln2MnECvRI6KQt/R2OvcO8oUWsVNJ2TyuESSRCDcHtTiss/4GCMUIJAl1fdbe73gGMxk7jDAh/ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c44jT0rxRz2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Aug 2025 02:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c44Kp47h3z9sRk;
	Sat, 16 Aug 2025 18:33:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lali5_hbY1bi; Sat, 16 Aug 2025 18:33:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c44Kp31YCz9sRh;
	Sat, 16 Aug 2025 18:33:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 462688B764;
	Sat, 16 Aug 2025 18:33:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0_U2uxviJf6w; Sat, 16 Aug 2025 18:33:34 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BAB598B763;
	Sat, 16 Aug 2025 18:33:33 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/8xx: Remove left-over instruction and comments in DataStoreTLBMiss handler
Date: Sat, 16 Aug 2025 18:33:26 +0200
Message-ID: <5811c8d1d6187f280ad140d6c0ad6010e41eeaeb.1755361995.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755362007; l=2260; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=AiHXMtFhh8Ce2WYooZYS7g9S+I96bwlKG8VhkoxFeF0=; b=KnUG1yo8uoFsuqw9l+g5FYFCA3AOjMFrcRUhk0XhlPdq+TIpJlAO0U88/6USwdRjPo/o8CS+5 HR98q6h41BPDzJhoktpXyyFYxwWSA/83tfRokZIIyHLYWdBk86HK12s
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit ac9f97ff8b32 ("powerpc/8xx: Inconditionally use task PGDIR in
DTLB misses") removed the test that needed the valeur in SPRN_EPN but
failed to remove the read.

Remove it.

And remove related comments, including the very same comment
in InstructionTLBMiss that should have been removed by
commit 33c527522f39 ("powerpc/8xx: Inconditionally use task PGDIR in
ITLB misses").

Also update the comment about absence of a second level table which
has been handled implicitely since commit 5ddb75cee5af ("powerpc/8xx:
remove tests on PGDIR entry validity").

Fixes: ac9f97ff8b32 ("powerpc/8xx: Inconditionally use task PGDIR in DTLB misses")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_8xx.S | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 78942fd6b4b9..393e19ee1322 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -162,7 +162,7 @@ instruction_counter:
  * For the MPC8xx, this is a software tablewalk to load the instruction
  * TLB.  The task switch loads the M_TWB register with the pointer to the first
  * level table.
- * If we discover there is no second level table (value is zero) or if there
+ * If there is no second level table (value is zero) or if there
  * is an invalid pte, we load that into the TLB, which causes another fault
  * into the TLB Error interrupt where we can handle such problems.
  * We have to use the MD_xxx registers for the tablewalk because the
@@ -183,9 +183,6 @@ instruction_counter:
 	mtspr	SPRN_SPRG_SCRATCH2, r10
 	mtspr	SPRN_M_TW, r11
 
-	/* If we are faulting a kernel address, we have to use the
-	 * kernel page tables.
-	 */
 	mfspr	r10, SPRN_SRR0	/* Get effective address of fault */
 	INVALIDATE_ADJACENT_PAGES_CPU15(r10, r11)
 	mtspr	SPRN_MD_EPN, r10
@@ -228,10 +225,6 @@ instruction_counter:
 	mtspr	SPRN_SPRG_SCRATCH2, r10
 	mtspr	SPRN_M_TW, r11
 
-	/* If we are faulting a kernel address, we have to use the
-	 * kernel page tables.
-	 */
-	mfspr	r10, SPRN_MD_EPN
 	mfspr	r10, SPRN_M_TWB	/* Get level 1 table */
 	lwz	r11, 0(r10)	/* Get level 1 entry */
 
-- 
2.49.0


