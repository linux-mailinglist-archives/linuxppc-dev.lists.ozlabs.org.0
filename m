Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF2541D1F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 05:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKfK62k1gz3c4n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 13:45:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HKfJd4zHsz2yKJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 13:45:04 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id B1B46AE8002D;
 Wed, 29 Sep 2021 23:44:58 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/iommu: Report the correct most efficient DMA
 mask for PCI devices
Date: Thu, 30 Sep 2021 13:44:54 +1000
Message-Id: <20210930034454.95794-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>, Carol L Soto <clsoto@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

According to dma-api.rst, the dma_get_required_mask() helper should return
"the mask that the platform requires to operate efficiently". Which in
the case of PPC64 means the bypass mask and not a mask from an IOMMU table
which is shorter and slower to use due to map/unmap operations (especially
expensive on "pseries").

However the existing implementation ignores the possibility of bypassing
and returns the IOMMU table mask on the pseries platform which makes some
drivers (mpt3sas is one example) choose 32bit DMA even though bypass is
supported. The powernv platform sort of handles it by having a bigger
default window with a mask >=40 but it only works as drivers choose
63/64bit if the required mask is >32 which is rather pointless.

This reintroduces the bypass capability check to let drivers make
a better choice of the DMA mask.

Fixes: f1565c24b596 ("powerpc: use the generic dma_ops_bypass mode")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/dma-iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 111249fd619d..d646077bcbcf 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -184,6 +184,14 @@ u64 dma_iommu_get_required_mask(struct device *dev)
 	struct iommu_table *tbl = get_iommu_table_base(dev);
 	u64 mask;
 
+	if (dev_is_pci(dev)) {
+		u64 bypass_mask = dma_direct_get_required_mask(dev);
+
+		if (dma_iommu_dma_supported(dev, bypass_mask)) {
+			dev_info(dev, "%s: returning bypass mask 0x%llx\n", __func__, bypass_mask);
+			return bypass_mask;
+		}
+	}
 	if (!tbl)
 		return 0;
 
-- 
2.30.2

