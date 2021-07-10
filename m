Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2773C2FFC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 04:40:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GMDlb2KSRz3f6x
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 12:40:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TeC9faF9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TeC9faF9; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GMDkm3RtCz3flt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jul 2021 12:39:28 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3BDC613C8;
 Sat, 10 Jul 2021 02:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884766;
 bh=x58gpLQeByz1VzpEf4ha9kXrLaM2EdD7QyXJTnbA8HE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TeC9faF9LYT4ac6H9I6/RsEWTg3/IeUkAMvc7bkYTBXDZLYYuVLjJTwo2jwOXBwtw
 Cy9/dYfcp/QSsP+FTiUu3dqfv5RwXEto9zaOYH/Ff6sglKsDb5K26PYyUZ0BeOagnK
 jwi7B0wYnbBxvUEh/Omc1Sw0auKWPKPLbzg2St7HIG4+wHfDBWi5kHETJgSRvnL1ec
 Mq5NBK2ibEggKLI7GPwZGptAzRi4w7Nsf+jfikiZUbUnuob7htvvSSVCcdp142FMAX
 9HViGl3FLJr47TsvLOmsfG9CPhLjL4RPlsm8ZhMq2diSTpVLjw+iE+ql872P5wyvd1
 gI0ahsoIP0W9g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 11/23] powerpc/ps3: Add dma_mask to ps3_dma_region
Date: Fri,  9 Jul 2021 22:39:00 -0400
Message-Id: <20210710023912.3172972-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710023912.3172972-1-sashal@kernel.org>
References: <20210710023912.3172972-1-sashal@kernel.org>
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
Cc: Geoff Levand <geoff@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Geoff Levand <geoff@infradead.org>

[ Upstream commit 9733862e50fdba55e7f1554e4286fcc5302ff28e ]

Commit f959dcd6ddfd29235030e8026471ac1b022ad2b0 (dma-direct: Fix
potential NULL pointer dereference) added a null check on the
dma_mask pointer of the kernel's device structure.

Add a dma_mask variable to the ps3_dma_region structure and set
the device structure's dma_mask pointer to point to this new variable.

Fixes runtime errors like these:
# WARNING: Fixes tag on line 10 doesn't match correct format
# WARNING: Fixes tag on line 10 doesn't match correct format

  ps3_system_bus_match:349: dev=8.0(sb_01), drv=8.0(ps3flash): match
  WARNING: CPU: 0 PID: 1 at kernel/dma/mapping.c:151 .dma_map_page_attrs+0x34/0x1e0
  ps3flash sb_01: ps3stor_setup:193: map DMA region failed

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/562d0c9ea0100a30c3b186bcc7adb34b0bbd2cd7.1622746428.git.geoff@infradead.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/ps3.h  |  2 ++
 arch/powerpc/platforms/ps3/mm.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/powerpc/include/asm/ps3.h b/arch/powerpc/include/asm/ps3.h
index a1bc7e758422..2d729b53a556 100644
--- a/arch/powerpc/include/asm/ps3.h
+++ b/arch/powerpc/include/asm/ps3.h
@@ -83,6 +83,7 @@ struct ps3_dma_region_ops;
  * @bus_addr: The 'translated' bus address of the region.
  * @len: The length in bytes of the region.
  * @offset: The offset from the start of memory of the region.
+ * @dma_mask: Device dma_mask.
  * @ioid: The IOID of the device who owns this region
  * @chunk_list: Opaque variable used by the ioc page manager.
  * @region_ops: struct ps3_dma_region_ops - dma region operations
@@ -97,6 +98,7 @@ struct ps3_dma_region {
 	enum ps3_dma_region_type region_type;
 	unsigned long len;
 	unsigned long offset;
+	u64 dma_mask;
 
 	/* driver variables  (set by ps3_dma_region_create) */
 	unsigned long bus_addr;
diff --git a/arch/powerpc/platforms/ps3/mm.c b/arch/powerpc/platforms/ps3/mm.c
index 19bae78b1f25..76cbf1be9962 100644
--- a/arch/powerpc/platforms/ps3/mm.c
+++ b/arch/powerpc/platforms/ps3/mm.c
@@ -18,6 +18,7 @@
  *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
+#include <linux/dma-mapping.h>
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/memblock.h>
@@ -1132,6 +1133,7 @@ int ps3_dma_region_init(struct ps3_system_bus_device *dev,
 	enum ps3_dma_region_type region_type, void *addr, unsigned long len)
 {
 	unsigned long lpar_addr;
+	int result;
 
 	lpar_addr = addr ? ps3_mm_phys_to_lpar(__pa(addr)) : 0;
 
@@ -1143,6 +1145,16 @@ int ps3_dma_region_init(struct ps3_system_bus_device *dev,
 		r->offset -= map.r1.offset;
 	r->len = len ? len : _ALIGN_UP(map.total, 1 << r->page_size);
 
+	dev->core.dma_mask = &r->dma_mask;
+
+	result = dma_set_mask_and_coherent(&dev->core, DMA_BIT_MASK(32));
+
+	if (result < 0) {
+		dev_err(&dev->core, "%s:%d: dma_set_mask_and_coherent failed: %d\n",
+			__func__, __LINE__, result);
+		return result;
+	}
+
 	switch (dev->dev_type) {
 	case PS3_DEVICE_TYPE_SB:
 		r->region_ops =  (USE_DYNAMIC_DMA)
-- 
2.30.2

