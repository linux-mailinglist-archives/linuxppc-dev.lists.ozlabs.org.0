Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03623E3B37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 20:44:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zbks3nDCzDqTG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 05:44:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="JmNNZB6N"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYvn0brxzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:22:13 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 256CC437F6;
 Thu, 24 Oct 2019 17:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937728; x=1573752129; bh=xBJtdevGeGnc96+BeVa8cqxH84E+1dCMjVv
 FrIcITyQ=; b=JmNNZB6NXP3MKjKPtlinHLM7wStQ39yd1hjG7r7Ywr4aFyuwig1
 CbDgow0fl/r3yRGQV3ldg6IxFUNAtqvnzG8Q06Wvp8I71OERuHYJXWAP/lf1t1ii
 nBtLX8WwykLPA3v1ACxHL3PG7RxSOkVTZA+AWAHHf41Y9F1P4wn5HPYQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omXcDi0qZfe4; Thu, 24 Oct 2019 20:22:08 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 31A0F438CE;
 Thu, 24 Oct 2019 20:22:06 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:22:05 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH RFC 09/11] PCI: hotplug: Add initial support for movable bus
 numbers
Date: Thu, 24 Oct 2019 20:21:55 +0300
Message-ID: <20191024172157.878735-10-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024172157.878735-1-s.miroshnichenko@yadro.com>
References: <20191024172157.878735-1-s.miroshnichenko@yadro.com>
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

Currently, hot-adding a bridge requires enough bus numbers to be reserved
on the slot. Choosing a favorable number of reserved buses per slot is
relatively simple for predictable cases, but it gets trickier when bridges
can be hot-plugged into hot-plugged bridges: there may be either not enough
buses in a slot for a new big bridge, or all the 255 possible numbers will
be depleted. So hot-add may fail still having unused buses somewhere in the
PCI topology.

Instead of reserving, the bus numbers can be allocated continuously, and
during a hot-adding a bridge in the middle of the PCI tree, the conflicting
buses can increment their numbers, creating a gap for the new bridge.

Before the moving, ensure there are enough space to move on, and there will
be no conflicts with other buses, taking into consideration that it may be
more than one root bridge in the domain (e.g. on some Intel Xeons one root
has buses 00-7f, and the second one - 80-ff).

The feature is disabled by default to not break the ABI, and can be enabled
by the "pci=movable_buses" command line argument, if all risks accepted.

The following set of parameters provides a safe activation of the feature:

  pci=realloc,pcie_bus_peer2peer,movable_buses

On x86, the "pci=assign-busses" is also required:

  pci=realloc,pcie_bus_peer2peer,movable_buses,assign-busses

This series is the second half of the work started by the "Movable BARs"
patches, and relies on fixes made there.

