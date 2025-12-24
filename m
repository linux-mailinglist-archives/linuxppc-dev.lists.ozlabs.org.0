Return-Path: <linuxppc-dev+bounces-15002-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F46CDC1CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:22:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbqGG6mccz2yth;
	Wed, 24 Dec 2025 22:21:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766575318;
	cv=none; b=RJwkDJZG4x//OyEhRN7NJwfrY43ru+WGcNUSQ9hdcGx0zXzZXnrn42sWMTSyYhh759qEBrP332a4HJazgUy7LTppk084/nIaQl59ywtkf0wEzl6VS6zXI5ETbi0KEByVoCLx041pBc2otKCeoEuli/YUMgxJ4MYXt+/ZvdnzanyDFOduEBj80DLwMVup6yFNzFsCLcZaWT2DB56Ys2krNAKTuFU7GAAxfmWeu2u7B4LBGW2kNQrNZKXn1IIFG/SOWBpWIZFRRJS3mlCW1ZArAn3sbCre03eZSaR4q0T9kSjvQ7ohpO1xV1VDBPBFMjGTm3G+BE2wSKVpZTYlCdzJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766575318; c=relaxed/relaxed;
	bh=z7fDlnt/LqilRpQpJcPsgCerOUBQFMMO6BSjSlzN/r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A56xCOn8R7wxuJjsG/+FEdEJTxQZfiF1OxIV9JKgbi7cVBlLq/EDGvL+RRaGM4su9Veb8hMqjz3Opowpj/PnAfw9apFlhfnUlevcTt1p3TW1anfA/KRUB75F5OR4wUoy9dR4yDAigIQj46dBb6h2eSyKFcUfuU9CjsvScolwXd49QJYFEKNOsHO7jH5fSe5RUCylvzKQdfu0RdSatusA59R5aI0jXpqbC7OajA5WFnsdnQcanWrfTOjSNJOhOpJPAGqRNGR5gIUd6v4gAEuVA7gp9a/2eHp3Lp1TBuDXhMS+VJmRAYmTrmitbcIPBZX6c+rLnFizxzppcOGSqW2Zlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ofh7zz7X; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ofh7zz7X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbqGG16Qfz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 22:21:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F15D42DE8;
	Wed, 24 Dec 2025 11:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96ABFC4CEFB;
	Wed, 24 Dec 2025 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766575286;
	bh=sMpjUe/hhb/piJnpNO9t/nbJ3zmkkCHnDq8UFDbXN3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ofh7zz7X+ylwXIgwjRZjioTZIAvCjNRStNAv+l8zG4cpSGHrEsKYZLcFdlxdwj+Ej
	 BzPTMUJ2UB5SlXTIZyizOH0b20iMiaWr9BDSfMdOn6x0K6CWHXEBD03ctI/CjhsO9m
	 77F0EKSD2MdeJ5GBvURJzc6ctC3rwG8N9zHC0ZpvOnWVvip9+N8uCremlx+9pq8Gwq
	 nv1WFfSWqthHeqIXWFpM35MVkY1W1wb3wJF+z705AaH3t/RoansN+h9/0PbLD9NLh0
	 4XhMSOQcpHcqjczp7fCgfF+h+Si4jbJa9IaDRPBC/E9K5rllDqRY452AodsSbSOca8
	 9CnghKOS5D65A==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 5/7] powerpc/32s: Fix segments setup when TASK_SIZE is not a multiple of 256M
Date: Wed, 24 Dec 2025 12:20:53 +0100
Message-ID: <8928d906079e156c59794c41e826a684eaaaebb4.1766574657.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1766574657.git.chleroy@kernel.org>
References: <cover.1766574657.git.chleroy@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4811; i=chleroy@kernel.org; h=from:subject:message-id; bh=UMeT/KUp8+woidCjPqCoL1mGuuOWLtvzg8TYGXLU1xw=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR6n5kj6+CyYFaBjOmtuNx3ex1//NgmrKataLVn/Qv36 saZrd+rO0pZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBEeMoY/qcVCQc+EGWr/PLc 6ubp4FuTAoWOf7EJZ/q539416NWH9lJGhrls2oKeu+wbhN/YZs6rP5O2MHWn41kh5sPbP/Jb1ba XcAEA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Christophe Leroy <christophe.leroy@csgroup.eu>

For book3s/32 it is assumed that TASK_SIZE is a multiple of 256 Mbytes,
but Kconfig allows any value for TASK_SIZE.

In all relevant calculations, align TASK_SIZE to the upper 256 Mbytes
boundary.

Also use ASM_CONST() in the definition of TASK_SIZE to ensure it is
seen as an unsigned constant.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/mmu-hash.h | 5 ++++-
 arch/powerpc/include/asm/task_size_32.h       | 2 +-
 arch/powerpc/kernel/asm-offsets.c             | 2 +-
 arch/powerpc/kernel/head_book3s_32.S          | 6 +++---
 arch/powerpc/mm/book3s32/mmu.c                | 2 +-
 arch/powerpc/mm/ptdump/segment_regs.c         | 2 +-
 6 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/mmu-hash.h b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
