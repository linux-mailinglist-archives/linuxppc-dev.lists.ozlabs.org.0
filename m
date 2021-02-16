Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CFE31C5D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 04:33:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dfmlf4w2Fz3cHY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 14:33:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DfmlK3cTLz30Gv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Feb 2021 14:33:17 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id DF05DAE80225;
 Mon, 15 Feb 2021 22:33:13 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 1/2] powerpc/iommu: Allocate it_map by vmalloc
Date: Tue, 16 Feb 2021 14:33:06 +1100
Message-Id: <20210216033307.69863-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210216033307.69863-1-aik@ozlabs.ru>
References: <20210216033307.69863-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The IOMMU table uses the it_map bitmap to keep track of allocated DMA
pages. This has always been a contiguous array allocated at either
the boot time or when a passed through device is returned to the host OS.
The it_map memory is allocated by alloc_pages() which allocates
contiguous physical memory.

Such allocation method occasionally creates a problem when there is
no big chunk of memory available (no free memory or too fragmented).
On powernv/ioda2 the default DMA window requires 16MB for it_map.

This replaces alloc_pages_node() with vzalloc_node() which allocates
contiguous block but in virtual memory. This should reduce changes of
failure but should not cause other behavioral changes as it_map is only
used by the kernel's DMA hooks/api when MMU is on.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/iommu.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index c00214a4355c..8eb6eb0afa97 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -719,7 +719,6 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 {
 	unsigned long sz;
 	static int welcomed = 0;
-	struct page *page;
 	unsigned int i;
 	struct iommu_pool *p;
 
@@ -728,11 +727,9 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 	/* number of bytes needed for the bitmap */
 	sz = BITS_TO_LONGS(tbl->it_size) * sizeof(unsigned long);
 
-	page = alloc_pages_node(nid, GFP_KERNEL, get_order(sz));
-	if (!page)
+	tbl->it_map = vzalloc_node(sz, nid);
+	if (!tbl->it_map)
 		panic("iommu_init_table: Can't allocate %ld bytes\n", sz);
-	tbl->it_map = page_address(page);
-	memset(tbl->it_map, 0, sz);
 
 	iommu_table_reserve_pages(tbl, res_start, res_end);
 
@@ -774,8 +771,6 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 
 static void iommu_table_free(struct kref *kref)
 {
-	unsigned long bitmap_sz;
-	unsigned int order;
 	struct iommu_table *tbl;
 
 	tbl = container_of(kref, struct iommu_table, it_kref);
@@ -796,12 +791,8 @@ static void iommu_table_free(struct kref *kref)
 	if (!bitmap_empty(tbl->it_map, tbl->it_size))
 		pr_warn("%s: Unexpected TCEs\n", __func__);
 
-	/* calculate bitmap size in bytes */
-	bitmap_sz = BITS_TO_LONGS(tbl->it_size) * sizeof(unsigned long);
-
 	/* free bitmap */
-	order = get_order(bitmap_sz);
-	free_pages((unsigned long) tbl->it_map, order);
+	vfree(tbl->it_map);
 
 	/* free table */
 	kfree(tbl);
-- 
2.17.1

