Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E0F26C25D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 13:59:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrzDH4P4kzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 21:59:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Brz8n2w7ZzDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 21:56:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GiuPdiHL; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Brz8n1jrWz9sTp; Wed, 16 Sep 2020 21:56:41 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Brz8n0hySz9sTq; Wed, 16 Sep 2020 21:56:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600257401;
 bh=Z26BkuhVe0HrwNQDv5PFXnAKYf5vkQsavcUOXU+QxqA=;
 h=From:To:Subject:Date:From;
 b=GiuPdiHLbsAKlTnGZ0T/JGpNO+wyydObY59BpD+vwj8/WNcz/5T1L7INfdE6YLsB+
 MxWOxsDoxGcvh0WRNaaoSwa3wZ1UhJeACGoZ8iIs8EOdym16LH9BY8tS7vYIQhKRzH
 vyk0mrAObtHEBoSF37yGF4eo9zwZ78binEN8IQ5/2Y03Lh4YxwOy6tawHwQ49iG+pl
 gp1nYSpTvSzWHzSHzKcJ0FfGedvybm4WXBhH7d4kF0Mlcgo7wsMxTxspRRDHTJLUY/
 3t4jGhRL4xlpHDl97AHeYzsEdizoVrwaq2mOxK8oAyT75swg7HLfWzN6AFk/9WhzyM
 nWMCR/nNhvnXw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/2] powerpc/mm/64s: Fix slb_setup_new_exec() sparse warning
Date: Wed, 16 Sep 2020 21:56:36 +1000
Message-Id: <20200916115637.3100484-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparse says:
  symbol slb_setup_new_exec was not declared. Should it be static?

No, it should have a declaration in a header, add one.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/book3s64/internal.h    | 2 ++
 arch/powerpc/mm/book3s64/mmu_context.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
index 7eda0d30d765..c12d78ee42f5 100644
--- a/arch/powerpc/mm/book3s64/internal.h
+++ b/arch/powerpc/mm/book3s64/internal.h
@@ -13,4 +13,6 @@ static inline bool stress_slb(void)
 	return static_branch_unlikely(&stress_slb_key);
 }
 
+void slb_setup_new_exec(void);
+
 #endif /* ARCH_POWERPC_MM_BOOK3S64_INTERNAL_H */
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 0ba30b8b935b..1c54821de7bf 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -21,6 +21,8 @@
 #include <asm/mmu_context.h>
 #include <asm/pgalloc.h>
 
+#include "internal.h"
+
 static DEFINE_IDA(mmu_context_ida);
 
 static int alloc_context_id(int min_id, int max_id)
@@ -48,8 +50,6 @@ int hash__alloc_context_id(void)
 }
 EXPORT_SYMBOL_GPL(hash__alloc_context_id);
 
-void slb_setup_new_exec(void);
-
 static int realloc_context_ids(mm_context_t *ctx)
 {
 	int i, id;
-- 
2.25.1

