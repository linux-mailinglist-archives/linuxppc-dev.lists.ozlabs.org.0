Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 029B0447917
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 05:05:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hncvc6y9Xz2yPp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 15:05:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Hnct05qmnz2yw1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 15:03:36 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id CA4EE8004F;
 Sun,  7 Nov 2021 23:03:33 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 3/3] powerpc/pseries/ddw: Do not try direct mapping
 with persistent memory and one window
Date: Mon,  8 Nov 2021 15:03:19 +1100
Message-Id: <20211108040320.3857636-4-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211108040320.3857636-1-aik@ozlabs.ru>
References: <20211108040320.3857636-1-aik@ozlabs.ru>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Brian King <brking@linux.vnet.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a possibility of having just one DMA window available with
a limited capacity which the existing code does not handle that well.
If the window is big enough for the system RAM but less than
MAX_PHYSMEM_BITS (which we want when persistent memory is present),
we create 1:1 window and leave persistent memory without DMA.

This disables 1:1 mapping entirely if there is persistent memory and
either:
- the huge DMA window does not cover the entire address space;
- the default DMA window is removed.

This relies on reverted 54fc3c681ded
("powerpc/pseries/ddw: Extend upper limit for huge DMA window for persistent memory")
to return the actual amount RAM in ddw_memory_hotplug_max() (posted
separately).

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/pseries/iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 301fa5b3d528..8f998e55735b 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1356,8 +1356,10 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		len = order_base_2(query.largest_available_block << page_shift);
 		win_name = DMA64_PROPNAME;
 	} else {
-		direct_mapping = true;
-		win_name = DIRECT64_PROPNAME;
+		direct_mapping = !default_win_removed ||
+			(len == MAX_PHYSMEM_BITS) ||
+			(!pmem_present && (len == max_ram_len));
+		win_name = direct_mapping ? DIRECT64_PROPNAME : DMA64_PROPNAME;
 	}
 
 	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
-- 
2.30.2

