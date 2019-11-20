Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21909103150
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:55:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hm4P17LYzDq9b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:55:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZdXaKs9c"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVL2XHvzDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:46 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id az9so12969565plb.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AW3FbwQORX38QnXrIZvZomkwTkNj6oYlZeV+uLal2bU=;
 b=ZdXaKs9c4yCuPj/34O8fnA+MSzpfuVFN6X5yXkUdpIAiD6YGgGUM35e5ZMlzu7g5+i
 jveY5lphUN5uMUwxuaCR4JWALc6f1Nh6zE4Xlv4ScFylZ3XiCoMs2FSPBwfZ+Pw3+JNm
 9m/6tqHJuWrkofOMPU3SfUyiII4Dzijl6AKC8sWa5w5W3BCEk59ivcv8Q20G2O3lsNBu
 8TOAI0RzdlrROt4AZ7c8RZlwd/vQrzCWJthC3X82z3lyM4cS7kasgyd4rzD42G6gTaiL
 F86fDU9rTjjViUCXcTbFMkMPDzww6FbhP6F6QEfzRtdKzFs2eVMxPWHbGxElRmWfFo7X
 Fi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AW3FbwQORX38QnXrIZvZomkwTkNj6oYlZeV+uLal2bU=;
 b=LXgogvA9/rOLhsqbVEEW9YU9XRvDr4LMrfAvMZuvnU8pyRq2mlW4bA3T7rzynNZZa+
 zVDPJ7qnJglXzrUd0PmHRIxEQpF6LuUPkHu+c3zi4lHk/SkVDzllwQZDcI+mSuxEWyLD
 /Fb/ABVDntKr4tQEeF7U9oMGp2IBz3aca+BG7x86+BQnbggcg5kTzz7VDRwlxS60wL9S
 UuVy7iEADC3yGLb9zTifVVLsCtHu/tcG9ul0TR9FwGLhqGEYEwXRaeR85CNAFp5/SrSV
 PlWkuNIlawzkkGl2+bYfYWh8P8oeYbqucotiFqCc5qthqRh7dnhfLIHvKGYpseNXRl9t
 +wGw==
X-Gm-Message-State: APjAAAV430tQjlnPLlx5ZYSYtEMUa4XUvAMqAnKiEqRa1sGAx7W/UFFg
 JtmgFGv+hGtGh4bXm/yKwwZQV2Xd
X-Google-Smtp-Source: APXvYqwlDq4mP7McTomzsMTNXuDr1g5M0Mba2fBlIE4zAFmTnuJvf1/m8B6ov9bZWA6+xV+ubzWRhg==
X-Received: by 2002:a17:90a:2e87:: with SMTP id r7mr668612pjd.21.1574213383094; 
 Tue, 19 Nov 2019 17:29:43 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:42 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 13/46] powerpc/eeh: Rework how pdev_probe() is used
Date: Wed, 20 Nov 2019 12:28:26 +1100
Message-Id: <20191120012859.23300-14-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adjust how the EEH core uses the eeh_ops->probe_pdev() so that it returns
the eeh_dev for the passed-in pci_dev. Currently mapping an pci_dev to an
eeh_dev is done by finding the pci_dn for the pci_dev, then using the
back-pointer to the eeh_dev stashed in the pci_dn.

