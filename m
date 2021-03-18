Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8819D340A28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 17:25:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1XSw2GhJz30LH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 03:25:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JnuhGi9J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+3da9058682ed8a08391b+6416+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=JnuhGi9J; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1XSV67Hvz301y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 03:25:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=9gEP8raZOg3EB9wo1YlmqP5MKZV8/kqbQaScw+YfWuE=; b=JnuhGi9J4kooWrHzFkSJvSQB/f
 H1LyP5FBzoY04johHQs63+EOvbbCIVrj5RI97Wzqrpu5/ANSHEXfUXSSHmdx8qZkrYl0CqZPmQyqD
 gUuOdJ02W96mrTGr0lh+bCwDZO6ub/Uc/WxBzk9LMWBGZefHttJAq4B8N6Oi+F+13iVW8MEutZfAR
 KhQuThABIusZgmw132kdn9enlQGOEPn3Q5pRjO2nNpenvm5KpiptkisJ0z5ZklqDVtXsxC2KvXNFB
 IxMjAONqS2TPXowUqOYB3qGo+qaWd6+I+m/Zd/mrIzgAeF0iNeQFlhB66jMOxkfVk2r8Yaub0v3Mb
 dDfJBBug==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMvRV-003DLG-Ih; Thu, 18 Mar 2021 16:24:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 3/3] swiotlb: remove swiotlb_nr_tbl
Date: Thu, 18 Mar 2021 17:14:24 +0100
Message-Id: <20210318161424.489045-4-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318161424.489045-1-hch@lst.de>
References: <20210318161424.489045-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Claire Chang <tientzu@chromium.org>, linuxppc-dev@lists.ozlabs.org,
 Dongli Zhang <dongli.zhang@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All callers just use it to check if swiotlb is active at all, for which
they can just use is_swiotlb_active.  In the longer run drivers need
to stop using is_swiotlb_active as well, but let's do the simple step
first.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c        | 2 +-
 drivers/pci/xen-pcifront.c                   | 2 +-
 include/linux/swiotlb.h                      | 1 -
 kernel/dma/swiotlb.c                         | 7 +------
 5 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index ad22f42541bda6..a9d65fc8aa0eab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -42,7 +42,7 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
 
 	max_order = MAX_ORDER;
 #ifdef CONFIG_SWIOTLB
-	if (swiotlb_nr_tbl()) {
+	if (is_swiotlb_active()) {
 		unsigned int max_segment;
 
 		max_segment = swiotlb_max_segment();
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index a37bc3d7b38b3b..9662522aa0664a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -321,7 +321,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	}
 
 #if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
-	need_swiotlb = !!swiotlb_nr_tbl();
+	need_swiotlb = is_swiotlb_active();
 #endif
 
 	ret = ttm_bo_device_init(&drm->ttm.bdev, &nouveau_bo_driver,
diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index 2d75026482197d..b7a8f3a1921f83 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -693,7 +693,7 @@ static int pcifront_connect_and_init_dma(struct pcifront_device *pdev)
 
 	spin_unlock(&pcifront_dev_lock);
 
-	if (!err && !swiotlb_nr_tbl()) {
+	if (!err && !is_swiotlb_active()) {
 		err = pci_xen_swiotlb_init_late();
 		if (err)
 			dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 63f7a63f61d098..216854a5e5134b 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -37,7 +37,6 @@ enum swiotlb_force {
 
 extern void swiotlb_init(int verbose);
 int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose);
-extern unsigned long swiotlb_nr_tbl(void);
 unsigned long swiotlb_size_or_default(void);
 extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
 extern int swiotlb_late_init_with_default_size(size_t default_size);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 13de669a9b4681..539c76beb52e07 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -94,12 +94,6 @@ setup_io_tlb_npages(char *str)
 }
 early_param("swiotlb", setup_io_tlb_npages);
 
-unsigned long swiotlb_nr_tbl(void)
-{
-	return io_tlb_default_mem ? io_tlb_default_mem->nslabs : 0;
-}
-EXPORT_SYMBOL_GPL(swiotlb_nr_tbl);
-
 unsigned int swiotlb_max_segment(void)
 {
 	return io_tlb_default_mem ? max_segment : 0;
@@ -652,6 +646,7 @@ bool is_swiotlb_active(void)
 {
 	return io_tlb_default_mem != NULL;
 }
+EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
 
-- 
2.30.1

