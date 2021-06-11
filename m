Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF143A4523
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 17:28:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1l9Y1nqWz3byl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 01:28:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C9jITNUp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=C9jITNUp; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1l8Q66Qcz3byp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jun 2021 01:27:34 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so868475pjn.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=POwdGvWH9uF6GuFYGDpfWh3gBTCdeay2Nuv62kz+670=;
 b=C9jITNUpsFL469uBCWw+ylcEXmDJHC24qGoWeq47lXmwrDoiFy9SQ+nYUnDf9eoUhJ
 UQMk8xg5DYQsIoGnRwISCRXEWnbFfVNYAqeVla6v7rlivkLs9OCXtvoP8+LC1h0SWDED
 3sRx2R1OhX94fVL71OHRWyugi7Thhky5EB+DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=POwdGvWH9uF6GuFYGDpfWh3gBTCdeay2Nuv62kz+670=;
 b=Cm0nnxUtMxvimkw9gsi2GTvrnWK2LZRP4KPbGo6wZ0N76asSJbGnPN9m2o6SHP9HuJ
 ALJd267e4Uc9LqE+QTA8wG0RX78R0DmHn06LIfUBUIyTHsdH9e2PYGuYnIgaldGg49l6
 m/EnyQzpIZXJcDFgWKINi3Tp4N291LR9uV7WH9M+kHPQDXXwqTqd4gWH0zMIVCHsnCOG
 IFKK1gzziD9oU3F/7f87xdbbtNzO+YdktTq7egXUcFicp8/6gB3HGEa8//lG1MF7CWWH
 ZBV/X7/IS9S0HC4BiGoVGwXCQVyt3jsdrojij2Pz50tt943sMrTzTkHrm5XwZnhhaf+G
 ONyA==
X-Gm-Message-State: AOAM533fnpRWf0BIl9dKvyBr8b8nwHGfm0vcSOAAqcgnWpWXpy7D+f2H
 4c9LXBSWN6nsDb5C7fxN+4LsDw==
X-Google-Smtp-Source: ABdhPJye589iRfRWyEdkeIKw72OE8rv2dNVWo6QIa4VZn02HOM9CDAmVKp9644S+z7efQaweuHXMtA==
X-Received: by 2002:a17:90a:7bce:: with SMTP id
 d14mr5098913pjl.38.1623425250808; 
 Fri, 11 Jun 2021 08:27:30 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:33c8:8e01:1161:6797])
 by smtp.gmail.com with UTF8SMTPSA id fs10sm10781936pjb.31.2021.06.11.08.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:27:30 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v9 02/14] swiotlb: Refactor swiotlb_create_debugfs
Date: Fri, 11 Jun 2021 23:26:47 +0800
Message-Id: <20210611152659.2142983-3-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611152659.2142983-1-tientzu@chromium.org>
References: <20210611152659.2142983-1-tientzu@chromium.org>
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

Split the debugfs creation to make the code reusable for supporting
different bounce buffer pools, e.g. restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 1a1208c81e85..8a3e2b3b246d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -64,6 +64,9 @@
 enum swiotlb_force swiotlb_force;
 
 struct io_tlb_mem *io_tlb_default_mem;
+#ifdef CONFIG_DEBUG_FS
+static struct dentry *debugfs_dir;
+#endif
 
 /*
  * Max segment that we can provide which (if pages are contingous) will
@@ -664,18 +667,24 @@ EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
 
-static int __init swiotlb_create_debugfs(void)
+static void swiotlb_create_debugfs_files(struct io_tlb_mem *mem)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
-
-	if (!mem)
-		return 0;
-	mem->debugfs = debugfs_create_dir("swiotlb", NULL);
 	debugfs_create_ulong("io_tlb_nslabs", 0400, mem->debugfs, &mem->nslabs);
 	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &mem->used);
+}
+
+static int __init swiotlb_create_default_debugfs(void)
+{
+	struct io_tlb_mem *mem = io_tlb_default_mem;
+
+	debugfs_dir = debugfs_create_dir("swiotlb", NULL);
+	if (mem) {
+		mem->debugfs = debugfs_dir;
+		swiotlb_create_debugfs_files(mem);
+	}
 	return 0;
 }
 
-late_initcall(swiotlb_create_debugfs);
+late_initcall(swiotlb_create_default_debugfs);
 
 #endif
-- 
2.32.0.272.g935e593368-goog

