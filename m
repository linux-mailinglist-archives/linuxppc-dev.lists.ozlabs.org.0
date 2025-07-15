Return-Path: <linuxppc-dev+bounces-10261-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6076CB068B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 23:39:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhXdC14wHz2y8p;
	Wed, 16 Jul 2025 07:39:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752615551;
	cv=none; b=edH5qOw56EotSPuFiew35TDk1BAuj5VmcCKZ+UNcaHp1d5rPrNL63RQFt8qNw30MmMhFKYIANIhZBJOVysZK9lwuzgBRk8rm5+9jLoZM/NKcFnv4G2XAixwVkQhZVjpy0Xus05eTPb82igxDoUPE8RQMSJuQMqhOOcGwo041fYlRgTOzJb6LKB37DdGBi3vRaXzQ0beze3CHAbkkBVSmWMs1Mq45wRpRqHa2AKQ3Xl0vCJbVtdMWibWQfU4vMD3Qd93US6FOaW9362H6k4fHRKDRUw9PXpxo4vVL02gpocTXIkPJqphS6gT9rY6O5QTv/8ZqGI1kITQajta9Yef9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752615551; c=relaxed/relaxed;
	bh=8PjzjruFthJ/9WkYWAPNc3CMtV9pv0s1uiS/VXTCoIY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=S5VrwOcIqiZOx/E+j5TYxIqEB4UgeyY9SDImpIMGDud/t5Xm0PW+GG9rO3YaarTuiYs2KR3wTW138nU4CY4o1Soh2MrELj7CHIxaKheiwf5+tvCBa6lUT7m00E3KbukKBAOON2V5UWpBQ+EPKMR4bqJux1+Rz1P9VlI4aSO4RxtxNxjuCVk7a/ktu1Bt/wbMg/mDYs8CqMt+fcbTBIXLFi+VmNQVWGZ0zBKeMWqmH5HXTu331Q1EPXBSUAN4Rnc/P0xHNmepUvEA06pTP2fXVRrj8or3eixZvw3hMa8nUoIvNJ2fTOUoK7CvtrW4OOOD1XNbqnRFIOgRiCTwGrFheg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=NqKmlqCb; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=NqKmlqCb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhXdB2bdhz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jul 2025 07:39:10 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 902FC8287698;
	Tue, 15 Jul 2025 16:39:08 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 5U_tYvSKFoQ6; Tue, 15 Jul 2025 16:39:07 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 47CD68288591;
	Tue, 15 Jul 2025 16:39:07 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 47CD68288591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1752615547; bh=8PjzjruFthJ/9WkYWAPNc3CMtV9pv0s1uiS/VXTCoIY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=NqKmlqCb9OR06Ks97mDo2JSnewgMuR2fKo0w3RKxNZNf1DqsvtQIgGruixPvIsNYd
	 VSStFlkxfJqR0Y0qAoDiJOaCyGeHRa7y8k4CC77fjM710BMfVRd0J3h+s25/gtH8Pb
	 gvjUKpnCcUWccv+eRoC3I4C6HNGeanl7DZpPfn/0=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gc4u1bx2RXq7; Tue, 15 Jul 2025 16:39:07 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 118AF8287698;
	Tue, 15 Jul 2025 16:39:07 -0500 (CDT)
Date: Tue, 15 Jul 2025 16:39:06 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <171044224.1359864.1752615546988.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com>
References: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v3 5/6] PCI: pnv_php: Fix surprise plug detection and
 recovery
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
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC138 (Linux)/8.5.0_GA_3042)
Thread-Topic: pnv_php: Fix surprise plug detection and recovery
Thread-Index: XyF2OaMn/3q+H+nwsGaxXLVF4U4PFwXmHrh/
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The existing PowerNV hotplug code did not handle surprise plug events
correctly, leading to a complete failure of the hotplug system after
device removal and a required reboot to detect new devices.

This comes down to two issues:
1.) When a device is surprise removed, oftentimes the bridge upstream
    port will cause a PE freeze on the PHB.  If this freeze is not
    cleared, the MSI interrupts from the bridge hotplug notification
    logic will not be received by the kernel, stalling all plug events
    on all slots associated with the PE.
2.) When a device is removed from a slot, regardless of surprise or
    programmatic removal, the associated PHB/PE ls left frozen.
    If this freeze is not cleared via a fundamental reset, skiboot
    is unable to clear the freeze and cannot retrain / rescan the
    slot.  This also requires a reboot to clear the freeze and redetect
    the device in the slot.

Issue the appropriate unfreeze and rescan commands on hotplug events,
and don't oops on hotplug if pci_bus_to_OF_node() returns NULL.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/pci-hotplug.c |   3 +
 drivers/pci/hotplug/pnv_php.c     | 108 +++++++++++++++++++++++++++++-
 2 files changed, 108 insertions(+), 3 deletions(-)

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
index bac8af3df41a..3533f7f23b71 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -4,12 +4,14 @@
  *
  * Copyright Gavin Shan, IBM Corporation 2016.
  * Copyright (C) 2025 Raptor Engineering, LLC
