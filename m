Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5164FA9DD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 19:20:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbMMM5jF5z3dNG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 03:20:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbMK61hYFz3bns
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 03:18:34 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KbMJp1HzLz9sTS;
 Sat,  9 Apr 2022 19:18:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39dSKG58ncYZ; Sat,  9 Apr 2022 19:18:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KbMJl4lgtz9sT3;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8EE408B765;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iiYIfqptCmas; Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 994AB8B79F;
 Sat,  9 Apr 2022 19:18:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 239HI7YE833214
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 9 Apr 2022 19:18:07 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 239HI7XU833213;
 Sat, 9 Apr 2022 19:18:07 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, akpm@linux-foundation.org
Subject: [PATCH v10 05/13] powerpc/mm: Move vma_mmu_pagesize()
Date: Sat,  9 Apr 2022 19:17:29 +0200
Message-Id: <1302e000d529c93d07208f1fae90f938e7a551b4.1649523076.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649523076.git.christophe.leroy@csgroup.eu>
References: <cover.1649523076.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649524639; l=1793; s=20211009;
 h=from:subject:message-id; bh=bx8qaeX914dm/qgyDYd+w6J7NWMH8VOi7HP/6ov9wh8=;
 b=bbfm6Q4FTG4t1UJFIbhOg831/onZhxL2dVR5Ph6r2MHVentUFeGjusgBMmwJkS+D63kA7JWHfX2y
 Mx+kYC+3CZyRqGTz6+4W2OhUqqkyBvjLFKqLZ1d+19mNRC34HGmC
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vma_mmu_pagesize() is only required for slices,
otherwise there is a generic weak version doing the
exact same thing.

Move it to slice.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/hugetlbpage.c | 11 -----------
 arch/powerpc/mm/slice.c       |  9 +++++++++
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index b642a5a8668f..7b89f0799d82 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -565,17 +565,6 @@ unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 }
 #endif
 
-unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
-{
-	/* With radix we don't use slice, so derive it from vma*/
-	if (IS_ENABLED(CONFIG_PPC_MM_SLICES) && !radix_enabled()) {
-		unsigned int psize = get_slice_psize(vma->vm_mm, vma->vm_start);
-
-		return 1UL << mmu_psize_to_shift(psize);
-	}
-	return vma_kernel_pagesize(vma);
-}
-
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
 	int shift = __ffs(size);
diff --git a/arch/powerpc/mm/slice.c b/arch/powerpc/mm/slice.c
index f42711f865f3..8a3ac062b71e 100644
--- a/arch/powerpc/mm/slice.c
+++ b/arch/powerpc/mm/slice.c
@@ -759,4 +759,13 @@ int slice_is_hugepage_only_range(struct mm_struct *mm, unsigned long addr,
 
 	return !slice_check_range_fits(mm, maskp, addr, len);
 }
+
+unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
+{
+	/* With radix we don't use slice, so derive it from vma*/
+	if (radix_enabled())
+		return vma_kernel_pagesize(vma);
+
+	return 1UL << mmu_psize_to_shift(get_slice_psize(vma->vm_mm, vma->vm_start));
+}
 #endif
-- 
2.35.1

