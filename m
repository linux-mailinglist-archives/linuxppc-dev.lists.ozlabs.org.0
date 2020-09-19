Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A4270FCB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 19:29:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtyPb5xk6zDqyS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 03:29:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.67; helo=mail-lf1-f67.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtyN06l14zDqty
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 03:28:13 +1000 (AEST)
Received: by mail-lf1-f67.google.com with SMTP id b22so9536024lfs.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 10:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=desQONGfMz+WJlXv9CdwcjavRq+NWN5KqFCQQMWi48w=;
 b=j8kJDmIWJFAXxmgfR5ZKo6fUjewC6HW4e6ISQJkfLjKFsF8I8+BVyMr62r+HlNJ9Pk
 uQTwRFqswnM3fd3lfuEhSXS5c5iPmOHq/bGT5M61TDuhMYK95QhZLotXinF+eF610h1E
 9ErADKWsRVsL4KzRKr3MI53udfzFffQID1t08WA/em26aTe2YT/xIFfp2/Kpzftwi3ic
 Nw50FjcqGZrQFcFpYdWberNE7oOS8Cx/P5ntnO1zRUZ+B8J5fTS9mkyyxx2slBGK0Xex
 HPXcMKa6HbCgxZvsYcdnCwGVLU5LLCFsgbFeN1LEBxFSoVNsQ+YYSCgR3XPwCpsqhtET
 vYkQ==
X-Gm-Message-State: AOAM530iZF65Py0OQhZssd4LgIJPBWL3e7CdkygXjX1VaurSKLZootqf
 wTUKixqY6P7I9XzwsXEYfF8=
X-Google-Smtp-Source: ABdhPJy8NHLxSmtGcjMd8e1irtTjyaPz+cXo0xmZ5LoOsPLc05O6w+0Kh9FFVr94HcTFzVdu9h7blg==
X-Received: by 2002:a19:254:: with SMTP id 81mr11757373lfc.405.1600536488001; 
 Sat, 19 Sep 2020 10:28:08 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id q22sm1357990lfr.258.2020.09.19.10.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 10:28:07 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI: Convert enum pci_bus_flags to bit fields in struct
 pci_bus
Date: Sat, 19 Sep 2020 17:28:06 +0000
Message-Id: <20200919172806.1134054-1-kw@linux.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Borislav Petkov <bp@alien8.de>, Colin Ian King <colin.king@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>, Myron Stowe <myron.stowe@redhat.com>,
 Ingo Molnar <mingo@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All the flags defined in the enum pci_bus_flags are used to determine
whether a particular feature of a PCI bus is available or not - features
are also often disabled via architecture or device-specific quirk.

These flags are tightly coupled with a PCI buses and PCI bridges and
primarily used in simple binary on/off manner to check whether something
is enabled or disabled, and have almost no other users (with an
exception of the x86 architecture-specific quirk) outside of the PCI
device drivers space.

Therefore, convert enum pci_bus_flags into a set of bit fields in the
struct pci_bus, and then drop said enum and the typedef pci_bus_flags_t.

This will keep PCI device-specific features as part of the struct
pci_dev and make the code that used to use flags simpler.

Related:
  https://patchwork.kernel.org/patch/11772809

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 arch/x86/pci/fixup.c    |  6 +++---
 drivers/pci/msi.c       |  8 ++++----
 drivers/pci/pci-sysfs.c | 14 ++++++--------
 drivers/pci/pci.c       |  2 +-
 drivers/pci/pcie/aer.c  |  5 ++---
 drivers/pci/probe.c     | 13 +++++++++----
 drivers/pci/quirks.c    | 16 ++++++++--------
 include/linux/pci.h     | 20 ++++++++++----------
 8 files changed, 43 insertions(+), 41 deletions(-)

diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
index b8c9a5b87f37..50ff8aa542b8 100644
--- a/arch/x86/pci/fixup.c
+++ b/arch/x86/pci/fixup.c
@@ -641,14 +641,14 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x8c10, quirk_apple_mbp_poweroff);
  * ID, the AER driver should traverse the child device tree, reading
  * AER registers to find the faulting device.
  */
