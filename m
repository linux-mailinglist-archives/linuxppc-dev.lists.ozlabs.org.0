Return-Path: <linuxppc-dev+bounces-3177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2726D9C8B0C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 13:51:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0QM149tz2ytT;
	Thu, 14 Nov 2024 23:51:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731588683;
	cv=none; b=OaZefpH4Ef4hbWa2JdgY4KLXa+2n84Iz4wDoHitmX6kttKGqi2Ih/78cL7UFGnuCPKtlAQYqM7lejH0kfVVEqYBjUCnihv9vPLtLCBo/Dp1im7AGXJnnewmTa8reG90+wftk+qCbhb7j/AOQaJRn7ZqTYcjJSTBULOyiLrVEWnmhscHz/rDaN9N5ziMFZrz7L9AwN4ODJOKorcIdhOgHrJLzLLYtZk2EVwBrYELFD1RSH755yy8ohze1oL/Wo/I67znvS92rE+mw40bbHe8Zjm2bSMPs7mgmSbMNZF5k0db+WD/rB1N8BslTas/Sl7yIR+69bi8/7K+A9vYj/eC6fA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731588683; c=relaxed/relaxed;
	bh=vjWVmIzrzecRAdw0e45UvGpGZnvkStlN4cYjwiHA+hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oje9dZmBdY5Xrpcj3XIWNGatCaLnrEc4YcxrgYubiubgE+ioj4GNKpKMSJKqb480W80JiD7pJS39oa2j0W/YWZD1buuKGyewXO7CjxPzCUhJ6ZRbfA12seTc50aHQXrKxTNqlOGlMJrsVHZh0UvxuLh8jibW+oGTSoaB3dUUAQVvUsonh0SPGSoVpSZXyRYoPv5vUKEpi7Qf1PFVsgWgiRruzV9Zo5B4DijXf1fd+53TU05+aUR82ML2EnB0m6HDTm8yMuUS8DeIFFs6GtLJYZxH6AmH2vuXM69431S/tfYncjbjLLIsxnoHQ/JGn4kgd7u78SjLFvoCDEjXCemfww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YhRRwXPX; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YhRRwXPX;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0QJ4LhFz2xwc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 23:51:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731588677;
	bh=vjWVmIzrzecRAdw0e45UvGpGZnvkStlN4cYjwiHA+hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YhRRwXPXdfLhJdcBWfbNTkucAbvE53+MpUwrSdezZytaLa8FWUzy5xGgwx/5QtwbD
	 zSbOzBqMLH6N1mmEYgF9OqvjK7qZU/OuffT6G9B8NznQL/gZ1VzZzOkOhMCgkGGO8f
	 oEKZjQQXbKYI+O9HkMxw1dAm0RPyQYhz4Vd4H4x59LuwpxdQoLKj/chQnOebqwZJvE
	 2WOiaUr9LdPuGv1niL9w77XsUcN9Zpsyt3yjTInrmjRxXOfXPekpZ+CKSMK2amYTMO
	 +NX9b1yIlenvMFRLJOv7d9bnlJF4L8e3+Psz98sHDSucn6X1ch75jZu38nS23hGlU2
	 8J66U6ZxSQ3wA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0QF5D0Gz4x3q;
	Thu, 14 Nov 2024 23:51:17 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<jk@ozlabs.org>,
	<arnd@arndb.de>,
	<geoff@infradead.org>
Subject: [RFC PATCH 02/20] powerpc: Remove some Cell leftovers
Date: Thu, 14 Nov 2024 23:50:51 +1100
Message-ID: <20241114125111.599093-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that CONFIG_PPC_CELL_NATIVE is removed, iommu_fixed_is_weak will
always be false, so remove it entirely.

Also remove a hack/quirk in the HTAB code that was only used on Cell.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/iommu.h      |  6 ------
 arch/powerpc/kernel/dma-iommu.c       |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c | 12 ------------
 3 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 04072b5f8962..b410021ad4c6 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -317,12 +317,6 @@ extern void iommu_flush_tce(struct iommu_table *tbl);
 extern enum dma_data_direction iommu_tce_direction(unsigned long tce);
 extern unsigned long iommu_direction_to_tce_perm(enum dma_data_direction dir);
 
-#ifdef CONFIG_PPC_CELL_NATIVE
-extern bool iommu_fixed_is_weak;
-#else
-#define iommu_fixed_is_weak false
-#endif
-
 extern const struct dma_map_ops dma_iommu_ops;
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index f0ae39e77e37..4d64a5db50f3 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -136,7 +136,7 @@ static bool dma_iommu_bypass_supported(struct device *dev, u64 mask)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pci_controller *phb = pci_bus_to_host(pdev->bus);
 
-	if (iommu_fixed_is_weak || !phb->controller_ops.iommu_bypass_supported)
+	if (!phb->controller_ops.iommu_bypass_supported)
 		return false;
 	return phb->controller_ops.iommu_bypass_supported(pdev, mask);
 }
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index c8b4fa71d4a7..734610052cf4 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1358,18 +1358,6 @@ static void __init htab_initialize(void)
 	} else {
 		unsigned long limit = MEMBLOCK_ALLOC_ANYWHERE;
 
-#ifdef CONFIG_PPC_CELL
-		/*
-		 * Cell may require the hash table down low when using the
-		 * Axon IOMMU in order to fit the dynamic region over it, see
-		 * comments in cell/iommu.c
-		 */
-		if (fdt_subnode_offset(initial_boot_params, 0, "axon") > 0) {
-			limit = 0x80000000;
-			pr_info("Hash table forced below 2G for Axon IOMMU\n");
-		}
-#endif /* CONFIG_PPC_CELL */
-
 		table = memblock_phys_alloc_range(htab_size_bytes,
 						  htab_size_bytes,
 						  0, limit);
-- 
2.47.0


