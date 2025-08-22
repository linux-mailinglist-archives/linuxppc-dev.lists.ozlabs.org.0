Return-Path: <linuxppc-dev+bounces-11212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE611B31D15
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:59:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jyR6V3mz3d2w;
	Sat, 23 Aug 2025 00:59:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874767;
	cv=none; b=iwjBG9ACO+ykllj6KFxPnGgTYB+QDQ9WwkNBVWrHxN2NJjnTmDJftW8zP9UpFtF3PCEG5Fxzq9z15hrIu4K/YSopK2SGc6tdg0Bg3WyQ5T2d0NBhWn4/cEW6eC4CBKcercWL392kPLQDGFOTh9AuOsRlmvYX0o4CgWb/t/g1NMSHjjayOy5gUdZcUg4SE41LbhQa7xjscFTC63zJ4Dc4dpqEFPMDnfMIrPX+wrM+PTMv24/e27zTlETZYsc3CgW0TkLkjfH9KNgW+ABIPKZefH/BqcV0pL0NgLjPh7yeCKtyZIk9Fx4N3RpXCsFcMBaT709VdNQqPIMSRoyjcMWWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874767; c=relaxed/relaxed;
	bh=n2ShnV2+wyM4wta3ga7S0QS9DS3p4f2j3b1EP5TTQ/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oB+R8OGo5h6HsNZXp2snAG5XSK5W+zydt/pOyTva2XRd6fEN1r/jEnrfEE/uCYpQQSiND7Z3NrpgRwuEcUVWTFsjgDzcbtzASJ2Xu/XtB1qhowEDTg9ZaSERb/wiD+CNDzkg3+5lwaQc/Vr97+J8dDANx1BRV+MYYcDzu/2glsM5Pnwv9nVAIhhu1siWX3u4bZkeTq3DC+l8sQsSWhAy2XvvDMmlHYgLn0So3HRIEKCxSV7icit8cxZ5AdxYcA9e4tVHHwUzKZeVQka/qmFqctauFvfomytDoMmqYmQXL7xfUPb/16wSZ6Npal61RjfE5asGs1fJhIYYiPLEcvuhtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iPpN2Wxx; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iPpN2Wxx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jyR0Lb1z3d2g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:59:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874768; x=1787410768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pzFN1L+PgZhbcDMgKU8nIsMBCPH3C7anPGuUjcc/28Q=;
  b=iPpN2Wxxu3e65An/W142+bsadjlpP++cTE1R5RyyqNm1BDF7Lb2Qjir0
   7yMYHoPv4R9E+iVZ9vJ9d5q5Lj4lp9AMkphQx4HAFPUCbJ/mhsbvB/P1Z
   o73lOAC41LjJfD3jGrfLPkPUsnZwXIli3cGSNgckopZc7Qh1kuxD37U/z
   ir0ef589iD6AtrNxyNxd2WSc2gmVpAueNYMI/8khDbVFXLhRg3G0lhJyW
   wVfadvC45LwsaBAzePDslDY1BYAI7du0I4MPvkPOPox+lhxNGsZQk7pck
   x5pjIwCGrPwROHpwwlgvJDOA5nbsD/5oo4e/0qLLaSfH94M4wwgwbNS43
   w==;
X-CSE-ConnectionGUID: +Kei1P8FRpGrCaL7gmGdOw==
X-CSE-MsgGUID: //af0wz1T8y3ZCGjnf4LGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75640689"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="75640689"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:25 -0700
X-CSE-ConnectionGUID: PdsNClpKQ1GOlh1GNHlBYA==
X-CSE-MsgGUID: GjCk9XCyTF+WMLWYvp1tTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="172986930"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:20 -0700
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
Subject: [PATCH 20/24] PCI: Refactor distributing available memory to use loops
Date: Fri, 22 Aug 2025 17:56:01 +0300
Message-Id: <20250822145605.18172-21-ilpo.jarvinen@linux.intel.com>
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

pci_bus_distribute_available_resources() and
pci_bridge_distribute_available_resources() retain bridge window
resources and related data needed for distributing the available window
in independent variables for io, memory, and prefetchable memory
windows. The code is essentially the same for all of them and therefore
repeated three times with different variable names.

