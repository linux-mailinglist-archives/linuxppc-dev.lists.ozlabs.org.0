Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7A41A225E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 14:55:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y44w5YSCzDqNB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 22:55:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+90f925bb5134fe9b5196+6072+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=by4MCf4F; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y2t45hdczDqjQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 22:01:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ukiT7cjWiYzMkls/B9h9QYB1LDc96srkW4GA62ogYa8=; b=by4MCf4FVlspiK89hC2yTnCIIQ
 QPo0j86FrRXcZr2VQ9RBlmnLAAB1yGmTiwAs/Ycl5Fen4vhNhgr7/M739lbjWc6iM7I9k/siTyB6a
 pgcyhntBma3DHBWqkHk4iDyNhx7tU0qWbzsxwDp9GoGnFR4USOqnuZmzB4Y1b01eNHlvlYGBe81MB
 XygDQ2P7YtQmA2jdzBhXzrBiFHp+aaP03P0JjPP22LfjDvWsiFP9MeldguZFabAdtW9q7GktxCOvz
 bHYelFOQxTAwWNU846W6+h/RDzX+V4ldekVITCi+H+sZJ/fxG8IXK/jpC+2PtGZN4GXXo55sx/ZIx
 u921kA+g==;
Received: from [2001:4bb8:180:5765:65b6:f11e:f109:b151] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9Nn-0005S9-I6; Wed, 08 Apr 2020 12:00:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: [PATCH 19/28] gpu/drm: remove the powerpc hack in drm_legacy_sg_alloc
Date: Wed,  8 Apr 2020 13:59:17 +0200
Message-Id: <20200408115926.1467567-20-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408115926.1467567-1-hch@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If this code was broken for non-coherent caches a crude powerpc hack
isn't going to help anyone else.  Remove the hack as it is the last
user of __vmalloc passing a page protection flag other than PAGE_KERNEL.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/drm_scatter.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
index ca520028b2cb..f4e6184d1877 100644
--- a/drivers/gpu/drm/drm_scatter.c
+++ b/drivers/gpu/drm/drm_scatter.c
@@ -43,15 +43,6 @@
 
 #define DEBUG_SCATTER 0
 
-static inline void *drm_vmalloc_dma(unsigned long size)
-{
-#if defined(__powerpc__) && defined(CONFIG_NOT_COHERENT_CACHE)
-	return __vmalloc(size, GFP_KERNEL, pgprot_noncached_wc(PAGE_KERNEL));
-#else
-	return vmalloc_32(size);
-#endif
-}
-
 static void drm_sg_cleanup(struct drm_sg_mem * entry)
 {
 	struct page *page;
@@ -126,7 +117,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
 		return -ENOMEM;
 	}
 
-	entry->virtual = drm_vmalloc_dma(pages << PAGE_SHIFT);
+	entry->virtual = vmalloc_32(pages << PAGE_SHIFT);
 	if (!entry->virtual) {
 		kfree(entry->busaddr);
 		kfree(entry->pagelist);
-- 
2.25.1

