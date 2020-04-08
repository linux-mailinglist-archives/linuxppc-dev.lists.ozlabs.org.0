Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3461A2158
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 14:09:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y33J4PZpzDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 22:09:00 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=AW8pgI8M; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y2rm4nJMzDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 21:59:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PAMsYd2akdNcv/61LqzK42KESSh1nYBdbqHeKhdDNg0=; b=AW8pgI8MPKkROoB8H45BAd8bqD
 YkGIDJuOmcFj1oi9Sbtk8Zx0z4VdemtQofwcOkWOUbPK7k+JA/rKZETRedymoO8+URo3yaJNhj6r0
 eD7mbR6lp0GLewQNQfA+FZ4fn5BoO5NBc01lvGRob1ZsACPrZofYyqa33qUOM0XEx+UvHsOkOhOHC
 oso8J18tJIyNrQNeRtUYklbHL1gG8TjoWe8hVLHTwfZyxDD00nYUDBwXE4xdjqOCiTIc17D9l1YQC
 xre4RGdbiu32Rv83O8hd5jAzbY+Abw20UrkBSoj2K2jRt2b1hC8yoRTWLwJCC3Njn9FbbYzo1NnJF
 gQdf9pjA==;
Received: from [2001:4bb8:180:5765:65b6:f11e:f109:b151] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9Ml-0001bC-Nz; Wed, 08 Apr 2020 11:59:36 +0000
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
Subject: [PATCH 02/28] staging: android: ion: use vmap instead of vm_map_ram
Date: Wed,  8 Apr 2020 13:59:00 +0200
Message-Id: <20200408115926.1467567-3-hch@lst.de>
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

vm_map_ram can keep mappings around after the vm_unmap_ram.  Using that
with non-PAGE_KERNEL mappings can lead to all kinds of aliasing issues.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/staging/android/ion/ion_heap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/android/ion/ion_heap.c b/drivers/staging/android/ion/ion_heap.c
index 473b465724f1..a2d5c6df4b96 100644
--- a/drivers/staging/android/ion/ion_heap.c
+++ b/drivers/staging/android/ion/ion_heap.c
@@ -99,12 +99,12 @@ int ion_heap_map_user(struct ion_heap *heap, struct ion_buffer *buffer,
 
 static int ion_heap_clear_pages(struct page **pages, int num, pgprot_t pgprot)
 {
-	void *addr = vm_map_ram(pages, num, -1, pgprot);
+	void *addr = vmap(pages, num, VM_MAP);
 
 	if (!addr)
 		return -ENOMEM;
 	memset(addr, 0, PAGE_SIZE * num);
-	vm_unmap_ram(addr, num);
+	vunmap(addr);
 
 	return 0;
 }
-- 
2.25.1

