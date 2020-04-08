Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB3C1A21B1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 14:21:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y3K927m6zDqMg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 22:21:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+90f925bb5134fe9b5196+6072+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=kMYww0dY; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y2sM2FGRzDqq0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 22:00:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Ny8WDSQUfoBWfg8q985YYaQfhGb7DzEU/DgzJ/fuVqQ=; b=kMYww0dYMqih4nXqzFYzLPfwnu
 8K11Gs1tthUPRpdveSrymRFrZ0AVzpFluASNT9W/MXTSLm36Nq+FNZrkrtyYWAfqtPnCF0yjS0H1M
 Uxbs0RnXCNez6dObH6FXoi/Z9xkxRqrhT5h06lOoWOEO1ket0/Q9AuHndax7AZxGCy3BwVrydOXXm
 YH7Pe4IJMJ1S01/u2nF1MsbH0mBlipl+zFJctp6ep3xodceTMqiXEAGWiXBisIlyKE2D5ARBU/P8j
 YPmdp7H/bfFoIXC5huhvRMyqgN6ZQamt5E3HP2VUUfa+ZWPvTde6fdDn4gdxptbNAbOt5LZolTubJ
 R0C0ixmA==;
Received: from [2001:4bb8:180:5765:65b6:f11e:f109:b151] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9N2-00021M-Ag; Wed, 08 Apr 2020 11:59:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: [PATCH 07/28] mm: remove __get_vm_area
Date: Wed,  8 Apr 2020 13:59:05 +0200
Message-Id: <20200408115926.1467567-8-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408115926.1467567-1-hch@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Switch the two remaining callers to use __get_vm_area_caller instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/kernel/pci_64.c | 3 ++-
 arch/sh/kernel/cpu/sh4/sq.c  | 3 ++-
 include/linux/vmalloc.h      | 2 --
 mm/vmalloc.c                 | 8 --------
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index 8e86bd9c1eca..155e2ef60053 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -132,7 +132,8 @@ void __iomem *ioremap_pbh(phys_addr_t paddr, unsigned long size)
 	 * address decoding but I'd rather not deal with those outside of the
 	 * reserved 64K legacy region.
 	 */
-	area = __get_vm_area(size, 0, PHB_IO_BASE, PHB_IO_END);
+	area = __get_vm_area_caller(size, 0, PHB_IO_BASE, PHB_IO_END,
+				    __builtin_return_address(0));
 	if (!area)
 		return NULL;
 
diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
index 934ff84844fa..d432164b23b7 100644
--- a/arch/sh/kernel/cpu/sh4/sq.c
+++ b/arch/sh/kernel/cpu/sh4/sq.c
@@ -103,7 +103,8 @@ static int __sq_remap(struct sq_mapping *map, pgprot_t prot)
 #if defined(CONFIG_MMU)
 	struct vm_struct *vma;
 
-	vma = __get_vm_area(map->size, VM_ALLOC, map->sq_addr, SQ_ADDRMAX);
+	vma = __get_vm_area_caller(map->size, VM_ALLOC, map->sq_addr,
+			SQ_ADDRMAX, __builtin_return_address(0));
 	if (!vma)
 		return -ENOMEM;
 
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 0507a162ccd0..3070b4dbc2d9 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -161,8 +161,6 @@ static inline size_t get_vm_area_size(const struct vm_struct *area)
 extern struct vm_struct *get_vm_area(unsigned long size, unsigned long flags);
 extern struct vm_struct *get_vm_area_caller(unsigned long size,
 					unsigned long flags, const void *caller);
-extern struct vm_struct *__get_vm_area(unsigned long size, unsigned long flags,
-					unsigned long start, unsigned long end);
 extern struct vm_struct *__get_vm_area_caller(unsigned long size,
 					unsigned long flags,
 					unsigned long start, unsigned long end,
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 399f219544f7..d1534d610b48 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2127,14 +2127,6 @@ static struct vm_struct *__get_vm_area_node(unsigned long size,
 	return area;
 }
 
-struct vm_struct *__get_vm_area(unsigned long size, unsigned long flags,
-				unsigned long start, unsigned long end)
-{
-	return __get_vm_area_node(size, 1, flags, start, end, NUMA_NO_NODE,
-				  GFP_KERNEL, __builtin_return_address(0));
-}
-EXPORT_SYMBOL_GPL(__get_vm_area);
-
 struct vm_struct *__get_vm_area_caller(unsigned long size, unsigned long flags,
 				       unsigned long start, unsigned long end,
 				       const void *caller)
-- 
2.25.1

