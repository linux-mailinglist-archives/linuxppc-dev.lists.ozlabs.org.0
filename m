Return-Path: <linuxppc-dev+bounces-11173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97723B2EEA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Aug 2025 08:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6v8t0qtyz2yhD;
	Thu, 21 Aug 2025 16:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755759038;
	cv=none; b=Hg6Q+25fo+ok79rvsSTzhTVy9Jat82S3FVec8JbaBWtS/eIoTI1SPwi7+b79VIYvM4Lixj9aeWvhaFWQBvK8dAxI+jd1McNq3ZdeZTBRg2mzWkZ0jB0JPjRRROjT81xXj6ocxCTlBdhTbdwxBsLfbWtoahg6ut6HKgV4HNDZXaQ09a8W3/VacjvJeBni/bs23/5deFsjc2c9Nm340qGdsI4WkIIKyOYuTlBkVP9hXAVgq4pqk42lQaKoMWcFfg0OG4Mw1l/QTgAeXBiYBKWuqZMdkFwYWkDjk4HY1geO6sW+/R+Q6o0wgsvl3azcqD1nx/bfeqY+35tY5QihTk5awg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755759038; c=relaxed/relaxed;
	bh=AsOgCFwMrCOl4tjM7v5ZSx6lIOE/x6qrhamTahUkojs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BhSMxngo07DSVP2SQ69RRMcHHY6P6S8A+2hjLhk8wQ6NuJs5kwq2wIvluk6zvtF24Lxd/HiIhXD37aeIPNYPVEVNGjSWvamDvU1QkzqxgK7zzHS3r52bScszkMVgLWXTIpucPk9pHpw/YxACSA/YVsCo5vYiJ01cVOCg/1t4Aq/NUTBVnHMSvLVclq/N5M9OgiwSBwXmUYvZh9GNkBKjt1fP1JP4a0CVEjDYHeF4f8w6WKjbrj4sS7STneCNwjXhSXa7hWQI1g1SN3YIzO9WzDNaB1mAXardJ378QLduniLKHg4Hx5TLLxTBsfAyG094ANPNYAicAzytTlo00HuRMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6v8s22txz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Aug 2025 16:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c6tjb6Dxlz9sRs;
	Thu, 21 Aug 2025 08:30:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBZ596fMmV_9; Thu, 21 Aug 2025 08:30:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c6tjb5Sflz9sRk;
	Thu, 21 Aug 2025 08:30:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A473D8B76C;
	Thu, 21 Aug 2025 08:30:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9xKpAQnhDf4U; Thu, 21 Aug 2025 08:30:27 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 372FB8B763;
	Thu, 21 Aug 2025 08:30:27 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/603: Really copy kernel PGD entries into all PGDIRs
Date: Thu, 21 Aug 2025 08:30:18 +0200
Message-ID: <752ab7514cae089a2dd7cc0f3d5e35849f76adb9.1755757797.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755757819; l=2209; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=iyl6104RZSrIlJicOe4iR8mRE0MXWiG2nNwBytsDVko=; b=jrtj+Mhrve85dIiULvqBIHwkjs+0MUxfUNNTTBQwdFwyoZP1NSdSfQbyzXeXuAyUbarBVHbC4 1ab825nC7UaBkYOka/LjRy2gDK1c8nbIQ1duIz9ax+0mbH9198THgdr
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 82ef440f9a38 ("powerpc/603: Copy kernel PGD entries into all
PGDIRs and preallocate execmem page tables") was supposed to extend
to powerpc 603 the copy of kernel PGD entries into all PGDIRs
implemented in a previous patch on the 8xx. But 603 is book3s/32 and
uses a duplicate of pgd_alloc() defined in another header.

So really do the copy at the correct place for the 603.

Fixes: 82ef440f9a38 ("powerpc/603: Copy kernel PGD entries into all PGDIRs and preallocate execmem page tables")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/pgalloc.h | 10 ++++++++--
 arch/powerpc/include/asm/nohash/pgalloc.h    |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgalloc.h b/arch/powerpc/include/asm/book3s/32/pgalloc.h
index dd4eb3063175..f4390704d5ba 100644
--- a/arch/powerpc/include/asm/book3s/32/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/32/pgalloc.h
@@ -7,8 +7,14 @@
 
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	return kmem_cache_alloc(PGT_CACHE(PGD_INDEX_SIZE),
-			pgtable_gfp_flags(mm, GFP_KERNEL));
+	pgd_t *pgd = kmem_cache_alloc(PGT_CACHE(PGD_INDEX_SIZE),
+				      pgtable_gfp_flags(mm, GFP_KERNEL));
+
+#ifdef CONFIG_PPC_BOOK3S_603
+	memcpy(pgd + USER_PTRS_PER_PGD, swapper_pg_dir + USER_PTRS_PER_PGD,
+	       (MAX_PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
+#endif
+	return pgd;
 }
 
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
diff --git a/arch/powerpc/include/asm/nohash/pgalloc.h b/arch/powerpc/include/asm/nohash/pgalloc.h
index bb5f3e8ea912..4ef780b291bc 100644
--- a/arch/powerpc/include/asm/nohash/pgalloc.h
+++ b/arch/powerpc/include/asm/nohash/pgalloc.h
@@ -22,7 +22,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 	pgd_t *pgd = kmem_cache_alloc(PGT_CACHE(PGD_INDEX_SIZE),
 			pgtable_gfp_flags(mm, GFP_KERNEL));
 
-#if defined(CONFIG_PPC_8xx) || defined(CONFIG_PPC_BOOK3S_603)
+#ifdef CONFIG_PPC_8xx
 	memcpy(pgd + USER_PTRS_PER_PGD, swapper_pg_dir + USER_PTRS_PER_PGD,
 	       (MAX_PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
 #endif
-- 
2.49.0


