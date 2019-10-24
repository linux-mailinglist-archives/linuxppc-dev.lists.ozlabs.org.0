Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6FFE3A19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 19:31:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zZ6P21hTzDqBS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 04:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="KrrA7SRa"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYhz0TQRzDqMN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:12:51 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BDC2543E1B;
 Thu, 24 Oct 2019 17:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937164; x=1573751565; bh=NvQMzjUVCOWGtfggDXlkUQRLM30JH6SR9Yn
 lAOvNzFQ=; b=KrrA7SRahrEMHVQTuIAXiGBPWmJ3cFBjLBkoPKW7+yuQHcsRTs0
 raeH2e2wpaSWyhvTLkvlGkU2U+Wijp4Szn7fhCUzwuUBH/8a2teY3REDITdPaazD
 46jLilZZ07FTRi6+0ww8BGI+GrEOMYkV/7TsMNOcLsNDLzOohai5730w=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQVudJlUeLKR; Thu, 24 Oct 2019 20:12:44 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 273C4437FA;
 Thu, 24 Oct 2019 20:12:41 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:40 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 08/30] PCI: hotplug: movable BARs: Don't allow added
 devices to steal resources
Date: Thu, 24 Oct 2019 20:12:06 +0300
Message-ID: <20191024171228.877974-9-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024171228.877974-1-s.miroshnichenko@yadro.com>
References: <20191024171228.877974-1-s.miroshnichenko@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.136]
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

When movable BARs are enabled, the PCI subsystem at first releases all the
bridge windows and then attempts to assign resources both to previously
working devices and to the newly hotplugged ones, with the same priority.

If a hotplugged device gets its BARs first, this may lead to lack of space
for already working devices, which is unacceptable. If that happens, mark
one of the new devices with the newly introduced flag PCI_DEV_DISABLED_BARS
(if it is not yet marked) and retry the BAR recalculation.

The worst case would be no BARs for hotplugged devices, while all the rest
just continue working.

The algorithm is simple and it doesn't retry different subsets of hot-added
devices in case of a failure, e.g. if there are no space to allocate BARs
for both hotplugged devices A and B, but is enough for just A, the A will
be marked with PCI_DEV_DISABLED_BARS first, then (after the next failure) -
B. As a result, A will not get BARs while it could. This issue is only
relevant when hotplugging two and more devices simultaneously.

Add a new res_mask bitmask to the struct pci_dev for storing the indices of
assigned BARs.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/pci.h       |  11 +++++
 drivers/pci/probe.c     | 102 ++++++++++++++++++++++++++++++++++++++--
 drivers/pci/setup-bus.c |  15 ++++++
 include/linux/pci.h     |   1 +
 4 files changed, 126 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4a3f2b69285b..55344f2c55bf 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -403,6 +403,7 @@ static inline bool pci_dev_is_disconnected(const struct pci_dev *dev)
 
 /* pci_dev priv_flags */
 #define PCI_DEV_ADDED 0
+#define PCI_DEV_DISABLED_BARS 1
 
 static inline void pci_dev_assign_added(struct pci_dev *dev, bool added)
 {
@@ -414,6 +415,16 @@ static inline bool pci_dev_is_added(const struct pci_dev *dev)
 	return test_bit(PCI_DEV_ADDED, &dev->priv_flags);
 }
 
+static inline void pci_dev_disable_bars(struct pci_dev *dev)
+{
+	assign_bit(PCI_DEV_DISABLED_BARS, &dev->priv_flags, true);
+}
+
+static inline bool pci_dev_bars_enabled(const struct pci_dev *dev)
+{
+	return !test_bit(PCI_DEV_DISABLED_BARS, &dev->priv_flags);
+}
+
 #ifdef CONFIG_PCIEAER
 #include <linux/aer.h>
 
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index d2dbec51c4df..2d1157493e6a 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3162,6 +3162,23 @@ bool pci_dev_bar_movable(struct pci_dev *dev, struct resource *res)
 	return pci_dev_movable(dev, res->child);
 }
 
+static unsigned int pci_dev_count_res_mask(struct pci_dev *dev)
+{
+	unsigned int res_mask = 0;
+	int i;
+
+	for (i = 0; i < PCI_BRIDGE_RESOURCES; i++) {
+		struct resource *r = &dev->resource[i];
+
+		if (!r->flags || (r->flags & IORESOURCE_UNSET) || !r->parent)
+			continue;
+
+		res_mask |= (1 << i);
+	}
+
+	return res_mask;
+}
+
 static void pci_bus_rescan_prepare(struct pci_bus *bus)
 {
 	struct pci_dev *dev;
@@ -3172,6 +3189,8 @@ static void pci_bus_rescan_prepare(struct pci_bus *bus)
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		struct pci_bus *child = dev->subordinate;
 
+		dev->res_mask = pci_dev_count_res_mask(dev);
+
 		if (child)
 			pci_bus_rescan_prepare(child);
 
@@ -3207,7 +3226,7 @@ static void pci_setup_bridges(struct pci_bus *bus)
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		struct pci_bus *child;
 
-		if (!pci_dev_is_added(dev))
+		if (!pci_dev_is_added(dev) || !pci_dev_bars_enabled(dev))
 			continue;
 
 		child = dev->subordinate;
@@ -3219,6 +3238,83 @@ static void pci_setup_bridges(struct pci_bus *bus)
 		pci_setup_bridge(bus);
 }
 