Refactor pci_bus_distribute_available_resources() to take an array.
This is complicated slightly by the function taking advantage of
passing the struct as value, which cannot be done for arrays in C.
Therefore, copy the data into a local array in the stack in the first
loop.

Variable names are (hopefully) improved slightly as well.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 162 ++++++++++++++++++----------------------
 include/linux/pci.h     |   3 +-
 2 files changed, 74 insertions(+), 91 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 28133a9c5f51..ee2f2c78d8c9 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -2058,15 +2058,16 @@ static void remove_dev_resource(struct resource *avail, struct pci_dev *dev,
 	avail->start = min(avail->start + tmp, avail->end + 1);
 }
 
-static void remove_dev_resources(struct pci_dev *dev, struct resource *io,
-				 struct resource *mmio,
-				 struct resource *mmio_pref)
+static void remove_dev_resources(struct pci_dev *dev,
+				 struct resource available[PCI_P2P_BRIDGE_RESOURCE_NUM])
 {
+	struct resource *mmio_pref = &available[PCI_BUS_BRIDGE_PREF_MEM_WINDOW];
 	struct resource *res;
 
 	pci_dev_for_each_resource(dev, res) {
 		if (resource_type(res) == IORESOURCE_IO) {
-			remove_dev_resource(io, dev, res);
+			remove_dev_resource(&available[PCI_BUS_BRIDGE_IO_WINDOW],
+					    dev, res);
 		} else if (resource_type(res) == IORESOURCE_MEM) {
 
 			/*
@@ -2080,10 +2081,13 @@ static void remove_dev_resources(struct pci_dev *dev, struct resource *io,
 			 */
 			if ((res->flags & IORESOURCE_PREFETCH) &&
 			    ((res->flags & IORESOURCE_MEM_64) ==
-			     (mmio_pref->flags & IORESOURCE_MEM_64)))
-				remove_dev_resource(mmio_pref, dev, res);
-			else
-				remove_dev_resource(mmio, dev, res);
+			     (mmio_pref->flags & IORESOURCE_MEM_64))) {
+				remove_dev_resource(&available[PCI_BUS_BRIDGE_PREF_MEM_WINDOW],
+						    dev, res);
+			} else {
+				remove_dev_resource(&available[PCI_BUS_BRIDGE_MEM_WINDOW],
+						    dev, res);
+			}
 		}
 	}
 }
