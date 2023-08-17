Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC35B77FC2C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:33:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oxKwcghe;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7P/cc9/4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRVtQ4hw9z3cTp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 02:33:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oxKwcghe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7P/cc9/4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 488 seconds by postgrey-1.37 at boromir; Fri, 18 Aug 2023 02:32:32 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRVsX47d1z30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 02:32:32 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id B1F3B2185C;
	Thu, 17 Aug 2023 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1692289460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tdLhBp3be39Ow7LFRDBwp1xDxodnRBLEqLHCf0VZvMo=;
	b=oxKwcghehfbdrUqRVj4/PzmDdMI9PoQbClDGz3mEbkgYSpgbe/Byc2L1Q0fJIA9fgmkXqR
	3THUNz1nUZgeaIIHP943wE8UWPp3KaZlDe7Bs/NETJ4lETiZ0bmDw9XCdFfxehDPXcNLbL
	rRI7gR9NAhESSoSh5X3MbQzZAtMtwSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692289460;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tdLhBp3be39Ow7LFRDBwp1xDxodnRBLEqLHCf0VZvMo=;
	b=7P/cc9/4QC3LZmv1uok8brIFiZjSikBG6Bk5V6R1NsBWHx1Cf6ADqEJ0oFAJZElSxwrgDT
	WZ1rT9qLmLqAVLDg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id 534412C146;
	Thu, 17 Aug 2023 16:24:18 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Move DMA64_PROPNAME define to a header
Date: Thu, 17 Aug 2023 18:24:08 +0200
Message-ID: <20230817162411.429-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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
Cc: Rob Herring <robh@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Gaurav Batra <gbatra@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Russell Currey <ruscur@russell.cc>, Deming Wang <wangdeming@inspur.com>, Alex Williamson <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Timothy Pearson <tpearson@raptorengineering.com>, Nicholas Piggin <npiggin@gmail.com>, Li Chen <lchen@ambarella.com>, Brian King <brking@linux.vnet.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Avoid redefining the same value in multiple source.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/include/asm/iommu.h       | 3 +++
 arch/powerpc/kexec/file_load_64.c      | 5 +----
 arch/powerpc/platforms/pseries/iommu.c | 2 --
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 34e14dfd8e04..026695943550 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -28,6 +28,9 @@
 #define IOMMU_PAGE_MASK(tblptr) (~((1 << (tblptr)->it_page_shift) - 1))
 #define IOMMU_PAGE_ALIGN(addr, tblptr) ALIGN(addr, IOMMU_PAGE_SIZE(tblptr))
 
+#define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
+#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
+
 /* Boot time flags */
 extern int iommu_is_off;
 extern int iommu_force_on;
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 110d28bede2a..17f86f93da09 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -27,6 +27,7 @@
 #include <asm/kexec_ranges.h>
 #include <asm/crashdump-ppc64.h>
 #include <asm/mmzone.h>
+#include <asm/iommu.h>
 #include <asm/prom.h>
 #include <asm/plpks.h>
 
@@ -1208,8 +1209,6 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 	if (ret < 0)
 		goto out;
 
-#define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
-#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
 	ret = update_pci_dma_nodes(fdt, DIRECT64_PROPNAME);
 	if (ret < 0)
 		goto out;
@@ -1217,8 +1216,6 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 	ret = update_pci_dma_nodes(fdt, DMA64_PROPNAME);
 	if (ret < 0)
 		goto out;
-#undef DMA64_PROPNAME
-#undef DIRECT64_PROPNAME
 
 	/* Update memory reserve map */
 	ret = get_reserved_memory_ranges(&rmem);
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index d593a7227dc9..16d93b580f61 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -395,8 +395,6 @@ static LIST_HEAD(dma_win_list);
 static DEFINE_SPINLOCK(dma_win_list_lock);
 /* protects initializing window twice for same device */
 static DEFINE_MUTEX(dma_win_init_mutex);
-#define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
-#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
 
 static int tce_clearrange_multi_pSeriesLP(unsigned long start_pfn,
 					unsigned long num_pfn, const void *arg)
-- 
2.41.0

