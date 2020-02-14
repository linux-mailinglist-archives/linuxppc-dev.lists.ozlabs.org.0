Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B252115F545
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 19:39:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K2Gh2j62zDqBX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 05:39:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=BmpIe9OT; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jz1W0c5WzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 03:12:47 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 695E42469B;
 Fri, 14 Feb 2020 16:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696763;
 bh=pbVzIndI7U2QKW7IP8oF3dBRt7hGnqAhaZiECsdUCfk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BmpIe9OTvkn7BR6owNLTk0RHtrWH00RFSL3QEf4l4+kcVHO2fMEOJBzSJb4/u7xGO
 w2EO366ulVDoCSMChVHwaMzpM+SrT1dYzc7kOHJU0Zhv/SyhwDLeUmatVedXraY63r
 MCnXXFTDyKIOIrDbtcaGLuwhLxI+5yWMUH9lAVtQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 043/252] powerpc/pseries/vio: Fix iommu_table
 use-after-free refcount warning
Date: Fri, 14 Feb 2020 11:08:18 -0500
Message-Id: <20200214161147.15842-43-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>

[ Upstream commit aff8c8242bc638ba57247ae1ec5f272ac3ed3b92 ]

Commit e5afdf9dd515 ("powerpc/vfio_spapr_tce: Add reference counting to
iommu_table") missed an iommu_table allocation in the pseries vio code.
The iommu_table is allocated with kzalloc and as a result the associated
kref gets a value of zero. This has the side effect that during a DLPAR
remove of the associated virtual IOA the iommu_tce_table_put() triggers
a use-after-free underflow warning.

Call Trace:
[c0000002879e39f0] [c00000000071ecb4] refcount_warn_saturate+0x184/0x190
(unreliable)
[c0000002879e3a50] [c0000000000500ac] iommu_tce_table_put+0x9c/0xb0
[c0000002879e3a70] [c0000000000f54e4] vio_dev_release+0x34/0x70
[c0000002879e3aa0] [c00000000087cfa4] device_release+0x54/0xf0
[c0000002879e3b10] [c000000000d64c84] kobject_cleanup+0xa4/0x240
[c0000002879e3b90] [c00000000087d358] put_device+0x28/0x40
[c0000002879e3bb0] [c0000000007a328c] dlpar_remove_slot+0x15c/0x250
[c0000002879e3c50] [c0000000007a348c] remove_slot_store+0xac/0xf0
[c0000002879e3cd0] [c000000000d64220] kobj_attr_store+0x30/0x60
[c0000002879e3cf0] [c0000000004ff13c] sysfs_kf_write+0x6c/0xa0
[c0000002879e3d10] [c0000000004fde4c] kernfs_fop_write+0x18c/0x260
[c0000002879e3d60] [c000000000410f3c] __vfs_write+0x3c/0x70
[c0000002879e3d80] [c000000000415408] vfs_write+0xc8/0x250
[c0000002879e3dd0] [c0000000004157dc] ksys_write+0x7c/0x120
[c0000002879e3e20] [c00000000000b278] system_call+0x5c/0x68

Further, since the refcount was always zero the iommu_tce_table_put()
fails to call the iommu_table release function resulting in a leak.

Fix this issue be initilizing the iommu_table kref immediately after
allocation.

Fixes: e5afdf9dd515 ("powerpc/vfio_spapr_tce: Add reference counting to iommu_table")
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/1579558202-26052-1-git-send-email-tyreld@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/vio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 49e04ec19238a..0e7778be4c490 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1195,6 +1195,8 @@ static struct iommu_table *vio_build_iommu_table(struct vio_dev *dev)
 	if (tbl == NULL)
 		return NULL;
 
+	kref_init(&tbl->it_kref);
+
 	of_parse_dma_window(dev->dev.of_node, dma_window,
 			    &tbl->it_index, &offset, &size);
 
-- 
2.20.1

