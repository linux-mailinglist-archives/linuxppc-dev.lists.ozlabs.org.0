Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E373148C1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:25:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZXvY5yBPzDsd9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:25:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=iIl5SP7d; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXq45Sn6zDsdb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:21:52 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id cv23so971232pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQjRLnhkPorvAVKaOPejw74RXuDyQjfs10AJ4S/GkGY=;
 b=iIl5SP7dar66QYJx01a8eKBzk/OkK/x97Udeqkp8z6Zecwu6gJbtr4+R7AJhbJUsET
 mW/NYKe+92F4cTf+MWb8Kjs3DEc/fRUB2Tuk/IK9lw1i5dbH+o71qP4rUdYAStwKxzrf
 aFKGX0hir3NozqAR+M+IQwDL2zs+YG9OyvX5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQjRLnhkPorvAVKaOPejw74RXuDyQjfs10AJ4S/GkGY=;
 b=nlxZYMQaDKea5YfNnk0Z3GmHzQIGoq0qLAVsv7CIihRWPgbun3Hj4EK8LDyIkcktoH
 BY9YLXDvRKgO/Ki5zNm1XQ2UEpdPmtDKa+xxZP9dG1jEOXdKwCq3jxn4r3KrX6a/X51N
 9OcX87mEdXF1GFAQFqM9C8J4FYFSlcjuQDiLVHMw/e9cDiVAL/HnxDFBhf7IfXNkLKYZ
 1c/gEua2GxFqFNnPq7/Ex156IS4B8jPD9UuBUcxIBIlHKOhYDVjx9IwBILfXZTgzdkAX
 LVY4N4MeifzbvCNSfL7ou38v4CNaupTuMgXIcm6lhIs1zJ6babKsTSvapo+qXeeFO6Wy
 NBzQ==
X-Gm-Message-State: AOAM532eAcqy6Ive52rlDvd7nwpQrdycpDbQO/DS/sv/Xx1OYBdUUoxP
 XVeru3lqD9T9pKDq21Cz9DIk9w==
X-Google-Smtp-Source: ABdhPJzMs/GVP3LhI2pHnVT9gB2t4EDZQ5t7O4c7u18G3hsJLKUa+IhCtg1SpLtI9Cft7lrwlj4fPw==
X-Received: by 2002:a17:90a:ad09:: with SMTP id
 r9mr2555446pjq.51.1612851710886; 
 Mon, 08 Feb 2021 22:21:50 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id y26sm21067426pgk.42.2021.02.08.22.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:21:50 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 01/14] swiotlb: Remove external access to io_tlb_start
Date: Tue,  9 Feb 2021 14:21:18 +0800
Message-Id: <20210209062131.2300005-2-tientzu@chromium.org>
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

Add a new function, get_swiotlb_start(), and remove external access to
io_tlb_start, so we can entirely hide struct swiotlb inside of swiotlb.c
in the following patches.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 arch/powerpc/platforms/pseries/svm.c | 4 ++--
 drivers/xen/swiotlb-xen.c            | 4 ++--
 include/linux/swiotlb.h              | 1 +
 kernel/dma/swiotlb.c                 | 5 +++++
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 7b739cc7a8a9..c10c51d49f3d 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -55,8 +55,8 @@ void __init svm_swiotlb_init(void)
 	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
 		return;
 
-	if (io_tlb_start)
-		memblock_free_early(io_tlb_start,
+	if (vstart)
+		memblock_free_early(vstart,
 				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
 }
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99..91f8c68d1a9b 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -192,8 +192,8 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	/*
 	 * IO TLB memory already allocated. Just use it.
 	 */
-	if (io_tlb_start != 0) {
-		xen_io_tlb_start = phys_to_virt(io_tlb_start);
+	if (is_swiotlb_active()) {
+		xen_io_tlb_start = phys_to_virt(get_swiotlb_start());
 		goto end;
 	}
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index d9c9fc9ca5d2..83200f3b042a 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -81,6 +81,7 @@ void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(void);
+phys_addr_t get_swiotlb_start(void);
 void __init swiotlb_adjust_size(unsigned long new_size);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 7c42df6e6100..e180211f6ad9 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -719,6 +719,11 @@ bool is_swiotlb_active(void)
 	return io_tlb_end != 0;
 }
 
+phys_addr_t get_swiotlb_start(void)
+{
+	return io_tlb_start;
+}
+
 #ifdef CONFIG_DEBUG_FS
 
 static int __init swiotlb_create_debugfs(void)
--

This can be dropped if Christoph's swiotlb cleanups are landed.
https://lore.kernel.org/linux-iommu/20210207160934.2955931-1-hch@lst.de/T/#m7124f29b6076d462101fcff6433295157621da09 

2.30.0.478.g8a0d178c01-goog

