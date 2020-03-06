Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB72417B7B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 08:49:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Yfs068whzDr34
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 18:49:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fuVNCq7j; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YfdZ2d2rzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 18:39:30 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id ay11so527738plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 23:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qVaqG+Kj0bLqxI9+1QYPXK9IIRN8k4TJM98hxpxZqbg=;
 b=fuVNCq7jUAHLsiiHj6TPnuEIfFM5VguYvHibFnoU2/cjbUB5heEuTQmw16cbkktadM
 1Ip0X080hS1K2i5xJYLzPbbntcDNejJ9heAiqbiD0tBgvm25+7SIwEnaz5g7sDSsmxEn
 HHGGa4BtLJwzvW45uxIz+mB5Vl2XgVqN6rMUGQInn9X8DS51+TFcgNwP2sZWnPJJmDf7
 f3SOKcKUR1RpG2ke8l5xQDQjSDD1kTd4F03rh+gQvQOeZGmD22JgmGulYMRqIANLT4X1
 f2xRrXW0cS0TIAE9+RvdA6B7UBwTSLy+ryc7i35miXAZIRgykcWyU/5mNmfOYfSRSwMa
 0/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVaqG+Kj0bLqxI9+1QYPXK9IIRN8k4TJM98hxpxZqbg=;
 b=cEMp2fxtAG02TMVy/1TJF+EIBlrEajAKell4Zbo96qQRxMvRfJvBcbDO+ysF164p5H
 4Tx4oNVzTTTKR4qSBO9LIZ42DDtiSWqwPdNO97OGvSx0A+rw872OuY35UCTqXZyCWuWo
 CSVn/rPYqtWJzO4j92tCLI53TTq1S5i0RNLd/+0XGSmxQMs2Mj7nPMREroljaR4rSf+a
 D8y2jS/n4JN7yrbpS2FfZAJMogRUw0I1VpzoMpiN05YmqtaS6aYI3L3Y80SaTOTB1FSm
 +Jy9mklMXdHy64oe3tmD85gqYrQYoeGQbO+Ddvn7iFEYmz0Pezo9R/pH89oNWWSTHCfk
 RIVA==
X-Gm-Message-State: ANhLgQ3iQMIklNiTOaE5oxwY72KLr9yNIEe+VRoXRQt9tSr4sCRohn9l
 A90JBZgLe+9IWKFM/V5OzFzgre8CEX4=
X-Google-Smtp-Source: ADFU+vuxDAevQXJSxN3hDPmhrH3ELOaRsL83e4ZKbrDTcarHjKRG3NB+DR3sPKAG+Z+XHuXHpvBf2g==
X-Received: by 2002:a17:90a:35a3:: with SMTP id
 r32mr2321839pjb.49.1583480367408; 
 Thu, 05 Mar 2020 23:39:27 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b16sm6192999pff.25.2020.03.05.23.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 23:39:27 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/6] powerpc/eeh: Make early EEH init pseries specific
Date: Fri,  6 Mar 2020 18:39:03 +1100
Message-Id: <20200306073904.4737-5-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200306073904.4737-1-oohall@gmail.com>
References: <20200306073904.4737-1-oohall@gmail.com>
MIME-Version: 1.0
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The eeh_ops->probe() function is called from two different contexts:

1. On pseries, where we set EEH_PROBE_MODE_DEVTREE, it's called in
   eeh_add_device_early() which is supposed to run before we create
   a pci_dev.

2. On PowerNV, where we set EEH_PROBE_MODE_DEV, it's called in
   eeh_device_add_late() which is supposed to run *after* the
   pci_dev is created.

The "early" probe is required because PAPR requires that we perform an RTAS
call to enable EEH support on a device before we start interacting with it
via config space or MMIO. This requirement doesn't exist on PowerNV and
shoehorning two completely separate initialisation paths into a common
interface just results in a convoluted code everywhere.

