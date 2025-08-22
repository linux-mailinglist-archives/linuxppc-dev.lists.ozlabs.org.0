Return-Path: <linuxppc-dev+bounces-11211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6478B31D12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:59:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jyH5LBNz3d26;
	Sat, 23 Aug 2025 00:59:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874759;
	cv=none; b=gZ4G8a+5uqAR5dGFnX+9jptYSpYBaqtaDU+Ag7BmRMjRSyBzZgpy4h7jw5cCgLl+Dak6CSfV1oIw73xMCwXDPhavynOOmLkL62u/3+V/ZniFLb5gLUfwrKcjgKFjSxXaNsBKcMn0kHD4vIuaDGJ3yUdyeyMxYKNfHsy5YfRTJ603gGPkb7QteeJMoshZFyCYyiQc3BVryY6CeIgC86AtllNto+p1JnTCQa5Wk7JnjPHV+1fm7Tat2tPvWnASy38CF7Z0tIHAZLuH+jE4x/AoRUw4bg1g6iFiCwZVAd6O0JLtO62yGbVZBeEIT720Pdm9AAwqzTtQMj7JAROP2e32Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874759; c=relaxed/relaxed;
	bh=otN72SAWEECsBwMn26kxecUa9Uzc4XXV3WqDyUmNxoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCny+0eWm0fTN/xWiAlSY7cRuldydEW4jrWgBNJbIDRfPJUWPgwRXu94MRpnQenGWMDx8P+vHtLKFdw8nGcnHbYoGVtx1g8GUXb3/DMnJVaPAN9gq+ThdEXAgx8cGcvhUNamlEd8hnNd1RhPm9uUwrau3P6thHV74vU0D+kCrq+2SoZvBfdXhB0K4gYSzIHLl+E65BewzacVciuHNInPW1K9bkb9mx7/kZ7qhNfxqRPYLDtVzXBwXnlEmQri8XU6UL0orFflN5PO4JSwLzI+QKMqBuFaq2ftl7LQ32jVPPoQ0PH1cv2S4il84x1RgQ9DFpDfSqE+iVL7NiZq67DKxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VnE60sQF; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VnE60sQF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jyG65mJz3cj1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:59:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874759; x=1787410759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Woq5i6B7u1BorPfYsOyd3IhFrLH3KrP16o8bmzdNAgc=;
  b=VnE60sQF4KBHD06AnXhGruQLqVieDZdGXTqjB0pmRNaDf4Nzg7jWTMro
   09XwEcm3Ewn7IlyG8ZOtvxzWH+zUwEubdZZabvhu2UeWXudENGF+RbmXl
   HUVNsBQXidjKyfj28+xfF1dM6/dbbVhN9OlZmDCmvddJXWcQ0bFO0Wg7W
   qoWKGT6gthML1G3+rSyeonLN1cZyeYQFjr2x0cBhLVnYWkavJBbpjnIpC
   Ub+0Pj5azCQ5xF+/MmhB39Zdy8wwpY8a3aZWuc5gXjZjxnQgXxkCDitgg
   +wO/43luyeBzUEFhZLp7n9nLj/PuHTZsqaQI8rxl2PrepsPjXVAxAIhHJ
   Q==;
X-CSE-ConnectionGUID: poeWBRF1SnGiSLJUg9aSHw==
X-CSE-MsgGUID: bTn4r8+yTfCMEUqyXXMd+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57201600"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57201600"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:16 -0700
X-CSE-ConnectionGUID: 2CZi8veKRJ6pf21LAS/Ivg==
X-CSE-MsgGUID: U31QFJe4TCKDYDvfFz/SHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="199695308"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andreas Larsson <andreas@gaisler.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org,
	sparclinux@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 19/24] PCI: Use pbus_select_window_for_type() during mem window sizing
Date: Fri, 22 Aug 2025 17:56:00 +0300
Message-Id: <20250822145605.18172-20-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
References: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

