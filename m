Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FE7367BF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 10:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQqxv1KY8z2yyr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 18:16:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AsZrZqJI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=AsZrZqJI; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQqwy0xxmz300C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 18:15:29 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id e2so18817506plh.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 01:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KeK8DSQdHPnfBsnYoJml8hxFMiJru7O0NA4XbeWzkSY=;
 b=AsZrZqJIimVAtGXMRVsWcKrsorVck1XgLTh3pHNLrWSxkdDRnGm7t6TqpM5ldf6xB7
 mC86KkbKnwzlnS/clKnP6s/9uO1XB8opjFqiCDh6A7+1mZw2SFs1IwNU2LHHphHOt6QY
 p2b9YBU51p/mzY9rCQjA96SJjLr18SEsXNgpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KeK8DSQdHPnfBsnYoJml8hxFMiJru7O0NA4XbeWzkSY=;
 b=YssFjhYE4DT7oFOWkQy4HwVCU/oI6Cjhm122OicNCQDb1nBFlU6x0nY6duas/CZnVm
 nlS5sBxBGZXoOkIQUn8ccInZHft4PasVrhVWPz7I+ByswGvFO7NmInjRCwgDPg2a9Y6v
 /kSdwLslS4kJzrmv4C/hzDKSnqBwhJO+wOF3mmgV9gkcNpDCtTBG2tTWJYQ/LEy1ed11
 I2mqWDV1YsVYqMUKTzQQKFhtLpokmiHJPA7IO9xvRq+3mW5mbeBec0T47b3j3Rw4AYiM
 Cfa77fTCFXvOSoL+fuRon7BXitw2Q0WqIkvkbNJsd6xRHziWgUzXo7/thDXvbGecE8Fx
 Y+Yw==
X-Gm-Message-State: AOAM530LH6flLMb1wXec4rYcTUJCL/xIKKoEZk9iZVdLbW1fb0wX695m
 ri9Apfc/7S41Yx26JrqKeR6wOw==
X-Google-Smtp-Source: ABdhPJx3x6k3UuJoTeVgHgSVZk2TSCFARKLuNRut1DwuLYspzTDGMvJMpDB6O5YCyQkIwGCuRKmyJg==
X-Received: by 2002:a17:90b:298:: with SMTP id
 az24mr2746175pjb.123.1619079327035; 
 Thu, 22 Apr 2021 01:15:27 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:1a8e:1bde:f79e:c302])
 by smtp.gmail.com with UTF8SMTPSA id o30sm1546049pgc.55.2021.04.22.01.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:15:26 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 01/16] swiotlb: Fix the type of index
Date: Thu, 22 Apr 2021 16:14:53 +0800
Message-Id: <20210422081508.3942748-2-tientzu@chromium.org>
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

Fix the type of index from unsigned int to int since find_slots() might
return -1.

Fixes: 0774983bc923 ("swiotlb: refactor swiotlb_tbl_map_single")
Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 0a5b6f7e75bc..8635a57f88e9 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -499,7 +499,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 {
 	struct io_tlb_mem *mem = io_tlb_default_mem;
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
-	unsigned int index, i;
+	unsigned int i;
+	int index;
 	phys_addr_t tlb_addr;
 
 	if (!mem)
-- 
2.31.1.368.gbe11c130af-goog

