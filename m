Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB6E901AB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 07:59:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyLjZ39X0z3vbc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 15:59:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyLdM1TVmz3cWF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 15:55:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4VyLcW1FPgz9v5V;
	Mon, 10 Jun 2024 07:55:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28k8qCYCauKS; Mon, 10 Jun 2024 07:55:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4VyLcL4Wnjz9v5s;
	Mon, 10 Jun 2024 07:54:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 964208B76E;
	Mon, 10 Jun 2024 07:54:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FarlN4awFhBP; Mon, 10 Jun 2024 07:54:58 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 70A898B76C;
	Mon, 10 Jun 2024 07:54:58 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 10/18] powerpc/e500: Remove enc and ind fields from struct mmu_psize_def
Date: Mon, 10 Jun 2024 07:54:55 +0200
Message-ID: <7518b2108edf2cc1274d3adb3821065deee3bda9.1717955559.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1717955558.git.christophe.leroy@csgroup.eu>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717998887; l=3777; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=GvUuKmINqllZ54PyQ+lDpy16CYLzBdm/Cr1rg49spF8=; b=OyfQUTod/0bbw4EyQQVBA/P5N3ZO8X30iPrJ8eUIij5YQvP1dKJOWaARcm2MOfKqCKfaLPaQm mmsdnfGbb/BDD75F8+P8mFNwxh4AT33inxGqOJ1S3GkD19a9/naVxbl
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

enc field is hidden behind BOOK3E_PAGESZ_XX macros, and when you look
closer you realise that this field is nothing else than the value of
shift minus ten.

So remove enc field and calculate tsize from shift field.

Also remove inc field which is unused.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
 arch/powerpc/include/asm/nohash/mmu-e500.h | 3 ---
 arch/powerpc/mm/nohash/book3e_pgtable.c    | 4 ++--
 arch/powerpc/mm/nohash/tlb.c               | 9 +--------
 arch/powerpc/mm/nohash/tlb_64e.c           | 2 +-
 4 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/mmu-e500.h b/arch/powerpc/include/asm/nohash/mmu-e500.h
index 7dc24b8632d7..b281d9eeaf1e 100644
--- a/arch/powerpc/include/asm/nohash/mmu-e500.h
+++ b/arch/powerpc/include/asm/nohash/mmu-e500.h
@@ -244,14 +244,11 @@ typedef struct {
 /* Page size definitions, common between 32 and 64-bit
  *
  *    shift : is the "PAGE_SHIFT" value for that page size
- *    penc  : is the pte encoding mask
  *
  */
 struct mmu_psize_def
 {
 	unsigned int	shift;	/* number of bits */
-	unsigned int	enc;	/* PTE encoding */
-	unsigned int    ind;    /* Corresponding indirect page size shift */
 	unsigned int	flags;
 #define MMU_PAGE_SIZE_DIRECT	0x1	/* Supported as a direct size */
 #define MMU_PAGE_SIZE_INDIRECT	0x2	/* Supported as an indirect size */
diff --git a/arch/powerpc/mm/nohash/book3e_pgtable.c b/arch/powerpc/mm/nohash/book3e_pgtable.c
index 1c5e4ecbebeb..ad2a7c26f2a0 100644
--- a/arch/powerpc/mm/nohash/book3e_pgtable.c
+++ b/arch/powerpc/mm/nohash/book3e_pgtable.c
@@ -29,10 +29,10 @@ int __meminit vmemmap_create_mapping(unsigned long start,
 		_PAGE_KERNEL_RW;
 
 	/* PTEs only contain page size encodings up to 32M */
-	BUG_ON(mmu_psize_defs[mmu_vmemmap_psize].enc > 0xf);
+	BUG_ON(mmu_psize_defs[mmu_vmemmap_psize].shift - 10 > 0xf);
 
 	/* Encode the size in the PTE */
-	flags |= mmu_psize_defs[mmu_vmemmap_psize].enc << 8;
+	flags |= (mmu_psize_defs[mmu_vmemmap_psize].shift - 10) << 8;
 
 	/* For each PTE for that area, map things. Note that we don't
 	 * increment phys because all PTEs are of the large size and
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index f57dc721d063..b653a7be4cb1 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -53,37 +53,30 @@
 struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 	[MMU_PAGE_4K] = {
 		.shift	= 12,
-		.enc	= BOOK3E_PAGESZ_4K,
 	},
 	[MMU_PAGE_2M] = {
 		.shift	= 21,
-		.enc	= BOOK3E_PAGESZ_2M,
 	},
 	[MMU_PAGE_4M] = {
 		.shift	= 22,
-		.enc	= BOOK3E_PAGESZ_4M,
 	},
 	[MMU_PAGE_16M] = {
 		.shift	= 24,
-		.enc	= BOOK3E_PAGESZ_16M,
 	},
 	[MMU_PAGE_64M] = {
 		.shift	= 26,
-		.enc	= BOOK3E_PAGESZ_64M,
 	},
 	[MMU_PAGE_256M] = {
 		.shift	= 28,
-		.enc	= BOOK3E_PAGESZ_256M,
 	},
 	[MMU_PAGE_1G] = {
 		.shift	= 30,
-		.enc	= BOOK3E_PAGESZ_1GB,
 	},
 };
 
 static inline int mmu_get_tsize(int psize)
 {
-	return mmu_psize_defs[psize].enc;
+	return mmu_psize_defs[psize].shift - 10;
 }
 #else
 static inline int mmu_get_tsize(int psize)
diff --git a/arch/powerpc/mm/nohash/tlb_64e.c b/arch/powerpc/mm/nohash/tlb_64e.c
index 053128a5636c..7988238496d7 100644
--- a/arch/powerpc/mm/nohash/tlb_64e.c
+++ b/arch/powerpc/mm/nohash/tlb_64e.c
@@ -53,7 +53,7 @@ int extlb_level_exc;
  */
 void tlb_flush_pgtable(struct mmu_gather *tlb, unsigned long address)
 {
-	int tsize = mmu_psize_defs[mmu_pte_psize].enc;
+	int tsize = mmu_psize_defs[mmu_pte_psize].shift - 10;
 
 	if (book3e_htw_mode != PPC_HTW_NONE) {
 		unsigned long start = address & PMD_MASK;
-- 
2.44.0