Additionally the early probe requires the probe function to take an pci_dn
rather than a pci_dev argument. We'd like to make pci_dn a pseries specific
data structure since there's no real requirement for them on PowerNV. To
help both goals move the early probe into the pseries containment zone
so the platform depedence is more explicit.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: s/set set/we set/ in the commit message
---
 arch/powerpc/include/asm/eeh.h               | 14 +++---
 arch/powerpc/kernel/eeh.c                    | 46 --------------------
 arch/powerpc/kernel/of_platform.c            |  6 +--
 arch/powerpc/platforms/powernv/eeh-powernv.c |  6 ---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 65 ++++++++++++++++++++++------
 arch/powerpc/platforms/pseries/pci_dlpar.c   |  2 +-
 drivers/pci/hotplug/rpadlpar_core.c          |  2 +-
 drivers/pci/hotplug/rpaphp_core.c            |  2 +-
 drivers/pci/hotplug/rpaphp_pci.c             |  2 +-
 9 files changed, 64 insertions(+), 81 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 5d10781..8580238 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -301,8 +301,6 @@ int __exit eeh_ops_unregister(const char *name);
 int eeh_check_failure(const volatile void __iomem *token);
 int eeh_dev_check_failure(struct eeh_dev *edev);
 void eeh_addr_cache_init(void);
-void eeh_add_device_early(struct pci_dn *);
-void eeh_add_device_tree_early(struct pci_dn *);
 void eeh_add_device_late(struct pci_dev *);
 void eeh_remove_device(struct pci_dev *);
 int eeh_unfreeze_pe(struct eeh_pe *pe);
@@ -358,10 +356,6 @@ static inline int eeh_check_failure(const volatile void __iomem *token)
 
 static inline void eeh_addr_cache_init(void) { }
 
-static inline void eeh_add_device_early(struct pci_dn *pdn) { }
-
-static inline void eeh_add_device_tree_early(struct pci_dn *pdn) { }
-
 static inline void eeh_add_device_late(struct pci_dev *dev) { }
 
 static inline void eeh_remove_device(struct pci_dev *dev) { }
@@ -370,6 +364,14 @@ static inline void eeh_remove_device(struct pci_dev *dev) { }
 #define EEH_IO_ERROR_VALUE(size) (-1UL)
 #endif /* CONFIG_EEH */
 
+#if defined(CONFIG_PPC_PSERIES) && defined(CONFIG_EEH)
+void pseries_eeh_init_edev(struct pci_dn *pdn);
+void pseries_eeh_init_edev_recursive(struct pci_dn *pdn);
+#else
+static inline void pseries_eeh_add_device_early(struct pci_dn *pdn) { }
+static inline void pseries_eeh_add_device_tree_early(struct pci_dn *pdn) { }
+#endif
+
 #ifdef CONFIG_PPC64
 /*
  * MMIO read/write operations with EEH support.
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index a9e4ca7..55d3ef6 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1107,52 +1107,6 @@ static int eeh_init(void)
 core_initcall_sync(eeh_init);
 
 /**
- * eeh_add_device_early - Enable EEH for the indicated device node
- * @pdn: PCI device node for which to set up EEH
- *
- * This routine must be used to perform EEH initialization for PCI
- * devices that were added after system boot (e.g. hotplug, dlpar).
- * This routine must be called before any i/o is performed to the
- * adapter (inluding any config-space i/o).
- * Whether this actually enables EEH or not for this device depends
- * on the CEC architecture, type of the device, on earlier boot
- * command-line arguments & etc.
- */
-void eeh_add_device_early(struct pci_dn *pdn)
-{
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
-
-	if (!edev)
-		return;
-
-	if (!eeh_has_flag(EEH_PROBE_MODE_DEVTREE))
-		return;
-
-	eeh_ops->probe(pdn, NULL);
-}
-
-/**
- * eeh_add_device_tree_early - Enable EEH for the indicated device
- * @pdn: PCI device node
- *
- * This routine must be used to perform EEH initialization for the
- * indicated PCI device that was added after system boot (e.g.
- * hotplug, dlpar).
- */
-void eeh_add_device_tree_early(struct pci_dn *pdn)
-{
-	struct pci_dn *n;
-
-	if (!pdn)
-		return;
-
-	list_for_each_entry(n, &pdn->child_list, list)
-		eeh_add_device_tree_early(n);
-	eeh_add_device_early(pdn);
-}
-EXPORT_SYMBOL_GPL(eeh_add_device_tree_early);
-
-/**
  * eeh_add_device_late - Perform EEH initialization for the indicated pci device
  * @dev: pci device for which to set up EEH
  *
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index 64edac81..71a3f97 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -62,13 +62,9 @@ static int of_pci_phb_probe(struct platform_device *dev)
 	/* Init pci_dn data structures */
 	pci_devs_phb_init_dynamic(phb);
 
