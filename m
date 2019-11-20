Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA27103175
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:16:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmX40bMHzDqWf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:16:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hG2FpKbF"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVm3QxkzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:08 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id 15so12474322pgh.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CDVoUaXSZeU9virSe+A0A59TJEcwxso6UpIOzuiiLnA=;
 b=hG2FpKbFOgToW5aizhDkKpUOPW+LMEFZmm0aYuWGHPCuiW5y+Mr4rz0IVJexsUv1Hb
 9cMyYHcx83HuRAZZg8h91jKGnbGu1zAHUT8hZNlsgFozP8anJGLrFb1qGmolX35Ts6OS
 9XqQTEj7fOXBL3m7SrU5CHYCeu+tmPXGfansHL/0GE+Y03KVHVc8/2QkKU5SACvVbV+J
 mtCgck2LHX295gGToxiaGfGkxLc8VfiSYEBsssSmhRCPIFRwupMPVDWPsbhw9ZQOZPk6
 AW0aeevcC4N+GOceBnkO2ibWb4kaZRsZIHej5jpyP6kVdDs35Myj08yA/GX4/i8yZvzn
 NFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CDVoUaXSZeU9virSe+A0A59TJEcwxso6UpIOzuiiLnA=;
 b=aeEJYmE4vsSi+6lutYujvIfQVv6HQih7zpvEziXnv8bRqNPdKmYchkUphs3BzCmgY3
 snNQJiNAYtZsfsnMErqZA/FY4JSDUXCkfp8YMzU3bHGIn6WRZl48MJf13HtULfHQ+mqP
 AEd46gTmEphqvCFy06HjJqbDGqfuQypz7gXvBIWIU0gBaw74eW+Kp6YChc2K1WLx4c9r
 hn0oxb9bheuTM6GiNvRjuXtzU5LNSR+7S5mOpHQtGbjmLhYIKnUYy0QbAJV7T9+IA6Uy
 nIvir0C1unHhrnzKjkgG9vgIh4wbU7WZMsP5BqbEx8M8p/NZ3glO074jd35PDgzQxYV0
 IW+Q==
X-Gm-Message-State: APjAAAWL4ZUQluscKBxH0cHxyMjkPi6/0fAk8yc4j1LRzYbGe9YoyTPz
 ZXuhiJ7tlQLWodNf0jxPK79CQ6Jk
X-Google-Smtp-Source: APXvYqwgzVlR6Uo+Ghpr/FYJJ6f+xCPEeZqd9y2tOcQyHMhYrKmgSWlKiioe+ma7VmEVAhiguL8aJA==
X-Received: by 2002:a62:1693:: with SMTP id 141mr783364pfw.146.1574213406270; 
 Tue, 19 Nov 2019 17:30:06 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:05 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 23/46] powerpc/eeh: Moving finding the parent PE into the
 platform
Date: Wed, 20 Nov 2019 12:28:36 +1100
Message-Id: <20191120012859.23300-24-oohall@gmail.com>
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

Currently the generic EEH code uses the pci_dn of a device to look up the
PE of the device's parent bridge, or physical function. The generic
function to insert the edev (and possibly create the eeh_pe) is called
from the probe functions already so this is a relatively minor change.

The existing lookup method moves into the pseries platform and PowerNV
can choose the PE based on the bus heirachy instead.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
"parent" meaning "parent of the PE that actually contains this edev"
is stupid, but it's stupid consistent with what's there already. Also
I couldn't think of a way to fix it without adding a bunch of boring
boilerplate at the call sites.

FIXME: I think I introduced a bug here. Currently we coalase a switch's
upstream port bus and the downstream port bus into a single PE since
they're a single failure domain. That seems to have been broken by
this patch, but whatever.
---
 arch/powerpc/include/asm/eeh.h               |  2 +-
 arch/powerpc/kernel/eeh_pe.c                 | 54 ++++-------------
 arch/powerpc/platforms/powernv/eeh-powernv.c | 25 +++++++-
 arch/powerpc/platforms/pseries/eeh_pseries.c | 61 ++++++++++++++++----
 4 files changed, 86 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index e109bfd3dd57..70d3e01dbe9d 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -295,7 +295,7 @@ struct eeh_pe *eeh_phb_pe_get(struct pci_controller *phb);
 struct eeh_pe *eeh_pe_next(struct eeh_pe *pe, struct eeh_pe *root);
 struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
 			  int pe_no, int config_addr);