-static void quirk_no_aersid(struct pci_dev *pdev)
+static void quirk_no_aer_sid(struct pci_dev *pdev)
 {
 	/* VMD Domain */
 	if (is_vmd(pdev->bus) && pci_is_root_bus(pdev->bus))
-		pdev->bus->bus_flags |= PCI_BUS_FLAGS_NO_AERSID;
+		pdev->bus->no_aer_sid = 1;
 }
 DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
-			      PCI_CLASS_BRIDGE_PCI, 8, quirk_no_aersid);
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_no_aer_sid);
 
 static void quirk_intel_th_dnv(struct pci_dev *dev)
 {
diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
index 30ae4ffda5c1..01e4bdbc830e 100644
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -875,13 +875,13 @@ static int pci_msi_supported(struct pci_dev *dev, int nvec)
 
 	/*
 	 * Any bridge which does NOT route MSI transactions from its
-	 * secondary bus to its primary bus must set NO_MSI flag on
-	 * the secondary pci_bus.
+	 * secondary bus to its primary bus must enable "no_msi" on
+	 * the secondary bus (pci_bus).
 	 * We expect only arch-specific PCI host bus controller driver
-	 * or quirks for specific PCI bridges to be setting NO_MSI.
+	 * or quirks for specific PCI bridges to enable "no_msi".
 	 */
 	for (bus = dev->bus; bus; bus = bus->parent)
-		if (bus->bus_flags & PCI_BUS_FLAGS_NO_MSI)
+		if (bus->no_msi)
 			return 0;
 
 	return 1;
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 6d78df981d41..eca214e45418 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -357,9 +357,7 @@ static ssize_t msi_bus_show(struct device *dev, struct device_attribute *attr,
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pci_bus *subordinate = pdev->subordinate;
 
-	return sprintf(buf, "%u\n", subordinate ?
-		       !(subordinate->bus_flags & PCI_BUS_FLAGS_NO_MSI)
-			   : !pdev->no_msi);
+	return sprintf(buf, "%u\n", subordinate ? !subordinate->no_msi : !pdev->no_msi);
 }
 
 static ssize_t msi_bus_store(struct device *dev, struct device_attribute *attr,
@@ -376,9 +374,9 @@ static ssize_t msi_bus_store(struct device *dev, struct device_attribute *attr,
 		return -EPERM;
 
 	/*
-	 * "no_msi" and "bus_flags" only affect what happens when a driver
-	 * requests MSI or MSI-X.  They don't affect any drivers that have
-	 * already requested MSI or MSI-X.
+	 * "no_msi" enabled for device and bus only affect what happens
+	 * when a driver requests MSI or MSI-X.  They don't affect any
+	 * drivers that have already requested MSI or MSI-X.
 	 */
 	if (!subordinate) {
 		pdev->no_msi = !val;
@@ -388,9 +386,9 @@ static ssize_t msi_bus_store(struct device *dev, struct device_attribute *attr,
 	}
 
 	if (val)
-		subordinate->bus_flags &= ~PCI_BUS_FLAGS_NO_MSI;
+		subordinate->no_msi = 0;
 	else
-		subordinate->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
+		subordinate->no_msi = 1;
 
 	dev_info(&subordinate->dev, "MSI/MSI-X %s for future drivers of devices on this bus\n",
 		 val ? "allowed" : "disallowed");
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e39c5499770f..12d434eb1b97 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5657,7 +5657,7 @@ int pcix_set_mmrbc(struct pci_dev *dev, int mmrbc)
 
 	o = (cmd & PCI_X_CMD_MAX_READ) >> 2;
 	if (o != v) {
-		if (v > o && (dev->bus->bus_flags & PCI_BUS_FLAGS_NO_MMRBC))
+		if (v > o && dev->bus->no_mmrbc)
 			return -EIO;
 
 		cmd &= ~PCI_X_CMD_MAX_READ;
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 65dff5f3457a..4272abab9695 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -827,8 +827,7 @@ static bool is_error_source(struct pci_dev *dev, struct aer_err_info *e_info)
 	 * When bus id is equal to 0, it might be a bad id
 	 * reported by root port.
 	 */
-	if ((PCI_BUS_NUM(e_info->id) != 0) &&
-	    !(dev->bus->bus_flags & PCI_BUS_FLAGS_NO_AERSID)) {
+	if (PCI_BUS_NUM(e_info->id) != 0 && !dev->bus->no_aer_sid) {
 		/* Device ID match? */
 		if (e_info->id == ((dev->bus->number << 8) | dev->devfn))
 			return true;
@@ -842,7 +841,7 @@ static bool is_error_source(struct pci_dev *dev, struct aer_err_info *e_info)
 	 * When either
 	 *      1) bus id is equal to 0. Some ports might lose the bus
 	 *              id of error source id;
-	 *      2) bus flag PCI_BUS_FLAGS_NO_AERSID is set
+	 *      2) bus has "no_aer_sid" enabled
 	 *      3) There are multiple errors and prior ID comparing fails;
 	 * We check AER status registers to find possible reporter.
 	 */
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 03d37128a24f..d3a92d60ae8f 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1002,7 +1002,7 @@ static bool pci_bridge_child_ext_cfg_accessible(struct pci_dev *bridge)
 	 * If extended config space isn't accessible on a bridge's primary
 	 * bus, we certainly can't access it on the secondary bus.
 	 */
-	if (bridge->bus->bus_flags & PCI_BUS_FLAGS_NO_EXTCFG)
+	if (bridge->bus->no_ext_cfg)
 		return false;
 
 	/*
@@ -1048,7 +1048,12 @@ static struct pci_bus *pci_alloc_child_bus(struct pci_bus *parent,
 	child->ops = parent->ops;
 	child->msi = parent->msi;
 	child->sysdata = parent->sysdata;
-	child->bus_flags = parent->bus_flags;
+
+	/* PCI bus flags */
+	child->no_msi = parent->no_msi;
+	child->no_mmrbc = parent->no_mmrbc;
+	child->no_aer_sid = parent->no_aer_sid;
+	child->no_ext_cfg = parent->no_ext_cfg;
 
 	/*
 	 * Initialize some portions of the bus device, but don't register
@@ -1079,7 +1084,7 @@ static struct pci_bus *pci_alloc_child_bus(struct pci_bus *parent,
 	 * the root bus.
 	 */
 	if (!pci_bridge_child_ext_cfg_accessible(bridge)) {
-		child->bus_flags |= PCI_BUS_FLAGS_NO_EXTCFG;
+		child->no_ext_cfg = 1;
 		pci_info(child, "extended config space not accessible\n");
 	}
 
@@ -1644,7 +1649,7 @@ int pci_cfg_space_size(struct pci_dev *dev)
 		return PCI_CFG_SPACE_EXP_SIZE;
 #endif
 
-	if (dev->bus->bus_flags & PCI_BUS_FLAGS_NO_EXTCFG)
+	if (dev->bus->no_ext_cfg)
 		return PCI_CFG_SPACE_SIZE;
 
 	class = dev->class >> 8;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 2a589b6d6ed8..5fae54201b08 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -1052,7 +1052,7 @@ static void quirk_amd_8131_mmrbc(struct pci_dev *dev)
 	if (dev->subordinate && dev->revision <= 0x12) {
 		pci_info(dev, "AMD8131 rev %x detected; disabling PCI-X MMRBC\n",
 			 dev->revision);
-		dev->subordinate->bus_flags |= PCI_BUS_FLAGS_NO_MMRBC;
+		dev->subordinate->no_mmrbc = 1;
 	}
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_8131_BRIDGE, quirk_amd_8131_mmrbc);
@@ -2503,10 +2503,10 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82875_HB,
 
 #ifdef CONFIG_PCI_MSI
 /*
- * Some chipsets do not support MSI. We cannot easily rely on setting
- * PCI_BUS_FLAGS_NO_MSI in its bus flags because there are actually some
- * other buses controlled by the chipset even if Linux is not aware of it.
- * Instead of setting the flag on all buses in the machine, simply disable
+ * Some chipsets do not support MSI. We cannot easily rely on enabling
+ * "no_msi" for its bus because there are actually some other buses
+ * controlled by the chipset even if Linux is not aware of it. Instead
+ * of enabling "no_msi" on all buses in the machine, simply disable
  * MSI globally.
  */
 static void quirk_disable_all_msi(struct pci_dev *dev)
@@ -2528,7 +2528,7 @@ static void quirk_disable_msi(struct pci_dev *dev)
 {
 	if (dev->subordinate) {
 		pci_warn(dev, "MSI quirk detected; subordinate MSI disabled\n");
-		dev->subordinate->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
+		dev->subordinate->no_msi = 1;
 	}
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_8131_BRIDGE, quirk_disable_msi);
@@ -2586,7 +2586,7 @@ static void quirk_msi_ht_cap(struct pci_dev *dev)
 {
 	if (dev->subordinate && !msi_ht_cap_enabled(dev)) {
 		pci_warn(dev, "MSI quirk detected; subordinate MSI disabled\n");
-		dev->subordinate->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
+		dev->subordinate->no_msi = 1;
 	}
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SERVERWORKS, PCI_DEVICE_ID_SERVERWORKS_HT2000_PCIE,
@@ -2612,7 +2612,7 @@ static void quirk_nvidia_ck804_msi_ht_cap(struct pci_dev *dev)
 		return;
 	if (!msi_ht_cap_enabled(dev) && !msi_ht_cap_enabled(pdev)) {
 		pci_warn(dev, "MSI quirk detected; subordinate MSI disabled\n");
-		dev->subordinate->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
+		dev->subordinate->no_msi = 1;
 	}
 	pci_dev_put(pdev);
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 835530605c0d..85204825d0a5 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -234,14 +234,6 @@ enum pci_irq_reroute_variant {
 	MAX_IRQ_REROUTE_VARIANTS = 3
 };
 
-typedef unsigned short __bitwise pci_bus_flags_t;
-enum pci_bus_flags {
-	PCI_BUS_FLAGS_NO_MSI	= (__force pci_bus_flags_t) 1,
-	PCI_BUS_FLAGS_NO_MMRBC	= (__force pci_bus_flags_t) 2,
-	PCI_BUS_FLAGS_NO_AERSID	= (__force pci_bus_flags_t) 4,
-	PCI_BUS_FLAGS_NO_EXTCFG	= (__force pci_bus_flags_t) 8,
-};
-
 /* Values from Link Status register, PCIe r3.1, sec 7.8.8 */
 enum pcie_link_width {
 	PCIE_LNK_WIDTH_RESRV	= 0x00,
@@ -627,12 +619,20 @@ struct pci_bus {
 	char		name[48];
 
 	unsigned short	bridge_ctl;	/* Manage NO_ISA/FBB/et al behaviors */
-	pci_bus_flags_t bus_flags;	/* Inherited by child buses */
 	struct device		*bridge;
 	struct device		dev;
 	struct bin_attribute	*legacy_io;	/* Legacy I/O for this bus */
 	struct bin_attribute	*legacy_mem;	/* Legacy mem */
-	unsigned int		is_added:1;
+	unsigned int		is_added:1;	/* This bus has already been registered */
+
+	/* PCI bus flags are inherited by child buses */
+	unsigned int		no_msi:1;	/* Don't use MSI/MSI-X for devices behind a bridge that does not route
+						   MSI transactions from its secondary bus to its primary bus */
+	unsigned int		no_mmrbc:1;	/* Disallow setting PCI-X Maximum Memory Read Byte Count on this bus */
+	unsigned int		no_aer_sid:1;	/* Allow Root Port buses to skip the AER source ID matching when finding
+						   the faulting device */
+	unsigned int		no_ext_cfg:1;	/* Don't use PCIe/PCI-X Mode 2 Extended Configuration Space
+						   when it isn't available on bridge's primary bus */
 };
 
 #define to_pci_bus(n)	container_of(n, struct pci_bus, dev)
-- 
2.28.0