-	/* Create EEH devices for the PHB */
+	/* Create EEH PEs for the PHB */
 	eeh_dev_phb_init_dynamic(phb);
 
-	/* Register devices with EEH */
-	if (dev->dev.of_node->child)
-		eeh_add_device_tree_early(PCI_DN(dev->dev.of_node));
-
 	/* Scan the bus */
 	pcibios_scan_phb(phb);
 	if (phb->bus == NULL)
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index ef727ec..eaa8dfe 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -40,13 +40,7 @@ static int eeh_event_irq = -EINVAL;
 
 void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
 {
-	struct pci_dn *pdn = pci_get_pdn(pdev);
-
-	if (!pdn || eeh_has_flag(EEH_FORCE_DISABLED))
-		return;
-
 	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
-	eeh_add_device_early(pdn);
 	eeh_add_device_late(pdev);
 }
 
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 95bbf91..1ca7cf0 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -67,7 +67,7 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 		pdn->pe_number  =  physfn_pdn->pe_num_map[pdn->vf_index];
 	}
 #endif
-	eeh_add_device_early(pdn);
+	pseries_eeh_init_edev(pdn);
 #ifdef CONFIG_PCI_IOV
 	if (pdev->is_virtfn) {
 		struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
@@ -221,15 +221,16 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn, int cap)
 }
 
 /**
- * pseries_eeh_probe - EEH probe on the given device
+ * pseries_eeh_init_edev - initialise the eeh_dev and eeh_pe for a pci_dn
+ *
  * @pdn: PCI device node
- * @data: Unused
  *
- * When EEH module is installed during system boot, all PCI devices
- * are checked one by one to see if it supports EEH. The function
- * is introduced for the purpose.
+ * When we discover a new PCI device via the device-tree we create a
+ * corresponding pci_dn and we allocate, but don't initialise, an eeh_dev.
+ * This function takes care of the initialisation and inserts the eeh_dev
+ * into the correct eeh_pe. If no eeh_pe exists we'll allocate one.
  */
-static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
+void pseries_eeh_init_edev(struct pci_dn *pdn)
 {
 	struct eeh_dev *edev;
 	struct eeh_pe pe;
@@ -237,18 +238,35 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
 	int enable = 0;
 	int ret;
 
-	/* Retrieve OF node and eeh device */
+	if (WARN_ON_ONCE(!eeh_has_flag(EEH_PROBE_MODE_DEVTREE)))
+		return;
+
+	/*
+	 * Find the eeh_dev for this pdn. The storage for the eeh_dev was
+	 * allocated at the same time as the pci_dn.
+	 *
+	 * XXX: We should probably re-visit that.
+	 */
 	edev = pdn_to_eeh_dev(pdn);
-	if (!edev || edev->pe)
-		return NULL;
+	if (!edev)
+		return;
+
+	/*
+	 * If ->pe is set then we've already probed this device. We hit
+	 * this path when a pci_dev is removed and rescanned while recovering
+	 * a PE (i.e. for devices where the driver doesn't support error
+	 * recovery).
+	 */
+	if (edev->pe)
+		return;
 
 	/* Check class/vendor/device IDs */
 	if (!pdn->vendor_id || !pdn->device_id || !pdn->class_code)
-		return NULL;
+		return;
 
 	/* Skip for PCI-ISA bridge */
         if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
-		return NULL;
+		return;
 
 	eeh_edev_dbg(edev, "Probing device\n");
 
@@ -315,9 +333,29 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
 
 	/* Save memory bars */
 	eeh_save_bars(edev);
+}
+
+/**
+ * pseries_eeh_init_edev_recursive - Enable EEH for the indicated device
+ * @pdn: PCI device node
+ *
+ * This routine must be used to perform EEH initialization for the
+ * indicated PCI device that was added after system boot (e.g.
+ * hotplug, dlpar).
+ */
+void pseries_eeh_init_edev_recursive(struct pci_dn *pdn)
+{
+	struct pci_dn *n;
+
+	if (!pdn)
+		return;
+
+	list_for_each_entry(n, &pdn->child_list, list)
+		pseries_eeh_init_edev_recursive(n);
 
-	return NULL;
+	pseries_eeh_init_edev(pdn);
 }