-int eeh_add_to_parent_pe(struct eeh_dev *edev);
+int eeh_add_to_parent_pe(struct eeh_pe *parent, struct eeh_dev *edev);
 int eeh_rmv_from_parent_pe(struct eeh_dev *edev);
 void eeh_pe_update_time_stamp(struct eeh_pe *pe);
 void *eeh_pe_traverse(struct eeh_pe *root,
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 831f363f1732..520c249f19d3 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -318,56 +318,23 @@ struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
 	return pe;
 }
 
-/**
- * eeh_pe_get_parent - Retrieve the parent PE
- * @edev: EEH device
- *
- * The whole PEs existing in the system are organized as hierarchy
- * tree. The function is used to retrieve the parent PE according
- * to the parent EEH device.
- */
-static struct eeh_pe *eeh_pe_get_parent(struct eeh_dev *edev)
-{
-	struct eeh_dev *parent;
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-
-	/*
-	 * It might have the case for the indirect parent
-	 * EEH device already having associated PE, but
-	 * the direct parent EEH device doesn't have yet.
-	 */
-	if (edev->physfn)
-		pdn = pci_get_pdn(edev->physfn);
-	else
-		pdn = pdn ? pdn->parent : NULL;
-	while (pdn) {
-		/* We're poking out of PCI territory */
-		parent = pdn_to_eeh_dev(pdn);
-		if (!parent)
-			return NULL;
-
-		if (parent->pe)
-			return parent->pe;
-
-		pdn = pdn->parent;
-	}
-
-	return NULL;
-}
-
 /**
  * eeh_add_to_parent_pe - Add EEH device to parent PE
+ * @parent: PE to create additional PEs under
  * @edev: EEH device
  *
- * Add EEH device to the parent PE. If the parent PE already
- * exists, the PE type will be changed to EEH_PE_BUS. Otherwise,
- * we have to create new PE to hold the EEH device and the new
- * PE will be linked to its parent PE as well.
+ * Add EEH device to the PE in edev->pe_config_addr. If the PE
+ * already exists then we'll add it to that. Otherwise a new
+ * PE is created, and inserted into the PE tree below @parent.
+ * If @parent is NULL, then it will be inserted under the PHB
+ * PE for edev->controller.
+ *
+ * In either case @edev is added to the PE's device list.
  */
