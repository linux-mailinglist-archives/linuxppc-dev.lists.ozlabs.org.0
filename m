Return-Path: <linuxppc-dev+bounces-10764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D9B1EC0C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 17:31:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bz7Kt1BLNz2xck;
	Sat,  9 Aug 2025 01:31:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754667090;
	cv=none; b=Iy48B6dyWcqDqpsWFk1ZrNAnW3I3QWhUToaQuVgc/4yDbuJsXJD6HLbYgZdytBz+8UHdb6QOKsXYLkA3biwllsbPWrVT49MVoIDABGtwARDjyKzxqSjmWUHr+AgzohZn/ipyc+ydtR2whR229wT50KRPBBmnIPPp0U4CiJCH75qH0XommDhQZBNPlhfVwK1edFUyh7ybjXvg5AJGjIXTSZrkYcNmAItAct/uV9nYMTNWv0fPVdoMAS0QQBveAdfkFb4JM6jhGYEOxquVqglKO4sQ6TuUv8N43nhQ1BiiHVplzpVxjFoRbwzCloKeqi2kZMrt4mMD93gG6jF616JMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754667090; c=relaxed/relaxed;
	bh=Pdv20NrVsDZ97emzHMMSxFmsRm0Ks6qauZuelLBM7Co=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MOYCL2vFd5S1GfzOT91tTKnf+pwvV8SMaZXL4FtEugMC7EM+5gEgCEb+7hBYUltwsgCIxRWpgo4e8gzcetld1Xigxz2DrYpRjruFliHqBisciWslpLkPCH3+f4AV3Hxay3GvOKwqaXVBuYEA04ojObokWvUgM9kL13m94K4yHiG8uN6c1cIyeb2EblkqaVd4uIyDx8iTHWpy/vpOQWkS1AyNyQLNcmtWEwoODirMud//wjTAkFgvB7kvzXQCC3FSgODEYFM8oJg20p00tP5cSZLQhhcJe+jFk8w3SDSXZMeYsalxjWz6O8ZybJSVCHKfYZZYhQ9Yvz9PxRA0Rrw88w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RHdhpt+g; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RHdhpt+g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bz7Ks0N50z2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Aug 2025 01:31:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13D88A56A15;
	Fri,  8 Aug 2025 15:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2074BC4CEF6;
	Fri,  8 Aug 2025 15:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754667086;
	bh=8Iej5uQHq7Y2Cnb+h8iyLE18Z+x8JbvqwRaBoFb61fs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RHdhpt+gopgkSP0XLxV1Demn+maLZOl2nxsMUHkgFrnn2/ok8EdkBSV4G4QCfgWq2
	 YANwyipbmZqsXwzUdsnooTqPXmX9bndG9Jdrcvi+5IkhiM048QukVwjLhfxSiW+CMa
	 MYViN/dJPHLYtLe9YWbU3CnmG7PO0EtW8cCD2s6GP8SUBwGnFZHmVrQuzre5/rG3td
	 NnenUGQynTp8LmDMToaQ2sxCbHLKdcQqZq1mTp9zSFtcuMRYC/CMPsC7ansXTh3tqu
	 RWZ25Vsnwkh5Cs0FUTAJZtq3OF1VlogIAC588AEQ+wHfZoOIkuIPXSeXKIXDic+GzZ
	 tvkOA9NAHQL3g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.16-5.10] PCI: pnv_php: Clean up allocated IRQs on unplug
Date: Fri,  8 Aug 2025 11:30:54 -0400
Message-Id: <20250808153054.1250675-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808153054.1250675-1-sashal@kernel.org>
References: <20250808153054.1250675-1-sashal@kernel.org>
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
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Timothy Pearson <tpearson@raptorengineering.com>

[ Upstream commit 4668619092554e1b95c9a5ac2941ca47ba6d548a ]

When the root of a nested PCIe bridge configuration is unplugged, the
pnv_php driver leaked the allocated IRQ resources for the child bridges'
hotplug event notifications, resulting in a panic.

Fix this by walking all child buses and deallocating all its IRQ resources
before calling pci_hp_remove_devices().

Also modify the lifetime of the workqueue at struct pnv_php_slot::wq so
that it is only destroyed in pnv_php_free_slot(), instead of
pnv_php_disable_irq(). This is required since pnv_php_disable_irq() will
now be called by workers triggered by hot unplug interrupts, so the
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
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
[bhelgaas: tidy comments]
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Link: https://patch.msgid.link/2013845045.1359852.1752615367790.JavaMail.zimbra@raptorengineeringinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit, here is my assessment:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Fixes a Real Bug with Kernel Panic**: The commit explicitly fixes a
   kernel panic (WARNING and crash) that occurs when unplugging nested
   PCIe bridge configurations. The panic trace shows it happens in
   `msi_device_data_release()` during hotplug operations, which is a
   serious stability issue.

2. **Clear Resource Leak Fix**: The commit addresses a specific IRQ
   resource leak where child bridge IRQ resources were not being
   properly cleaned up during hot unplug operations. This is a real bug
   that affects system stability and resource management.

3. **Small and Contained Fix**: The changes are well-contained within
   the PowerNV PHP (PCI Hotplug) driver. The modifications include:
   - Adding a new `disable_msi` parameter to `pnv_php_disable_irq()`
   - Moving workqueue destruction to `pnv_php_free_slot()`
   - Adding functions to recursively disable IRQs for child slots
   - Re-enabling IRQ on slot enable for surprise hotplug support

