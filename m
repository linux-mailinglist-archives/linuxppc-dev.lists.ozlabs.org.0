Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD329067B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 19:11:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4698x03MVxzDr9K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 03:11:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="WJbBEgoM"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698Tx63YyzDrFj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:51:17 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id F178142ED0;
 Fri, 16 Aug 2019 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1565974273; x=1567788674; bh=LkwSVQK1q3gV6fjggFw4Bs0n6KK6skHEPgB
 AdkAEKj0=; b=WJbBEgoM0KGPKLQNdCezzYW0reUVQXmTmrUpjFOyzCAWl49R421
 6zuCGtjtYch8tOHBnAvv/1PPPJSgGx+SMo6Lrls4nifh35pwMTp976RwVvDAx09R
 8QEBd952qccqgYZun2Hmhwc3y1OKayi5Y+lhh2Tth3XTA99ziLYz6tO0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95T76U5NdbW6; Fri, 16 Aug 2019 19:51:13 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9630242ECE;
 Fri, 16 Aug 2019 19:51:10 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:51:09 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v5 07/23] PCI: hotplug: movable BARs: Don't allow added
 devices to steal resources
Date: Fri, 16 Aug 2019 19:50:45 +0300
Message-ID: <20190816165101.911-8-s.miroshnichenko@yadro.com>
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
 drivers/pci/probe.c     | 101 ++++++++++++++++++++++++++++++++++++++--
 drivers/pci/setup-bus.c |  15 ++++++
 include/linux/pci.h     |   1 +
 4 files changed, 125 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index a0ec696512eb..53249cbc21b6 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -373,6 +373,7 @@ static inline bool pci_dev_is_disconnected(const struct pci_dev *dev)
 
 /* pci_dev priv_flags */
 #define PCI_DEV_ADDED 0
+#define PCI_DEV_DISABLED_BARS 1
 
 static inline void pci_dev_assign_added(struct pci_dev *dev, bool added)
 {
@@ -384,6 +385,16 @@ static inline bool pci_dev_is_added(const struct pci_dev *dev)
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
index a26bf740e9ab..bf0a7d1c5d09 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3428,6 +3428,23 @@ void __weak pcibios_rescan_done(struct pci_dev *dev)
 {
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
@@ -3438,6 +3455,8 @@ static void pci_bus_rescan_prepare(struct pci_bus *bus)
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		struct pci_bus *child = dev->subordinate;
 
+		dev->res_mask = pci_dev_count_res_mask(dev);
+
 		if (child)
 			pci_bus_rescan_prepare(child);
 
@@ -3481,7 +3500,7 @@ static void pci_setup_bridges(struct pci_bus *bus)
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		struct pci_bus *child;
 
-		if (!pci_dev_is_added(dev) || pci_dev_is_ignored(dev))
+		if (!pci_dev_is_added(dev) || !pci_dev_bars_enabled(dev))
 			continue;
 
 		child = dev->subordinate;
@@ -3493,6 +3512,83 @@ static void pci_setup_bridges(struct pci_bus *bus)
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
+		pci_bus_release_root_bridge_resources(root);
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
+	} while (true);
+}
+
 /**
  * pci_rescan_bus - Scan a PCI bus for devices
  * @bus: PCI bus to scan
@@ -3515,8 +3611,7 @@ unsigned int pci_rescan_bus(struct pci_bus *bus)
 
 		max = pci_scan_child_bus(root);
 
-		pci_bus_release_root_bridge_resources(root);
-		pci_assign_unassigned_root_bus_resources(root);
+		pci_reassign_root_bus_resources(root);
 
 		pci_setup_bridges(root);
 		pci_bus_rescan_done(root);
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 04f626e1ac18..1a731002ce18 100644
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
index e5b5eff05744..95a8113c2157 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -375,6 +375,7 @@ struct pci_dev {
 	 */
 	unsigned int	irq;
 	struct resource resource[DEVICE_COUNT_RESOURCE]; /* I/O and memory regions + expansion ROMs */
+	unsigned int	res_mask;		/* Bitmask of assigned resources */
 
 	bool		match_driver;		/* Skip attaching driver */
 
-- 
2.21.0

