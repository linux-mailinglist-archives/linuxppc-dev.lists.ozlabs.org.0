Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D4F34F589
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 02:40:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F96t36ZLmz3bwS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 11:40:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CI+wrZlx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CI+wrZlx; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F96rF6hVZz3brq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 11:38:53 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F96rC1YFRz9sWP; Wed, 31 Mar 2021 11:38:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617151131;
 bh=FWLikmqZe+OoMmiv9wpj26zh22UFEqSYhhpH4zXT32A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CI+wrZlxycvIEZhWBoKDsVAypNNrwR9tlbyxPiNtsUs8s+ML2RZKFxl6kLvrLLn1J
 +tpP0PGeIzFqYzo4QKNGUuU1nd8gBsii11i/nX7ZnFyR8fe/tjLZKqqie2aztvf6kY
 Y9bSAKPI5sBK/H19HsMBv26f0c46hkmV+25/WGrs9USt7mTNR4CRS0ffwLiUIUAVaI
 fLCjeUYaPpG9NqKZwlZ2it+X/E7NagscCsp59YnEz6JhJdORFvebjLI92Nv4RKJW+f
 4P+i28nIRbXylc0gusnXvWV0r4Vk9T6VDwSy9InWQgFRG05FhBNTQ+cvtcXERvTYCd
 N1f8y6nHCw5vg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/6] powerpc/mm/64s/hash: Factor out change_memory_range()
Date: Wed, 31 Mar 2021 11:38:43 +1100
Message-Id: <20210331003845.216246-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331003845.216246-1-mpe@ellerman.id.au>
References: <20210331003845.216246-1-mpe@ellerman.id.au>
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

Pull the loop calling hpte_updateboltedpp() out of
hash__change_memory_range() into a helper function. We need it to be a
separate function for the next patch.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/book3s64/hash_pgtable.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

v2: Unchanged.

diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 03819c259f0a..3663d3cdffac 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -400,10 +400,23 @@ EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
+static void change_memory_range(unsigned long start, unsigned long end,
+				unsigned int step, unsigned long newpp)
+{
+	unsigned long idx;
+
+	pr_debug("Changing page protection on range 0x%lx-0x%lx, to 0x%lx, step 0x%x\n",
+		 start, end, newpp, step);
+
+	for (idx = start; idx < end; idx += step)
+		/* Not sure if we can do much with the return value */
+		mmu_hash_ops.hpte_updateboltedpp(newpp, idx, mmu_linear_psize,
+							mmu_kernel_ssize);
+}
+
 static bool hash__change_memory_range(unsigned long start, unsigned long end,
 				      unsigned long newpp)
 {
-	unsigned long idx;
 	unsigned int step, shift;
 
 	shift = mmu_psize_defs[mmu_linear_psize].shift;
@@ -415,13 +428,7 @@ static bool hash__change_memory_range(unsigned long start, unsigned long end,
 	if (start >= end)
 		return false;
 
-	pr_debug("Changing page protection on range 0x%lx-0x%lx, to 0x%lx, step 0x%x\n",
-		 start, end, newpp, step);
-
-	for (idx = start; idx < end; idx += step)
-		/* Not sure if we can do much with the return value */
-		mmu_hash_ops.hpte_updateboltedpp(newpp, idx, mmu_linear_psize,
-							mmu_kernel_ssize);
+	change_memory_range(start, end, step, newpp);
 
 	return true;
 }
-- 
2.25.1