@@ -2098,45 +2102,39 @@ static void remove_dev_resources(struct pci_dev *dev, struct resource *io,
  * shared with the bridges.
  */
 static void pci_bus_distribute_available_resources(struct pci_bus *bus,
-					    struct list_head *add_list,
-					    struct resource io,
-					    struct resource mmio,
-					    struct resource mmio_pref)
+		    struct list_head *add_list,
+		    struct resource available_in[PCI_P2P_BRIDGE_RESOURCE_NUM])
 {
+	struct resource available[PCI_P2P_BRIDGE_RESOURCE_NUM];
 	unsigned int normal_bridges = 0, hotplug_bridges = 0;
-	struct resource *io_res, *mmio_res, *mmio_pref_res;
 	struct pci_dev *dev, *bridge = bus->self;
-	resource_size_t io_per_b, mmio_per_b, mmio_pref_per_b, align;
+	resource_size_t per_bridge[PCI_P2P_BRIDGE_RESOURCE_NUM];
+	resource_size_t align;
+	int i;
 
-	io_res = &bridge->resource[PCI_BRIDGE_IO_WINDOW];
-	mmio_res = &bridge->resource[PCI_BRIDGE_MEM_WINDOW];
-	mmio_pref_res = &bridge->resource[PCI_BRIDGE_PREF_MEM_WINDOW];
+	for (i = 0; i < PCI_P2P_BRIDGE_RESOURCE_NUM; i++) {
+		struct resource *res = pci_bus_resource_n(bus, i);
 
-	/*
-	 * The alignment of this bridge is yet to be considered, hence it must
-	 * be done now before extending its bridge window.
-	 */
-	align = pci_resource_alignment(bridge, io_res);
-	if (!io_res->parent && align)
-		io.start = min(ALIGN(io.start, align), io.end + 1);
-
-	align = pci_resource_alignment(bridge, mmio_res);
-	if (!mmio_res->parent && align)
-		mmio.start = min(ALIGN(mmio.start, align), mmio.end + 1);
+		available[i] = available_in[i];
 
-	align = pci_resource_alignment(bridge, mmio_pref_res);
-	if (!mmio_pref_res->parent && align)
-		mmio_pref.start = min(ALIGN(mmio_pref.start, align),
-			mmio_pref.end + 1);
+		/*
+		 * The alignment of this bridge is yet to be considered,
+		 * hence it must be done now before extending its bridge
+		 * window.
+		 */
+		align = pci_resource_alignment(bridge, res);
+		if (!res->parent && align)
+			available[i].start = min(ALIGN(available[i].start, align),
+						 available[i].end + 1);
 
-	/*
-	 * Now that we have adjusted for alignment, update the bridge window
-	 * resources to fill as much remaining resource space as possible.
-	 */
-	adjust_bridge_window(bridge, io_res, add_list, resource_size(&io));
-	adjust_bridge_window(bridge, mmio_res, add_list, resource_size(&mmio));
-	adjust_bridge_window(bridge, mmio_pref_res, add_list,
-			     resource_size(&mmio_pref));
+		/*
+		 * Now that we have adjusted for alignment, update the
+		 * bridge window resources to fill as much remaining
+		 * resource space as possible.
+		 */
+		adjust_bridge_window(bridge, res, add_list,
+				     resource_size(&available[i]));
+	}
 
 	/*
 	 * Calculate how many hotplug bridges and normal bridges there
@@ -2160,7 +2158,7 @@ static void pci_bus_distribute_available_resources(struct pci_bus *bus,
 	 */
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		if (!dev->is_virtfn)
-			remove_dev_resources(dev, &io, &mmio, &mmio_pref);
+			remove_dev_resources(dev, available);
 	}
 
 	/*
@@ -2172,16 +2170,9 @@ static void pci_bus_distribute_available_resources(struct pci_bus *bus,
 	 * split between non-hotplug bridges. This is to allow possible
 	 * hotplug bridges below them to get the extra space as well.
 	 */
