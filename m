Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F31E1621B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 08:49:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MCfs0mKPzDqB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 18:49:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 48MCP96LVtzDqVS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 18:37:33 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 44429AE807E2;
 Tue, 18 Feb 2020 02:35:30 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 5/5] vfio/spapr_tce: Advertise and allow a huge DMA
 windows at 4GB
Date: Tue, 18 Feb 2020 18:36:50 +1100
Message-Id: <20200218073650.16149-6-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218073650.16149-1-aik@ozlabs.ru>
References: <20200218073650.16149-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>,
 Alex Williamson <alex.williamson@redhat.com>, kvm-ppc@vger.kernel.org,
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
index 16b3adc508db..4f22be3c4aa2 100644
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

