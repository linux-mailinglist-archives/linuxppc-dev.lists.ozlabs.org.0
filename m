Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1F26081E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 04:00:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlpJN6JMnzDqQ8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 12:00:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
X-Greylist: delayed 403 seconds by postgrey-1.36 at bilbo;
 Tue, 08 Sep 2020 11:58:27 AEST
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BlpGC3kGMzDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 11:58:27 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id F3099AE8001C;
 Mon,  7 Sep 2020 21:50:54 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/dma: Fix dma_map_ops::get_required_mask
Date: Tue,  8 Sep 2020 11:51:06 +1000
Message-Id: <20200908015106.79661-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 Christoph Hellwig <hch@lst.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are 2 problems with it:
1. "<" vs expected "<<"
2. the shift number is an IOMMU page number mask, not an address mask
as the IOMMU page shift is missing.

This did not hit us before f1565c24b596 ("powerpc: use the generic
dma_ops_bypass mode") because we had there additional code to handle
bypass mask so this chunk (almost?) never executed. However there
were reports that aacraid does not work with "iommu=nobypass".
After f1565c24b596, aacraid (and probably others which call
dma_get_required_mask() before setting the mask) was unable to
enable 64bit DMA and fall back to using IOMMU which was known not to work,
one of the problems is double free of an IOMMU page.

This fixes DMA for aacraid, both with and without "iommu=nobypass"
in the kernel command line. Verified with "stress-ng -d 4".

Fixes: f1565c24b596 ("powerpc: use the generic dma_ops_bypass mode")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

The original code came Jun 24 2011:
6a5c7be5e484 ("powerpc: Override dma_get_required_mask by platform hook and ops")


What is dma_get_required_mask() for anyway? What "requires" what here?

Even though it works for now (due to huge - >4GB - default DMA window),
I am still not convinced we do not want this chunk here
(this is what f1565c24b596 removed):

if (dev_is_pci(dev)) {
        u64 bypass_mask = dma_direct_get_required_mask(dev);

        if (dma_iommu_bypass_supported(dev, bypass_mask))
                return bypass_mask;
}
---
 arch/powerpc/kernel/dma-iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 569fecd7b5b2..9053fc9d20c7 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -120,7 +120,8 @@ u64 dma_iommu_get_required_mask(struct device *dev)
 	if (!tbl)
 		return 0;
 
-	mask = 1ULL < (fls_long(tbl->it_offset + tbl->it_size) - 1);
+	mask = 1ULL << (fls_long(tbl->it_offset + tbl->it_size) +
+			tbl->it_page_shift - 1);
 	mask += mask - 1;
 
 	return mask;
-- 
2.17.1

