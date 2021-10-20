Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B04434C01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 15:24:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZBDQ13tBz3dc0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 00:24:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HZBCP2t2mz3cNk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 00:24:01 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id A6DFFAE80250;
 Wed, 20 Oct 2021 09:23:27 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 3/4] powerpc/pseries/iommu: Check if the default window
 in use before removing it
Date: Thu, 21 Oct 2021 00:23:14 +1100
Message-Id: <20211020132315.2287178-4-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020132315.2287178-1-aik@ozlabs.ru>
References: <20211020132315.2287178-1-aik@ozlabs.ru>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Brian King <brking@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Leonardo Bras <leobras.c@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the moment this check is performed after we remove the default window
which is late and disallows to revert whatever changes enable_ddw()
has made to DMA windows.

This moves the check and error exit before removing the window.

This raised the message severity from "debug" to "warning" as this
should not happen in practice and cannot be triggered by the userspace.

Fixes: 381ceda88c4c ("powerpc/pseries/iommu: Make use of DDW for indirect mapping")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/pseries/iommu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 45564547cd80..9bbcfdece9e3 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1302,6 +1302,12 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		struct property *default_win;
 		int reset_win_ext;
 
+		/* DDW + IOMMU on single window may fail if there is any allocation */
+		if (iommu_table_in_use(tbl)) {
+			dev_warn(&dev->dev, "current IOMMU table in use, can't be replaced.\n");
+			goto out_failed;
+		}
+
 		default_win = of_find_property(pdn, "ibm,dma-window", NULL);
 		if (!default_win)
 			goto out_failed;
@@ -1356,12 +1362,6 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			query.largest_available_block,
 			1ULL << page_shift);
 
-		/* DDW + IOMMU on single window may fail if there is any allocation */
-		if (default_win_removed && iommu_table_in_use(tbl)) {
-			dev_dbg(&dev->dev, "current IOMMU table in use, can't be replaced.\n");
-			goto out_failed;
-		}
-
 		len = order_base_2(query.largest_available_block << page_shift);
 		win_name = DMA64_PROPNAME;
 	} else {
-- 
2.30.2

