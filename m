Return-Path: <linuxppc-dev+bounces-4294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F02749F63FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:55:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrF55J7zz30TS;
	Wed, 18 Dec 2024 21:55:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519337;
	cv=none; b=gjRMoz82ZZDMT9oDH48BDN5oCX1I0Xyan9LRuC7KPP3K7pvvdif15gTr/+msMKS7CQwBpz374igzktHA8DXi1VXuG26O/jvG3x31XsvCeYNPQZgphPBG81rINILRaW2IL9m/nGtCunfaST9nkrBGXOCOIq5YCbR06w+sgZ51rz3UE42mCzwodRsqfktxzZYRJ1fFX6/nIrFE9azw9nE4tAxy4wOnTqs5ZaW30R2YtvHQ1n6+dHiZENLpksFzfVmuLmAjpXIE4vniNzvfyVHs7r2kg1u7WjuQdE5rBtt1RD7CgeaP9M9c3Q/ZYrMfjlz/fKbIbza+rKuOd+K1wIfwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519337; c=relaxed/relaxed;
	bh=cOj73+dtbZ8oPhiq5S0sTCR9Jej/y7QQv3x0PwgR2Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpAmExQANaIDZ7FSrcYtGNuYyxTHBsxZLDSWPs6OgVqRlxAaDKiprCJ6IrgOPlRflyQCuFlJbm1euLR+VLiYBvbav4H3Ze5+7dmO4QfQQCuuIO54VNpZ3sxGxVV3FtcHxJKSg67jFTZPgIGu8I2fVv8sw5Cc0VqfQ8k0HFhffI1mrOmUsxvmXiPRW0UXs0SCyPbwPxOq5+ZnRG8JdvStJoPf/sQKcb+zPILNKT77e87MF69Pw4XdvP2zHEAGK1yFJ9UCj73kAPJCvIeCPfIks0DfEdxFkGmIW3iSVtqa2mWzxQnwJ9iTQqdOrhsUTsMHgfavF523QURfTxGNw9v37A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OboquWRn; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OboquWRn;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF32br2z2yjb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519327;
	bh=cOj73+dtbZ8oPhiq5S0sTCR9Jej/y7QQv3x0PwgR2Vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OboquWRnfgVWB+j3r+ioJaqnSjtHX/K/86wrC+8yjsriB3xn2GHilEePj+KdRdLhA
	 F4bDDZ0c1+86Py6xLylMGdEixQbEKwmB+QZkmUlRqwfTV3grtBQTxZlwrs0cT6repJ
	 Blobgl1IO75Sexv+XfNWbIM66UH5m3K6dltt7V/lwo+GDVe2VX9/S77snlHvt1B8x7
	 R/OK0Ja3AhksfdoO+TKa/tA+mewSv8xC+E8WomIyQuJx8I60lBBjfuao4ppzwsHx/x
	 X5Vw467udRsnde7UQfClT88d03rFnX38WOg/G2dIkt7OVGNha+OkPFtg4V0ZVD8Lhi
	 4s7sUsVuA5Zzg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrDv3bzdz4xdx;
	Wed, 18 Dec 2024 21:55:27 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 02/25] powerpc: Remove some Cell leftovers
Date: Wed, 18 Dec 2024 21:54:50 +1100
Message-ID: <20241218105523.416573-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that CONFIG_PPC_CELL_NATIVE is removed, iommu_fixed_is_weak will
always be false, so remove it entirely.

Also remove a hack/quirk in the HTAB code that was only used on Cell.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

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
2.47.1


