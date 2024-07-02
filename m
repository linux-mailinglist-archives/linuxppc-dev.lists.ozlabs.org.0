Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30E923FAA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 15:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD4Fz04n0z79fl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 23:56:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD4903nfMz3fq5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 23:52:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4WD4890hHzz9v49;
	Tue,  2 Jul 2024 15:51:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zAmKaaQ0jHm; Tue,  2 Jul 2024 15:51:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4WD4833KVRz9tZl;
	Tue,  2 Jul 2024 15:51:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CAF78B774;
	Tue,  2 Jul 2024 15:51:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zXEONt1F524O; Tue,  2 Jul 2024 15:51:31 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.12])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E3F168B764;
	Tue,  2 Jul 2024 15:51:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v7 12/23] powerpc/8xx: Fix size given to set_huge_pte_at()
Date: Tue,  2 Jul 2024 15:51:24 +0200
Message-ID: <97f2090011e25d99b6b0aae73e22e1b921c5d1fb.1719928057.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719928057.git.christophe.leroy@csgroup.eu>
References: <cover.1719928057.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719928275; l=967; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=D5c7rc2WApQ3tCbzTNEVQ0Gk3Td9OpyCeDWt3oeDJWA=; b=uQUtdIUq84SS96MK3Yyi7eFh/R82rncNurgunjBL3cKhAN7hd4/KdduSVyWl3x7FwJ20kvEBT AAWK0LcoeyYCOlx3G8nxXwuG1GtSCMyrGnv/4xWUvckGvRl6DFLaV/A
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

set_huge_pte_at() expects the size of the hugepage as an int, not the
psize which is the index of the page definition in table mmu_psize_defs[]

Fixes: 935d4f0c6dc8 ("mm: hugetlb: add huge page size param to set_huge_pte_at()")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
 arch/powerpc/mm/nohash/8xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 43d4842bb1c7..d93433e26ded 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -94,7 +94,8 @@ static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
 		return -EINVAL;
 
 	set_huge_pte_at(&init_mm, va, ptep,
-			pte_mkhuge(pfn_pte(pa >> PAGE_SHIFT, prot)), psize);
+			pte_mkhuge(pfn_pte(pa >> PAGE_SHIFT, prot)),
+			1UL << mmu_psize_to_shift(psize));
 
 	return 0;
 }
-- 
2.44.0