__pci_bus_size_bridges() goes to great lengths of helping
pbus_size_mem() in which types it should put into a particular bridge
window, requiring passing up to three resource type into
pbus_size_mem().

Instead of having complex logic __pci_bus_size_bridges() and a
non-straightforward interface between those functions, use
pbus_select_window_for_type() and pbus_select_window() to find the
correct bridge window and compare if the resources belong to that
window.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 111 +++++++++-------------------------------
 1 file changed, 24 insertions(+), 87 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 281ca5c73c97..28133a9c5f51 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1284,24 +1284,22 @@ static bool pbus_upstream_space_available(struct pci_bus *bus,
  * pbus_size_mem() - Size the memory window of a given bus
  *
  * @bus:		The bus
- * @mask:		Mask the resource flag, then compare it with type
- * @type:		The type of free resource from bridge
- * @type2:		Second match type
- * @type3:		Third match type
+ * @type:		The type of bridge resource
  * @min_size:		The minimum memory window that must be allocated
  * @add_size:		Additional optional memory window
  * @realloc_head:	Track the additional memory window on this list
  *
- * Calculate the size of the bus and minimal alignment which guarantees
- * that all child resources fit in this size.
+ * Calculate the size of the bus resource for @type and minimal alignment
+ * which guarantees that all child resources fit in this size.
  *
- * Return -ENOSPC if there's no available bus resource of the desired
- * type.  Otherwise, set the bus resource start/end to indicate the
- * required size, add things to realloc_head (if supplied), and return 0.
+ * Sets the bus resource start/end to indicate the required size if there an
+ * available unassigned bus resource of the desired @type.
+ *
+ * Adds optional resource requests to the @realloc_head list if it is
+ * supplied.
  */
-static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
-			 unsigned long type, unsigned long type2,
-			 unsigned long type3, resource_size_t min_size,
+static void pbus_size_mem(struct pci_bus *bus, unsigned long type,
+			 resource_size_t min_size,
 			 resource_size_t add_size,
 			 struct list_head *realloc_head)
 {
@@ -1309,19 +1307,18 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 	resource_size_t min_align, win_align, align, size, size0, size1 = 0;
 	resource_size_t aligns[28]; /* Alignments from 1MB to 128TB */
 	int order, max_order;
-	struct resource *b_res = find_bus_resource_of_type(bus,
-					mask | IORESOURCE_PREFETCH, type);
+	struct resource *b_res = pbus_select_window_for_type(bus, type);
 	resource_size_t children_add_size = 0;
 	resource_size_t children_add_align = 0;
 	resource_size_t add_align = 0;
 	resource_size_t relaxed_align;
 
 	if (!b_res)
-		return -ENOSPC;
+		return;
 
 	/* If resource is already assigned, nothing more to do */
 	if (b_res->parent)
-		return 0;
+		return;
 
 	memset(aligns, 0, sizeof(aligns));
 	max_order = 0;
@@ -1338,11 +1335,9 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 			if (!pdev_resources_assignable(dev) ||
 			    !pdev_resource_should_fit(dev, r))
 				continue;
-
-			if ((r->flags & mask) != type &&
-			    (r->flags & mask) != type2 &&
-			    (r->flags & mask) != type3)
+			if (b_res != pbus_select_window(bus, r))
 				continue;
+
 			r_size = resource_size(r);
 
 			/* Put SRIOV requested res to the optional list */
@@ -1428,7 +1423,7 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 			pci_info(bus->self, "disabling bridge window %pR to %pR (unused)\n",
 				 b_res, &bus->busn_res);
 		b_res->flags |= IORESOURCE_DISABLED;
-		return 0;
+		return;
 	}
 
 	resource_set_range(b_res, min_align, size0);
@@ -1441,7 +1436,6 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 			   (unsigned long long) (size1 - size0),
 			   (unsigned long long) add_align);
 	}
-	return 0;
 }
 
 unsigned long pci_cardbus_resource_alignment(struct resource *res)
