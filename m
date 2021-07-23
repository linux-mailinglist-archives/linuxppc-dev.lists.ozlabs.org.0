Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E263D400F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 19:58:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWcWR631sz3fbl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 03:58:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=Rv/rTZtj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deltatee.com (client-ip=204.191.154.188; helo=ale.deltatee.com;
 envelope-from=gunthorp@deltatee.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256
 header.s=20200525 header.b=Rv/rTZtj; dkim-atps=neutral
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWcL530rsz30QS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jul 2021 03:50:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=n2R1GNZpiJpIvqPgMoFv818LmwSs1yl8HL/LWwKcvVk=; b=Rv/rTZtj3T1nEGLn1WGczPTaen
 2yIufVhmqXEZZQcWeZrPYXkIZtElB2JS3S+Q2Jjuo2MBlfeXs7yylXfYoMcUAcGExpeIfOU75HSjV
 pf7krDbOQH/tSfJN+fElu+VVJqlRFYdQPNJiF4+WCLcG0tiI0p4KERH+zeiKfztGqnCd+UNf++PoZ
 S8Exa3ad1UXddK3LqWr51Nf2fnLQV9b9+P4kG2ztV24ryTmwUQZ6I3WFEb6dIVLrutgq/2XpovvLE
 NXxAW1CxwmNOHEATVHgyt4MfJmMX9ybHuGwzx/Byb9TN3fvIxw5nslKmWzVyMwIsgD+iRJFYM5syd
 AWnM6Zjg==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m6zJh-0005Lh-OW; Fri, 23 Jul 2021 11:50:35 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m6zJL-0005qn-8Z; Fri, 23 Jul 2021 11:50:11 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 23 Jul 2021 11:49:53 -0600
Message-Id: <20210723175008.22410-7-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com,
 martin.oliveira@eideticom.com, logang@deltatee.com, linux@armlinux.org.uk,
 tsbogend@alpha.franken.de
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 MYRULES_NO_TEXT,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH v2 06/21] ARM/dma-mapping: return error code from .map_sg() ops
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Robin Murphy <robin.murphy@arm.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Stephen Bates <sbates@raithlin.com>, Russell King <linux@armlinux.org.uk>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.
In the case of a DMA_MAPPING_ERROR, -EIO is returned. Otherwise,
-ENOMEM or -EINVAL is returned depending on the error from
__map_sg_chunk().

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/arm/mm/dma-mapping.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index c4b8df2ad328..113b9cb3701b 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -980,7 +980,7 @@ int arm_dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	struct scatterlist *s;
-	int i, j;
+	int i, j, ret;
 
 	for_each_sg(sg, s, nents, i) {
 #ifdef CONFIG_NEED_SG_DMA_LENGTH
@@ -988,15 +988,17 @@ int arm_dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 #endif
 		s->dma_address = ops->map_page(dev, sg_page(s), s->offset,
 						s->length, dir, attrs);
-		if (dma_mapping_error(dev, s->dma_address))
+		if (dma_mapping_error(dev, s->dma_address)) {
+			ret = -EIO;
 			goto bad_mapping;
+		}
 	}
 	return nents;
 
  bad_mapping:
 	for_each_sg(sg, s, i, j)
 		ops->unmap_page(dev, sg_dma_address(s), sg_dma_len(s), dir, attrs);
-	return 0;
+	return ret;
 }
 
 /**
@@ -1622,7 +1624,7 @@ static int __iommu_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 		     bool is_coherent)
 {
 	struct scatterlist *s = sg, *dma = sg, *start = sg;
-	int i, count = 0;
+	int i, count = 0, ret;
 	unsigned int offset = s->offset;
 	unsigned int size = s->offset + s->length;
 	unsigned int max = dma_get_max_seg_size(dev);
@@ -1634,8 +1636,10 @@ static int __iommu_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 		s->dma_length = 0;
 
 		if (s->offset || (size & ~PAGE_MASK) || size + s->length > max) {
-			if (__map_sg_chunk(dev, start, size, &dma->dma_address,
-			    dir, attrs, is_coherent) < 0)
+			ret = __map_sg_chunk(dev, start, size,
+					     &dma->dma_address, dir, attrs,
+					     is_coherent);
+			if (ret < 0)
 				goto bad_mapping;
 
 			dma->dma_address += offset;
@@ -1648,8 +1652,9 @@ static int __iommu_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 		}
 		size += s->length;
 	}
-	if (__map_sg_chunk(dev, start, size, &dma->dma_address, dir, attrs,
-		is_coherent) < 0)
+	ret = __map_sg_chunk(dev, start, size, &dma->dma_address, dir, attrs,
+			     is_coherent);
+	if (ret < 0)
 		goto bad_mapping;
 
 	dma->dma_address += offset;
@@ -1660,7 +1665,9 @@ static int __iommu_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 bad_mapping:
 	for_each_sg(sg, s, count, i)
 		__iommu_remove_mapping(dev, sg_dma_address(s), sg_dma_len(s));
-	return 0;
+	if (ret == -ENOMEM)
+		return ret;
+	return -EINVAL;
 }
 
 /**
-- 
2.20.1

