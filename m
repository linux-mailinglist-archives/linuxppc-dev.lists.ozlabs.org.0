Return-Path: <linuxppc-dev+bounces-9440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C72ADE254
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 06:23:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMVwV5SrFz30Vf;
	Wed, 18 Jun 2025 14:23:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750220602;
	cv=none; b=iVBWgNqU+NUY3XHkffMWrSDy+hVJquCtiNjhm8qOKuJMcZGefm7iEgxzeNwSIAAOyZD4RxZGLC9xJdnm7H6mYNiUhFUCzyD1RtSeHhq/bOrCyPiicvwhBjIbFc7XTUDEwoBztaIhUArKcINk3fC1Wuqv9gXcdRGMruk3O+6SneHTGmblEmtP2mWlZf6BK4/8Se1z9Xtr/+BzDZU4JSivfrB629qOfZAvk/nMEFV7uPDrBKJBGc25hzWH/BeGX60gbgcpnfouQxeMVmMBo/oGtLuo4+XWQB2GZrZvxPmdJNK/srso7y3PH0cWG5zCKDH3X+2+rhJeZKwMc1ZFOpcEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750220602; c=relaxed/relaxed;
	bh=fCsTSff5vaGDaT2BMduCiomdUgfjVArRaBm+jjoQMZY=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=UzNyMg8FlvkcdBZVrK/NO4y+Fpf768HwZvP+ILEh4tMQC62KG5MVWk8xgdOfXH4WL7lVbEXi/ui0WHBjuymgi8eeIXAEMhtLTWzlYcNu+n+1JERHkE8xO++ut+2W/HgjVTPW42PfKi4hg1tMVCP+ofDc/bm66ho2azDMo0TsNAYa6Yf4HlUd/QHIiCUtotEdQvb6kMdj5WG8WyhSxL2Uytu1FJXdjU4GXH2GW2pM5fnnw4xn1yEK9886CYXTcO2d37xj354gsP1ZjPMkiTqeq+v/nN8JpHesxJZgAJcmOpTFAWNCjgIv0RGbAObDT+j6oXRf24EaPA2vTthq6eElBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=XaKZNXR5; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=XaKZNXR5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMVwT6tf1z30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 14:23:21 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2BEF782887A2;
	Tue, 17 Jun 2025 23:23:20 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id MA41jKSfWApN; Tue, 17 Jun 2025 23:23:19 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 1A573828884A;
	Tue, 17 Jun 2025 23:23:19 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 1A573828884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750220599; bh=fCsTSff5vaGDaT2BMduCiomdUgfjVArRaBm+jjoQMZY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=XaKZNXR5jjouqXxbWzi3lVVT4s81rIwrLM0zXlb8mDmoxDQYVtOeWtKC9QOKHt5Nr
	 8R+Z/nXkMrHkhKCPy3DIwB9XNI2gECoW4ZOSGb8I33f2reQblsZff4ZAG9jBI7PQy5
	 2UowpXCzA0479QKLpx4D2UcCbNjKFVxIw11pwrjc=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZTP6rVgH_RJk; Tue, 17 Jun 2025 23:23:18 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E84B782887A2;
	Tue, 17 Jun 2025 23:23:18 -0500 (CDT)
Date: Tue, 17 Jun 2025 23:23:18 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Timothy Pearson <tpearson@raptorengineering.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <1601775800.1309772.1750220598846.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 5/6] pci/hotplug/pnv_php: Fix surprise plug detection and
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Index: qHjNaiRKXINBkueoTfScThdzuWuQAw==
Thread-Topic: pci/hotplug/pnv_php: Fix surprise plug detection and
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

 recovery

The existing PowerNV hotplug code did not handle suprise plug events
correctly, leading to a complete failure of the hotplug system after
device removal and a required reboot to detect new devices.

This comes down to three issues:
1.) When a device is suprise removed, oftentimes the bridge upstream
    port will cause a PE freeze on the PHB.  If this freeze is not
    cleared, the MSI interrupts from the bridge hotplug notification
    logic will not be received by the kernel, stalling all plug events
    on all slots associated with the PE.
2.) When a device is removed from a slot, regardless of suprise or
    programmatic removal, the associated PHB/PE ls left frozen.
    If this freeze is not cleared via a fundamental reset, skiboot
    is unable to clear the freeze and cannot retrain / rescan the
    slot.  This also requires a reboot to clear the freeze and redetect
    the device in the slot.
3.) When interrupts are disabled on a slot, we incorrectly disable the
    upstream slot interrupt along with the child port interrupts, causing
    future hotplug events on the slot to be lost.

Issue the appropriate unfreeze and rescan commands on hotplug events,
keep the upstream slot interrupts enabled on slot deactivation, and
don't oops on hotplug if pci_bus_to_OF_node() returns NULL.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/pci-hotplug.c |  3 ++
 drivers/pci/hotplug/pnv_php.c     | 71 +++++++++++++++++++++++++++++--
 2 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
index 9ea74973d78d..6f444d0822d8 100644
--- a/arch/powerpc/kernel/pci-hotplug.c
+++ b/arch/powerpc/kernel/pci-hotplug.c
@@ -141,6 +141,9 @@ void pci_hp_add_devices(struct pci_bus *bus)
 	struct pci_controller *phb;
 	struct device_node *dn = pci_bus_to_OF_node(bus);
 
