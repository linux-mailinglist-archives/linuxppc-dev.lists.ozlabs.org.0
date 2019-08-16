Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207390698
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 19:18:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46994p0HByzDsGf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 03:18:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="oTxvRYAN"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698Tz6pjxzDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:51:19 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 252E942EF9;
 Fri, 16 Aug 2019 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1565974275; x=1567788676; bh=1Y+0spmmFlUPuggo+bgEEFFMtqzbhKatpQ/
 sHiyRX0k=; b=oTxvRYANHlG3yV25VULTU6fG7OW9U6HI5YoYn6HrTW6X+6LbtVp
 tgSGD5bvjPbc4nPcx3eQDkyfK/dfWO3Qfdqrw2Yr1vV8jsMhHzQ39OLlWQsYiPU8
 lUAb69A64FBPBaP630k4iCJeXbjI2rrYFdRNeY1dwnFUrK4gcKS37tGs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3u4K-fdgkI2; Fri, 16 Aug 2019 19:51:15 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 27727412D6;
 Fri, 16 Aug 2019 19:51:11 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:51:10 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v5 11/23] PCI: hotplug: movable BARs: Calculate immovable
 parts of bridge windows
Date: Fri, 16 Aug 2019 19:50:49 +0300
Message-ID: <20190816165101.911-12-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190816165101.911-1-s.miroshnichenko@yadro.com>
References: <20190816165101.911-1-s.miroshnichenko@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When movable BARs are enabled, and if a bridge contains a device with fixed
(IORESOURCE_PCI_FIXED) or immovable BARs, the corresponing windows can't be
moved too far away from their original positions - they must still contain
all the fixed/immovable BARs, like that:

  1) Window position before a bus rescan:

  | <--                    root bridge window                        --> |
  |                                                                      |
  | | <--     bridge window    --> |                                     |
  | | movable BARs | **fixed BAR** |                                     |

  2) Possible valid outcome after rescan and move:

  | <--                    root bridge window                        --> |
  |                                                                      |
  |                | <--     bridge window    --> |                      |
  |                | **fixed BAR** | Movable BARs |                      |

An immovable area of a bridge (separare for IO, MEM and MEM64 window types)
is a range that covers all the fixed and immovable BARs of direct children,
and all the fixed area of children bridges:

  | <--                    root bridge window                        --> |
  |                                                                      |
  |  | <--                  bridge window level 1                --> |   |
  |  | ******** immovable area of this bridge window ********        |   |
  |  |                                                               |   |
  |  | **fixed BAR**  | <--      bridge window level 2    --> | BARs |   |
  |  |                | ***** fixed area of this bridge ***** |      |   |
  |  |                |                                       |      |   |
  |  |                | ***fixed BAR*** |   | ***fixed BAR*** |      |   |

To store these areas, the .immovable_range field has been added to struct
pci_bus. It is filled recursively from leaves to the root before a rescan.

Also make pbus_size_io() and pbus_size_mem() return their usual result OR
the size of an immovable range of according type, depending on which one is
larger.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/pci.h       | 14 +++++++
 drivers/pci/probe.c     | 88 +++++++++++++++++++++++++++++++++++++++++
 drivers/pci/setup-bus.c | 17 ++++++++
 include/linux/pci.h     |  6 +++
 4 files changed, 125 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 53249cbc21b6..12add575faf1 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -371,6 +371,20 @@ static inline bool pci_dev_is_disconnected(const struct pci_dev *dev)
 	return dev->error_state == pci_channel_io_perm_failure;
 }
 
+static inline int pci_get_bridge_resource_idx(struct resource *r)
+{
+	int idx = 1;
+
+	if (r->flags & IORESOURCE_IO)
+		idx = 0;
+	else if (!(r->flags & IORESOURCE_PREFETCH))
+		idx = 1;
+	else if (r->flags & IORESOURCE_MEM_64)
+		idx = 2;
+
+	return idx;
+}
+
 /* pci_dev priv_flags */
 #define PCI_DEV_ADDED 0
 #define PCI_DEV_DISABLED_BARS 1
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index bf0a7d1c5d09..5f52a19738aa 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -550,6 +550,7 @@ void pci_read_bridge_bases(struct pci_bus *child)
 static struct pci_bus *pci_alloc_bus(struct pci_bus *parent)
 {
 	struct pci_bus *b;
+	int idx;
 
 	b = kzalloc(sizeof(*b), GFP_KERNEL);
 	if (!b)
@@ -566,6 +567,11 @@ static struct pci_bus *pci_alloc_bus(struct pci_bus *parent)
 	if (parent)
 		b->domain_nr = parent->domain_nr;
 #endif
+	for (idx = 0; idx < PCI_BRIDGE_RESOURCE_NUM; ++idx) {
+		b->immovable_range[idx].start = 0;
+		b->immovable_range[idx].end = 0;
+	}
+
 	return b;
 }
 
@@ -3512,6 +3518,87 @@ static void pci_setup_bridges(struct pci_bus *bus)
 		pci_setup_bridge(bus);
 }
 
