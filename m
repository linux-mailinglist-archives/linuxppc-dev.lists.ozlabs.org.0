Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F13148ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:35:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZY743032zDsjg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:35:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=FOjc62yo; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXqp1yhBzDsdv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:22:29 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id k22so4797874pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CxLFhhx42ZtNAWWPxxTC2YTMXHtyxeDPJClSNQiYoYc=;
 b=FOjc62yoUhk/LYUclkinZZ4zDvKpeGo1x74CjLhqDxql67icfdZqyBr48BDMmzkMqR
 tA+flicJ3qCGmrksh4BzQ5Am4hl3t7sFnye0tmSkf0JhPfYSoJrQn4ouvbgIPDxqcZT9
 22NHFR6mKzgKsRHbHqBZhVhBnyuYHLbdeoeHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CxLFhhx42ZtNAWWPxxTC2YTMXHtyxeDPJClSNQiYoYc=;
 b=iTgt0Eu+JlhlVcL30h9Af14uG3CTJgBDHmnv8+GXNcakEf+Q6h45rvd8WV0QREOaMM
 tks2aiLzrdf37hQ14Wf+22HKyl0GqKPoxNfL+dkwzahXxm4J8Uz7CymPJBVfCz3kHtMq
 zDKI6MWT4J54rxa8aGYz4sH2FpLJdnM6DdYbsgA9wdgI/UurJBv8foo6W9DrMB8ww16E
 rWT2Nzev1zi/zfHJYYhJBW52lUt2/Dh/g+dJa/vPLuwrsNgHyg7j8dUCHKnHKU7GTz0m
 bk0akChvh729zd064BbJh5JjTU6+jExalkrE2Pz40bsFk/bxFQG8Xz5YT2dEpeVLoRpU
 euSQ==
X-Gm-Message-State: AOAM5333iKWjbUwpJBPsvDrv4TdL+hWhhb4KVObyEprQMUdlDPx/OseI
 wBhqIt769mzFt80ak65ftg/+bw==
X-Google-Smtp-Source: ABdhPJwDHlCULV4tTgyY9CKwnf/NbNTRufsz7Pi36U/uwqUNeuQrkhr5EaPoNzogQlT61PzYunqO5A==
X-Received: by 2002:a17:90a:3188:: with SMTP id
 j8mr2559404pjb.53.1612851746343; 
 Mon, 08 Feb 2021 22:22:26 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id np7sm1080411pjb.10.2021.02.08.22.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:22:25 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 06/14] swiotlb: Add restricted DMA pool
Date: Tue,  9 Feb 2021 14:21:23 +0800
Message-Id: <20210209062131.2300005-7-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, mingo@kernel.org, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Boichat <drinkcat@chromium.org>, Claire Chang <tientzu@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the initialization function to create restricted DMA pools from
matching reserved-memory nodes.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/device.h |  4 ++
 kernel/dma/swiotlb.c   | 94 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 7619a84f8ce4..08d440627b93 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -415,6 +415,7 @@ struct dev_links_info {
  * @dma_pools:	Dma pools (if dma'ble device).
  * @dma_mem:	Internal for coherent mem override.
  * @cma_area:	Contiguous memory area for dma allocations
+ * @dev_swiotlb: Internal for swiotlb override.
  * @archdata:	For arch-specific additions.
  * @of_node:	Associated device tree node.
  * @fwnode:	Associated device node supplied by platform firmware.
@@ -517,6 +518,9 @@ struct device {
 #ifdef CONFIG_DMA_CMA
 	struct cma *cma_area;		/* contiguous memory area for dma
 					   allocations */
+#endif
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	struct swiotlb *dev_swiotlb;
 #endif
 	/* arch specific additions */
 	struct dev_archdata	archdata;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index dc37951c6924..3a17451c5981 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -39,6 +39,13 @@
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 #endif
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/slab.h>
+#endif
 
 #include <asm/io.h>
 #include <asm/dma.h>
@@ -75,7 +82,8 @@ enum swiotlb_force swiotlb_force;
  *              range check to see if the memory was in fact allocated by this
  *              API.
  * @nslabs:     The number of IO TLB blocks (in groups of 64) between @start and
- *              @end. This is command line adjustable via setup_io_tlb_npages.
+ *              @end. For default swiotlb, this is command line adjustable via
+ *              setup_io_tlb_npages.
  * @used:       The number of used IO TLB block.
  * @list:       The free list describing the number of free entries available
  *              from each index.
@@ -780,3 +788,87 @@ static int __init swiotlb_create_default_debugfs(void)
 
 late_initcall(swiotlb_create_default_debugfs);
 #endif
+
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
+				    struct device *dev)
+{
+	struct swiotlb *swiotlb = rmem->priv;
+	int ret;
+
+	if (dev->dev_swiotlb)
+		return -EBUSY;
+
+	/* Since multiple devices can share the same pool, the private data,
+	 * swiotlb struct, will be initialized by the first device attached
+	 * to it.
+	 */
+	if (!swiotlb) {
+		swiotlb = kzalloc(sizeof(*swiotlb), GFP_KERNEL);
+		if (!swiotlb)
+			return -ENOMEM;
+#ifdef CONFIG_ARM
+		unsigned long pfn = PHYS_PFN(reme->base);
+
+		if (!PageHighMem(pfn_to_page(pfn))) {
+			ret = -EINVAL;
+			goto cleanup;
+		}
+#endif /* CONFIG_ARM */
+
+		ret = swiotlb_init_tlb_pool(swiotlb, rmem->base, rmem->size);
+		if (ret)
+			goto cleanup;
+
+		rmem->priv = swiotlb;
+	}
+
+#ifdef CONFIG_DEBUG_FS
+	swiotlb_create_debugfs(swiotlb, rmem->name, default_swiotlb.debugfs);
+#endif /* CONFIG_DEBUG_FS */
+
+	dev->dev_swiotlb = swiotlb;
+
+	return 0;
+
+cleanup:
+	kfree(swiotlb);
+
+	return ret;
+}
+
+static void rmem_swiotlb_device_release(struct reserved_mem *rmem,
+					struct device *dev)
+{
+	if (!dev)
+		return;
+
+#ifdef CONFIG_DEBUG_FS
+	debugfs_remove_recursive(dev->dev_swiotlb->debugfs);
+#endif /* CONFIG_DEBUG_FS */
+	dev->dev_swiotlb = NULL;
+}
+
+static const struct reserved_mem_ops rmem_swiotlb_ops = {
+	.device_init = rmem_swiotlb_device_init,
+	.device_release = rmem_swiotlb_device_release,
+};
+
+static int __init rmem_swiotlb_setup(struct reserved_mem *rmem)
+{
+	unsigned long node = rmem->fdt_node;
+
+	if (of_get_flat_dt_prop(node, "reusable", NULL) ||
+	    of_get_flat_dt_prop(node, "linux,cma-default", NULL) ||
+	    of_get_flat_dt_prop(node, "linux,dma-default", NULL) ||
+	    of_get_flat_dt_prop(node, "no-map", NULL))
+		return -EINVAL;
+
+	rmem->ops = &rmem_swiotlb_ops;
+	pr_info("Reserved memory: created device swiotlb memory pool at %pa, size %ld MiB\n",
+		&rmem->base, (unsigned long)rmem->size / SZ_1M);
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(dma, "restricted-dma-pool", rmem_swiotlb_setup);
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
-- 
2.30.0.478.g8a0d178c01-goog