+	if (!dn)
+		return;
+
 	phb = pci_bus_to_host(bus);
 
 	mode = PCI_PROBE_NORMAL;
diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 1a734adb5b10..32f26f0d1ca6 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -9,6 +9,7 @@
 #include <linux/libfdt.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/delay.h>
 #include <linux/pci_hotplug.h>
 #include <linux/of_fdt.h>
 
@@ -473,7 +474,7 @@ static int pnv_php_enable(struct pnv_php_slot *php_slot, bool rescan)
 	struct hotplug_slot *slot = &php_slot->slot;
 	uint8_t presence = OPAL_PCI_SLOT_EMPTY;
 	uint8_t power_status = OPAL_PCI_SLOT_POWER_ON;
-	int ret;
+	int ret, i;
 
 	/* Check if the slot has been configured */
 	if (php_slot->state != PNV_PHP_STATE_REGISTERED)
@@ -531,6 +532,27 @@ static int pnv_php_enable(struct pnv_php_slot *php_slot, bool rescan)
 
 	/* Power is off, turn it on and then scan the slot */
 	ret = pnv_php_set_slot_power_state(slot, OPAL_PCI_SLOT_POWER_ON);
+	if (ret) {
+		SLOT_WARN(php_slot, "PCI slot activation failed with error code %d, possible frozen PHB", ret);
+		SLOT_WARN(php_slot, "Attempting complete PHB reset before retrying slot activation\n");
+		for (i = 0; i < 3; i++) {
+			/* Slot activation failed, PHB may be fenced from a prior device failure
+			 * Use the OPAL fundamental reset call to both try a device reset and clear
+			 * any potentially active PHB fence / freeze
+			 */
+			SLOT_WARN(php_slot, "Try %d...\n", i + 1);
+			pci_set_pcie_reset_state(php_slot->pdev, pcie_warm_reset);
+			msleep(250);
+			pci_set_pcie_reset_state(php_slot->pdev, pcie_deassert_reset);
+
+			ret = pnv_php_set_slot_power_state(slot, OPAL_PCI_SLOT_POWER_ON);
+			if (!ret)
+				break;
+		}
+
+		if (i >= 3)
+			SLOT_WARN(php_slot, "Failed to bring slot online, aborting!\n");
+	}
 	if (ret)
 		return ret;
 
@@ -625,6 +647,21 @@ static int pnv_php_disable_all_irqs(struct pci_bus *bus)
 	return 0;
 }
 
+/**
+ * Disable any hotplug interrupts for all downstream slots on the provided bus in
+ * preparation for a hot unplug.
+ */
+static int pnv_php_disable_all_downstream_irqs(struct pci_bus *bus)
+{
+	struct pci_bus *child_bus;
+
+	/* Go down child busses, recursively deactivating their IRQs */
+	list_for_each_entry(child_bus, &bus->children, node)
+		pnv_php_disable_all_irqs(child_bus);
+
+	return 0;
+}
+
 static int pnv_php_disable_slot(struct hotplug_slot *slot)
 {
 	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
@@ -639,9 +676,11 @@ static int pnv_php_disable_slot(struct hotplug_slot *slot)
 	    php_slot->state != PNV_PHP_STATE_REGISTERED)
 		return 0;
 
-
-	/* Free all irq resources from slot and all child slots before remove */
-	pnv_php_disable_all_irqs(php_slot->bus);
+	/* Free all IRQ resources from all child slots before remove.
+	 * Note that we do not disable the root slot IRQ here as that
+	 * would also deactivate the slot hot (re)plug interrupt!
+	 */
+	pnv_php_disable_all_downstream_irqs(php_slot->bus);
 
 	/* Remove all devices behind the slot */
 	pci_lock_rescan_remove();
@@ -823,12 +862,36 @@ static void pnv_php_event_handler(struct work_struct *work)
 	struct pnv_php_event *event =
 		container_of(work, struct pnv_php_event, work);
 	struct pnv_php_slot *php_slot = event->php_slot;
+	struct pci_dev *pdev = php_slot->pdev;
+	struct eeh_dev *edev;
+	struct eeh_pe *pe;
+	int i;
 
 	if (event->added)
 		pnv_php_enable_slot(&php_slot->slot);
 	else
 		pnv_php_disable_slot(&php_slot->slot);
 
+	if (!event->added) {
+		/* When a device is surprise removed from a downstream bridge slot, the upstream bridge port
+		 * can still end up frozen due to related EEH events, which will in turn block the MSI interrupts
+		 * for slot hotplug detection.  Detect and thaw any frozen upstream PE after slot deactivation...
+		 */
+		edev = pci_dev_to_eeh_dev(pdev);
+		pe = edev ? edev->pe : NULL;
+		eeh_ops->get_state(pe, NULL);
+		if (pe->state & EEH_PE_ISOLATED) {
+			SLOT_WARN(php_slot, "Upstream bridge PE %02x frozen, thawing...\n", pe->addr);
+			for (i = 0; i < 3; i++)
+				if (!eeh_unfreeze_pe(pe))
+					break;
+			if (i >= 3)
+				SLOT_WARN(php_slot, "Unable to thaw PE %02x, hotplug detect will fail!\n", pe->addr);
+			else
+				SLOT_WARN(php_slot, "PE %02x thawed successfully\n", pe->addr);
+		}
+	}
+
 	kfree(event);
 }
 
-- 
2.39.5

