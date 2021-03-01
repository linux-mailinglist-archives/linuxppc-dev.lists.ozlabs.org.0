Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D532788D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 08:49:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DpsqG4NyQz3dDZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:49:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cO0/CICs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+bce9324c41c3486454c7+6399+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=cO0/CICs; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DpslM0vqgz3d86
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 18:46:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=brl7E8YVp1JaasQZUSI4zOCBNU3VX5lh7I+3ZpJVKoQ=; b=cO0/CICsxS0v4hTlVtR0AshwTW
 BsQP4SA3okIlBHconzJAwHO1GHs+WlrszQeZX8PaBKPE4sTe4Pr60XvEotfhISYYsfb9GHUs6mxn5
 +LUPeX4e+PyqKPmerxpZOsSOplktgII87t8Q57xX5Wdtdc6sPRJ57juxwYJQ5uVZFhq9uXQY/vibm
 POlSfDXa1pP3OWLz54nN2HRVZh6xiQ91PsdXS5Qqon+lvO2cQD6Qc2bfExgGVpbGTpzis4zBJTAon
 zOhhS34/GFAL7SGt20X25yTtEm0DWXZEh1aPLIImYDKVUb9adcUs9rZkJP08CohwnsBQYdzbUs5V+
 gW+ODGhQ==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdFr-00FRE9-3o; Mon, 01 Mar 2021 07:46:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 10/14] xen-swiotlb: split xen_swiotlb_init
Date: Mon,  1 Mar 2021 08:44:32 +0100
Message-Id: <20210301074436.919889-11-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
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

Split xen_swiotlb_init into a normal an an early case.  That makes both
much simpler and more readable, and also allows marking the early
code as __init and x86-only.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/xen/mm.c              |   2 +-
 arch/x86/xen/pci-swiotlb-xen.c |   4 +-
 drivers/xen/swiotlb-xen.c      | 124 +++++++++++++++++++--------------
 include/xen/swiotlb-xen.h      |   3 +-
 4 files changed, 75 insertions(+), 58 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 467fa225c3d0ed..aae950cd053fea 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -140,7 +140,7 @@ static int __init xen_mm_init(void)
 	struct gnttab_cache_flush cflush;
 	if (!xen_initial_domain())
 		return 0;
-	xen_swiotlb_init(1, false);
+	xen_swiotlb_init();
 
 	cflush.op = 0;
 	cflush.a.dev_bus_addr = 0;
diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
index 19ae3e4fe4e98e..54f9aa7e845739 100644
--- a/arch/x86/xen/pci-swiotlb-xen.c
+++ b/arch/x86/xen/pci-swiotlb-xen.c
@@ -59,7 +59,7 @@ int __init pci_xen_swiotlb_detect(void)
 void __init pci_xen_swiotlb_init(void)
 {
 	if (xen_swiotlb) {
-		xen_swiotlb_init(1, true /* early */);
+		xen_swiotlb_init_early();
 		dma_ops = &xen_swiotlb_dma_ops;
 
 #ifdef CONFIG_PCI
@@ -76,7 +76,7 @@ int pci_xen_swiotlb_init_late(void)
 	if (xen_swiotlb)
 		return 0;
 
-	rc = xen_swiotlb_init(1, false /* late */);
+	rc = xen_swiotlb_init();
 	if (rc)
 		return rc;
 
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 060eeb056486f5..00adeb95ebb9df 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -156,96 +156,112 @@ static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
 
 #define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, IO_TLB_SEGSIZE)
 
-int __ref xen_swiotlb_init(int verbose, bool early)
+int __ref xen_swiotlb_init(void)
 {
-	unsigned long bytes, order;
-	int rc = -ENOMEM;
 	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
+	unsigned long nslabs, bytes, order;
 	unsigned int repeat = 3;
+	int rc = -ENOMEM;
 	char *start;
-	unsigned long nslabs;
 
 	nslabs = swiotlb_nr_tbl();
-retry:
 	if (!nslabs)
 		nslabs = DEFAULT_NSLABS;
+retry:
+	m_ret = XEN_SWIOTLB_ENOMEM;
 	bytes = nslabs << IO_TLB_SHIFT;
 	order = get_order(bytes);
 
 	/*
 	 * Get IO TLB memory from any location.
 	 */
-	if (early) {
-		start = memblock_alloc(PAGE_ALIGN(bytes),
-						  PAGE_SIZE);
-		if (!start)
-			panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-			      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
-	} else {
 #define SLABS_PER_PAGE (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
 #define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
-		while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
-			start = (void *)xen_get_swiotlb_free_pages(order);
-			if (start)
-				break;
-			order--;
-		}
-		if (order != get_order(bytes)) {
-			pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
-				(PAGE_SIZE << order) >> 20);
-			nslabs = SLABS_PER_PAGE << order;
-			bytes = nslabs << IO_TLB_SHIFT;
-		}
+	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
+		start = (void *)xen_get_swiotlb_free_pages(order);
+		if (start)
+			break;
+		order--;
 	}
-	if (!start) {
-		m_ret = XEN_SWIOTLB_ENOMEM;
+	if (!start)
 		goto error;
+	if (order != get_order(bytes)) {
+		pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
+			(PAGE_SIZE << order) >> 20);
+		nslabs = SLABS_PER_PAGE << order;
+		bytes = nslabs << IO_TLB_SHIFT;
 	}
+
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(start,
-			       bytes,
-			       nslabs);
+	rc = xen_swiotlb_fixup(start, bytes, nslabs);
 	if (rc) {
-		if (early)
-			memblock_free(__pa(start),
-				      PAGE_ALIGN(bytes));
-		else {
-			free_pages((unsigned long)start, order);
-			start = NULL;
-		}
+		free_pages((unsigned long)start, order);
 		m_ret = XEN_SWIOTLB_EFIXUP;
 		goto error;
 	}
-	if (early) {
-		if (swiotlb_init_with_tbl(start, nslabs,
-			 verbose))
-			panic("Cannot allocate SWIOTLB buffer");
-		rc = 0;
-	} else
-		rc = swiotlb_late_init_with_tbl(start, nslabs);
-
-	if (!rc)
-		swiotlb_set_max_segment(PAGE_SIZE);
-
-	return rc;
+	rc = swiotlb_late_init_with_tbl(start, nslabs);
+	if (rc)
+		return rc;
+	swiotlb_set_max_segment(PAGE_SIZE);
+	return 0;
 error:
 	if (repeat--) {
-		nslabs = max(1024UL, /* Min is 2MB */
-					(nslabs >> 1));
+		/* Min is 2MB */
+		nslabs = max(1024UL, (nslabs >> 1));
 		pr_info("Lowering to %luMB\n",
 			(nslabs << IO_TLB_SHIFT) >> 20);
 		goto retry;
 	}
 	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
-	if (early)
-		panic("%s (rc:%d)", xen_swiotlb_error(m_ret), rc);
-	else
-		free_pages((unsigned long)start, order);
+	free_pages((unsigned long)start, order);
 	return rc;
 }
 
+#ifdef CONFIG_X86
+void __init xen_swiotlb_init_early(void)
+{
+	unsigned long nslabs, bytes;
+	unsigned int repeat = 3;
+	char *start;
+	int rc;
+
+	nslabs = swiotlb_nr_tbl();
+	if (!nslabs)
+		nslabs = DEFAULT_NSLABS;
+retry:
+	/*
+	 * Get IO TLB memory from any location.
+	 */
+	bytes = nslabs << IO_TLB_SHIFT;
+	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
+	if (!start)
+		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
+		      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
+
+	/*
+	 * And replace that memory with pages under 4GB.
+	 */
+	rc = xen_swiotlb_fixup(start, bytes, nslabs);
+	if (rc) {
+		memblock_free(__pa(start), PAGE_ALIGN(bytes));
+		if (repeat--) {
+			/* Min is 2MB */
+			nslabs = max(1024UL, (nslabs >> 1));
+			pr_info("Lowering to %luMB\n",
+				(nslabs << IO_TLB_SHIFT) >> 20);
+			goto retry;
+		}
+		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
+	}
+
+	if (swiotlb_init_with_tbl(start, nslabs, false))
+		panic("Cannot allocate SWIOTLB buffer");
+	swiotlb_set_max_segment(PAGE_SIZE);
+}
+#endif /* CONFIG_X86 */
+
 static void *
 xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 			   dma_addr_t *dma_handle, gfp_t flags,
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index d5eaf9d682b804..6206b1ec99168a 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -9,7 +9,8 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
 void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
 			     size_t size, enum dma_data_direction dir);
 
-extern int xen_swiotlb_init(int verbose, bool early);
+int xen_swiotlb_init(void);
+void __init xen_swiotlb_init_early(void);
 extern const struct dma_map_ops xen_swiotlb_dma_ops;
 
 #endif /* __LINUX_SWIOTLB_XEN_H */
-- 
2.29.2

