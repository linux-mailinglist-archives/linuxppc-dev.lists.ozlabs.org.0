Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B5A367C3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 10:17:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQqzV6HSvz3c5V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 18:17:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kLFGcuOQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=kLFGcuOQ; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQqxR5gP6z30Gc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 18:15:55 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 nm3-20020a17090b19c3b029014e1bbf6c60so530591pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 01:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4dyB3xlmvkfx6+ggy7Uv640xgq260Lfsxi7yqvhCZI=;
 b=kLFGcuOQrccDqfD9J76t1/kDLyymEf5QZdonwnYtBNPLHycZjLGV1OskzqU8d8CBT2
 dFZ2kyndUcgD1g6WATSmnvKXnlXdau6lSM6AakeoAvt1oeObRayZc+uNuTgzJ9Ur1iuG
 1ryoegnb2fqqmY98GaQlrYL4hIv1GoXoL11Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4dyB3xlmvkfx6+ggy7Uv640xgq260Lfsxi7yqvhCZI=;
 b=jEwcVVHn4fpH6VtxeenuO+Cw4N+K7LMnFFL3o97psIvnWjpY7M4FYvgKIZQ7BeXS/P
 r+/MxlVX0smVZYPhMHG35FE5fxxxUo6/MZQ00JCxp54Fm4OuKVGPb+uhMXapdE7HcPn3
 9KQqcptsuUbDavmXV2/SBJ+fE9Vt3olMg0YTuDlmsQ6Cs1Lfufsw1m6vJf4sLdMHGqgT
 sDeorCTuXBB+8+je0MJQhLVNH5pYHarmX+zqzhylznjW/uY0CQSV8/ipeOF2W2tweehk
 dPZWYGywYGXSWtVBccZXNCyvSunn4JlxufWgvbnrKmw8I60ZnmUw/DxOvAMZik9tsXDJ
 EwuQ==
X-Gm-Message-State: AOAM53025VIU4COuqxmylfZd5a6nfe8F2hqqQLWOosYPqhdfdo4cjcUS
 h704SzBL9s/O2KrrtByjkLshPg==
X-Google-Smtp-Source: ABdhPJzaPOcvkpo4oh1A/JsjcQqzOO/tc1NI/mmGYHMg9yfM2pWhcv0q011OgU/0UUPri4B/30xsPg==
X-Received: by 2002:a17:90b:14c4:: with SMTP id
 jz4mr2772455pjb.144.1619079353175; 
 Thu, 22 Apr 2021 01:15:53 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:1a8e:1bde:f79e:c302])
 by smtp.gmail.com with UTF8SMTPSA id bk6sm4233324pjb.10.2021.04.22.01.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:15:52 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 04/16] swiotlb: Add DMA_RESTRICTED_POOL
Date: Thu, 22 Apr 2021 16:14:56 +0800
Message-Id: <20210422081508.3942748-5-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210422081508.3942748-1-tientzu@chromium.org>
References: <20210422081508.3942748-1-tientzu@chromium.org>
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

Add a new kconfig symbol, DMA_RESTRICTED_POOL, for restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 77b405508743..3e961dc39634 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -80,6 +80,20 @@ config SWIOTLB
 	bool
 	select NEED_DMA_MAP_STATE
 
+config DMA_RESTRICTED_POOL
+	bool "DMA Restricted Pool"
+	depends on OF && OF_RESERVED_MEM
+	select SWIOTLB
+	help
+	  This enables support for restricted DMA pools which provide a level of
+	  DMA memory protection on systems with limited hardware protection
+	  capabilities, such as those lacking an IOMMU.
+
+	  For more information see
+	  <Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt>
+	  and <kernel/dma/swiotlb.c>.
+	  If unsure, say "n".
+
 #
 # Should be selected if we can mmap non-coherent mappings to userspace.
 # The only thing that is really required is a way to set an uncached bit
-- 
2.31.1.368.gbe11c130af-goog