@@ -1546,12 +1540,11 @@ static void pci_bus_size_cardbus(struct pci_bus *bus,
 void __pci_bus_size_bridges(struct pci_bus *bus, struct list_head *realloc_head)
 {
 	struct pci_dev *dev;
-	unsigned long mask, prefmask, type2 = 0, type3 = 0;
 	resource_size_t additional_io_size = 0, additional_mmio_size = 0,
 			additional_mmio_pref_size = 0;
 	struct resource *pref;
 	struct pci_host_bridge *host;
-	int hdr_type, ret;
+	int hdr_type;
 
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		struct pci_bus *b = dev->subordinate;
@@ -1601,71 +1594,15 @@ void __pci_bus_size_bridges(struct pci_bus *bus, struct list_head *realloc_head)
 		pbus_size_io(bus, realloc_head ? 0 : additional_io_size,
 			     additional_io_size, realloc_head);
 
-		/*
-		 * If there's a 64-bit prefetchable MMIO window, compute
-		 * the size required to put all 64-bit prefetchable
-		 * resources in it.
-		 */
-		mask = IORESOURCE_MEM;
-		prefmask = IORESOURCE_MEM | IORESOURCE_PREFETCH;
-		if (pref && (pref->flags & IORESOURCE_MEM_64)) {
-			prefmask |= IORESOURCE_MEM_64;
-			ret = pbus_size_mem(bus, prefmask, prefmask,
-				prefmask, prefmask,
-				realloc_head ? 0 : additional_mmio_pref_size,
-				additional_mmio_pref_size, realloc_head);
-
-			/*
-			 * If successful, all non-prefetchable resources
-			 * and any 32-bit prefetchable resources will go in
-			 * the non-prefetchable window.
-			 */
-			if (ret == 0) {
-				mask = prefmask;
-				type2 = prefmask & ~IORESOURCE_MEM_64;
-				type3 = prefmask & ~IORESOURCE_PREFETCH;
-			}
-		}
-
-		/*
-		 * If there is no 64-bit prefetchable window, compute the
-		 * size required to put all prefetchable resources in the
-		 * 32-bit prefetchable window (if there is one).
-		 */
-		if (!type2) {
-			prefmask &= ~IORESOURCE_MEM_64;
-			ret = pbus_size_mem(bus, prefmask, prefmask,
-				prefmask, prefmask,
-				realloc_head ? 0 : additional_mmio_pref_size,
-				additional_mmio_pref_size, realloc_head);
-
-			/*
-			 * If successful, only non-prefetchable resources
-			 * will go in the non-prefetchable window.
-			 */
-			if (ret == 0)
-				mask = prefmask;
-			else
-				additional_mmio_size += additional_mmio_pref_size;
-
-			type2 = type3 = IORESOURCE_MEM;
+		if (pref) {
+			pbus_size_mem(bus,
+				      IORESOURCE_MEM | IORESOURCE_PREFETCH |
+				      (pref->flags & IORESOURCE_MEM_64),
+				      realloc_head ? 0 : additional_mmio_pref_size,
+				      additional_mmio_pref_size, realloc_head);
 		}
 
-		/*
-		 * Compute the size required to put everything else in the
-		 * non-prefetchable window. This includes:
-		 *
-		 *   - all non-prefetchable resources
-		 *   - 32-bit prefetchable resources if there's a 64-bit
-		 *     prefetchable window or no prefetchable window at all
-		 *   - 64-bit prefetchable resources if there's no prefetchable
-		 *     window at all
-		 *
-		 * Note that the strategy in __pci_assign_resource() must match
-		 * that used here. Specifically, we cannot put a 32-bit
-		 * prefetchable resource in a 64-bit prefetchable window.
-		 */
-		pbus_size_mem(bus, mask, IORESOURCE_MEM, type2, type3,
+		pbus_size_mem(bus, IORESOURCE_MEM,
 			      realloc_head ? 0 : additional_mmio_size,
 			      additional_mmio_size, realloc_head);
 		break;
-- 
2.39.5


