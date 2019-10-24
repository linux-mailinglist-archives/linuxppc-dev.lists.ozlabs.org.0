Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B73DE39AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 19:19:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zYrF5mNmzDqW8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 04:19:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="W3BtRmtK"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYhv4v99zDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:12:47 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 19F4A42F14;
 Thu, 24 Oct 2019 17:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937161; x=1573751562; bh=gAAEqhNNDTOwrXRTh4j6hjh9zAAjUohixCZ
 5LlrKZl8=; b=W3BtRmtKxnxEi0WXFcFESDDeWDg/jjnjIlJAxNdyF74bGiYxEbM
 fvrs4FJLTJ8Ilr4hAfzTLz4vzVID7/b2Iiv0Irwu/N3JuI3hGYcE/T8kbiETcQ4b
 RylIZAySZeiapCiSJsi0OeHEfNjs6Ivb7hFI8fiBgC5MjdIl9x5HW7CE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpyDAiP5VViU; Thu, 24 Oct 2019 20:12:41 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 92B1E43597;
 Thu, 24 Oct 2019 20:12:39 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:39 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 03/30] PCI: hotplug: Add a flag for the movable BARs feature
Date: Thu, 24 Oct 2019 20:12:01 +0300
Message-ID: <20191024171228.877974-4-s.miroshnichenko@yadro.com>
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>, linux@yadro.com,
 Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>, Rajat Jain <rajatja@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When hot-adding a device, the bridge may have windows not big enough (or
fragmented too much) for newly requested BARs to fit in. And expanding
these bridge windows may be impossible because blocked by "neighboring"
BARs and bridge windows.

Still, it may be possible to allocate a memory region for new BARs with the
following procedure:

1) notify all the drivers which support movable BARs to pause and release
   the BARs; the rest of the drivers are guaranteed that their devices will
   not get BARs moved;

2) release all the bridge windows and movable BARs;

3) try to recalculate new bridge windows that will fit all the BAR types:
   - fixed;
   - immovable;
   - movable;
   - newly requested by hot-added devices;

4) if the previous step fails, disable BARs for one of the hot-added
   devices and retry from step 3;

5) notify the drivers, so they remap BARs and resume.

If bridge calculation and BAR assignment fails with a hot-added devices,
BARs of these devices will be disabled, falling back to the same amount and
size of BARs as they were before the hotplug event. The kernel succeeded in
assigning then, so the same algorithm will provide the same results again.

This makes the prior reservation of memory by BIOS/bootloader/firmware not
required anymore for the PCI hotplug.

Drivers indicate their support of movable BARs by implementing the new
.rescan_prepare() and .rescan_done() hooks in the struct pci_driver. All
device's activity must be paused during a rescan, and iounmap()+ioremap()
must be applied to every used BAR.

If a device is not bound to a driver, its BARs are considered movable.

For a higher probability of the successful BAR reassignment, all the BARs
and bridge windows should be released before the rescan, not only those
with higher addresses.

One example when it is needed, BAR(I) is moved to free a gap for the new
BAR(II):

  Before:
 ==================== parent bridge window ===============
               ---- hotplug bridge window ----
|   BAR(I)    |   fixed BAR   |   fixed BAR   | fixed BAR |
                           ^
                           |
                       new BAR(II)

  After:
 ==================== parent bridge window =========================
 ----------- hotplug bridge window -----------
| new BAR(II) |   fixed BAR   |   fixed BAR   | fixed BAR | BAR(I)  |

Another example is a fragmented bridge window jammed between fixed BARs:

  Before:
 ===================== parent bridge window ========================
             ---------- hotplug bridge window ----------
| fixed BAR |   | BAR(I) |    | BAR(II) |    | BAR(III) | fixed BAR |
                           ^
                           |
                       new BAR(IV)

 After:
 ==================== parent bridge window =========================
             ---------- hotplug bridge window ----------
| fixed BAR | BAR(I) | BAR(II) | BAR(III) | new BAR(IV) | fixed BAR |

This patch is a preparation for future patches with actual implementation,
and for now it just does the following:
 - declares the feature;
 - defines the bool pci_can_move_bars and bool pci_dev_bar_movable(dev);
 - invokes the .rescan_prepare() and .rescan_done() driver notifiers;
 - disables the feature for the powerpc/pseries.

The feature is disabled by default until the final patch of the series.
It can be overridden per-arch using the pci_can_move_bars=false flag or by
the following command line option:

    pci=no_movable_bars

CC: Sam Bobroff <sbobroff@linux.ibm.com>
CC: Rajat Jain <rajatja@google.com>
CC: Lukas Wunner <lukas@wunner.de>
CC: Oliver O'Halloran <oohall@gmail.com>
CC: David Laight <David.Laight@ACULAB.COM>
Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 .../admin-guide/kernel-parameters.txt         |  1 +
 arch/powerpc/platforms/pseries/setup.c        |  2 +
 drivers/pci/pci.c                             |  4 +
 drivers/pci/pci.h                             |  2 +
 drivers/pci/probe.c                           | 85 ++++++++++++++++++-
 include/linux/pci.h                           |  4 +
 6 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a84a83f8881e..c6243aaed0c9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3528,6 +3528,7 @@
 				may put more devices in an IOMMU group.
 		force_floating	[S390] Force usage of floating interrupts.
 		nomio		[S390] Do not use MIO instructions.