4. **Meets Stable Criteria**:
   - Fixes a real bug (kernel panic/crash)
   - Is obviously correct - properly cleans up resources
   - Has clear testing evidence (fixes the described panic)
   - Size is reasonable (under 100 lines of actual changes)
   - Doesn't introduce new features or architectural changes

5. **Critical for PowerNV Platform Users**: This affects IBM PowerNV
   platforms using PCIe hotplug functionality, where nested bridge
   configurations can cause system crashes without this fix.

6. **Well-Documented Problem**: The commit message provides a clear
   description of the issue, including the kernel panic trace, making it
   easy to verify the problem and solution.

The fix follows proper cleanup patterns by ensuring IRQ resources are
freed before removing devices, and properly manages the lifetime of the
workqueue to avoid use-after-free scenarios. This is exactly the type of
bug fix that stable kernels should include to maintain system stability.

 drivers/pci/hotplug/pnv_php.c | 96 ++++++++++++++++++++++++++++-------
 1 file changed, 77 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index aaa8e0a2a893..5476c9e7760d 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -3,6 +3,7 @@
  * PCI Hotplug Driver for PowerPC PowerNV platform.
  *
  * Copyright Gavin Shan, IBM Corporation 2016.
+ * Copyright (C) 2025 Raptor Engineering, LLC
  */
 
 #include <linux/bitfield.h>
@@ -36,8 +37,10 @@ static void pnv_php_register(struct device_node *dn);
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
@@ -53,19 +56,15 @@ static void pnv_php_disable_irq(struct pnv_php_slot *php_slot,
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
@@ -74,7 +73,8 @@ static void pnv_php_free_slot(struct kref *kref)
 					struct pnv_php_slot, kref);
 
 	WARN_ON(!list_empty(&php_slot->children));
-	pnv_php_disable_irq(php_slot, false);
+	pnv_php_disable_irq(php_slot, false, false);
+	destroy_workqueue(php_slot->wq);
 	kfree(php_slot->name);
 	kfree(php_slot);
 }
@@ -588,8 +588,58 @@ static int pnv_php_reset_slot(struct hotplug_slot *slot, bool probe)
 static int pnv_php_enable_slot(struct hotplug_slot *slot)
 {
 	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
+	u32 prop32;
+	int ret;
+
+	ret = pnv_php_enable(php_slot, true);
+	if (ret)
+		return ret;
+
+	/* (Re-)enable interrupt if the slot supports surprise hotplug */
+	ret = of_property_read_u32(php_slot->dn, "ibm,slot-surprise-pluggable",
+				   &prop32);
+	if (!ret && prop32)
+		pnv_php_enable_irq(php_slot);
 
-	return pnv_php_enable(php_slot, true);
+	return 0;
+}
+
+/*
+ * Disable any hotplug interrupts for all slots on the provided bus, as well as
+ * all downstream slots in preparation for a hot unplug.
+ */
+static int pnv_php_disable_all_irqs(struct pci_bus *bus)
+{
+	struct pci_bus *child_bus;
+	struct pci_slot *slot;
+
+	/* First go down child buses */
+	list_for_each_entry(child_bus, &bus->children, node)
+		pnv_php_disable_all_irqs(child_bus);
+
+	/* Disable IRQs for all pnv_php slots on this bus */
+	list_for_each_entry(slot, &bus->slots, list) {
+		struct pnv_php_slot *php_slot = to_pnv_php_slot(slot->hotplug);
+
+		pnv_php_disable_irq(php_slot, false, true);
+	}
+
+	return 0;
+}
+
+/*
+ * Disable any hotplug interrupts for all downstream slots on the provided
+ * bus in preparation for a hot unplug.
+ */
+static int pnv_php_disable_all_downstream_irqs(struct pci_bus *bus)
+{
+	struct pci_bus *child_bus;
+
+	/* Go down child buses, recursively deactivating their IRQs */
+	list_for_each_entry(child_bus, &bus->children, node)
+		pnv_php_disable_all_irqs(child_bus);
+
+	return 0;
 }
 
 static int pnv_php_disable_slot(struct hotplug_slot *slot)
@@ -606,6 +656,13 @@ static int pnv_php_disable_slot(struct hotplug_slot *slot)
 	    php_slot->state != PNV_PHP_STATE_REGISTERED)
 		return 0;
 
+	/*
+	 * Free all IRQ resources from all child slots before remove.
+	 * Note that we do not disable the root slot IRQ here as that
+	 * would also deactivate the slot hot (re)plug interrupt!
+	 */
+	pnv_php_disable_all_downstream_irqs(php_slot->bus);
+
 	/* Remove all devices behind the slot */
 	pci_lock_rescan_remove();
 	pci_hp_remove_devices(php_slot->bus);
@@ -674,6 +731,15 @@ static struct pnv_php_slot *pnv_php_alloc_slot(struct device_node *dn)
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
@@ -870,14 +936,6 @@ static void pnv_php_init_irq(struct pnv_php_slot *php_slot, int irq)
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
@@ -896,7 +954,7 @@ static void pnv_php_init_irq(struct pnv_php_slot *php_slot, int irq)
 	ret = request_irq(irq, pnv_php_interrupt, IRQF_SHARED,
 			  php_slot->name, php_slot);
 	if (ret) {
-		pnv_php_disable_irq(php_slot, true);
+		pnv_php_disable_irq(php_slot, true, true);
 		SLOT_WARN(php_slot, "Error %d enabling IRQ %d\n", ret, irq);
 		return;
 	}
-- 
2.39.5