index 8435bf3cdabf..387d370c8a35 100644
--- a/arch/powerpc/include/asm/book3s/32/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
@@ -192,12 +192,15 @@ extern s32 patch__hash_page_B, patch__hash_page_C;
 extern s32 patch__flush_hash_A0, patch__flush_hash_A1, patch__flush_hash_A2;
 extern s32 patch__flush_hash_B;
 
+#include <linux/sizes.h>
+#include <linux/align.h>
+
 #include <asm/reg.h>
 #include <asm/task_size_32.h>
 
 static __always_inline void update_user_segment(u32 n, u32 val)
 {
-	if (n << 28 < TASK_SIZE)
+	if (n << 28 < ALIGN(TASK_SIZE, SZ_256M))
 		mtsr(val + n * 0x111, n << 28);
 }
 
diff --git a/arch/powerpc/include/asm/task_size_32.h b/arch/powerpc/include/asm/task_size_32.h
index de7290ee770f..30edc21f71fb 100644
--- a/arch/powerpc/include/asm/task_size_32.h
+++ b/arch/powerpc/include/asm/task_size_32.h
@@ -6,7 +6,7 @@
 #error User TASK_SIZE overlaps with KERNEL_START address
 #endif
 
-#define TASK_SIZE (CONFIG_TASK_SIZE)
+#define TASK_SIZE ASM_CONST(CONFIG_TASK_SIZE)
 
 /*
  * This decides where the kernel will search for a free chunk of vm space during
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index a4bc80b30410..46149f326fd4 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -331,7 +331,7 @@ int main(void)
 
 #ifndef CONFIG_PPC64
 	DEFINE(TASK_SIZE, TASK_SIZE);
-	DEFINE(NUM_USER_SEGMENTS, TASK_SIZE>>28);
+	DEFINE(NUM_USER_SEGMENTS, ALIGN(TASK_SIZE, SZ_256M) >> 28);
 #endif /* ! CONFIG_PPC64 */
 
 	/* datapage offsets for use by vdso */
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index cb2bca76be53..c1779455ea32 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -420,7 +420,7 @@ InstructionTLBMiss:
 	lwz	r2,0(r2)		/* get pmd entry */
 #ifdef CONFIG_EXECMEM
 	rlwinm	r3, r0, 4, 0xf
-	subi	r3, r3, (TASK_SIZE >> 28) & 0xf
+	subi	r3, r3, NUM_USER_SEGMENTS
 #endif
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
 	beq-	InstructionAddressInvalid	/* return if no mapping */
@@ -475,7 +475,7 @@ DataLoadTLBMiss:
 	lwz	r2,0(r1)		/* get pmd entry */
 	rlwinm	r3, r0, 4, 0xf
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
-	subi	r3, r3, (TASK_SIZE >> 28) & 0xf
+	subi	r3, r3, NUM_USER_SEGMENTS
 	beq-	2f			/* bail if no mapping */
 1:	rlwimi	r2,r0,22,20,29		/* insert next 10 bits of address */
 	lwz	r2,0(r2)		/* get linux-style pte */
@@ -554,7 +554,7 @@ DataStoreTLBMiss:
 	lwz	r2,0(r1)		/* get pmd entry */
 	rlwinm	r3, r0, 4, 0xf
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
-	subi	r3, r3, (TASK_SIZE >> 28) & 0xf
+	subi	r3, r3, NUM_USER_SEGMENTS
 	beq-	2f			/* bail if no mapping */
 1:
 	rlwimi	r2,r0,22,20,29		/* insert next 10 bits of address */
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index c42ecdf94e48..37eefc6786a7 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -225,7 +225,7 @@ int mmu_mark_initmem_nx(void)
 
 	BUILD_BUG_ON(ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE);
 
-	for (i = TASK_SIZE >> 28; i < 16; i++) {
+	for (i = ALIGN(TASK_SIZE, SZ_256M) >> 28; i < 16; i++) {
 		/* Do not set NX on VM space for modules */
 		if (is_module_segment(i << 28))
 			continue;
diff --git a/arch/powerpc/mm/ptdump/segment_regs.c b/arch/powerpc/mm/ptdump/segment_regs.c
index 9df3af8d481f..c06704b18a2c 100644
--- a/arch/powerpc/mm/ptdump/segment_regs.c
+++ b/arch/powerpc/mm/ptdump/segment_regs.c
@@ -31,7 +31,7 @@ static int sr_show(struct seq_file *m, void *v)
 	int i;
 
 	seq_puts(m, "---[ User Segments ]---\n");
-	for (i = 0; i < TASK_SIZE >> 28; i++)
+	for (i = 0; i < ALIGN(TASK_SIZE, SZ_256M) >> 28; i++)
 		seg_show(m, i);
 
 	seq_puts(m, "\n---[ Kernel Segments ]---\n");
-- 
2.49.0


