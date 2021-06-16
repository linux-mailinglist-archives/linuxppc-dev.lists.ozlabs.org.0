Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 358253A9034
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 05:56:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4WZw6bwPz3dG0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 13:56:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G+MHCjWe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=G+MHCjWe; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4WWm4Ldqz3bVD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 13:53:56 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so958745pjn.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 20:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eU61psdxuacInDbxGN0V8O121x7LcVp3cBkwTdMQ+YI=;
 b=G+MHCjWefSWSsBn+zFsqavx79K0f1OgfsPHA3pIJ7ZUrc94j/9bKUmi3fYlnxX6sx7
 MpFnLUq23wOmkqNgWIGDoG5ljrkEFDbKSDT6O1jD22wjvWPKV2kuzmbOLBWoI6lHX43m
 0UxMGANvZTFecxtxMJ6BmCdD5qQlDyW8Evmz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eU61psdxuacInDbxGN0V8O121x7LcVp3cBkwTdMQ+YI=;
 b=h2eOJc26pa56H8PwZHrMolxMloVXmn7IZgYsRdUPT7UpewlxPZEE0/FVfAG6E5Srp5
 xXN+1Cc/V8nSMwvNQsNqf5a4CaeobM5jB9OcktH8EzjFCJWUVQmV0SiCJMb5ljm8Oqgw
 D2Yyz/gEMW9pQGwdh6NFbUjccvxRyzFNy3Wk8lvR8YuCqY/PdGV5I3slFc67f6+LXCB4
 VN51/s2bDFg4vmlziITX5nPnu2MjqueDN0NubT4jOw2FLbWcR/ko/9SooIuLeQnNgdSC
 FnlXBuKXsmAk8+tfO20eoL/8+XQtTw7zJOXqzCF7Cwhcuccg/5b52svzCLV/zinWNYYk
 OlwA==
X-Gm-Message-State: AOAM531o4e7gHG80SfqOUzmliwvhq7S7cuc/DjpU2ms3TpBO44h1TvLH
 eklPZncsRnSUcpJ2Z9YFG2eZgw==
X-Google-Smtp-Source: ABdhPJz+/n8SXXk477Y7KP8AZrN6dcjdprvaWXKVwnDO1qXcju51BlhAASYnAFCrwZ+85V6bo0r6Hw==
X-Received: by 2002:a17:902:b409:b029:114:afa6:7f4a with SMTP id
 x9-20020a170902b409b0290114afa67f4amr7247326plr.56.1623815633242; 
 Tue, 15 Jun 2021 20:53:53 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:3d52:f252:7393:1992])
 by smtp.gmail.com with UTF8SMTPSA id x22sm557553pjp.37.2021.06.15.20.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 20:53:52 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v11 07/12] swiotlb: Move alloc_size to swiotlb_find_slots
Date: Wed, 16 Jun 2021 11:52:35 +0800
Message-Id: <20210616035240.840463-8-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210616035240.840463-1-tientzu@chromium.org>
References: <20210616035240.840463-1-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, mingo@kernel.org, jxgao@google.com,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 xypron.glpk@gmx.de, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, tientzu@chromium.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rename find_slots to swiotlb_find_slots and move the maintenance of
alloc_size to it for better code reusability later.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index a9907ac262fc..037772724b3c 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -431,8 +431,8 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
  * Find a suitable number of IO TLB entries size that will fit this request and
  * allocate a buffer from that IO TLB pool.
  */
-static int find_slots(struct device *dev, phys_addr_t orig_addr,
-		size_t alloc_size)
+static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
+			      size_t alloc_size)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
@@ -487,8 +487,11 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 	return -1;
 
 found:
-	for (i = index; i < index + nslots; i++)
+	for (i = index; i < index + nslots; i++) {
 		mem->slots[i].list = 0;
+		mem->slots[i].alloc_size =
+			alloc_size - ((i - index) << IO_TLB_SHIFT);
+	}
 	for (i = index - 1;
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
 	     mem->slots[i].list; i--)
@@ -529,7 +532,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
-	index = find_slots(dev, orig_addr, alloc_size + offset);
+	index = swiotlb_find_slots(dev, orig_addr, alloc_size + offset);
 	if (index == -1) {
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
@@ -543,11 +546,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	 * This is needed when we sync the memory.  Then we sync the buffer if
 	 * needed.
 	 */
-	for (i = 0; i < nr_slots(alloc_size + offset); i++) {
+	for (i = 0; i < nr_slots(alloc_size + offset); i++)
 		mem->slots[index + i].orig_addr = slot_addr(orig_addr, i);
-		mem->slots[index + i].alloc_size =
-			alloc_size - (i << IO_TLB_SHIFT);
-	}
 	tlb_addr = slot_addr(mem->start, index) + offset;
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
-- 
2.32.0.272.g935e593368-goog

