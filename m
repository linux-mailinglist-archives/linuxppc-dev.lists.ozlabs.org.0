Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2356331490D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:45:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZYKz0ZGnzDqLG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:45:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=ert+Xkxp; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXrV1dMvzDsf5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:23:05 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id o63so11828733pgo.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6zQVHgfobPuQEWulcSd+ytGSNGCX6uxs4mC7Gt2kf+c=;
 b=ert+XkxphAdsHWZRYOV0Cfn/2U+Hq+bg6asziCHHt/7u8Vvc0xyaeiuaRHcJi9Q1Vz
 h0k512lAFo9/rmCIttSQjdSndXS7KAKpm476xzbqDMAPDG5a7mdNYtdhfGaun9yWGWmH
 a9iyECq63v2VApjt+BbXpHPW6ZsiyzSxuIc1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6zQVHgfobPuQEWulcSd+ytGSNGCX6uxs4mC7Gt2kf+c=;
 b=ZxatHjZARW/wmkDu1o5b7vc+WxHdEjF1uFHKy7WxaxTforZkIhXsK0T7vOO5s76YHC
 bQti8OKlLpLnvm4lpRvBzSKzoSDomBoBCW4TBdahk2sEYqLhOxjEaFDmb1r3Jv5Rxotf
 wyo+UylPxyrIwIqaxA7afg1Dz2Nu21ouxV6/DQlmd6b2F8xumxZBBxjXY3NcBdJjx/Mn
 JBBvJWxOMb3zNtckpU0DGoF9sJ7I3bDaYnqesaXyRC3VY+s0RR02yuKpiFVEs2eLtQh7
 a51muc46RdJSHF1kUmPkm/M2U5Vd7loYKx+c/cLYFxF1PQWL31ji+Nw0h4hg9zACEUbr
 2qUQ==
X-Gm-Message-State: AOAM531dUKMmJvunnNYBkYlw2+8vDY3rSQ2Z3AU/vu6Q66HULdyFa9wo
 5JT4KSWJ2E10QkwPbvhEnfzO7w==
X-Google-Smtp-Source: ABdhPJzmV9YXPB6hCsXZ7URzXPDB7/qCe304q7KRCHJSQjtn7qxPBetED2jKI5U7yWvekiJpr6hFzw==
X-Received: by 2002:a62:4e10:0:b029:1c9:9015:dc5b with SMTP id
 c16-20020a624e100000b02901c99015dc5bmr21533363pfb.30.1612851783406; 
 Mon, 08 Feb 2021 22:23:03 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id gx22sm1155253pjb.49.2021.02.08.22.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:23:02 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 11/14] swiotlb: Add is_dev_swiotlb_force()
Date: Tue,  9 Feb 2021 14:21:28 +0800
Message-Id: <20210209062131.2300005-12-tientzu@chromium.org>
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

Add is_dev_swiotlb_force() which returns true if the device has
restricted DMA pool (e.g. dev->dev_swiotlb is set).

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 9 +++++++++
 kernel/dma/swiotlb.c    | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 76f86c684524..b9f2a250c8da 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -73,11 +73,16 @@ extern enum swiotlb_force swiotlb_force;
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
 bool is_swiotlb_force(struct device *dev);
+bool is_dev_swiotlb_force(struct device *dev);
 #else
 static inline bool is_swiotlb_force(struct device *dev)
 {
 	return unlikely(swiotlb_force == SWIOTLB_FORCE);
 }
+static inline bool is_dev_swiotlb_force(struct device *dev)
+{
+	return false;
+}
 #endif /* CONFIG_DMA_RESTRICTED_POOL */
 
 bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr);
@@ -93,6 +98,10 @@ static inline bool is_swiotlb_force(struct device *dev)
 {
 	return false;
 }
+static inline bool is_dev_swiotlb_force(struct device *dev)
+{
+	return false;
+}
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index f64cbe6e84cc..fd9c1bd183ac 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -841,6 +841,11 @@ bool is_swiotlb_force(struct device *dev)
 	return unlikely(swiotlb_force == SWIOTLB_FORCE) || dev->dev_swiotlb;
 }
 
+bool is_dev_swiotlb_force(struct device *dev)
+{
+	return dev->dev_swiotlb;
+}
+
 static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 				    struct device *dev)
 {
-- 
2.30.0.478.g8a0d178c01-goog

