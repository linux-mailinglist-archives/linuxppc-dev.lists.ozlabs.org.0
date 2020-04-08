Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1B21A2216
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 14:34:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y3cp5gF8zDqLl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 22:34:34 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=OK8x5jof; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y2sd1hPLzDqjQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 22:00:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=F8FiHBCrG9trCoDrLT1wvc+8HEEyslQ5M3nlqbAOi4Y=; b=OK8x5jofz7Eq/Xji6qnn9UGlM2
 TK7yIE7ID6JsM28vlnHqYgIaHdHgzlOuQ4TuXiLbTmA6Q2ZfI6PvPBN5pBXyc5Auc5dz3qF+T+9E6
 0fpZoHk7kEzc1hBMz1Ec7FEOEA4EKRMDJ24m5gnidsGdLXbDq9pJisggellU6ich7aN2xKVAUQ4sq
 BaqxsyzSZSL7NbfmIXfHlEXX3rUqlQYguPTztiusz2CKeZOlZwsyMFGgWgAwhD7Rcu2AhOKjV+tGp
 m885HKFsmwwNcIkjhdQGgEsJlbnGE0L2z/sy4m55mkoDauXiGLQj/Sofo/PT8Y5uY3xBoA7RmgOMg
 wAu3tP5Q==;
Received: from [2001:4bb8:180:5765:65b6:f11e:f109:b151] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9NR-00049e-7q; Wed, 08 Apr 2020 12:00:18 +0000
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
Subject: [PATCH 13/28] mm: rename vmap_page_range to map_kernel_range
Date: Wed,  8 Apr 2020 13:59:11 +0200
Message-Id: <20200408115926.1467567-14-hch@lst.de>
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

This matches the map_kernel_range_noflush API.  Also change to pass
a size instead of the end, similar to the noflush version.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/vmalloc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 55df5dc6a9fc..a3d810def567 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -272,13 +272,13 @@ int map_kernel_range_noflush(unsigned long addr, unsigned long size,
 	return nr;
 }
 
-static int vmap_page_range(unsigned long start, unsigned long end,
+static int map_kernel_range(unsigned long start, unsigned long size,
 			   pgprot_t prot, struct page **pages)
 {
 	int ret;
 
-	ret = map_kernel_range_noflush(start, end - start, prot, pages);
-	flush_cache_vmap(start, end);
+	ret = map_kernel_range_noflush(start, size, prot, pages);
+	flush_cache_vmap(start, start + size);
 	return ret;
 }
 
@@ -1866,7 +1866,7 @@ void *vm_map_ram(struct page **pages, unsigned int count, int node, pgprot_t pro
 
 	kasan_unpoison_vmalloc(mem, size);
 
-	if (vmap_page_range(addr, addr + size, prot, pages) < 0) {
+	if (map_kernel_range(addr, size, prot, pages) < 0) {
 		vm_unmap_ram(mem, count);
 		return NULL;
 	}
@@ -2030,10 +2030,9 @@ void unmap_kernel_range(unsigned long addr, unsigned long size)
 int map_vm_area(struct vm_struct *area, pgprot_t prot, struct page **pages)
 {
 	unsigned long addr = (unsigned long)area->addr;
-	unsigned long end = addr + get_vm_area_size(area);
 	int err;
 
-	err = vmap_page_range(addr, end, prot, pages);
+	err = map_kernel_range(addr, get_vm_area_size(area), prot, pages);
 
 	return err > 0 ? 0 : err;
 }
-- 
2.25.1

