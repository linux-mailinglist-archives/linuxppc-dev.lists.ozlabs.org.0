Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B20309C966
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 08:26:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H28F2DLzzDqf6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 16:26:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 46H1yV50ChzDqb1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 16:17:54 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 7A381AE80597;
 Mon, 26 Aug 2019 02:17:01 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2 3/4] vfio/spapr_tce: Invalidate multiple TCEs at once
Date: Mon, 26 Aug 2019 16:17:04 +1000
Message-Id: <20190826061705.92048-4-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826061705.92048-1-aik@ozlabs.ru>
References: <20190826061705.92048-1-aik@ozlabs.ru>
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
Cc: kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Alistair Popple <alistair@popple.id.au>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Invalidating a TCE cache entry for each updated TCE is quite expensive.
This makes use of the new iommu_table_ops::xchg_no_kill()/tce_kill()
callbacks to bring down the time spent in mapping a huge guest DMA window.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 drivers/vfio/vfio_iommu_spapr_tce.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index babef8b00daf..3b18fa4d090a 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -435,7 +435,7 @@ static int tce_iommu_clear(struct tce_container *container,
 	unsigned long oldhpa;
 	long ret;
 	enum dma_data_direction direction;
-	unsigned long lastentry = entry + pages;
+	unsigned long lastentry = entry + pages, firstentry = entry;
 
 	for ( ; entry < lastentry; ++entry) {
 		if (tbl->it_indirect_levels && tbl->it_userspace) {
@@ -460,7 +460,7 @@ static int tce_iommu_clear(struct tce_container *container,
 
 		direction = DMA_NONE;
 		oldhpa = 0;
-		ret = iommu_tce_xchg(container->mm, tbl, entry, &oldhpa,
+		ret = iommu_tce_xchg_no_kill(container->mm, tbl, entry, &oldhpa,
 				&direction);
 		if (ret)
 			continue;
@@ -476,6 +476,8 @@ static int tce_iommu_clear(struct tce_container *container,
 		tce_iommu_unuse_page(container, oldhpa);
 	}
 
+	iommu_tce_kill(tbl, firstentry, pages);
+
 	return 0;
 }
 
@@ -518,8 +520,8 @@ static long tce_iommu_build(struct tce_container *container,
 
 		hpa |= offset;
 		dirtmp = direction;
-		ret = iommu_tce_xchg(container->mm, tbl, entry + i, &hpa,
-				&dirtmp);
+		ret = iommu_tce_xchg_no_kill(container->mm, tbl, entry + i,
+				&hpa, &dirtmp);
 		if (ret) {
 			tce_iommu_unuse_page(container, hpa);
 			pr_err("iommu_tce: %s failed ioba=%lx, tce=%lx, ret=%ld\n",
@@ -536,6 +538,8 @@ static long tce_iommu_build(struct tce_container *container,
 
 	if (ret)
 		tce_iommu_clear(container, tbl, entry, i);
+	else
+		iommu_tce_kill(tbl, entry, pages);
 
 	return ret;
 }
@@ -572,8 +576,8 @@ static long tce_iommu_build_v2(struct tce_container *container,
 		if (mm_iommu_mapped_inc(mem))
 			break;
 
-		ret = iommu_tce_xchg(container->mm, tbl, entry + i, &hpa,
-				&dirtmp);
+		ret = iommu_tce_xchg_no_kill(container->mm, tbl, entry + i,
+				&hpa, &dirtmp);
 		if (ret) {
 			/* dirtmp cannot be DMA_NONE here */
 			tce_iommu_unuse_page_v2(container, tbl, entry + i);
@@ -593,6 +597,8 @@ static long tce_iommu_build_v2(struct tce_container *container,
 
 	if (ret)
 		tce_iommu_clear(container, tbl, entry, i);
+	else
+		iommu_tce_kill(tbl, entry, pages);
 
 	return ret;
 }
-- 
2.17.1

