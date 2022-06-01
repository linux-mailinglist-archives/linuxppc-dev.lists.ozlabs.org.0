Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E5D539BDF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 06:01:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCb7K0zcpz3bt0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 14:01:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCb6w0dvTz2yLg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 14:01:27 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 1D1B080531;
	Wed,  1 Jun 2022 00:01:19 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/pseries/iommu: Print ibm,query-pe-dma-windows parameters
Date: Wed,  1 Jun 2022 14:01:17 +1000
Message-Id: <20220601040117.1467710-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerVM has a stricter policy about allocating TCEs for LPARs and
often there is not enough TCEs for 1:1 mapping, this adds the supported
numbers into dev_info() to help analyzing bugreports.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

A PowerVM admin can enable "enlarged IO capacity" for a passed
though PCI device but there is no way from inside LPAR to know if that
worked or how many more TCEs became available.

---
 arch/powerpc/platforms/pseries/iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 7639e7355df2..84edc8d730e1 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1022,9 +1022,6 @@ static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
 
 	ret = rtas_call(ddw_avail[DDW_QUERY_PE_DMA_WIN], 3, out_sz, query_out,
 			cfg_addr, BUID_HI(buid), BUID_LO(buid));
-	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x returned %d\n",
-		 ddw_avail[DDW_QUERY_PE_DMA_WIN], cfg_addr, BUID_HI(buid),
-		 BUID_LO(buid), ret);
 
 	switch (out_sz) {
 	case 5:
@@ -1042,6 +1039,11 @@ static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
 		break;
 	}
 
+	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x returned %d, lb=%llx ps=%x wn=%d\n",
+		 ddw_avail[DDW_QUERY_PE_DMA_WIN], cfg_addr, BUID_HI(buid),
+		 BUID_LO(buid), ret, query->largest_available_block,
+		 query->page_size, query->windows_available);
+
 	return ret;
 }
 
-- 
2.30.2