+static struct pci_dev *pci_find_next_new_device(struct pci_bus *bus)
+{
+	struct pci_dev *dev;
+
+	if (!bus)
+		return NULL;
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		struct pci_bus *child_bus = dev->subordinate;
+
+		if (!pci_dev_is_added(dev) && pci_dev_bars_enabled(dev))
+			return dev;
+
+		if (child_bus) {
+			struct pci_dev *next_new_dev;
+
+			next_new_dev = pci_find_next_new_device(child_bus);
+			if (next_new_dev)
+				return next_new_dev;
+		}
+	}
+
+	return NULL;
+}
+
+static bool pci_bus_check_all_bars_reassigned(struct pci_bus *bus)
+{
+	struct pci_dev *dev;
+	bool ret = true;
+
+	if (!bus)
+		return false;
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		struct pci_bus *child = dev->subordinate;
+		unsigned int res_mask = pci_dev_count_res_mask(dev);
+
+		if (!pci_dev_bars_enabled(dev))
+			continue;
+
+		if (dev->res_mask & ~res_mask) {
+			pci_err(dev, "Non-re-enabled resources found: 0x%x -> 0x%x\n",
+				dev->res_mask, res_mask);
+			ret = false;
+		}
+
+		if (child && !pci_bus_check_all_bars_reassigned(child))
+			ret = false;
+	}
+
+	return ret;
+}
+
+static void pci_reassign_root_bus_resources(struct pci_bus *root)
+{
+	do {
+		struct pci_dev *next_new_dev;
+
+		pci_assign_unassigned_root_bus_resources(root);
+
+		if (pci_bus_check_all_bars_reassigned(root))
+			break;
+
+		next_new_dev = pci_find_next_new_device(root);
+		if (!next_new_dev) {
+			dev_err(&root->dev, "failed to re-assign resources even after ignoring all the hotplugged devices\n");
+			break;
+		}
+
+		dev_warn(&root->dev, "failed to re-assign resources, disable the next hotplugged device %s and retry\n",
+			 dev_name(&next_new_dev->dev));
+
+		pci_dev_disable_bars(next_new_dev);
+		pci_bus_release_root_bridge_resources(root);
+	} while (true);
+}
+
 /**
  * pci_rescan_bus - Scan a PCI bus for devices
  * @bus: PCI bus to scan
@@ -3238,11 +3334,11 @@ unsigned int pci_rescan_bus(struct pci_bus *bus)
 
 	if (pci_can_move_bars) {
 		pci_bus_rescan_prepare(root);
+		pci_bus_release_root_bridge_resources(root);
 
 		max = pci_scan_child_bus(root);
 
-		pci_bus_release_root_bridge_resources(root);
-		pci_assign_unassigned_root_bus_resources(root);
+		pci_reassign_root_bus_resources(root);
 
 		pci_setup_bridges(root);
 		pci_bus_rescan_done(root);
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 381ce964cb20..4b538d132958 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -128,6 +128,9 @@ static void pdev_sort_resources(struct pci_dev *dev, struct list_head *head)
 {
 	int i;
 
+	if (!pci_dev_bars_enabled(dev))
+		return;
+
 	for (i = 0; i < PCI_NUM_RESOURCES; i++) {
 		struct resource *r;
 		struct pci_dev_resource *dev_res, *tmp;
@@ -177,6 +180,9 @@ static void __dev_sort_resources(struct pci_dev *dev, struct list_head *head)
 {
 	u16 class = dev->class >> 8;
 
+	if (!pci_dev_bars_enabled(dev))
+		return;
+
 	/* Don't touch classless devices or host bridges or IOAPICs */
 	if (class == PCI_CLASS_NOT_DEFINED || class == PCI_CLASS_BRIDGE_HOST)
 		return;
@@ -278,6 +284,9 @@ static void assign_requested_resources_sorted(struct list_head *head,
 	int idx;
 
 	list_for_each_entry(dev_res, head, list) {
+		if (!pci_dev_bars_enabled(dev_res->dev))
+			continue;
+
 		res = dev_res->res;
 		idx = res - &dev_res->dev->resource[0];
 		if (resource_size(res) &&
@@ -995,6 +1004,9 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		int i;
 
+		if (!pci_dev_bars_enabled(dev))
+			continue;
+
 		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
 			struct resource *r = &dev->resource[i];
 			resource_size_t r_size;
@@ -1349,6 +1361,9 @@ void __pci_bus_assign_resources(const struct pci_bus *bus,
 	pbus_assign_resources_sorted(bus, realloc_head, fail_head);
 
 	list_for_each_entry(dev, &bus->devices, bus_list) {
+		if (!pci_dev_bars_enabled(dev))
+			continue;
+
 		pdev_assign_fixed_resources(dev);
 
 		b = dev->subordinate;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index b981e67c8a13..7f7f704df672 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -376,6 +376,7 @@ struct pci_dev {
 	 */
 	unsigned int	irq;
 	struct resource resource[DEVICE_COUNT_RESOURCE]; /* I/O and memory regions + expansion ROMs */
+	unsigned int	res_mask;		/* Bitmask of assigned resources */
 
 	bool		match_driver;		/* Skip attaching driver */
 
-- 
2.23.0

