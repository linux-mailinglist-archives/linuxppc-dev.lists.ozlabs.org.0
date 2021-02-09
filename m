Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8825F3148C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:27:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZXxl4md9zDsc2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:27:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=nuyunksJ; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXqF4l6wzDsdG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:22:01 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id a16so9161833plh.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ypYSGMF0E/cBAHmG+5MgTYKeSo3o0eLQF2YTe8sYrHU=;
 b=nuyunksJVzuVGUJwTZPlPVCVdAk7PqLR5/eJIWK+czvsKm+Rv5adeEB/7QzXpfJ6Qb
 eTQmwh//uII6ybrnF53ZsBr2I2SswetGJe9SJ79VWxXwIXylAfF5A0x6o0MD+aeanu4S
 AHLyX/KnrhYHKwiWZolFO//7UXaKKEQSkWti8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ypYSGMF0E/cBAHmG+5MgTYKeSo3o0eLQF2YTe8sYrHU=;
 b=r9BDB5E/L+IdUnY4gZ2PVR+NhTMVRl4J9WNowkX+PZLE0a07YbrZSLjNcPvTBNEMEZ
 aHgPvoW5fY4n78AFFPoFrum7kUb/RY2CYkyGoZ1cCUa+duyr6K5QLgwQZt5gt0GVK4u8
 rqg2yByVMzy0YwcNelDD+KETIunUtCG3Xb0sPH30ua8AxhLVLeH5nQoo8pPiukuA4EDv
 4pMxHnSvDJZi+b2j7eX2pZX7SkdaC5fW12+NhEpJow8YKwZquBZL8BiPuLsVH9g1zQqv
 B5x2ZxbSh8lEAYmiOOqm3zkJZKwADXn8Qc9wT9WxCKys67D1ppOEcgarZaGnU3kjCEeO
 8pKA==
X-Gm-Message-State: AOAM531AHpP3i9KYJaXoRTE6z57JV1wrjJY8f7RgEK3qqs2s4MR8j0fD
 aAULrwWUpKVxkwF20sN8a2m2Hw==
X-Google-Smtp-Source: ABdhPJywOf1kdt/G4UCY0rOH88voPYoRmAlcet1VV4EMdbEytPdXO083Yd5o1179zNV2rDMmBilckQ==
X-Received: by 2002:a17:90a:df87:: with SMTP id p7mr663033pjv.99.1612851717915; 
 Mon, 08 Feb 2021 22:21:57 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id a24sm22136125pff.18.2021.02.08.22.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:21:57 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 02/14] swiotlb: Move is_swiotlb_buffer() to swiotlb.c
Date: Tue,  9 Feb 2021 14:21:19 +0800
Message-Id: <20210209062131.2300005-3-tientzu@chromium.org>
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

Move is_swiotlb_buffer() to swiotlb.c and make io_tlb_{start,end}
static, so we can entirely hide struct swiotlb inside of swiotlb.c in
the following patches.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 7 +------
 kernel/dma/swiotlb.c    | 7 ++++++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 83200f3b042a..041611bf3c2a 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -70,13 +70,8 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
-extern phys_addr_t io_tlb_start, io_tlb_end;
-
-static inline bool is_swiotlb_buffer(phys_addr_t paddr)
-{
-	return paddr >= io_tlb_start && paddr < io_tlb_end;
-}
 
+bool is_swiotlb_buffer(phys_addr_t paddr);
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index e180211f6ad9..678490d39e55 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -69,7 +69,7 @@ enum swiotlb_force swiotlb_force;
  * swiotlb_tbl_sync_single_*, to see if the memory was in fact allocated by this
  * API.
  */
-phys_addr_t io_tlb_start, io_tlb_end;
+static phys_addr_t io_tlb_start, io_tlb_end;
 
 /*
  * The number of IO TLB blocks (in groups of 64) between io_tlb_start and
@@ -719,6 +719,11 @@ bool is_swiotlb_active(void)
 	return io_tlb_end != 0;
 }
 
+bool is_swiotlb_buffer(phys_addr_t paddr)
+{
+	return paddr >= io_tlb_start && paddr < io_tlb_end;
+}
+
 phys_addr_t get_swiotlb_start(void)
 {
 	return io_tlb_start;
-- 
2.30.0.478.g8a0d178c01-goog

