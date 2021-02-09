Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAAB3148DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:31:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZY2f2J50zDqr0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:31:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=WmMoRPfw; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXqW6WXczDsdJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:22:15 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id o7so11848346pgl.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WvKUPmchuhcE1zfso8bHoA3z2cJUHyqor/xynDrdSzc=;
 b=WmMoRPfwVrKkMTfzfSeApWYOsANXGiOgA3320pKWhEerXc+d04kio6kBo6Samikmhh
 dKY6FAm9apY748uamOD6+T+Q7zkEWfp30SA3fCJNtSNB7CjdS5M+/v04eEEHZ9JPhbQU
 oGnPa5k409EctotY2FmiW01VL+4N5+/MQmqlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WvKUPmchuhcE1zfso8bHoA3z2cJUHyqor/xynDrdSzc=;
 b=OdmNwAiQoa3v4oT5fX+7+X1UlD0yymsRvUh8CY+odVB4hFcze5kn8UEU9KOnnQvvBg
 Rnh83KnrbYUe34KKNJQ4AYFAmQo00wKmDK1/mqc9EG7jzR6kNwEzPuLBemAyvgjrmeei
 uhkLmbE3+YbtyM5yYu78Xd61tvbSbP2mOprqFjwl923Km+cIOIS/poBlZT+uQThZphY4
 b1ysWN/mfM+pnnw/sXAULdfF97sUsdPlaWZp/61LG3ElDFpu0u9VHG+iYxYdZM3ly6Tk
 kXwT/PVFycjLCQitMCiZ1XO8Kt1nMRRtn2u2XqX/UFZyKs1MCkZq87r/YZPioG419euy
 hVpQ==
X-Gm-Message-State: AOAM531onKDYULYs2dlpuCErOS9eGAqQ9E+Pvc26M+DLuI93TuiArAbN
 wmkRaNvSD3HABXPC4LMVbtFvjw==
X-Google-Smtp-Source: ABdhPJwPilLMeHO4izUWlTNwHOL/6AulGQdpqWdqLrBPBm35gr6jqlo9rCgrJT+lklmP7VdqmUgqQg==
X-Received: by 2002:a63:80c8:: with SMTP id j191mr1570888pgd.58.1612851732543; 
 Mon, 08 Feb 2021 22:22:12 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id w1sm14605147pfg.116.2021.02.08.22.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:22:11 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 04/14] swiotlb: Refactor swiotlb_late_init_with_tbl
Date: Tue,  9 Feb 2021 14:21:21 +0800
Message-Id: <20210209062131.2300005-5-tientzu@chromium.org>
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

Refactor swiotlb_late_init_with_tbl to make the code reusable for
restricted DMA pool initialization.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 65 ++++++++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 28b7bfe7a2a8..dc37951c6924 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -353,20 +353,21 @@ static void swiotlb_cleanup(void)
 	max_segment = 0;
 }
 
-int
-swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
+static int swiotlb_init_tlb_pool(struct swiotlb *swiotlb, phys_addr_t start,
+				size_t size)
 {
-	struct swiotlb *swiotlb = &default_swiotlb;
-	unsigned long i, bytes;
+	unsigned long i;
+	void *vaddr = phys_to_virt(start);
 
-	bytes = nslabs << IO_TLB_SHIFT;
+	size = ALIGN(size, 1 << IO_TLB_SHIFT);
+	swiotlb->nslabs = size >> IO_TLB_SHIFT;
+	swiotlb->nslabs = ALIGN(swiotlb->nslabs, IO_TLB_SEGSIZE);
 
-	swiotlb->nslabs = nslabs;
-	swiotlb->start = virt_to_phys(tlb);
-	swiotlb->end = swiotlb->start + bytes;
+	swiotlb->start = start;
+	swiotlb->end = swiotlb->start + size;
 
-	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
-	memset(tlb, 0, bytes);
+	set_memory_decrypted((unsigned long)vaddr, size >> PAGE_SHIFT);
+	memset(vaddr, 0, size);
 
 	/*
 	 * Allocate and initialize the free list array.  This array is used
@@ -390,13 +391,7 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 		swiotlb->orig_addr[i] = INVALID_PHYS_ADDR;
 	}
 	swiotlb->index = 0;
-	no_iotlb_memory = false;
-
-	swiotlb_print_info();
 
-	late_alloc = 1;
-
-	swiotlb_set_max_segment(swiotlb->nslabs << IO_TLB_SHIFT);
 	spin_lock_init(&swiotlb->lock);
 
 	return 0;
@@ -410,6 +405,27 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	return -ENOMEM;
 }
 
+int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
+{
+	struct swiotlb *swiotlb = &default_swiotlb;
+	unsigned long bytes = nslabs << IO_TLB_SHIFT;
+	int ret;
+
+	ret = swiotlb_init_tlb_pool(swiotlb, virt_to_phys(tlb), bytes);
+	if (ret)
+		return ret;
+
+	no_iotlb_memory = false;
+
+	swiotlb_print_info();
+
+	late_alloc = 1;
+
+	swiotlb_set_max_segment(bytes);
+
+	return 0;
+}
+
 void __init swiotlb_exit(void)
 {
 	struct swiotlb *swiotlb = &default_swiotlb;
@@ -747,17 +763,20 @@ phys_addr_t get_swiotlb_start(void)
 }
 
 #ifdef CONFIG_DEBUG_FS
-
-static int __init swiotlb_create_debugfs(void)
+static void swiotlb_create_debugfs(struct swiotlb *swiotlb, const char *name,
+				   struct dentry *node)
 {
-	struct swiotlb *swiotlb = &default_swiotlb;
-
-	swiotlb->debugfs = debugfs_create_dir("swiotlb", NULL);
+	swiotlb->debugfs = debugfs_create_dir(name, node);
 	debugfs_create_ulong("io_tlb_nslabs", 0400, swiotlb->debugfs, &swiotlb->nslabs);
 	debugfs_create_ulong("io_tlb_used", 0400, swiotlb->debugfs, &swiotlb->used);
-	return 0;
 }
 
-late_initcall(swiotlb_create_debugfs);
+static int __init swiotlb_create_default_debugfs(void)
+{
+	swiotlb_create_debugfs(&default_swiotlb, "swiotlb", NULL);
+
+	return 0;
+}
 
+late_initcall(swiotlb_create_default_debugfs);
 #endif
-- 
2.30.0.478.g8a0d178c01-goog

