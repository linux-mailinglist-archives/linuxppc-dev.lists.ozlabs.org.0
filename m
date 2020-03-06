Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEE617B7BF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 08:51:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Yfvc4PB9zDqvl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 18:51:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=egb+4Z+S; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Yfdb6ZsrzDqh3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 18:39:31 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id t3so699450pgn.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 23:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ii54/eVk1pn+pPhB9omZf3IFCZTN8nX10HEUyCKXHQA=;
 b=egb+4Z+SIHYQL5e0SidKSH194HvQfercwWB04YVlGP6OHchE0hi48atL0PPyhQZOX6
 N9JEOlxZq1t8HbfmWbaLoYXoQNqZqn8IPn8Z9f13BguIxp60r5cp2am1Eh/3pYriDD86
 x2ienD4ttPHmomRZpXeFKoSaIbVfoXGmZE8n0kc6Nq7UB2IFZHoZhL4evyutgQVgqDzk
 Yba7TABt9sJhAhnz8S9G62JBy/RHKVXb03TgjIaEWadpBEKbRyjYkGB+2q2Kn6OXFhnm
 n1EkLAO9E+ec2Hf0B8edhHD03s7oLC6nZ6pyxaJ7Au+cRIyha+upTz1ytW1l4Uixgo2V
 sW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ii54/eVk1pn+pPhB9omZf3IFCZTN8nX10HEUyCKXHQA=;
 b=WfznNv8UiSKzQq+DP4Usbp0FpYRe97C1dlCOV6/wJoBOgnCM52pJGwYsZjKgCmo1V+
 uVeS7TQLk0owNZUy4HKJfo6LU5V4L4NPegbV+GGM/j6T7H9tjZdxpnhRuYALawCyL/mi
 MsxXRVZikqVojRUKMO7U0tGT/OCKqI+2VAgZYvE5J328g8po1woVjXhXsUUcorUIug/R
 MqBv7DO11XfqBkxyaiJ5Viut0g1ZejkGH8lQzxnIulq7aDu6KEG/HK+qL9qp9HZ7sfmp
 +2i48MLYH8y17lntH0bVETDhGsHttZ9bu3gJ4SZe0KkA50n43Btt6OmAx/Keb1jPVU7v
 Jobg==
X-Gm-Message-State: ANhLgQ2FxbEkBYFO8dkMQCoPIjJtFyMx0k+g69u6rIVdV1wy2Yh0tRUY
 mvDYxgvzSkHSNuZMxtWc6S87RTrSKt0=
X-Google-Smtp-Source: ADFU+vv/imklYFZpBKHOlgIHalM2OQ/2+/yzVb9BQ2wCbe7hxNiuLV30z7bv0rIYErJljOrWAUKHsg==
X-Received: by 2002:a63:114a:: with SMTP id 10mr2014430pgr.185.1583480369596; 
 Thu, 05 Mar 2020 23:39:29 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b16sm6192999pff.25.2020.03.05.23.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 23:39:29 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 6/6] powerpc/eeh: Rework eeh_ops->probe()
Date: Fri,  6 Mar 2020 18:39:04 +1100
Message-Id: <20200306073904.4737-6-oohall@gmail.com>
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

With the EEH early probe now being pseries specific there's no need for
eeh_ops->probe() to take a pci_dn. Instead, we can make it take a pci_dev
and use the probe function to map a pci_dev to an eeh_dev. This allows
the platform to implement it's own method for finding (or creating) an
eeh_dev for a given pci_dev which also removes a use of pci_dn in
generic EEH code.

This patch also renames eeh_device_add_late() to eeh_device_probe(). This
better reflects what it does does and removes the last vestiges of the
early/late EEH probe split.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: Fixed the comment block above eeh_probe_device() to use the new
    function name.