+static void pci_bus_update_immovable_range(struct pci_bus *bus)
+{
+	struct pci_dev *dev;
+	int idx;
+	resource_size_t start, end;
+
+	for (idx = 0; idx < PCI_BRIDGE_RESOURCE_NUM; ++idx) {
+		bus->immovable_range[idx].start = 0;
+		bus->immovable_range[idx].end = 0;
+	}
+
+	list_for_each_entry(dev, &bus->devices, bus_list)
+		if (dev->subordinate)
+			pci_bus_update_immovable_range(dev->subordinate);
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		int i;
+		bool dev_is_movable = pci_dev_movable_bars_supported(dev);
+		struct pci_bus *child = dev->subordinate;
+
+		for (i = 0; i < PCI_BRIDGE_RESOURCES; ++i) {
+			struct resource *r = &dev->resource[i];
+
+			if (!r->flags || (r->flags & IORESOURCE_UNSET) || !r->parent)
+				continue;
+
+			if (!dev_is_movable || (r->flags & IORESOURCE_PCI_FIXED)) {
+				idx = pci_get_bridge_resource_idx(r);
+				start = bus->immovable_range[idx].start;
+				end = bus->immovable_range[idx].end;
+
+				if (!start || start > r->start)
+					start = r->start;
+				if (end < r->end)
+					end = r->end;
+
+				if (bus->immovable_range[idx].start != start ||
+				    bus->immovable_range[idx].end != end) {
+					dev_dbg(&bus->dev, "Found fixed 0x%llx-0x%llx in %s, expand the fixed bridge window %d to 0x%llx-0x%llx\n",
+						(unsigned long long)r->start,
+						(unsigned long long)r->end,
+						dev_name(&dev->dev), idx,
+						(unsigned long long)start,
+						(unsigned long long)end);
+					bus->immovable_range[idx].start = start;
+					bus->immovable_range[idx].end = end;
+				}
+			}
+		}
+
+		if (child) {
+			for (idx = 0; idx < PCI_BRIDGE_RESOURCE_NUM; ++idx) {
+				struct resource *child_immovable_range =
+					&child->immovable_range[idx];
+
+				if (child_immovable_range->start >=
+				    child_immovable_range->end)
+					continue;
+
+				start = bus->immovable_range[idx].start;
+				end = bus->immovable_range[idx].end;
+
+				if (!start || start > child_immovable_range->start)
+					start = child_immovable_range->start;
+				if (end < child_immovable_range->end)
+					end = child_immovable_range->end;
+
+				if (start < bus->immovable_range[idx].start ||
+				    end > bus->immovable_range[idx].end) {
+					dev_dbg(&bus->dev, "Expand the fixed bridge window %d from %s to 0x%llx-0x%llx\n",
+						idx, dev_name(&child->dev),
+						(unsigned long long)start,
+						(unsigned long long)end);
+					bus->immovable_range[idx].start = start;
+					bus->immovable_range[idx].end = end;
+				}
+			}
+		}
+	}
+}
+
 static struct pci_dev *pci_find_next_new_device(struct pci_bus *bus)
 {
 	struct pci_dev *dev;
@@ -3610,6 +3697,7 @@ unsigned int pci_rescan_bus(struct pci_bus *bus)
 		pci_bus_rescan_prepare(root);
 
 		max = pci_scan_child_bus(root);
+		pci_bus_update_immovable_range(root);
 
 		pci_reassign_root_bus_resources(root);
 
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 33f709095675..420510a1a257 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -882,9 +882,17 @@ static void pbus_size_io(struct pci_bus *bus, resource_size_t min_size,
 	resource_size_t children_add_size = 0;
 	resource_size_t min_align, align;
 
+	resource_size_t fixed_start = bus->immovable_range[0].start;
+	resource_size_t fixed_end = bus->immovable_range[0].end;
+	resource_size_t fixed_size = (fixed_start < fixed_end) ?
+		(fixed_end - fixed_start + 1) : 0;
+
 	if (!b_res)
 		return;
 
+	if (min_size < fixed_size)
+		min_size = fixed_size;
+
 	min_align = window_alignment(bus, IORESOURCE_IO);
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		int i;
@@ -993,6 +1001,15 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 	resource_size_t children_add_size = 0;
 	resource_size_t children_add_align = 0;
 	resource_size_t add_align = 0;
+	bool is_mem64 = (mask & IORESOURCE_MEM_64);
+
+	resource_size_t fixed_start = bus->immovable_range[is_mem64 ? 2 : 1].start;
+	resource_size_t fixed_end = bus->immovable_range[is_mem64 ? 2 : 1].end;
+	resource_size_t fixed_size = (fixed_start < fixed_end) ?
+		(fixed_end - fixed_start + 1) : 0;
+
+	if (min_size < fixed_size)
+		min_size = fixed_size;
 
 	if (!b_res)
 		return -ENOSPC;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 95a8113c2157..efafbf816fe6 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -581,6 +581,12 @@ struct pci_bus {
 	struct list_head resources;	/* Address space routed to this bus */
 	struct resource busn_res;	/* Bus numbers routed to this bus */
 
+	/*
+	 * If there are fixed or immovable resources in the bridge window, this range
+	 * contains the lowest start address and highest end address of them.
+	 */
+	struct resource immovable_range[PCI_BRIDGE_RESOURCE_NUM];
+
 	struct pci_ops	*ops;		/* Configuration access functions */
 	struct msi_controller *msi;	/* MSI controller */
 	void		*sysdata;	/* Hook for sys-specific extension */
-- 
2.21.0