Following patches will resolve the introduced issues:
 - fix desynchronization in /sys/devices/pci*, /sys/bus/pci/devices/* and
   /proc/bus/pci/* after changes in PCI topology;
 - compact gaps in numbering, which may appear after removing a bridge, to
   maintain the number continuity.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 .../admin-guide/kernel-parameters.txt         |   3 +
 drivers/pci/pci.c                             |   3 +
 drivers/pci/pci.h                             |   2 +
 drivers/pci/probe.c                           | 153 +++++++++++++++++-
 4 files changed, 156 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c6243aaed0c9..1bf8dea1f08a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3529,6 +3529,9 @@
 		force_floating	[S390] Force usage of floating interrupts.
 		nomio		[S390] Do not use MIO instructions.
 		no_movable_bars	Don't allow BARs to be moved during hotplug
+		movable_buses	Prefer bus renaming over the number reserving. This
+				inflicts the deleting+recreating of sysfs and procfs
+				entries.
 
 	pcie_aspm=	[PCIE] Forcibly enable or disable PCIe Active State Power
 			Management.
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 6ec1b70e4a96..9b2dcaa268e8 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -79,6 +79,7 @@ int pci_domains_supported = 1;
 #endif
 
 bool pci_can_move_bars = true;
+bool pci_movable_buses;
 
 #define DEFAULT_CARDBUS_IO_SIZE		(256)
 #define DEFAULT_CARDBUS_MEM_SIZE	(64*1024*1024)
@@ -6335,6 +6336,8 @@ static int __init pci_setup(char *str)
 				disable_acs_redir_param = str + 18;
 			} else if (!strncmp(str, "no_movable_bars", 15)) {
 				pci_can_move_bars = false;
+			} else if (!strncmp(str, "movable_buses", 13)) {
+				pci_movable_buses = true;
 			} else {
 				pr_err("PCI: Unknown option `%s'\n", str);
 			}
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 9b5164d10499..804176bb1d1b 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -289,6 +289,8 @@ void pci_bus_put(struct pci_bus *bus);
 
 bool pci_dev_bar_movable(struct pci_dev *dev, struct resource *res);
 
+extern bool pci_movable_buses;
+
 int assign_fixed_resource_on_bus(struct pci_bus *b, struct resource *r);
 
 /* PCIe link information */
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 3494b5d265d5..be9e5754cac7 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1096,6 +1096,126 @@ static void pci_enable_crs(struct pci_dev *pdev)
 					 PCI_EXP_RTCTL_CRSSVE);
 }
 
+static void pci_do_move_buses(const int domain, int busnr, int first_moved_busnr,
+			      int delta, const struct resource *valid_range)
+{
+	struct pci_bus *bus;
+	int subordinate;
+	u32 old_buses, buses;
+
+	if (busnr < valid_range->start || busnr > valid_range->end)
+		return;
+
+	bus = pci_find_bus(domain, busnr);
+	if (!bus)
+		return;
+
+	if (delta > 0) {
+		pci_do_move_buses(domain, busnr + 1, first_moved_busnr,
+				  delta, valid_range);
+	}
+
+	bus->number += delta;
+	bus->busn_res.start += delta;
+
+	/* Children of moved buses must update their primary bus */
+	if (bus->primary >= first_moved_busnr)
+		bus->primary += delta;
+
+	pci_read_config_dword(bus->self, PCI_PRIMARY_BUS, &buses);
+	old_buses = buses;
+	subordinate = (old_buses >> 16) & 0xff;
+	subordinate += delta;
+	buses &= 0xff000000;
+	buses |= (unsigned int)bus->primary;
+	buses |= (unsigned int)(bus->number << 8);
+	buses |= (unsigned int)(subordinate << 16);
+	pci_write_config_dword(bus->self, PCI_PRIMARY_BUS, buses);
+
+	if (delta < 0)
+		pci_do_move_buses(domain, busnr + 1, first_moved_busnr,
+				  delta, valid_range);
+}
+
+/*
+ * Buses can only be moved if distributed continuously, without neither gaps nor reserved
+ * bus numbers.
+ *
+ * Secondary bus of every bridge is expanded to the maximum possible value allowed be the
+ * root bridge.
+ */
+static int pci_move_buses(int domain, int busnr, int delta,
+			  const struct resource *valid_range)
+{
+	if (!pci_movable_buses)
+		return 0;
+
+	if (!delta)
+		return 0;
+
+	/* Return immediately for the root bus */
+	if (!busnr)
+		return 0;
+
+	if (busnr < valid_range->start || busnr > valid_range->end) {
+		pr_err("Bus number %02x is outside of valid range %pR\n",
+		       busnr, valid_range);
+		return -EINVAL;
+	}
+
+	if (((busnr + delta) < valid_range->start) ||
+	    ((busnr + delta) > valid_range->end)) {
+		pr_err("Can't move bus %02x by %d outside of valid range %pR\n",
+		       busnr, delta, valid_range);
+		return -ENOSPC;
+	}
+
+	if (delta > 0) {
+		struct pci_bus *bus = pci_find_bus(domain, valid_range->end - delta + 1);
+
+		if (bus) {
+			pr_err("Not enough space for bus movement - blocked by %s\n",
+			       dev_name(&bus->dev));
+			return -ENOSPC;
+		}
+	} else {
+		int check_busnr;
+
+		for (check_busnr = busnr + delta; check_busnr < busnr; ++check_busnr) {
+			struct pci_bus *bus = pci_find_bus(domain, check_busnr);
+
+			if (bus) {
+				pr_err("Not enough space for bus movement - blocked by %s\n",
+				       dev_name(&bus->dev));
+				return -ENOSPC;
+			}
+		}
+	}
+
+	pci_do_move_buses(domain, busnr, busnr,
+			  delta, valid_range);
+
+	return 0;
+}
+
+static bool pci_new_bus_needed(struct pci_bus *bus, const struct pci_dev *self)
+{
+	if (!bus)
+		return true;
+
+	if (!pci_movable_buses)
+		return false;
+
+	if (pci_is_root_bus(bus))
+		return false;
+
+	/* Check if the downstream port already has the requested bus number */
+	if (bus->self == self)
+		return false;
+
+	return true;
+}
+
 static unsigned int pci_scan_child_bus_extend(struct pci_bus *bus,
 					      unsigned int available_buses);
 /**
@@ -1165,6 +1285,10 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
 	bool fixed_buses;
 	u8 fixed_sec, fixed_sub;
 	int next_busnr;
+	struct pci_bus *root = bus;
+
+	while (!pci_is_root_bus(root))
+		root = root->parent;
 
 	/*
 	 * Make sure the bridge is powered on to be able to access config
@@ -1277,7 +1401,11 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
 		 * case we only re-scan this bus.
 		 */
 		child = pci_find_bus(pci_domain_nr(bus), next_busnr);
