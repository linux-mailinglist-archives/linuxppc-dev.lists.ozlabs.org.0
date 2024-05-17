Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 762D48C8C7A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 21:03:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgxFh02b4z3g8F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 05:03:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgxC53jM6z3cY0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 05:01:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Vgx9Z0w2nz9tC6;
	Fri, 17 May 2024 21:00:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRylV9dNZXBG; Fri, 17 May 2024 21:00:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Vgx9R0wHkz9st0;
	Fri, 17 May 2024 21:00:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1AE658B783;
	Fri, 17 May 2024 21:00:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wBPqeT3DWKib; Fri, 17 May 2024 21:00:11 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.121])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 871678B775;
	Fri, 17 May 2024 21:00:10 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH v2 14/20] powerpc/e500: Remove enc field from struct mmu_psize_def
Date: Fri, 17 May 2024 21:00:08 +0200
Message-ID: <9c7f189b7733b00e8dc9825e76b6bb257bbd519b.1715971869.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1715971869.git.christophe.leroy@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715972397; l=3486; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=pFirDn7W+oe6R3pUl0dSDaJRwGy9nlgpjqjg2SeMSNQ=; b=E3J0KGxGsf8FrjvkBDhhITz+4DWq4o5mYJzxociqOJHp4HQfKVF3qKs8cVbpy+aXKv7aCLhm3 RAhL9DooCe8A/GRoQaTLyxdSbZ0OJl1YQgzG/IHv+zB88ARlv6/XFtT
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

Also remove inc filed which is unused.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/mmu-e500.h |  3 ---
 arch/powerpc/mm/nohash/book3e_pgtable.c    |  4 ++--
 arch/powerpc/mm/nohash/tlb.c               | 11 ++---------
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/mmu-e500.h b/arch/powerpc/include/asm/nohash/mmu-e500.h
index 792bfaafd70b..4167da0c0241 100644
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
index 1caccbf4c138..10b5a6b60450 100644
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
@@ -371,7 +364,7 @@ void tlb_flush(struct mmu_gather *tlb)
  */
 void tlb_flush_pgtable(struct mmu_gather *tlb, unsigned long address)
 {
-	int tsize = mmu_psize_defs[mmu_pte_psize].enc;
+	int tsize = mmu_get_tsize(mmu_pte_psize);
 
 	if (book3e_htw_mode != PPC_HTW_NONE) {
 		unsigned long start = address & PMD_MASK;
-- 
2.44.0

