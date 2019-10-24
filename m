Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18534E3B3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 20:46:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zbnF47zgzDqPm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 05:46:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="HOlyiJZl"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYvn5vf2zDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:22:13 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BB6C3437F8;
 Thu, 24 Oct 2019 17:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937729; x=1573752130; bh=+567eQd9BAxyVv0ZptWpcxxV5MHCVDgjHwB
 rbG2xjoM=; b=HOlyiJZlnVQYrkxf2NxbndwsTxVpG8v6VKuBO6h4JvGeXVEgWzh
 +A29JYZb8687uSdx0cbZdpLJkyewl0OlnDqlg7otEbRYz48bN9qoKuTaHfCN4gSP
 rYMvlH6+mKRaPj1p/4SAAj5YzqSk+V6HLVvmqOqxOFMyfSd9qBTLjm4Y=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLzeJ6S6QrYD; Thu, 24 Oct 2019 20:22:09 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 61630438D1;
 Thu, 24 Oct 2019 20:22:06 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:22:06 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH RFC 10/11] PCI: hotplug: movable bus numbers: rename proc and
 sysfs entries
Date: Thu, 24 Oct 2019 20:21:56 +0300
Message-ID: <20191024172157.878735-11-s.miroshnichenko@yadro.com>
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

Changing the number of a bus (therefore changing addresses of this bus, of
its children and all the buses next in the tree) invalidates entries in
/sys/devices/pci*, /proc/bus/pci/* and symlinks in /sys/bus/pci/devices/*
for all the renamed devices and buses.

Remove the affected proc and sysfs entries and symlinks before renaming the
bus, then created them back.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/probe.c | 105 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index be9e5754cac7..fe9bf012ef33 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1096,12 +1096,99 @@ static void pci_enable_crs(struct pci_dev *pdev)
 					 PCI_EXP_RTCTL_CRSSVE);
 }
 
+static void pci_buses_remove_sysfs(int domain, int busnr, int max_bus_number)
+{
+	struct pci_bus *bus;
+	struct pci_dev *dev = NULL;
+
+	bus = pci_find_bus(domain, busnr);
+	if (!bus)
+		return;
+
+	if (busnr < max_bus_number)
+		pci_buses_remove_sysfs(domain, busnr + 1, max_bus_number);
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		device_remove_class_symlinks(&dev->dev);
+		pci_remove_sysfs_dev_files(dev);
+		pci_proc_detach_device(dev);
+		bus_disconnect_device(&dev->dev);
+	}
+
+	device_remove_class_symlinks(&bus->dev);
+	pci_proc_detach_bus(bus);
+}
+
+static void pci_buses_create_sysfs(int domain, int busnr, int max_bus_number)
+{
+	struct pci_bus *bus;
+	struct pci_dev *dev = NULL;
+
+	bus = pci_find_bus(domain, busnr);
+	if (!bus)
+		return;
+
+	device_add_class_symlinks(&bus->dev);
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		bus_add_device(&dev->dev);
+		if (pci_dev_is_added(dev)) {
+			pci_proc_attach_device(dev);
+			pci_create_sysfs_dev_files(dev);
+			device_add_class_symlinks(&dev->dev);
+		}
+	}
+
+	if (busnr < max_bus_number)
+		pci_buses_create_sysfs(domain, busnr + 1, max_bus_number);
+}
+
+static void pci_rename_bus(struct pci_bus *bus, const char *new_bus_name)
+{
+	struct class *class;
+	int err;
+
+	class = bus->dev.class;
+	bus->dev.class = NULL;
+	err = device_rename(&bus->dev, new_bus_name);
+	bus->dev.class = class;
+}
+
+static void pci_rename_bus_devices(struct pci_bus *bus, const int domain,
+				   const int new_busnr)
+{
+	struct pci_dev *dev = NULL;
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		char old_name[64];
+		char new_name[64];
+		struct class *class;
+		int err;
+		int i;
+
+		strncpy(old_name, dev_name(&dev->dev), sizeof(old_name));
+		sprintf(new_name, "%04x:%02x:%02x.%d", domain, new_busnr,
+			PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
+		class = dev->dev.class;
+		dev->dev.class = NULL;
+		err = device_rename(&dev->dev, new_name);
+		dev->dev.class = class;
+
+		for (i = 0; i < PCI_BRIDGE_RESOURCES; i++)
+			dev->resource[i].name = pci_name(dev);
+	}
+}
+
 static void pci_do_move_buses(const int domain, int busnr, int first_moved_busnr,
 			      int delta, const struct resource *valid_range)
 {
 	struct pci_bus *bus;
-	int subordinate;
+	int subordinate, old_primary;
 	u32 old_buses, buses;
+	char old_bus_name[64];
+	char new_bus_name[64];
+	struct resource old_res;
+	int new_busnr = busnr + delta;
 
 	if (busnr < valid_range->start || busnr > valid_range->end)
 		return;
@@ -1110,11 +1197,21 @@ static void pci_do_move_buses(const int domain, int busnr, int first_moved_busnr
 	if (!bus)
 		return;
 
+	old_primary = bus->primary;
+	strncpy(old_bus_name, dev_name(&bus->dev), sizeof(old_bus_name));
+	sprintf(new_bus_name, "%04x:%02x", domain, new_busnr);
+
 	if (delta > 0) {
 		pci_do_move_buses(domain, busnr + 1, first_moved_busnr,
 				  delta, valid_range);
+		pci_rename_bus_devices(bus, domain, new_busnr);
+		pci_rename_bus(bus, new_bus_name);
+	} else {
+		pci_rename_bus(bus, new_bus_name);
+		pci_rename_bus_devices(bus, domain, new_busnr);
 	}
 
+	memcpy(&old_res, &bus->busn_res, sizeof(old_res));
 	bus->number += delta;
 	bus->busn_res.start += delta;
 
@@ -1132,6 +1229,10 @@ static void pci_do_move_buses(const int domain, int busnr, int first_moved_busnr
 	buses |= (unsigned int)(subordinate << 16);
 	pci_write_config_dword(bus->self, PCI_PRIMARY_BUS, buses);
 
+	dev_warn(&bus->dev, "Renamed bus %s (%02x-%pR) to %s (%02x-%pR)\n",
+		 old_bus_name, old_primary, &old_res,
+		 new_bus_name, bus->primary, &bus->busn_res);
+
 	if (delta < 0)
 		pci_do_move_buses(domain, busnr + 1, first_moved_busnr,
 				  delta, valid_range);
@@ -1192,8 +1293,10 @@ static int pci_move_buses(int domain, int busnr, int delta,
 		}
 	}
 
+	pci_buses_remove_sysfs(domain, busnr, valid_range->end);
 	pci_do_move_buses(domain, busnr, busnr,
 			  delta, valid_range);
+	pci_buses_create_sysfs(domain, busnr + delta, valid_range->end);
 
 	return 0;
 }
-- 
2.23.0

