Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F4215E008
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 17:12:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Jz142rGhzDqbw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 03:12:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=pAUSd4XR; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JyXb3G9XzDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 02:51:11 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98A8224650;
 Fri, 14 Feb 2020 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695469;
 bh=iFYQhpWOkDmeT8zNYwNwIvVyzQ8+HWPzekwrwkZcGD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pAUSd4XRL8RHAsBdIK+4Xx0Q/d7tKd4jEulLEhB4eedoJNIWKa3JI4/5rG5vjWk5y
 /uox5uyh7H8qn8VBDOXvKJQqYoIqd5WcVd+W4jtCI4G2pbq9Ph8v/T7aKGAzQzjNZi
 X+EY71Gf/uYwLkKd4AfSxS0/6nkX9YFHi8PMNB9A=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 104/542] powerpc/pseries/vio: Fix iommu_table
 use-after-free refcount warning
Date: Fri, 14 Feb 2020 10:41:36 -0500
Message-Id: <20200214154854.6746-104-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
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
index 79e2287991dbb..f682b7babc09c 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1176,6 +1176,8 @@ static struct iommu_table *vio_build_iommu_table(struct vio_dev *dev)
 	if (tbl == NULL)
 		return NULL;
 
+	kref_init(&tbl->it_kref);
+
 	of_parse_dma_window(dev->dev.of_node, dma_window,
 			    &tbl->it_index, &offset, &size);
 
-- 
2.20.1