We want to move away from using pci_dn on PowerNV and moving the eeh_dev
lookup into probe_pdev() allows the EEH core to be oblivious of how the
mapping is actually done.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h               | 16 +++++++--
 arch/powerpc/kernel/eeh.c                    | 34 ++++++++++++--------
 arch/powerpc/platforms/powernv/eeh-powernv.c | 20 +++++++++---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 19 ++++++++++-
 4 files changed, 67 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 466b0165fbcf..e109bfd3dd57 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -215,8 +215,20 @@ enum {
 struct eeh_ops {
 	char *name;
 	int (*init)(void);
-	void (*probe_pdn)(struct pci_dn *pdn);    /* used on pseries */
-	void (*probe_pdev)(struct pci_dev *pdev); /* used on powernv */
+
+	/*
+	 * on pseries the eeh_dev is initialised before the pci_dev exists
+	 * using the contents of the pci_dn.
+	 */
+	void (*probe_pdn)(struct pci_dn *pdn);
+
+	/*
+	 * probe_pdev() is used to find, and possibly create, an eeh_dev
+	 * for a pci_dev. The EEH core binds the returned device to the
+	 * pci_dev.
+	 */
+	struct eeh_dev *(*probe_pdev)(struct pci_dev *pdev);
+
 	int (*set_option)(struct eeh_pe *pe, int option);
 	int (*get_pe_addr)(struct eeh_pe *pe);
 	int (*get_state)(struct eeh_pe *pe, int *delay);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 087a98b42a8c..58a8299ac417 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1099,17 +1099,24 @@ EXPORT_SYMBOL_GPL(eeh_add_device_tree_early);
  */
 void eeh_add_device_late(struct pci_dev *dev)
 {
-	struct pci_dn *pdn;
 	struct eeh_dev *edev;
 
 	if (!dev)
 		return;
 
-	pdn = pci_get_pdn_by_devfn(dev->bus, dev->devfn);
-	edev = pdn_to_eeh_dev(pdn);
-	eeh_edev_dbg(edev, "Adding device\n");
-	if (edev->pdev == dev) {
-		eeh_edev_dbg(edev, "Device already referenced!\n");
+	pr_debug("EEH: Adding device %s\n", pci_name(dev));
+
+	/* pci_dev_to_eeh_dev() can only work if archdata.edev is already set */
+	edev = pci_dev_to_eeh_dev(dev);
+	if (edev) {
+		/* FIXME: I don't remember why this isn't an error, but it's not */
+		eeh_edev_dbg(edev, "Already bound to an eeh_dev!\n");
+		return;
+	}
+
+	edev = eeh_ops->probe_pdev(dev);
+	if (!edev) {
+		pr_debug("EEH: Adding device failed\n");
 		return;
 	}
 
@@ -1118,8 +1125,13 @@ void eeh_add_device_late(struct pci_dev *dev)
 	 * unbalanced kref to the device during unplug time, which
 	 * relies on pcibios_release_device(). So we have to remove
 	 * that here explicitly.
+	 *
+	 * FIXME: This really shouldn't be necessary. We should probably
+	 * tear down the EEH state when we detatch the pci_dev from the
+	 * bus. We might need to move the bus notifiers out of the platforms
+	 * first.
 	 */
-	if (edev->pdev) {
+	if (edev->pdev && edev->pdev != dev) {
 		eeh_rmv_from_parent_pe(edev);
 		eeh_addr_cache_rmv_dev(edev->pdev);
 		eeh_sysfs_remove_device(edev->pdev);
@@ -1130,17 +1142,11 @@ void eeh_add_device_late(struct pci_dev *dev)
 		 * into error handler afterwards.
 		 */
 		edev->mode |= EEH_DEV_NO_HANDLER;
-
-		edev->pdev = NULL;
-		dev->dev.archdata.edev = NULL;
 	}
 
-	if (eeh_ops->probe_pdev && eeh_has_flag(EEH_PROBE_MODE_DEV))
-		eeh_ops->probe_pdev(dev);
-
+	/* bind the pdev and the edev together */
 	edev->pdev = dev;
 	dev->dev.archdata.edev = edev;
-
 	eeh_addr_cache_insert_dev(dev);
 	eeh_sysfs_add_device(dev);
 }
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 8bd5317aa878..5250c4525544 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -348,9 +348,9 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
  * pnv_eeh_probe - Do probe on PCI device
  * @pdev: pci_dev to probe
  *
- * Creates (or finds an existing) edev for this pci_dev.
+ * Create, or find the existing, eeh_dev for this pci_dev.
  */
-static void pnv_eeh_probe_pdev(struct pci_dev *pdev)
+static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 {
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pci_controller *hose = pdn->phb;
@@ -367,11 +367,19 @@ static void pnv_eeh_probe_pdev(struct pci_dev *pdev)
 	 * the probing.
 	 */
 	if (!edev || edev->pe)
-		return;
+		return NULL;
+
+	/* already configured? */
+	if (edev->pdev) {
+		pr_debug("%s: found existing edev for %04x:%02x:%02x.%01x\n",
+			__func__, hose->global_number, config_addr >> 8,
+			PCI_SLOT(config_addr), PCI_FUNC(config_addr));
+		return edev;
+	}
 
 	/* Skip for PCI-ISA bridge */
 	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
-		return;
+		return NULL;
 
 	eeh_edev_dbg(edev, "Probing device\n");
 
@@ -401,7 +409,7 @@ static void pnv_eeh_probe_pdev(struct pci_dev *pdev)
 	ret = eeh_add_to_parent_pe(edev);
 	if (ret) {
 		eeh_edev_warn(edev, "Failed to add device to PE (code %d)\n", ret);
-		return;
+		return NULL;
 	}
 
 	/*
@@ -459,6 +467,8 @@ static void pnv_eeh_probe_pdev(struct pci_dev *pdev)
 	eeh_save_bars(edev);
 
 	eeh_edev_dbg(edev, "EEH enabled on device\n");
+
+	return edev;
 }
 
 /**
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 3ac23c884f4e..13a8c274554a 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -317,6 +317,23 @@ static void pseries_eeh_probe_pdn(struct pci_dn *pdn)
 	eeh_save_bars(edev);
 }
 
+/* Platform specific method to retrieve the eeh_dev for this pci_dev */
+static struct eeh_dev *pseries_eeh_probe_pdev(struct pci_dev *pdev)
+{
+	struct eeh_dev *edev;
+	struct pci_dn *pdn;
+
+	pdn = pci_get_pdn_by_devfn(pdev->bus, pdev->devfn);
+	if (!pdn)
+		return NULL;
+
+	edev = pdn_to_eeh_dev(pdn);
+	if (!edev || !edev->pe)
+		return NULL;
+
+	return edev;
+}
+
 /**
  * pseries_eeh_set_option - Initialize EEH or MMIO/DMA reenable
  * @pe: EEH PE
@@ -754,7 +771,7 @@ static struct eeh_ops pseries_eeh_ops = {
 	.name			= "pseries",
 	.init			= pseries_eeh_init,
 	.probe_pdn		= pseries_eeh_probe_pdn,
-	.probe_pdev 		= NULL,
+	.probe_pdev 		= pseries_eeh_probe_pdev,
 	.set_option		= pseries_eeh_set_option,
 	.get_pe_addr		= pseries_eeh_get_pe_addr,
 	.get_state		= pseries_eeh_get_state,
-- 
2.21.0

