Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E09423736
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 06:48:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPMQj3SZjz3bNB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 15:48:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HPMQF3KGRz2yP3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 15:47:47 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 3EEF7AE80030;
 Wed,  6 Oct 2021 00:47:39 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2] powerps/pseries/dma: Add support for 2M IOMMU page
 size
Date: Wed,  6 Oct 2021 15:47:35 +1100
Message-Id: <20211006044735.1114669-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Leonardo Bras <leobras.c@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The upcoming PAPR spec adds a 2M page size, bit 23 right after 16G page
size in the "ibm,query-pe-dma-window" call.

This adds support for the new page size. Since the new page size is out
of sorted order, this changes the loop to not assume that shift[] is
sorted.

This has now been tested and is known to work on a pre-release version
of phyp.

Reviewed-by: Leonardo Bras <leobras.c@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* adjusted the commit log about testing
---
 arch/powerpc/platforms/pseries/iommu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index dab5c56ffd0e..269f61d519c2 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1159,14 +1159,15 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
 /* Return largest page shift based on "IO Page Sizes" output of ibm,query-pe-dma-window. */
 static int iommu_get_page_shift(u32 query_page_size)
 {
-	/* Supported IO page-sizes according to LoPAR */
+	/* Supported IO page-sizes according to LoPAR, note that 2M is out of order */
 	const int shift[] = {
 		__builtin_ctzll(SZ_4K),   __builtin_ctzll(SZ_64K), __builtin_ctzll(SZ_16M),
 		__builtin_ctzll(SZ_32M),  __builtin_ctzll(SZ_64M), __builtin_ctzll(SZ_128M),
-		__builtin_ctzll(SZ_256M), __builtin_ctzll(SZ_16G)
+		__builtin_ctzll(SZ_256M), __builtin_ctzll(SZ_16G), __builtin_ctzll(SZ_2M)
 	};
 
 	int i = ARRAY_SIZE(shift) - 1;
+	int ret = 0;
 
 	/*
 	 * On LoPAR, ibm,query-pe-dma-window outputs "IO Page Sizes" using a bit field:
@@ -1176,11 +1177,10 @@ static int iommu_get_page_shift(u32 query_page_size)
 	 */
 	for (; i >= 0 ; i--) {
 		if (query_page_size & (1 << i))
-			return shift[i];
+			ret = max(ret, shift[i]);
 	}
 
-	/* No valid page size found. */
-	return 0;
+	return ret;
 }
 
 static struct property *ddw_property_create(const char *propname, u32 liobn, u64 dma_addr,
-- 
2.30.2