-	if (hotplug_bridges) {
-		io_per_b = div64_ul(resource_size(&io), hotplug_bridges);
-		mmio_per_b = div64_ul(resource_size(&mmio), hotplug_bridges);
-		mmio_pref_per_b = div64_ul(resource_size(&mmio_pref),
-					   hotplug_bridges);
-	} else {
-		io_per_b = div64_ul(resource_size(&io), normal_bridges);
-		mmio_per_b = div64_ul(resource_size(&mmio), normal_bridges);
-		mmio_pref_per_b = div64_ul(resource_size(&mmio_pref),
-					   normal_bridges);
+	for (i = 0; i < PCI_P2P_BRIDGE_RESOURCE_NUM; i++) {
+		per_bridge[i] = div64_ul(resource_size(&available[i]),
+					 hotplug_bridges ?: normal_bridges);
 	}
 
 	for_each_pci_bridge(dev, bus) {
@@ -2194,49 +2185,41 @@ static void pci_bus_distribute_available_resources(struct pci_bus *bus,
 		if (hotplug_bridges && !dev->is_hotplug_bridge)
 			continue;
 
-		res = &dev->resource[PCI_BRIDGE_IO_WINDOW];
+		for (i = 0; i < PCI_P2P_BRIDGE_RESOURCE_NUM; i++) {
+			res = pci_bus_resource_n(bus, i);
 
-		/*
-		 * Make sure the split resource space is properly aligned
-		 * for bridge windows (align it down to avoid going above
-		 * what is available).
-		 */
-		align = pci_resource_alignment(dev, res);
-		resource_set_size(&io, ALIGN_DOWN_IF_NONZERO(io_per_b, align));
-
-		/*
-		 * The x_per_b holds the extra resource space that can be
-		 * added for each bridge but there is the minimal already
-		 * reserved as well so adjust x.start down accordingly to
-		 * cover the whole space.
-		 */
-		io.start -= resource_size(res);
-
-		res = &dev->resource[PCI_BRIDGE_MEM_WINDOW];
-		align = pci_resource_alignment(dev, res);
-		resource_set_size(&mmio,
-				  ALIGN_DOWN_IF_NONZERO(mmio_per_b,align));
-		mmio.start -= resource_size(res);
+			/*
+			 * Make sure the split resource space is properly
+			 * aligned for bridge windows (align it down to
+			 * avoid going above what is available).
+			 */
+			align = pci_resource_alignment(dev, res);
+			resource_set_size(&available[i],
+					  ALIGN_DOWN_IF_NONZERO(per_bridge[i],
+								align));
 
-		res = &dev->resource[PCI_BRIDGE_PREF_MEM_WINDOW];
-		align = pci_resource_alignment(dev, res);
-		resource_set_size(&mmio_pref,
-				  ALIGN_DOWN_IF_NONZERO(mmio_pref_per_b, align));
-		mmio_pref.start -= resource_size(res);
+			/*
+			 * The per_bridge holds the extra resource space
+			 * that can be added for each bridge but there is
+			 * the minimal already reserved as well so adjust
+			 * x.start down accordingly to cover the whole
+			 * space.
+			 */
+			available[i].start -= resource_size(res);
+		}
 
-		pci_bus_distribute_available_resources(b, add_list, io, mmio,
-						       mmio_pref);
+		pci_bus_distribute_available_resources(b, add_list, available);
 
-		io.start += io.end + 1;
-		mmio.start += mmio.end + 1;
-		mmio_pref.start += mmio_pref.end + 1;
+		for (i = 0; i < PCI_P2P_BRIDGE_RESOURCE_NUM; i++)
+			available[i].start += available[i].end + 1;
 	}
 }
 
 static void pci_bridge_distribute_available_resources(struct pci_dev *bridge,
 						      struct list_head *add_list)
 {
-	struct resource available_io, available_mmio, available_mmio_pref;
+	struct resource *res, available[PCI_P2P_BRIDGE_RESOURCE_NUM];
+	unsigned int i;
 
 	if (!bridge->is_hotplug_bridge)
 		return;
@@ -2244,14 +2227,13 @@ static void pci_bridge_distribute_available_resources(struct pci_dev *bridge,
 	pci_dbg(bridge, "distributing available resources\n");
 
 	/* Take the initial extra resources from the hotplug port */
-	available_io = bridge->resource[PCI_BRIDGE_IO_WINDOW];
-	available_mmio = bridge->resource[PCI_BRIDGE_MEM_WINDOW];
-	available_mmio_pref = bridge->resource[PCI_BRIDGE_PREF_MEM_WINDOW];
+	for (i = 0; i < PCI_P2P_BRIDGE_RESOURCE_NUM; i++) {
+		res = pci_resource_n(bridge, PCI_BRIDGE_RESOURCES + i);
+		available[i] = *res;
+	}
 
 	pci_bus_distribute_available_resources(bridge->subordinate,
-					       add_list, available_io,
-					       available_mmio,
-					       available_mmio_pref);
+					       add_list, available);
 }
 
 static bool pci_bridge_resources_not_assigned(struct pci_dev *dev)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 275df4058767..723e9cede69d 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -119,7 +119,8 @@ enum {
 #define PCI_CB_BRIDGE_MEM_1_WINDOW	(PCI_BRIDGE_RESOURCES + 3)
 
 /* Total number of bridge resources for P2P and CardBus */
-#define PCI_BRIDGE_RESOURCE_NUM 4
+#define PCI_P2P_BRIDGE_RESOURCE_NUM	3
+#define PCI_BRIDGE_RESOURCE_NUM		4
 
 	/* Resources assigned to buses behind the bridge */
 	PCI_BRIDGE_RESOURCES,
-- 
2.39.5


