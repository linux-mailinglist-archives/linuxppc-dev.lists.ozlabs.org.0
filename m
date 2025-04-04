Return-Path: <linuxppc-dev+bounces-7447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B00DA7B6E0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Apr 2025 06:27:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTQY03Mhxz30TJ;
	Fri,  4 Apr 2025 15:26:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743740804;
	cv=none; b=eXqQxQNaaSEZ0bG+Jm5NPX3GyckXojUCA7HbNVi5zHymikR4kVqnjZnGcFH8qx7JRE+n5GRZIgwDE2dmLWqb5fzW6TQMu66TWWDzBb6kAjlRLRzcGnBujc7DuwOQPi1zrTEL1x20Opq2IoGRntsMRlZSJ5KM52PEwIhsYuYpUa7ruhM3kD08YgaQ0bVNgCvt5JZQITReaQlhcnpS0rzHNHa1Pecl30n4125/NoBGpthZd6Ng/rWukn1QCVWL1+sJlspn/A53Zd70DfoR6e76938Z04vewatSYAJL74sOf+iGefYN9+UYP0CXdSUt96hDr3fL5dkrr3DIKDAHVZvdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743740804; c=relaxed/relaxed;
	bh=fAe4Tpi/1CPIcV/MWl6tn64VBoEe+zjbtMnLCtQAsSM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=irR28dzzKj0/ZUDKQyWdJCyOzL4ubYpgGEnrrXCumbuUh0OWVkDFZZTMCQlMcXoCqWuyzhZomBVPI7gs03n1XQzH/5ERSyS9s0sLZIgUQ1/3vV16Xrza6eb7YZOLrr5YczdqtXZ3YNUglNXmUE+kVOSs4NLaORS3JCjC/TlDF7eDmqjbx2DPB0bc593w3umR0eqFGrldBbyLTYW1mtXcuFsS+/H9nXnkcmoOwMrN5JnEGZEWsxklsy+LbH8MVtwLx0JMPQknafPRl+FJ/PyHZfqhcA11S8O0V65rB2wmjk6Sf1ogFXWGf6OPQB9XTpq7z42WjHMnlcXOs1gZLxk9mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=C7cDfb7Z; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=C7cDfb7Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTQXv43dMz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 15:26:39 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 1CA4A8287D28;
	Thu,  3 Apr 2025 23:18:15 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id R4hZ5MRpKMEH; Thu,  3 Apr 2025 23:18:14 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 39B3282888D4;
	Thu,  3 Apr 2025 23:18:14 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 39B3282888D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1743740294; bh=fAe4Tpi/1CPIcV/MWl6tn64VBoEe+zjbtMnLCtQAsSM=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=C7cDfb7ZWARbd4e0IfE7mFEDuZlh28NN29CT0E/NFCq33WYLpOQNX5FhFsO9mh1nn
	 y+dsRpzh+7OU6Hnb5cLUOmyHKAM3udhyuwGFOcJD20EpZCzx+cTr67zaXM5w/mwQsh
	 pF5M94SxPLECbSdw3MOJeVSL66J6BSKL3SEjtodY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ax0Jm6ctHBZu; Thu,  3 Apr 2025 23:18:14 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
	by mail.rptsys.com (Postfix) with ESMTPSA id AC3CD82878A5;
	Thu,  3 Apr 2025 23:18:13 -0500 (CDT)
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	tpearson@raptorengineering.com,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/3] pci/hotplug/pnv_php: Properly clean up allocated IRQs on unplug
Date: Thu,  3 Apr 2025 23:18:08 -0500
Message-Id: <20250404041810.245984-2-sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404041810.245984-1-sanastasio@raptorengineering.com>
References: <20250404041810.245984-1-sanastasio@raptorengineering.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In cases where the root of a nested PCIe bridge configuration is
unplugged, the pnv_php driver would leak the allocated IRQ resources for
the child bridges' hotplug event notifications, resulting in a panic.
Fix this by walking all child buses and deallocating all it's IRQ
resources before calling pci_hp_remove_devices.

Also modify the lifetime of the workqueue at struct pnv_php_slot::wq so
that it is only destroyed in pnv_php_free_slot, instead of
pnv_php_disable_irq. This is required since pnv_php_disable_irq will now
be called by workers triggered by hot unplug interrupts, so the
workqueue needs to stay allocated.

The abridged kernel panic that occurs without this patch is as follows:

  WARNING: CPU: 0 PID: 687 at kernel/irq/msi.c:292 msi_device_data_release+0x6c/0x9c
  CPU: 0 UID: 0 PID: 687 Comm: bash Not tainted 6.14.0-rc5+ #2
  Call Trace:
   msi_device_data_release+0x34/0x9c (unreliable)
   release_nodes+0x64/0x13c
   devres_release_all+0xc0/0x140
   device_del+0x2d4/0x46c
   pci_destroy_dev+0x5c/0x194
   pci_hp_remove_devices+0x90/0x128
   pci_hp_remove_devices+0x44/0x128
   pnv_php_disable_slot+0x54/0xd4
   power_write_file+0xf8/0x18c
   pci_slot_attr_store+0x40/0x5c
   sysfs_kf_write+0x64/0x78
   kernfs_fop_write_iter+0x1b0/0x290
   vfs_write+0x3bc/0x50c
   ksys_write+0x84/0x140
   system_call_exception+0x124/0x230
   system_call_vectored_common+0x15c/0x2ec

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 drivers/pci/hotplug/pnv_php.c | 76 ++++++++++++++++++++++++++---------
 1 file changed, 57 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 573a41869c15..2c07544216fb 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -36,8 +36,10 @@ static void pnv_php_register(struct device_node *dn);
 static void pnv_php_unregister_one(struct device_node *dn);
 static void pnv_php_unregister(struct device_node *dn);
 
