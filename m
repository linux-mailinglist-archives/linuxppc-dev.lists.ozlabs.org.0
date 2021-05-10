Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFFA378074
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 11:53:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdxFn1Ystz3cLq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 19:53:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aEzUGv6H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=aEzUGv6H; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdxCK3zCzz303t
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 19:51:25 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id gj14so9441902pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 02:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H8s2Ssxedi+m7Lc7mdaT6IyIVFNL7UMFVGCjjIXUKBs=;
 b=aEzUGv6HyICG91lVRchMBsfGFoiKw5t3UKv5r9/XWkq1l03uTxk5gK7BReGArG4wM7
 eL8k61LHaWwrgnh+WJYeL7I+S/QoUwEkwv6x0tDx3HcpYoUp9liwFvhqHJX8OnvlaqU3
 oxtyLQT57sgPbzesRlkZ21sVrQ/LPb2+Dv9rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H8s2Ssxedi+m7Lc7mdaT6IyIVFNL7UMFVGCjjIXUKBs=;
 b=s+clu30kXQlvHpvteiJV3ek8DqDAkSPnt3UNzaVFjyAiclmXfjFPA5d8VoC5euaYle
 07WhJjgQZTOTMUYgoQA5Gvrl7hs9mqj2HK/1sHksfWtIC2yOnVZn182Quebqv6D9bh5l
 Ih1YlVUOY1Y12CVYv/3r7irorVDg8kShYPX/n2RiDkj/TlimbGFoTWydMuRgjcOmzFg6
 JzPitaOrqwU/QJAkow/azqnW/oj3BSthgsQpUY/i5UkzysdnZNBh/RzAqU1DvNrKNIb3
 xN9L2rzf+abGdZC+xYmPjVqAXTS7BkqiGTW9Ejcj0NjsMwSDS1PgbLsMd8/pDBG+7xOS
 96zQ==
X-Gm-Message-State: AOAM5331Qk8QrtEOgFhXhCHOtGdOiyJ7jr2/SWNuYy+N/rEDiOjQD2lQ
 O2iKl/KadPOGKaMFzngGglkNGQ==
X-Google-Smtp-Source: ABdhPJzROW5FUCBZB2fXFHkP0ALBea1sVjbZahlfu04HnoSywATlCq/z9y3jgockvO/xDk1J1RoGzg==
X-Received: by 2002:a17:90b:1bcd:: with SMTP id
 oa13mr40100520pjb.22.1620640283118; 
 Mon, 10 May 2021 02:51:23 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a524:abe8:94e3:5601])
 by smtp.gmail.com with UTF8SMTPSA id ml19sm46030318pjb.2.2021.05.10.02.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 02:51:22 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v6 05/15] swiotlb: Add a new get_io_tlb_mem getter
Date: Mon, 10 May 2021 17:50:16 +0800
Message-Id: <20210510095026.3477496-6-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210510095026.3477496-1-tientzu@chromium.org>
References: <20210510095026.3477496-1-tientzu@chromium.org>
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
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new getter, get_io_tlb_mem, to help select the io_tlb_mem struct.
The restricted DMA pool is preferred if available.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 03ad6e3b4056..b469f04cca26 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -2,6 +2,7 @@
 #ifndef __LINUX_SWIOTLB_H
 #define __LINUX_SWIOTLB_H
 
+#include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -102,6 +103,16 @@ struct io_tlb_mem {
 };
 extern struct io_tlb_mem *io_tlb_default_mem;
 
+static inline struct io_tlb_mem *get_io_tlb_mem(struct device *dev)
+{
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (dev && dev->dma_io_tlb_mem)
+		return dev->dma_io_tlb_mem;
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
+
+	return io_tlb_default_mem;
+}
+
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 {
 	struct io_tlb_mem *mem = io_tlb_default_mem;
-- 
2.31.1.607.g51e8a6a459-goog

