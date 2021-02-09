Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD43531490C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:43:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZYJ22Sz1zDqqn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:43:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=J3JXGtOr; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXrL1wZpzDsdq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:22:58 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id r38so11793743pgk.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=497zjM77pvF3Z9oAZHKRrRRQASb3zykCWrEq06oWuA4=;
 b=J3JXGtOrm5PoEyvBsVk+eONszRpKlS2e/fHFYsrzg7r41jB4Qhydpz4iHXCx+nR2XB
 bgZwF53kTc5vzTPgHCJnyyfoRJvrgBHi7UionQnej7Yu1P183TVntz02XzomTxMCHg3G
 mcXNNavE9b460T2UV+kLxlE9ubP6dRssCo1RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=497zjM77pvF3Z9oAZHKRrRRQASb3zykCWrEq06oWuA4=;
 b=DDp91EcWhjZCawYQtkNuEkQPW+AW2dWALjvpQv4yVR4NUi6PsVD4nZpHpEkdW6Cd5l
 YGgHwExALgvN/UUDgPPVrEjLW/QgfXZsmtly24vqdAtQp9jwhgglXWsvWqitmREyZDdp
 hcAbkkoN5fLAWhga8lYnt9FL8QiYrt8z6PZ4Kneut2KQeynDotIqXaQsI3mF6gocwtZ+
 QclNC3mEXPwc0ij4fpwouXid7OFAB0y02IIw0n2gYX9N6EoldH+nfKvoBvNCNm0d/KDO
 vU4CdfRwcpEi179PnAiX+9QXYBCmxWXVLenovR6gjC78gQhXkUgKgVpYrJSeUYLaTXJj
 bpCw==
X-Gm-Message-State: AOAM530bNtQt1GLnnBvEfkfUpzBsEOqOBau5KNKMndP74vMhTKWT2wNw
 nLkfsZjDU50FzRYwkeJhx+xXbg==
X-Google-Smtp-Source: ABdhPJxEw/06walO5wKH5QrYrrWevtYirMnCFq5PBC/eIi86fDszp4wESrmyrR0n6ZgmsKGnPFNlrg==
X-Received: by 2002:a63:4a1a:: with SMTP id x26mr21490368pga.260.1612851776396; 
 Mon, 08 Feb 2021 22:22:56 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id x20sm10253509pfn.14.2021.02.08.22.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:22:55 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 10/14] dma-direct: Add a new wrapper
 __dma_direct_free_pages()
Date: Tue,  9 Feb 2021 14:21:27 +0800
Message-Id: <20210209062131.2300005-11-tientzu@chromium.org>
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

Add a new wrapper __dma_direct_free_pages() that will be useful later
for dev_swiotlb_free().

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/direct.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 30ccbc08e229..a76a1a2f24da 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -75,6 +75,11 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
 		min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit);
 }
 
+static void __dma_direct_free_pages(struct device *dev, struct page *page, size_t size)
+{
+	dma_free_contiguous(dev, page, size);
+}
+
 static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 		gfp_t gfp)
 {
@@ -237,7 +242,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 			return NULL;
 	}
 out_free_pages:
-	dma_free_contiguous(dev, page, size);
+	__dma_direct_free_pages(dev, page, size);
 	return NULL;
 }
 
@@ -273,7 +278,7 @@ void dma_direct_free(struct device *dev, size_t size,
 	else if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
 		arch_dma_clear_uncached(cpu_addr, size);
 
-	dma_free_contiguous(dev, dma_direct_to_page(dev, dma_addr), size);
+	__dma_direct_free_pages(dev, dma_direct_to_page(dev, dma_addr), size);
 }
 
 struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
@@ -310,7 +315,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
 	return page;
 out_free_pages:
-	dma_free_contiguous(dev, page, size);
+	__dma_direct_free_pages(dev, page, size);
 	return NULL;
 }
 
@@ -329,7 +334,7 @@ void dma_direct_free_pages(struct device *dev, size_t size,
 	if (force_dma_unencrypted(dev))
 		set_memory_encrypted((unsigned long)vaddr, 1 << page_order);
 
-	dma_free_contiguous(dev, page, size);
+	__dma_direct_free_pages(dev, page, size);
 }
 
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
-- 
2.30.0.478.g8a0d178c01-goog