+ * Copyright (C) 2025 Raptor Computing Systems, LLC
  */
 
 #include <linux/bitfield.h>
 #include <linux/libfdt.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/delay.h>
 #include <linux/pci_hotplug.h>
 #include <linux/of_fdt.h>
 
@@ -469,6 +471,59 @@ static int pnv_php_set_attention_state(struct hotplug_slot *slot, u8 state)
 	return 0;
 }
 
+static int pnv_php_activate_slot(struct pnv_php_slot *php_slot,
+				 struct hotplug_slot *slot)
+{
+	int ret, i;
+
+	/*
+	 * Issue initial slot activation command to firmware
+	 *
+	 * Firmware will power slot on, attempt to train the link, and discover any downstream devices
+	 * If this process fails, firmware will return an error code and an invalid device tree
+	 * Failure can be caused for multiple reasons, including a faulty downstream device,
+	 * poor connection to the downstream device, or a previously latched PHB fence.
+	 * On failure, issue fundamental reset up to three times before aborting.
+	 */
+	ret = pnv_php_set_slot_power_state(slot, OPAL_PCI_SLOT_POWER_ON);
+	if (ret) {
+		SLOT_WARN(
+			php_slot,
+			"PCI slot activation failed with error code %d, possible frozen PHB",
+			ret);
+		SLOT_WARN(
+			php_slot,
+			"Attempting complete PHB reset before retrying slot activation\n");
+		for (i = 0; i < 3; i++) {
+			/*
+			 * Slot activation failed, PHB may be fenced from a
+			 * prior device failure.
+			 *
+			 * Use the OPAL fundamental reset call to both try a
+			 * device reset and clear any potentially active PHB
+			 * fence / freeze.
+			 */
+			SLOT_WARN(php_slot, "Try %d...\n", i + 1);
+			pci_set_pcie_reset_state(php_slot->pdev,
+						 pcie_warm_reset);
+			msleep(250);
+			pci_set_pcie_reset_state(php_slot->pdev,
+						 pcie_deassert_reset);
+
+			ret = pnv_php_set_slot_power_state(
+				slot, OPAL_PCI_SLOT_POWER_ON);
+			if (!ret)
+				break;
+		}
+
+		if (i >= 3)
+			SLOT_WARN(php_slot,
+				  "Failed to bring slot online, aborting!\n");
+	}
+
+	return ret;
+}
+
 static int pnv_php_enable(struct pnv_php_slot *php_slot, bool rescan)
 {
 	struct hotplug_slot *slot = &php_slot->slot;
@@ -531,7 +586,7 @@ static int pnv_php_enable(struct pnv_php_slot *php_slot, bool rescan)
 		goto scan;
 
 	/* Power is off, turn it on and then scan the slot */
-	ret = pnv_php_set_slot_power_state(slot, OPAL_PCI_SLOT_POWER_ON);
+	ret = pnv_php_activate_slot(php_slot, slot);
 	if (ret)
 		return ret;
 
@@ -836,16 +891,63 @@ static int pnv_php_enable_msix(struct pnv_php_slot *php_slot)
 	return entry.vector;
 }
 
+static void
+pnv_php_detect_clear_suprise_removal_freeze(struct pnv_php_slot *php_slot)
+{
+	struct pci_dev *pdev = php_slot->pdev;
+	struct eeh_dev *edev;
+	struct eeh_pe *pe;
+	int i, rc;
+
+	/*
+	 * When a device is surprise removed from a downstream bridge slot,
+	 * the upstream bridge port can still end up frozen due to related EEH
+	 * events, which will in turn block the MSI interrupts for slot hotplug
+	 * detection.
+	 *
+	 * Detect and thaw any frozen upstream PE after slot deactivation...
+	 */
+	edev = pci_dev_to_eeh_dev(pdev);
+	pe = edev ? edev->pe : NULL;
+	rc = eeh_pe_get_state(pe);
+	if ((rc == -ENODEV) || (rc == -ENOENT)) {
+		SLOT_WARN(
+			php_slot,
+			"Upstream bridge PE state unknown, hotplug detect may fail\n");
+	} else {
+		if (pe->state & EEH_PE_ISOLATED) {
+			SLOT_WARN(
+				php_slot,
+				"Upstream bridge PE %02x frozen, thawing...\n",
+				pe->addr);
+			for (i = 0; i < 3; i++)
+				if (!eeh_unfreeze_pe(pe))
+					break;
+			if (i >= 3)
+				SLOT_WARN(
+					php_slot,
+					"Unable to thaw PE %02x, hotplug detect will fail!\n",
+					pe->addr);
+			else
+				SLOT_WARN(php_slot,
+					  "PE %02x thawed successfully\n",
+					  pe->addr);
+		}
+	}
+}
+
 static void pnv_php_event_handler(struct work_struct *work)
 {
 	struct pnv_php_event *event =
 		container_of(work, struct pnv_php_event, work);
 	struct pnv_php_slot *php_slot = event->php_slot;
 
-	if (event->added)
+	if (event->added) {
 		pnv_php_enable_slot(&php_slot->slot);
-	else
+	} else {
 		pnv_php_disable_slot(&php_slot->slot);
+		pnv_php_detect_clear_suprise_removal_freeze(php_slot);
+	}
 
 	kfree(event);
 }
-- 
2.39.5