---
 arch/powerpc/include/asm/eeh.h               |  6 ++--
 arch/powerpc/kernel/eeh.c                    | 44 +++++++++++++++-------------
 arch/powerpc/platforms/powernv/eeh-powernv.c | 30 +++++++++----------
 arch/powerpc/platforms/pseries/eeh_pseries.c | 23 ++++++++++++++-
 4 files changed, 62 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 8580238..964a542 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -215,7 +215,7 @@ enum {
 struct eeh_ops {
 	char *name;
 	int (*init)(void);
-	void* (*probe)(struct pci_dn *pdn, void *data);
+	struct eeh_dev *(*probe)(struct pci_dev *pdev);
 	int (*set_option)(struct eeh_pe *pe, int option);
 	int (*get_pe_addr)(struct eeh_pe *pe);
 	int (*get_state)(struct eeh_pe *pe, int *delay);
@@ -301,7 +301,7 @@ int __exit eeh_ops_unregister(const char *name);
 int eeh_check_failure(const volatile void __iomem *token);
 int eeh_dev_check_failure(struct eeh_dev *edev);
 void eeh_addr_cache_init(void);
-void eeh_add_device_late(struct pci_dev *);
+void eeh_probe_device(struct pci_dev *pdev);
 void eeh_remove_device(struct pci_dev *);
 int eeh_unfreeze_pe(struct eeh_pe *pe);
 int eeh_pe_reset_and_recover(struct eeh_pe *pe);
@@ -356,7 +356,7 @@ static inline int eeh_check_failure(const volatile void __iomem *token)
 
 static inline void eeh_addr_cache_init(void) { }
 
-static inline void eeh_add_device_late(struct pci_dev *dev) { }
+static inline void eeh_probe_device(struct pci_dev *dev) { }
 
 static inline void eeh_remove_device(struct pci_dev *dev) { }
 
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 55d3ef6..7cdcb41 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1107,35 +1107,43 @@ static int eeh_init(void)
 core_initcall_sync(eeh_init);
 
 /**
- * eeh_add_device_late - Perform EEH initialization for the indicated pci device
+ * eeh_probe_device() - Perform EEH initialization for the indicated pci device
  * @dev: pci device for which to set up EEH
  *
  * This routine must be used to complete EEH initialization for PCI
  * devices that were added after system boot (e.g. hotplug, dlpar).
  */
-void eeh_add_device_late(struct pci_dev *dev)
+void eeh_probe_device(struct pci_dev *dev)
 {
-	struct pci_dn *pdn;
 	struct eeh_dev *edev;
 
-	if (!dev)
+	pr_debug("EEH: Adding device %s\n", pci_name(dev));
+
+	/*
+	 * pci_dev_to_eeh_dev() can only work if eeh_probe_dev() was
+	 * already called for this device.
+	 */
+	if (WARN_ON_ONCE(pci_dev_to_eeh_dev(dev))) {
+		pci_dbg(dev, "Already bound to an eeh_dev!\n");
 		return;
+	}
 
-	pdn = pci_get_pdn_by_devfn(dev->bus, dev->devfn);
-	edev = pdn_to_eeh_dev(pdn);
-	eeh_edev_dbg(edev, "Adding device\n");
-	if (edev->pdev == dev) {
-		eeh_edev_dbg(edev, "Device already referenced!\n");
+	edev = eeh_ops->probe(dev);
+	if (!edev) {
+		pr_debug("EEH: Adding device failed\n");
 		return;
 	}
 
 	/*
-	 * The EEH cache might not be removed correctly because of
-	 * unbalanced kref to the device during unplug time, which
-	 * relies on pcibios_release_device(). So we have to remove
-	 * that here explicitly.
+	 * FIXME: We rely on pcibios_release_device() to remove the
+	 * existing EEH state. The release function is only called if
+	 * the pci_dev's refcount drops to zero so if something is
+	 * keeping a ref to a device (e.g. a filesystem) we need to
+	 * remove the old EEH state.
+	 *
+	 * FIXME: HEY MA, LOOK AT ME, NO LOCKING!
 	 */
-	if (edev->pdev) {
+	if (edev->pdev && edev->pdev != dev) {
 		eeh_rmv_from_parent_pe(edev);
 		eeh_addr_cache_rmv_dev(edev->pdev);
 		eeh_sysfs_remove_device(edev->pdev);
@@ -1146,17 +1154,11 @@ void eeh_add_device_late(struct pci_dev *dev)
 		 * into error handler afterwards.
 		 */
 		edev->mode |= EEH_DEV_NO_HANDLER;
-
-		edev->pdev = NULL;
-		dev->dev.archdata.edev = NULL;
 	}
 
-	if (eeh_has_flag(EEH_PROBE_MODE_DEV))
-		eeh_ops->probe(pdn, NULL);
-
+	/* bind the pdev and the edev together */
 	edev->pdev = dev;
 	dev->dev.archdata.edev = edev;
-
 	eeh_addr_cache_insert_dev(dev);
 	eeh_sysfs_add_device(dev);
 }
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index eaa8dfe..79409e0 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -41,7 +41,7 @@ static int eeh_event_irq = -EINVAL;
 void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
 {
 	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
-	eeh_add_device_late(pdev);
+	eeh_probe_device(pdev);
 }
 
 static int pnv_eeh_init(void)
@@ -340,23 +340,13 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
 
 /**
  * pnv_eeh_probe - Do probe on PCI device
- * @pdn: PCI device node
- * @data: unused
+ * @pdev: pci_dev to probe
  *
- * When EEH module is installed during system boot, all PCI devices
- * are checked one by one to see if it supports EEH. The function
- * is introduced for the purpose. By default, EEH has been enabled
- * on all PCI devices. That's to say, we only need do necessary
- * initialization on the corresponding eeh device and create PE
- * accordingly.
- *
- * It's notable that's unsafe to retrieve the EEH device through
- * the corresponding PCI device. During the PCI device hotplug, which
- * was possiblly triggered by EEH core, the binding between EEH device
- * and the PCI device isn't built yet.
+ * Create, or find the existing, eeh_dev for this pci_dev.
  */
-static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
+static struct eeh_dev *pnv_eeh_probe(struct pci_dev *pdev)
 {
+	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pci_controller *hose = pdn->phb;
 	struct pnv_phb *phb = hose->private_data;
 	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
@@ -373,6 +363,14 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 	if (!edev || edev->pe)
 		return NULL;
 
+	/* already configured? */
+	if (edev->pdev) {
+		pr_debug("%s: found existing edev for %04x:%02x:%02x.%01x\n",
+			__func__, hose->global_number, config_addr >> 8,
+			PCI_SLOT(config_addr), PCI_FUNC(config_addr));
+		return edev;
+	}
+
 	/* Skip for PCI-ISA bridge */
 	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
 		return NULL;
@@ -464,7 +462,7 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 
 	eeh_edev_dbg(edev, "EEH enabled on device\n");
 
-	return NULL;
+	return edev;
 }
 
 /**
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 1ca7cf0..8453428 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -77,7 +77,7 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 		eeh_add_to_parent_pe(edev);   /* Add as VF PE type */
 	}
 #endif
-	eeh_add_device_late(pdev);
+	eeh_probe_device(pdev);
 }
 
 /*
@@ -335,6 +335,26 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 	eeh_save_bars(edev);
 }
 
+static struct eeh_dev *pseries_eeh_probe(struct pci_dev *pdev)
+{
+	struct eeh_dev *edev;
+	struct pci_dn *pdn;
+
+	pdn = pci_get_pdn_by_devfn(pdev->bus, pdev->devfn);
+	if (!pdn)
+		return NULL;
+
+	/*
+	 * If the system supports EEH on this device then the eeh_dev was
+	 * configured and inserted into a PE in pseries_eeh_init_edev()
+	 */
+	edev = pdn_to_eeh_dev(pdn);
+	if (!edev || !edev->pe)
+		return NULL;
+
+	return edev;
+}
+
 /**
  * pseries_eeh_init_edev_recursive - Enable EEH for the indicated device
  * @pdn: PCI device node
@@ -813,6 +833,7 @@ static int pseries_notify_resume(struct pci_dn *pdn)
 static struct eeh_ops pseries_eeh_ops = {
 	.name			= "pseries",
 	.init			= pseries_eeh_init,
+	.probe			= pseries_eeh_probe,
 	.set_option		= pseries_eeh_set_option,
 	.get_pe_addr		= pseries_eeh_get_pe_addr,
 	.get_state		= pseries_eeh_get_state,
-- 
2.9.5