+EXPORT_SYMBOL_GPL(pseries_eeh_init_edev_recursive);
 
 /**
  * pseries_eeh_set_option - Initialize EEH or MMIO/DMA reenable
@@ -775,7 +813,6 @@ static int pseries_notify_resume(struct pci_dn *pdn)
 static struct eeh_ops pseries_eeh_ops = {
 	.name			= "pseries",
 	.init			= pseries_eeh_init,
-	.probe			= pseries_eeh_probe,
 	.set_option		= pseries_eeh_set_option,
 	.get_pe_addr		= pseries_eeh_get_pe_addr,
 	.get_state		= pseries_eeh_get_state,
diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
index 361986e..b3a38f5 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -37,7 +37,7 @@ struct pci_controller *init_phb_dynamic(struct device_node *dn)
 	eeh_dev_phb_init_dynamic(phb);
 
 	if (dn->child)
-		eeh_add_device_tree_early(PCI_DN(dn));
+		pseries_eeh_init_edev_recursive(PCI_DN(dn));
 
 	pcibios_scan_phb(phb);
 	pcibios_finish_adding_to_bus(phb->bus);
diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
index 977946e..c5eb509 100644
--- a/drivers/pci/hotplug/rpadlpar_core.c
+++ b/drivers/pci/hotplug/rpadlpar_core.c
@@ -140,7 +140,7 @@ static void dlpar_pci_add_bus(struct device_node *dn)
 	struct pci_controller *phb = pdn->phb;
 	struct pci_dev *dev = NULL;
 
-	eeh_add_device_tree_early(pdn);
+	pseries_eeh_init_edev_recursive(pdn);
 
 	/* Add EADS device to PHB bus, adding new entry to bus->devices */
 	dev = of_create_pci_dev(dn, phb->bus, pdn->devfn);
diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index 9c1e43e..b89d5ff 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -494,7 +494,7 @@ static int enable_slot(struct hotplug_slot *hotplug_slot)
 		return retval;
 
 	if (state == PRESENT) {
-		eeh_add_device_tree_early(PCI_DN(slot->dn));
+		pseries_eeh_init_edev_recursive(PCI_DN(slot->dn));
 
 		pci_lock_rescan_remove();
 		pci_hp_add_devices(slot->bus);
diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaphp_pci.c
index 61ebbd8..c380bda 100644
--- a/drivers/pci/hotplug/rpaphp_pci.c
+++ b/drivers/pci/hotplug/rpaphp_pci.c
@@ -96,7 +96,7 @@ int rpaphp_enable_slot(struct slot *slot)
 		}
 
 		if (list_empty(&bus->devices)) {
-			eeh_add_device_tree_early(PCI_DN(slot->dn));
+			pseries_eeh_init_edev_recursive(PCI_DN(slot->dn));
 			pci_hp_add_devices(bus);
 		}
 
-- 
2.9.5

