Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C45F9457EC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 08:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lists.ozlabs.org;
	s=201707; t=1722578763;
	bh=9I9PRJK1eA/oZpcuetiypzDvBEF1ZsnK+kG9vlKQTi0=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=aUBWVKSEk34p886tphpNGRswV+fXNfWbVLCii/VThrW1jao/jRT1sERokfOjqbjnm
	 SmjEwaUv42HGSzewhmW4P1CsnfTcSVQKXs8/XUHvIG1CFN8QY1tJRARrHFi6wGlVqE
	 x1h+V9ZHsMrFCcsnTIIc/yagf4ftTy+ubpbu2r+cjg1OWe+60HFjjkRhMycV0y2GKF
	 qI42GdgNwjl6kg3BXHPvRGi2WwV1+j4vTrDNdqOq5Ydo+Sy6p4frAGZlNVfEMVOv59
	 eHQU/GkR3QiMhXWZD+q8m8u8d++/ZJuOeG9R66NXz6gM/9yHxb08/dDsbJon1h5Ehf
	 qo7Mo4t+dzFTg==
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZwLg0dcLz3dTn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 16:06:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=jxw4ewpc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZwJP2H19z3cK8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 16:04:05 +1000 (AEST)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 67FEC440781;
	Fri,  2 Aug 2024 09:02:40 +0300 (IDT)
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v5 3/3] arm64: support DMA zone above 4GB
Date: Fri,  2 Aug 2024 09:03:48 +0300
Message-ID: <517ef5af643bbc258b53c95b443ffe9678a95af3.1722578375.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1722578375.git.baruch@tkos.co.il>
References: <cover.1722578375.git.baruch@tkos.co.il>
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
From: Baruch Siach via Linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, =?UTF-8?q?Petr=20Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Catalin Marinas <catalin.marinas@arm.com>

Commit 791ab8b2e3db ("arm64: Ignore any DMA offsets in the
max_zone_phys() calculation") made arm64 DMA/DMA32 zones span the entire
RAM when RAM starts above 32-bits. This breaks hardware with DMA area
that start above 32-bits. But the commit log says that "we haven't
noticed any such hardware". It turns out that such hardware does exist.

One such platform has RAM starting at 32GB with an internal bus that has
the following DMA limits:

  #address-cells = <2>;
  #size-cells = <2>;
  dma-ranges = <0x00 0xc0000000 0x08 0x00000000 0x00 0x40000000>;

That is, devices under this bus see 1GB of DMA range between 3GB-4GB in
their address space. This range is mapped to CPU memory at 32GB-33GB.
With current code DMA allocations for devices under this bus are not
limited to DMA area, leading to run-time allocation failure.

This commit reinstates DMA zone at the bottom of RAM. The result is DMA
zone that properly reflects the hardware constraints as follows:

[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000800000000-0x000000083fffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000840000000-0x0000000bffffffff]

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
[baruch: split off the original patch]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 arch/arm64/mm/init.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index c45e2152ca9e..bfb10969cbf0 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -114,20 +114,8 @@ static void __init arch_reserve_crashkernel(void)
 				    low_size, high);
 }
 
-/*
- * Return the maximum physical address for a zone given its limit.
- * If DRAM starts above 32-bit, expand the zone to the maximum
- * available memory, otherwise cap it at 32-bit.
- */
 static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
 {
-	phys_addr_t phys_start = memblock_start_of_DRAM();
-
-	if (phys_start > U32_MAX)
-		zone_limit = PHYS_ADDR_MAX;
-	else if (phys_start > zone_limit)
-		zone_limit = U32_MAX;
-
 	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
 }
 
-- 
2.43.0

