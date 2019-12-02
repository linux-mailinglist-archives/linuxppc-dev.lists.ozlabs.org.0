Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AD510E47B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 03:17:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47R7zh1YvbzDqQw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 13:17:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 47R7qP0Wh6zDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 13:10:08 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 973DEAE807E6;
 Sun,  1 Dec 2019 20:59:02 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel RFC 4/4] vfio/spapr_tce: Advertise and allow a huge DMA
 windows at 4GB
Date: Mon,  2 Dec 2019 12:59:53 +1100
Message-Id: <20191202015953.127902-5-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202015953.127902-1-aik@ozlabs.ru>
References: <20191202015953.127902-1-aik@ozlabs.ru>
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
 Alistair Popple <alistair@popple.id.au>,
 Alex Williamson <alex.williamson@redhat.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

So far the only option for a big 64big DMA window was a window located
at 0x800.0000.0000.0000 (1<<59) which creates problems for devices
supporting smaller DMA masks.

This exploits a POWER9 PHB option to allow the second DMA window to map
at 0 and advertises it with a 4GB offset to avoid overlap with
the default 32bit window.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---


This is an additional option and not inside
vfio_iommu_spapr_tce_ddw_info as the new option gets
a new flag and one would expect a new member in
vfio_iommu_spapr_tce_info per a flag but can squash it
into vfio_iommu_spapr_tce_ddw_info, should I?


---
 include/uapi/linux/vfio.h           |  2 ++
 drivers/vfio/vfio_iommu_spapr_tce.c | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 9e843a147ead..c7f89d47335a 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -831,9 +831,11 @@ struct vfio_iommu_spapr_tce_info {
 	__u32 argsz;
 	__u32 flags;
 #define VFIO_IOMMU_SPAPR_INFO_DDW	(1 << 0)	/* DDW supported */
+#define VFIO_IOMMU_SPAPR_INFO_DDW_START	(1 << 1)	/* DDW offset */
 	__u32 dma32_window_start;	/* 32 bit window start (bytes) */
 	__u32 dma32_window_size;	/* 32 bit window size (bytes) */
 	struct vfio_iommu_spapr_tce_ddw_info ddw;
+	__u64 dma64_window_start;
 };
 
 #define VFIO_IOMMU_SPAPR_TCE_GET_INFO	_IO(VFIO_TYPE, VFIO_BASE + 12)
diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index 26cef65b41e7..470008c3359f 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -691,7 +691,7 @@ static long tce_iommu_create_window(struct tce_container *container,
 	container->tables[num] = tbl;
 
 	/* Return start address assigned by platform in create_table() */
-	*start_addr = tbl->it_offset << tbl->it_page_shift;
+	*start_addr = tbl->it_dmaoff << tbl->it_page_shift;
 
 	return 0;
 
@@ -842,7 +842,13 @@ static long tce_iommu_ioctl(void *iommu_data,
 			info.ddw.levels = table_group->max_levels;
 		}
 
-		ddwsz = offsetofend(struct vfio_iommu_spapr_tce_info, ddw);
+		ddwsz = offsetofend(struct vfio_iommu_spapr_tce_info,
+				dma64_window_start);
+
+		if (info.argsz >= ddwsz) {
+			info.flags |= VFIO_IOMMU_SPAPR_INFO_DDW_START;
+			info.dma64_window_start = table_group->tce64_start;
+		}
 
 		if (info.argsz >= ddwsz)
 			minsz = ddwsz;
-- 
2.17.1

