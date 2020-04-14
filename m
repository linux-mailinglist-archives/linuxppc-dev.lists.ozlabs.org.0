Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C541E1A7F39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 16:09:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491nRR0x7JzDqjW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 00:09:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+4a22011dcb1da0b09bf4+6078+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=JXYdttdn; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491mDV5dmyzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 23:14:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ounqfI9CXMUIXqEGvecn2fVMevKBON5/GtrMu/96rgE=; b=JXYdttdnaHgBP+lrnbNQv+l484
 AiTLXkeT89LiTTe8UjKuAOXDWRuFGAcQ/0CnDrMoy9ZGKz4sk7r96NGt6CuvaRdpA66qBYAJs0u4x
 u7ZGjCB5NfHcOgUfTmMxihPOpHU3YzO7ATv3rEodE1mB0A6EDcsMfLgynRGNEoH0URG1N67vsvQ19
 2xBcQNMtObO5UAoeqB1qDJY5ftdJr1rvZS8JlFIjADihw193xCv/FJPXcuqN0qXZ02y6IQK+CKIx5
 yQbDGbmNwBHeYmOIds2Y0zr7VGGy4VAfNmsEEGLFdUk7woS9f96wHe5hQkcMuG6kN1pDBO+UDwMcB
 358La5gQ==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOLOY-0006i4-0d; Tue, 14 Apr 2020 13:14:30 +0000
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
Subject: [PATCH 11/29] mm: only allow page table mappings for built-in zsmalloc
Date: Tue, 14 Apr 2020 15:13:30 +0200
Message-Id: <20200414131348.444715-12-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414131348.444715-1-hch@lst.de>
References: <20200414131348.444715-1-hch@lst.de>
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

This allows to unexport map_vm_area and unmap_kernel_range, which are
rather deep internal and should not be available to modules, as they for
example allow fine grained control of mapping permissions, and also
allow splitting the setup of a vmalloc area and the actual mapping and
thus expose vmalloc internals.

zsmalloc is typically built-in and continues to work (just like the
percpu-vm code using a similar patter), while modular zsmalloc also
continues to work, but must use copies.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 mm/Kconfig   | 2 +-
 mm/vmalloc.c | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 09a9edfb8461..5c0362bd8d56 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -707,7 +707,7 @@ config ZSMALLOC
 
 config ZSMALLOC_PGTABLE_MAPPING
 	bool "Use page table mapping to access object in zsmalloc"
-	depends on ZSMALLOC
+	depends on ZSMALLOC=y
 	help
 	  By default, zsmalloc uses a copy-based object mapping method to
 	  access allocations that span two pages. However, if a particular
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3375f9508ef6..9183fc0d365a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2046,7 +2046,6 @@ void unmap_kernel_range(unsigned long addr, unsigned long size)
 	vunmap_page_range(addr, end);
 	flush_tlb_kernel_range(addr, end);
 }
-EXPORT_SYMBOL_GPL(unmap_kernel_range);
 
 int map_vm_area(struct vm_struct *area, pgprot_t prot, struct page **pages)
 {
@@ -2058,7 +2057,6 @@ int map_vm_area(struct vm_struct *area, pgprot_t prot, struct page **pages)
 
 	return err > 0 ? 0 : err;
 }
-EXPORT_SYMBOL_GPL(map_vm_area);
 
 static inline void setup_vmalloc_vm_locked(struct vm_struct *vm,
 	struct vmap_area *va, unsigned long flags, const void *caller)
-- 
2.25.1