-int eeh_add_to_parent_pe(struct eeh_dev *edev)
+int eeh_add_to_parent_pe(struct eeh_pe *parent, struct eeh_dev *edev)
 {
 	int config_addr = edev->bdfn;
-	struct eeh_pe *pe, *parent;
+	struct eeh_pe *pe;
 
 	/* Check if the PE number is valid */
 	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr) {
@@ -431,7 +398,6 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	 * to PHB directly. Otherwise, we have to associate the
 	 * PE with its parent.
 	 */
-	parent = eeh_pe_get_parent(edev);
 	if (!parent) {
 		parent = eeh_phb_pe_get(edev->controller);
 		if (!parent) {
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 7aba18e08996..49a932ff092a 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -358,6 +358,25 @@ static int pnv_eeh_write_config(struct eeh_dev *edev,
 	return pnv_pci_cfg_write(pdn, where, size, val);
 }
 
+static struct eeh_pe *pnv_eeh_pe_get_parent(struct pci_dev *pdev)
+{
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
+	struct pci_dev *parent = pdev->bus->self;
+
+#ifdef CONFIG_PCI_IOV
+	if (pdev->is_virtfn)
+		parent = pdev->physfn;
+#endif
+
+	if (parent) {
+		struct pnv_ioda_pe *ioda_pe = pnv_ioda_get_pe(parent);
+
+		return eeh_pe_get(phb->hose, ioda_pe->pe_number, 0);
+	}
+
+	return NULL;
+}
+
 /**
  * pnv_eeh_probe - Do probe on PCI device
  * @pdev: pci_dev to probe
@@ -368,6 +387,7 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 {
 	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pci_controller *hose = phb->hose;
+	struct eeh_pe *parent_pe;
 	struct eeh_dev *edev;
 	uint32_t pcie_flags;
 	int ret;
@@ -450,8 +470,11 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 
 	edev->pe_config_addr = phb->ioda.pe_rmap[config_addr];
 
+	/* find the PE that contains this PE, might be NULL */
+	parent_pe = pnv_eeh_pe_get_parent(pdev);
+
 	/* Create PE */
-	ret = eeh_add_to_parent_pe(edev);
+	ret = eeh_add_to_parent_pe(parent_pe, edev);
 	if (ret) {
 		eeh_edev_warn(edev, "Failed to add device to PE (code %d)\n", ret);
 		return NULL;
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 13a8c274554a..b4a92c24fd45 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -70,11 +70,12 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 	eeh_add_device_early(pdn);
 #ifdef CONFIG_PCI_IOV
 	if (pdev->is_virtfn) {
+		struct eeh_pe *physfn_pe = pci_dev_to_eeh_dev(pdev->physfn)->pe;
 		struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 
 		edev->pe_config_addr =  (pdn->busno << 16) | (pdn->devfn << 8);
 		eeh_rmv_from_parent_pe(edev); /* Remove as it is adding to bus pe */
-		eeh_add_to_parent_pe(edev);   /* Add as VF PE type */
+		eeh_add_to_parent_pe(physfn_pe, edev); /* Add as VF PE type */
 	}
 #endif
 	eeh_add_device_late(pdev);
@@ -220,6 +221,43 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn, int cap)
 	return 0;
 }
 
+/**
+ * pseries_eeh_pe_get_parent - Retrieve the parent PE
+ * @edev: EEH device
+ *
+ * The whole PEs existing in the system are organized as hierarchy
+ * tree. The function is used to retrieve the parent PE according
+ * to the parent EEH device.
+ */
+static struct eeh_pe *pseries_eeh_pe_get_parent(struct eeh_dev *edev)
+{
+	struct eeh_dev *parent;
+	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
+
+	/*
+	 * It might have the case for the indirect parent
+	 * EEH device already having associated PE, but
+	 * the direct parent EEH device doesn't have yet.
+	 */
+	if (edev->physfn)
+		pdn = pci_get_pdn(edev->physfn);
+	else
+		pdn = pdn ? pdn->parent : NULL;
+	while (pdn) {
+		/* We're poking out of PCI territory */
+		parent = pdn_to_eeh_dev(pdn);
+		if (!parent)
+			return NULL;
+
+		if (parent->pe)
+			return parent->pe;
+
+		pdn = pdn->parent;
+	}
+
+	return NULL;
+}
+
 /**
  * pseries_eeh_probe - EEH probe on the given device
  * @pdn: PCI device node
@@ -286,10 +324,14 @@ static void pseries_eeh_probe_pdn(struct pci_dn *pdn)
 	if (ret) {
 		eeh_edev_dbg(edev, "EEH failed to enable on device (code %d)\n", ret);
 	} else {
+		struct eeh_pe *parent;
+
 		/* Retrieve PE address */
 		edev->pe_config_addr = eeh_ops->get_pe_addr(&pe);
 		pe.addr = edev->pe_config_addr;
 
+		parent = pseries_eeh_pe_get_parent(edev);
+
 		/* Some older systems (Power4) allow the ibm,set-eeh-option
 		 * call to succeed even on nodes where EEH is not supported.
 		 * Verify support explicitly.
@@ -298,16 +340,15 @@ static void pseries_eeh_probe_pdn(struct pci_dn *pdn)
 		if (ret > 0 && ret != EEH_STATE_NOT_SUPPORT)
 			enable = 1;
 
-		if (enable) {
+		/* This device doesn't support EEH, but it may have an
+		 * EEH parent, in which case we mark it as supported.
+		 */
+		if (parent && !enable)
+			edev->pe_config_addr = parent->addr;
+
+		if (enable || parent) {
 			eeh_add_flag(EEH_ENABLED);
-			eeh_add_to_parent_pe(edev);
-		} else if (pdn->parent && pdn_to_eeh_dev(pdn->parent) &&
-			   (pdn_to_eeh_dev(pdn->parent))->pe) {
-			/* This device doesn't support EEH, but it may have an
-			 * EEH parent, in which case we mark it as supported.
-			 */
-			edev->pe_config_addr = pdn_to_eeh_dev(pdn->parent)->pe_config_addr;
-			eeh_add_to_parent_pe(edev);
+			eeh_add_to_parent_pe(parent, edev);
 		}
 		eeh_edev_dbg(edev, "EEH is %s on device (code %d)\n",
 			     (enable ? "enabled" : "unsupported"), ret);
-- 
2.21.0

