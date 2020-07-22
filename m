Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D95D228F6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:54:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBNRX4DydzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:54:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Rrp+spPA; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMr04YZtzDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:27:12 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id w2so514953pgg.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hqPMp+GIgGtfEfPLS8blGqQLEjmPTdgWMzLMN9g4yOs=;
 b=Rrp+spPAgh54B/UXxdKpGzY8rMtyoOnxWJP0TPDblHiXt0Y53I5aoOMhaineVUDKKi
 sZUZGE+iMz33W1/+dNWYBM6plymgx+u/CAB0fTWPNq9PIPoN2rlCFad5lUd46UFWJ5uN
 iDxgfqbXVLhoPrYqM8girnJrigMNdlbcJTemiLcgKjQuSsXCuP68cQ2VS0Ofd57W/Ext
 /UT3H/aOFhyjI3GEuqCEeW18VQccB2XomixQr5AqDX5AjSnrEzO4bHq4OY++QG5l0Z4d
 PQYVfMo6xWfCppdlGwi5sIj/8aeQMjgABpkjrpQuwilQdWpSLYjX2LMIcXGuYeCHfPid
 tWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hqPMp+GIgGtfEfPLS8blGqQLEjmPTdgWMzLMN9g4yOs=;
 b=AMv2vCU9eTq8FpovQKPnTLMeJ28EyVZ5znc5fSsdV3NzsODFmDL74RNTUcHtRuMNuF
 qFK30moybcLshP+7OLiYHUBDLPnf0f+V1sCis0Jsegt5LDwM/1O7+ZSITNQbf0vDDUeR
 z0Ktfbfq9Ap4fOMMUGlHfKdxADNRSVmSyPOzPMK6f4N2XGCjJ6NcV5Fw6SbDsvU7YN9T
 Csfinh0PBCU7RnflNKVm24KUsz1T4fw4c1Ukl1M00Ag5U/7bJ2pI2cZe/tZFaThq9x3k
 l46SyWoReAYDSfa4hSYZKyS3ziUQYaEo7DzPlTw34rDVow5IV2ZMfvpCfumIvxiNmiRS
 1owA==
X-Gm-Message-State: AOAM531DkyEzq9CgGoYpXy1UZfirltAzSKLxE/txQv/B8dUj45otGjYk
 Ly21WpEdhQ4GD0Po4WdVVDsZB0Hie6E=
X-Google-Smtp-Source: ABdhPJzMdZCLd1AlPVTNKdOpRrzrx1wSGVuzJBZg3fIr47UG44HqMzoXXxaKSA/F+tF2tAXuALczKA==
X-Received: by 2002:a62:788d:: with SMTP id
 t135mr25402929pfc.315.1595392030280; 
 Tue, 21 Jul 2020 21:27:10 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id d4sm20583709pgf.9.2020.07.21.21.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 21:27:09 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 14/14] powerpc/eeh: Move PE tree setup into the platform
Date: Wed, 22 Jul 2020 14:26:28 +1000
Message-Id: <20200722042628.1425880-14-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722042628.1425880-1-oohall@gmail.com>
References: <20200722042628.1425880-1-oohall@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The EEH core has a concept of a "PE tree" to support PowerNV. The PE tree
follows the PCI bus structures because a reset asserted on an upstream
bridge will be propagated to the downstream bridges. On pseries there's a
1-1 correspondence between what the guest sees are a PHB and a PE so the
"tree" is really just a single node.

Current the EEH core is reponsible for setting up this PE tree which it
does by traversing the pci_dn tree. The structure of the pci_dn tree
matches the bus tree on PowerNV which leads to the PE tree being "correct"
this setup method doesn't make a whole lot of sense and it's actively
confusing for the pseries case where it doesn't really do anything.

