Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551B3CA3CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 19:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQgzd0mwvz3cdb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 03:17:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=VCPgoVUt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deltatee.com (client-ip=204.191.154.188; helo=ale.deltatee.com;
 envelope-from=gunthorp@deltatee.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256
 header.s=20200525 header.b=VCPgoVUt; dkim-atps=neutral
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQgxt6Mtlz305y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 03:16:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=9b2AxuIBWP2rX2JFr1XI1eezzTEXnwjOp4q66fJ74+c=; b=VCPgoVUtOm1WHuYxUHm4B1Cez8
 mgKPoApw/BVoyttnimQ9wao0paXUXJOoWTAeKzNKD0b0O+PN9rIuu9MsL7D1WqhjVospH7QSfnqgj
 tTtiY2untOl16Pf7pL3yLEXYv6FxLsiAJ5ZsMsouM+77PPl6NvU9bLajRizBa52UjsZUcwOV8FZ4M
 2S6UZiOc8TCY4kwYOpVtUj9vcMBY8wlOdOt0ijVuZXzMwmGJLwtdBOqLxWpKTNem65sdax/XiI4NB
 43PpGNCFhqXYOTFcO5eqUIoab7HGZEhnpz9t86SRNmXYO4aEoyDeVnz1VOxnsMe9SZs6AtMd7Nu8A
 RQrbtdcw==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m44V0-0001yd-25; Thu, 15 Jul 2021 10:46:10 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m44Uo-0001nT-JD; Thu, 15 Jul 2021 10:45:58 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Thu, 15 Jul 2021 10:45:36 -0600
Message-Id: <20210715164544.6827-9-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
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
 martin.oliveira@eideticom.com, logang@deltatee.com, tsbogend@alpha.franken.de
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v1 08/16] MIPS/jazzdma: return error code from
 jazz_dma_map_sg()
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
 Stephen Bates <sbates@raithlin.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

vdma_alloc() may fail for different reasons, but since it only supports
indicating an error via a return of DMA_MAPPING_ERROR, we coalesce the
different reasons into -EINVAL.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/jazz/jazzdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index 461457b28982..3b99743435db 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -552,7 +552,7 @@ static int jazz_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 				dir);
 		sg->dma_address = vdma_alloc(sg_phys(sg), sg->length);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
-			return 0;
+			return -EINVAL;
 		sg_dma_len(sg) = sg->length;
 	}

--
2.20.1