+		no_movable_bars	Don't allow BARs to be moved during hotplug
 
 	pcie_aspm=	[PCIE] Forcibly enable or disable PCIe Active State Power
 			Management.
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 0a40201f315f..7cd12c5a2deb 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -920,6 +920,8 @@ static void __init pseries_init(void)
 {
 	pr_debug(" -> pseries_init()\n");
 
+	pci_can_move_bars = false;
+
 #ifdef CONFIG_HVC_CONSOLE
 	if (firmware_has_feature(FW_FEATURE_LPAR))
 		hvc_vio_init_early();
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e85dc63c73fd..85014c6b2817 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -78,6 +78,8 @@ static void pci_dev_d3_sleep(struct pci_dev *dev)
 int pci_domains_supported = 1;
 #endif
 
+bool pci_can_move_bars;
+
 #define DEFAULT_CARDBUS_IO_SIZE		(256)
 #define DEFAULT_CARDBUS_MEM_SIZE	(64*1024*1024)
 /* pci=cbmemsize=nnM,cbiosize=nn can override this */
@@ -6331,6 +6333,8 @@ static int __init pci_setup(char *str)
 				pci_add_flags(PCI_SCAN_ALL_PCIE_DEVS);
 			} else if (!strncmp(str, "disable_acs_redir=", 18)) {
 				disable_acs_redir_param = str + 18;
+			} else if (!strncmp(str, "no_movable_bars", 15)) {
+				pci_can_move_bars = false;
 			} else {
 				pr_err("PCI: Unknown option `%s'\n", str);
 			}
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 3f6947ee3324..19bc50597d12 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -286,6 +286,8 @@ void pci_disable_bridge_window(struct pci_dev *dev);
 struct pci_bus *pci_bus_get(struct pci_bus *bus);
 void pci_bus_put(struct pci_bus *bus);
 
+bool pci_dev_bar_movable(struct pci_dev *dev, struct resource *res);
+
 /* PCIe link information */
 #define PCIE_SPEED2STR(speed) \
 	((speed) == PCIE_SPEED_16_0GT ? "16 GT/s" : \
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index d4f21e413638..3d8c0f653378 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3133,6 +3133,73 @@ unsigned int pci_rescan_bus_bridge_resize(struct pci_dev *bridge)
 	return max;
 }
 
+static bool pci_dev_movable(struct pci_dev *dev, bool res_has_children)
+{
+	if (!pci_can_move_bars)
+		return false;
+
+	if (dev->driver && dev->driver->rescan_prepare)
+		return true;
+
+	if (!dev->driver && !res_has_children)
+		return true;
+
+	return false;
+}
+
+bool pci_dev_bar_movable(struct pci_dev *dev, struct resource *res)
+{
+	struct pci_bus_region region;
+
+	if (res->flags & IORESOURCE_PCI_FIXED)
+		return false;
+
+	/* Workaround for the legacy VGA memory 0xa0000-0xbffff */
+	pcibios_resource_to_bus(dev->bus, &region, res);
+	if (region.start == 0xa0000)
+		return false;
+
+	return pci_dev_movable(dev, res->child);
+}
+
+static void pci_bus_rescan_prepare(struct pci_bus *bus)
+{
+	struct pci_dev *dev;
+
+	if (bus->self)
+		pci_config_pm_runtime_get(bus->self);
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		struct pci_bus *child = dev->subordinate;
+
+		if (child)
+			pci_bus_rescan_prepare(child);
+
+		if (dev->driver &&
+		    dev->driver->rescan_prepare)
+			dev->driver->rescan_prepare(dev);
+	}
+}
+
+static void pci_bus_rescan_done(struct pci_bus *bus)
+{
+	struct pci_dev *dev;
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		struct pci_bus *child = dev->subordinate;
+
+		if (dev->driver &&
+		    dev->driver->rescan_done)
+			dev->driver->rescan_done(dev);
+
+		if (child)
+			pci_bus_rescan_done(child);
+	}
+
+	if (bus->self)
+		pci_config_pm_runtime_put(bus->self);
+}
+
 /**
  * pci_rescan_bus - Scan a PCI bus for devices
  * @bus: PCI bus to scan
@@ -3145,9 +3212,23 @@ unsigned int pci_rescan_bus_bridge_resize(struct pci_dev *bridge)
 unsigned int pci_rescan_bus(struct pci_bus *bus)
 {
 	unsigned int max;
+	struct pci_bus *root = bus;
+
+	while (!pci_is_root_bus(root))
+		root = root->parent;
+
+	if (pci_can_move_bars) {
+		pci_bus_rescan_prepare(root);
+
+		max = pci_scan_child_bus(root);
+		pci_assign_unassigned_root_bus_resources(root);
+
+		pci_bus_rescan_done(root);
+	} else {
+		max = pci_scan_child_bus(bus);
+		pci_assign_unassigned_bus_resources(bus);
+	}
 
-	max = pci_scan_child_bus(bus);
-	pci_assign_unassigned_bus_resources(bus);
 	pci_bus_add_devices(bus);
 
 	return max;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 525140e3a460..b981e67c8a13 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -835,6 +835,8 @@ struct pci_driver {
 	int  (*resume)(struct pci_dev *dev);	/* Device woken up */
 	void (*shutdown)(struct pci_dev *dev);
 	int  (*sriov_configure)(struct pci_dev *dev, int num_vfs); /* On PF */
+	void (*rescan_prepare)(struct pci_dev *dev);
+	void (*rescan_done)(struct pci_dev *dev);
 	const struct pci_error_handlers *err_handler;
 	const struct attribute_group **groups;
 	struct device_driver	driver;
@@ -1395,6 +1397,8 @@ void pci_setup_bridge(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
 
+extern bool pci_can_move_bars;
+
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)
 
-- 
2.23.0