+static void pnv_php_enable_irq(struct pnv_php_slot *php_slot);
+
 static void pnv_php_disable_irq(struct pnv_php_slot *php_slot,
-				bool disable_device)
+				bool disable_device, bool disable_msi)
 {
 	struct pci_dev *pdev = php_slot->pdev;
 	u16 ctrl;
@@ -53,19 +55,15 @@ static void pnv_php_disable_irq(struct pnv_php_slot *php_slot,
 		php_slot->irq = 0;
 	}
 
-	if (php_slot->wq) {
-		destroy_workqueue(php_slot->wq);
-		php_slot->wq = NULL;
-	}
-
-	if (disable_device) {
+	if (disable_device || disable_msi) {
 		if (pdev->msix_enabled)
 			pci_disable_msix(pdev);
 		else if (pdev->msi_enabled)
 			pci_disable_msi(pdev);
+	}
 
+	if (disable_device)
 		pci_disable_device(pdev);
-	}
 }
 
 static void pnv_php_free_slot(struct kref *kref)
@@ -74,7 +72,8 @@ static void pnv_php_free_slot(struct kref *kref)
 					struct pnv_php_slot, kref);
 
 	WARN_ON(!list_empty(&php_slot->children));
-	pnv_php_disable_irq(php_slot, false);
+	pnv_php_disable_irq(php_slot, false, false);
+	destroy_workqueue(php_slot->wq);
 	kfree(php_slot->name);
 	kfree(php_slot);
 }
@@ -561,8 +560,42 @@ static int pnv_php_reset_slot(struct hotplug_slot *slot, bool probe)
 static int pnv_php_enable_slot(struct hotplug_slot *slot)
 {
 	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
+	u32 prop32;
+	int ret;
+
+	ret = pnv_php_enable(php_slot, true);
+	if (ret)
+		return ret;
 
-	return pnv_php_enable(php_slot, true);
+	/* (Re-)enable interrupt if the slot supports surprise hotplug */
+	ret = of_property_read_u32(php_slot->dn, "ibm,slot-surprise-pluggable", &prop32);
+	if (!ret && prop32)
+		pnv_php_enable_irq(php_slot);
+
+	return 0;
+}
+
+/**
+ * Disable any hotplug interrupts for all slots on the provided bus, as well as
+ * all downstream slots in preparation for a hot unplug.
+ */
+static int pnv_php_disable_all_irqs(struct pci_bus *bus)
+{
+	struct pci_bus *child_bus;
+	struct pci_slot *cur_slot;
+
+	/* First go down child busses */
+	list_for_each_entry(child_bus, &bus->children, node)
+		pnv_php_disable_all_irqs(child_bus);
+
+	/* Disable IRQs for all pnv_php slots on this bus */
+	list_for_each_entry(cur_slot, &bus->slots, list) {
+		struct pnv_php_slot *php_slot = to_pnv_php_slot(cur_slot->hotplug);
+
+		pnv_php_disable_irq(php_slot, false, true);
+	}
+
+	return 0;
 }
 
 static int pnv_php_disable_slot(struct hotplug_slot *slot)
@@ -579,6 +612,10 @@ static int pnv_php_disable_slot(struct hotplug_slot *slot)
 	    php_slot->state != PNV_PHP_STATE_REGISTERED)
 		return 0;
 
+
+	/* Free all irq resources from slot and all child slots before remove */
+	pnv_php_disable_all_irqs(php_slot->bus);
+
 	/* Remove all devices behind the slot */
 	pci_lock_rescan_remove();
 	pci_hp_remove_devices(php_slot->bus);
@@ -647,6 +684,15 @@ static struct pnv_php_slot *pnv_php_alloc_slot(struct device_node *dn)
 		return NULL;
 	}
 
+	/* Allocate workqueue for this slot's interrupt handling */
+	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
+	if (!php_slot->wq) {
+		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");
+		kfree(php_slot->name);
+		kfree(php_slot);
+		return NULL;
+	}
+
 	if (dn->child && PCI_DN(dn->child))
 		php_slot->slot_no = PCI_SLOT(PCI_DN(dn->child)->devfn);
 	else
@@ -843,14 +889,6 @@ static void pnv_php_init_irq(struct pnv_php_slot *php_slot, int irq)
 	u16 sts, ctrl;
 	int ret;
 
-	/* Allocate workqueue */
-	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
-	if (!php_slot->wq) {
-		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");
-		pnv_php_disable_irq(php_slot, true);
-		return;
-	}
-
 	/* Check PDC (Presence Detection Change) is broken or not */
 	ret = of_property_read_u32(php_slot->dn, "ibm,slot-broken-pdc",
 				   &broken_pdc);
@@ -869,7 +907,7 @@ static void pnv_php_init_irq(struct pnv_php_slot *php_slot, int irq)
 	ret = request_irq(irq, pnv_php_interrupt, IRQF_SHARED,
 			  php_slot->name, php_slot);
 	if (ret) {
-		pnv_php_disable_irq(php_slot, true);
+		pnv_php_disable_irq(php_slot, true, true);
 		SLOT_WARN(php_slot, "Error %d enabling IRQ %d\n", ret, irq);
 		return;
 	}
-- 
2.30.2


