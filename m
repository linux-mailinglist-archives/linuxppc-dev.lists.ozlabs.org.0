Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C730197433
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 08:03:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rMMt4mPFzDqV9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 17:03:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=d-silva.org (client-ip=66.55.73.32;
 helo=ushosting.nmnhosting.com; envelope-from=alastair@d-silva.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256
 header.s=201810a header.b=AUp+mlMk; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48rM7s2LwMzDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 16:53:13 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 0CD9B2DC685F;
 Mon, 30 Mar 2020 16:52:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585547573;
 bh=JCkxqdhDpbqnh8PRykYbOapzLDhQpaFdQTq2avtnUbk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AUp+mlMku4qydmYRmIQAz0mHtgW/QWdocLSpZmVj8gEVvUW0kV4JR5lWebXhN5UXf
 S45Os+VecBpgDQFNUPlPIYXuVSFytq7eOZr/9Mr+wCXi23AfDkwqy/5i9Ey1707t4r
 innVeW33PDa3HOA9nzLJ9T7Q2SdCOzUdxdWbtW9lRGfaUN1sesyWSQR+lxlim45wvg
 O5+qPjj4wXBAhnO0PLxbtzB7b9YN4wZDlQflV6mMgXniUrHrXz1RhmBYlopcvdKHP7
 kEC0wemMdjz4K6l2g/eSA7yNMIqeRV6CnbDTcgzgK9uoyA0K4NgSEJkG13xKQx8IbT
 2eX40QC7fIyb7bgjbYd9UG0oWR+Cmh7SkzJBz/VbMzOIykZgXgMFkq/Dfq/mpzPcTl
 f5PlgYNRzlM262ad4hILfnl/danLaHgpo1/mFyhwHYVDyKTu6vCwl62EwA0Lhk/UPn
 T58ZhVy9t7ddJN+Ws/1u/Lqzpird3mG83JGhn0JkjW+WaYswOWFx1HLxKPNqHrMK/J
 NvHprrmROvUqRV9pSaOWik29SdcxMd+24+KWQZWF4NMNavF9XMw69bhjFIsAUHrC7l
 oWQLrYbGwAd1EN+0gwYjA3nQ4ygL0t7JOlBEleXmRayk0do9PBVp1k4lUab+TbmNlC
 wjaYarf5IsxL+Nzdn4fhC0VI=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Af045934;
 Fri, 27 Mar 2020 18:12:15 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 06/25] ocxl: Tally up the LPC memory on a link & allow it
 to be mapped
Date: Fri, 27 Mar 2020 18:11:43 +1100
Message-Id: <20200327071202.2159885-7-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:15 +1100 (AEDT)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

OpenCAPI LPC memory is allocated per link, but each link supports
multiple AFUs, and each AFU can have LPC memory assigned to it.

This patch tallys the memory for all AFUs on a link, allowing it
to be mapped in a single operation after the AFUs have been
enumerated.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/misc/ocxl/core.c          | 10 ++++++
 drivers/misc/ocxl/link.c          | 60 +++++++++++++++++++++++++++++++
 drivers/misc/ocxl/ocxl_internal.h | 33 +++++++++++++++++
 3 files changed, 103 insertions(+)

diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
index b7a09b21ab36..2531c6cf19a0 100644
--- a/drivers/misc/ocxl/core.c
+++ b/drivers/misc/ocxl/core.c
@@ -230,8 +230,18 @@ static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
 	if (rc)
 		goto err_free_pasid;
 
+	if (afu->config.lpc_mem_size || afu->config.special_purpose_mem_size) {
+		rc = ocxl_link_add_lpc_mem(afu->fn->link, afu->config.lpc_mem_offset,
+					   afu->config.lpc_mem_size +
+					   afu->config.special_purpose_mem_size);
+		if (rc)
+			goto err_free_mmio;
+	}
+
 	return 0;
 
+err_free_mmio:
+	unmap_mmio_areas(afu);
 err_free_pasid:
 	reclaim_afu_pasid(afu);
 err_free_actag:
diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 58d111afd9f6..af119d3ef79a 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -84,6 +84,11 @@ struct ocxl_link {
 	int dev;
 	atomic_t irq_available;
 	struct spa *spa;
+	struct mutex lpc_mem_lock; /* protects lpc_mem & lpc_mem_sz */
+	u64 lpc_mem_sz; /* Total amount of LPC memory presented on the link */
+	u64 lpc_mem;
+	int lpc_consumers;
+
 	void *platform_data;
 };
 static struct list_head links_list = LIST_HEAD_INIT(links_list);
@@ -396,6 +401,8 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
 	if (rc)
 		goto err_spa;
 
+	mutex_init(&link->lpc_mem_lock);
+
 	/* platform specific hook */
 	rc = pnv_ocxl_spa_setup(dev, link->spa->spa_mem, PE_mask,
 				&link->platform_data);
@@ -711,3 +718,56 @@ void ocxl_link_free_irq(void *link_handle, int hw_irq)
 	atomic_inc(&link->irq_available);
 }
 EXPORT_SYMBOL_GPL(ocxl_link_free_irq);
+
+int ocxl_link_add_lpc_mem(void *link_handle, u64 offset, u64 size)
+{
+	struct ocxl_link *link = (struct ocxl_link *)link_handle;
+
+	// Check for overflow
+	if (offset > (offset + size))
+		return -EINVAL;
+
+	mutex_lock(&link->lpc_mem_lock);
+	link->lpc_mem_sz = max(link->lpc_mem_sz, offset + size);
+
+	mutex_unlock(&link->lpc_mem_lock);
+
+	return 0;
+}
+
+u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev)
+{
+	struct ocxl_link *link = (struct ocxl_link *)link_handle;
+
+	mutex_lock(&link->lpc_mem_lock);
+
+	if (!link->lpc_mem)
+		link->lpc_mem = pnv_ocxl_platform_lpc_setup(pdev, link->lpc_mem_sz);
+
+	if (link->lpc_mem)
+		link->lpc_consumers++;
+	mutex_unlock(&link->lpc_mem_lock);
+
+	return link->lpc_mem;
+}
+
+void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev)
+{
+	struct ocxl_link *link = (struct ocxl_link *)link_handle;
+
+	mutex_lock(&link->lpc_mem_lock);
+
+	if (!link->lpc_mem) {
+		mutex_unlock(&link->lpc_mem_lock);
+		return;
+	}
+
+	WARN_ON(--link->lpc_consumers < 0);
+
+	if (link->lpc_consumers == 0) {
+		pnv_ocxl_platform_lpc_release(pdev);
+		link->lpc_mem = 0;
+	}
+
+	mutex_unlock(&link->lpc_mem_lock);
+}
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index 198e4e4bc51d..2d7575225bd7 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -142,4 +142,37 @@ int ocxl_irq_offset_to_id(struct ocxl_context *ctx, u64 offset);
 u64 ocxl_irq_id_to_offset(struct ocxl_context *ctx, int irq_id);
 void ocxl_afu_irq_free_all(struct ocxl_context *ctx);
 
+/**
+ * ocxl_link_add_lpc_mem() - Increment the amount of memory required by an OpenCAPI link
+ *
+ * @link_handle: The OpenCAPI link handle
+ * @offset: The offset of the memory to add
+ * @size: The number of bytes to increment memory on the link by
+ *
+ * Returns 0 on success, -EINVAL on overflow
+ */
+int ocxl_link_add_lpc_mem(void *link_handle, u64 offset, u64 size);
+
+/**
+ * ocxl_link_lpc_map() - Map the LPC memory for an OpenCAPI device
+ * Since LPC memory belongs to a link, the whole LPC memory available
+ * on the link must be mapped in order to make it accessible to a device.
+ * @link_handle: The OpenCAPI link handle
+ * @pdev: A device that is on the link
+ *
+ * Returns the address of the mapped LPC memory, or 0 on error
+ */
+u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev);
+
+/**
+ * ocxl_link_lpc_release() - Release the LPC memory device for an OpenCAPI device
+ *
+ * Offlines LPC memory on an OpenCAPI link for a device. If this is the
+ * last device on the link to release the memory, unmap it from the link.
+ *
+ * @link_handle: The OpenCAPI link handle
+ * @pdev: A device that is on the link
+ */
+void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev);
+
 #endif /* _OCXL_INTERNAL_H_ */
-- 
2.24.1