We want to remove the dependence on pci_dn anyway so this patch move
choosing where to insert a new PE into the platform code rather than
being part of the generic EEH code. For PowerNV this simplifies the
tree building logic and removes the use of pci_dn. For pseries we
keep the existing logic. I'm not really convinced it does anything
due to the 1-1 PE-to-PHB correspondence so every device under that
PHB should be in the same PE, but I'd rather not remove it entirely
until we've had a chance to look at it more deeply.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: Reworked pseries PE setup slightly. NOT DONE YET. mostly done needs test
---
 arch/powerpc/include/asm/eeh.h               |  2 +-
 arch/powerpc/kernel/eeh_pe.c                 | 70 ++++++--------------
 arch/powerpc/platforms/powernv/eeh-powernv.c | 27 +++++++-
 arch/powerpc/platforms/pseries/eeh_pseries.c | 66 +++++++++++++++---
 4 files changed, 102 insertions(+), 63 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index df9462230e75..187c23324d96 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -283,7 +283,7 @@ struct eeh_pe *eeh_phb_pe_get(struct pci_controller *phb);
 struct eeh_pe *eeh_pe_next(struct eeh_pe *pe, struct eeh_pe *root);
 struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
 			  int pe_no, int config_addr);
-int eeh_pe_tree_insert(struct eeh_dev *edev);
+int eeh_pe_tree_insert(struct eeh_dev *edev, struct eeh_pe *new_pe_parent);
 int eeh_pe_tree_remove(struct eeh_dev *edev);
 void eeh_pe_update_time_stamp(struct eeh_pe *pe);
 void *eeh_pe_traverse(struct eeh_pe *root,
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 898205829a8f..ea2f8b362d18 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -318,53 +318,20 @@ struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
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
  * eeh_pe_tree_insert - Add EEH device to parent PE
  * @edev: EEH device
+ * @new_pe_parent: PE to create additional PEs under
  *
- * Add EEH device to the parent PE. If the parent PE already
- * exists, the PE type will be changed to EEH_PE_BUS. Otherwise,
- * we have to create new PE to hold the EEH device and the new
- * PE will be linked to its parent PE as well.
+ * Add EEH device to the PE in edev->pe_config_addr. If a PE already
+ * exists with that address then @edev is added to that PE. Otherwise
+ * a new PE is created and inserted into the PE tree as a child of
+ * @new_pe_parent.
+ *
+ * If @new_pe_parent is NULL then the new PE will be inserted under
+ * directly under the the PHB.
  */
-int eeh_pe_tree_insert(struct eeh_dev *edev)
+int eeh_pe_tree_insert(struct eeh_dev *edev, struct eeh_pe *new_pe_parent)
 {
 	struct pci_controller *hose = edev->controller;
 	struct eeh_pe *pe, *parent;
@@ -399,7 +366,7 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
 			}
 
 			eeh_edev_dbg(edev,
-				     "Added to device PE (parent: PE#%x)\n",
+				     "Added to existing PE (parent: PE#%x)\n",
 				     pe->parent->addr);
 		} else {
 			/* Mark the PE as type of PCI bus */
@@ -431,10 +398,9 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
 	 * to PHB directly. Otherwise, we have to associate the
 	 * PE with its parent.
 	 */
-	parent = eeh_pe_get_parent(edev);
-	if (!parent) {
-		parent = eeh_phb_pe_get(hose);
-		if (!parent) {
+	if (!new_pe_parent) {
+		new_pe_parent = eeh_phb_pe_get(hose);
+		if (!new_pe_parent) {
 			pr_err("%s: No PHB PE is found (PHB Domain=%d)\n",
 				__func__, hose->global_number);
 			edev->pe = NULL;
@@ -442,17 +408,19 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
 			return -EEXIST;
 		}
 	}
-	pe->parent = parent;
+
+	/* link new PE into the tree */
+	pe->parent = new_pe_parent;
+	list_add_tail(&pe->child, &new_pe_parent->child_list);
 
 	/*
 	 * Put the newly created PE into the child list and
 	 * link the EEH device accordingly.
 	 */
-	list_add_tail(&pe->child, &parent->child_list);
 	list_add_tail(&edev->entry, &pe->edevs);
 	edev->pe = pe;
-	eeh_edev_dbg(edev, "Added to device PE (parent: PE#%x)\n",
-		     pe->parent->addr);
+	eeh_edev_dbg(edev, "Added to new (parent: PE#%x)\n",
+		     new_pe_parent->addr);
 
 	return 0;
 }
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 8c9fca773692..9af8c3b98853 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -338,6 +338,28 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
 	return 0;
 }
 
+static struct eeh_pe *pnv_eeh_get_upstream_pe(struct pci_dev *pdev)
+{
+	struct pci_controller *hose = pdev->bus->sysdata;
+	struct pnv_phb *phb = hose->private_data;
+	struct pci_dev *parent = pdev->bus->self;
+
+#ifdef CONFIG_PCI_IOV
+	/* for VFs we use the PF's PE as the upstream PE */
+	if (pdev->is_virtfn)
+		parent = pdev->physfn;
+#endif
+
+	/* otherwise use the PE of our parent bridge */
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
@@ -350,6 +372,7 @@ static struct eeh_dev *pnv_eeh_probe(struct pci_dev *pdev)
 	struct pci_controller *hose = pdn->phb;
 	struct pnv_phb *phb = hose->private_data;
 	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
+	struct eeh_pe *upstream_pe;
 	uint32_t pcie_flags;
 	int ret;
 	int config_addr = (pdn->busno << 8) | (pdn->devfn);
@@ -398,8 +421,10 @@ static struct eeh_dev *pnv_eeh_probe(struct pci_dev *pdev)
 
 	edev->pe_config_addr = phb->ioda.pe_rmap[config_addr];
 
+	upstream_pe = pnv_eeh_get_upstream_pe(pdev);
+
 	/* Create PE */
-	ret = eeh_pe_tree_insert(edev);
+	ret = eeh_pe_tree_insert(edev, upstream_pe);
 	if (ret) {
 		eeh_edev_warn(edev, "Failed to add device to PE (code %d)\n", ret);
 		return NULL;
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 88639b65daa3..8169f3e996fc 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -68,11 +68,16 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 	pseries_eeh_init_edev(pdn);
 #ifdef CONFIG_PCI_IOV
 	if (pdev->is_virtfn) {
+		/*
+		 * FIXME: This really should be handled by choosing the right
+		 *        parent PE in in pseries_eeh_init_edev().
+		 */
+		struct eeh_pe *physfn_pe = pci_dev_to_eeh_dev(pdev->physfn)->pe;
 		struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 
 		edev->pe_config_addr =  (pdn->busno << 16) | (pdn->devfn << 8);
 		eeh_pe_tree_remove(edev); /* Remove as it is adding to bus pe */
-		eeh_pe_tree_insert(edev);   /* Add as VF PE type */
+		eeh_pe_tree_insert(edev, physfn_pe);   /* Add as VF PE type */
 	}
 #endif
 	eeh_probe_device(pdev);
@@ -218,6 +223,43 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn, int cap)
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
  * pseries_eeh_init_edev - initialise the eeh_dev and eeh_pe for a pci_dn
  *
@@ -301,6 +343,8 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 	if (ret) {
 		eeh_edev_dbg(edev, "EEH failed to enable on device (code %d)\n", ret);
 	} else {
+		struct eeh_pe *parent;
+
 		/* Retrieve PE address */
 		edev->pe_config_addr = pseries_eeh_get_pe_addr(pdn);
 		pe.addr = edev->pe_config_addr;
@@ -313,16 +357,18 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 		if (ret > 0 && ret != EEH_STATE_NOT_SUPPORT)
 			enable = 1;
 
-		if (enable) {
+		/* This device doesn't support EEH, but it may have an
+		 * EEH parent. In this case any error on the device will
+		 * freeze the PE of it's upstream bridge, so added it to
+		 * the upstream PE.
+		 */
+		parent = pseries_eeh_pe_get_parent(edev);
+		if (parent && !enable)
+			edev->pe_config_addr = parent->addr;
+
+		if (enable || parent) {
 			eeh_add_flag(EEH_ENABLED);
-			eeh_pe_tree_insert(edev);
-		} else if (pdn->parent && pdn_to_eeh_dev(pdn->parent) &&
-			   (pdn_to_eeh_dev(pdn->parent))->pe) {
-			/* This device doesn't support EEH, but it may have an
-			 * EEH parent, in which case we mark it as supported.
-			 */
-			edev->pe_config_addr = pdn_to_eeh_dev(pdn->parent)->pe_config_addr;
-			eeh_pe_tree_insert(edev);
+			eeh_pe_tree_insert(edev, parent);
 		}
 		eeh_edev_dbg(edev, "EEH is %s on device (code %d)\n",
 			     (enable ? "enabled" : "unsupported"), ret);
-- 
2.26.2