-		if (!child) {
+		if (pci_new_bus_needed(child, dev)) {
+			if (child && pci_move_buses(pci_domain_nr(child), next_busnr,
+						    1, &root->busn_res))
+				goto out;
+
 			child = pci_add_new_bus(bus, dev, next_busnr);
 			if (!child)
 				goto out;
@@ -2771,9 +2899,13 @@ static unsigned int pci_scan_child_bus_extend(struct pci_bus *bus,
 		}
 	}
 
-	/* Reserve buses for SR-IOV capability */
-	used_buses = pci_iov_bus_range(bus);
-	max += used_buses;
+	if (!pci_movable_buses) {
+		/* Reserve buses for SR-IOV capability */
+		used_buses = pci_iov_bus_range(bus);
+		max += used_buses;
+	} else {
+		used_buses = 0;
+	}
 
 	/*
 	 * After performing arch-dependent fixup of the bus, look behind
@@ -2806,6 +2938,11 @@ static unsigned int pci_scan_child_bus_extend(struct pci_bus *bus,
 		cmax = max;
 		max = pci_scan_bridge_extend(bus, dev, max, 0, 0);
 
+		if (pci_movable_buses) {
+			used_buses += cmax - max;
+			continue;
+		}
+
 		/*
 		 * Reserve one bus for each bridge now to avoid extending
 		 * hotplug bridges too much during the second scan below.
@@ -2835,11 +2972,17 @@ static unsigned int pci_scan_child_bus_extend(struct pci_bus *bus,
 			 * bridges if any.
 			 */
 			buses = available_buses / hotplug_bridges;
-			buses = min(buses, available_buses - used_buses + 1);
+			buses = min(buses, available_buses - used_buses +
+				    (pci_movable_buses ? 0 : 1));
 		}
 
 		cmax = max;
 		max = pci_scan_bridge_extend(bus, dev, cmax, buses, 1);
+		if (pci_movable_buses) {
+			used_buses += max - cmax;
+			continue;
+		}
+
 		/* One bus is already accounted so don't add it again */
 		if (max - cmax > 1)
 			used_buses += max - cmax - 1;
-- 
2.23.0

