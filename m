Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CCA22D61E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 10:34:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDK9k5W30zDrS2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 18:34:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j/W1/znW; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDJjN4g1CzF1LZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 18:13:12 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id d188so467060pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ud+Gofgy7wS4kQABU8QZIEnddoEJmYX82SfS8RWFKks=;
 b=j/W1/znWZrumYJoAlU4J6nrKDTxFFW9Yv43dNGjlIUQYRvTuJchOgAEBMv727yyCqF
 YJr1oJh1a5tQChhdVFP2jwIx1NfuKGe50u+r2njA1GpFaoCroPRX+KViQkoFdsTJImVb
 fsEokCH7InEqvLixRjCFb2IpKq4YA67S+ZozaXJj2UpalyjiU7BirZPM/sJxGDKlxMbZ
 oIqDBQvKnPpa0Ju6ZcVENQPiE/7aTYliJE7JyjBn04wEgwq8p6o1VGQe3KzGKb71yRwb
 0N1Xxa8ccF3lmKP1winZBJXZ7hJHLR8RmbqV/nBNeB3SooTFSY1epR5EiCfehPcb8bU2
 7XPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ud+Gofgy7wS4kQABU8QZIEnddoEJmYX82SfS8RWFKks=;
 b=c9fmnPMjpm0SoxMAggabhEqcjV5KeD+xpBYumWNojsplosgfnJ4ReyKieaqmqWzeTA
 RVSnf2HJDRR+0jT++qApvWyxFoInbwHKwFHmKDxp4+9JJ4+3Ib9JxkCRigJ4Rdcdgr+1
 seMZ5dK9qdcZxWzeVpCd5239Y2qapxanz0dyK62ooz9slzLLHUzdLQ5wrLRpEhPvwo9d
 pNGS1DMhqQpqRE8ZdIh7xnrg+qfxMMZrKyE3nze/D86LH0T+/qXjoopEXVZ1qKSwiHoI
 vziUGwi196zSP3zAVuHrHCjCp564bySuL/un4UcY5apEZZ7Uxm3Vjbwrhzc9n1dopLI+
 qdbw==
X-Gm-Message-State: AOAM530wXussFSDPyqtMx06gIeg5Z8eHFoZIj+vkDWzVNiVEV718YX5Q
 aVMouDpJadCISfTGmIR5Bq16Rjtj4OU=
X-Google-Smtp-Source: ABdhPJx5GVp6KWlQ89QsQKHyyg89h4Z61SDbecIJLK5txOQ0iLXkOVRc9yh2r6u6O80rCQ8trk8jCw==
X-Received: by 2002:a63:690:: with SMTP id 138mr11289693pgg.122.1595664789878; 
 Sat, 25 Jul 2020 01:13:09 -0700 (PDT)
Received: from localhost.localdomain ([118.210.60.180])
 by smtp.gmail.com with ESMTPSA id a26sm8647360pgm.20.2020.07.25.01.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 01:13:09 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 12/14] powerpc/eeh: Rename
 eeh_{add_to|remove_from}_parent_pe()
Date: Sat, 25 Jul 2020 18:12:29 +1000
Message-Id: <20200725081231.39076-12-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200725081231.39076-1-oohall@gmail.com>
References: <20200725081231.39076-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The naming of eeh_{add_to|remove_from}_parent_pe() doesn't really reflect
what they actually do. If the PE referred to be edev->pe_config_addr
already exists under that PHB then the edev is added to that PE. However,
if the PE doesn't exist the a new one is created for the edev.

The bulk of the implementation of eeh_add_to_parent_pe() covers that
second case. Similarly, most of eeh_remove_from_parent_pe() is
determining when it's safe to delete a PE.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: no changes
v3: no changes
---
 arch/powerpc/include/asm/eeh.h               | 4 ++--
 arch/powerpc/kernel/eeh.c                    | 4 ++--
 arch/powerpc/kernel/eeh_driver.c             | 2 +-
 arch/powerpc/kernel/eeh_pe.c                 | 8 ++++----
 arch/powerpc/kernel/pci_dn.c                 | 2 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c | 2 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c | 8 ++++----
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 79de8624809a..ee5f354bc8b9 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -283,8 +283,8 @@ struct eeh_pe *eeh_phb_pe_get(struct pci_controller *phb);
 struct eeh_pe *eeh_pe_next(struct eeh_pe *pe, struct eeh_pe *root);
 struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
 			  int pe_no, int config_addr);
-int eeh_add_to_parent_pe(struct eeh_dev *edev);
-int eeh_rmv_from_parent_pe(struct eeh_dev *edev);
+int eeh_pe_tree_insert(struct eeh_dev *edev);
+int eeh_pe_tree_remove(struct eeh_dev *edev);
 void eeh_pe_update_time_stamp(struct eeh_pe *pe);
 void *eeh_pe_traverse(struct eeh_pe *root,
 		      eeh_pe_traverse_func fn, void *flag);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index f203ffc5c57d..94682382fc8c 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1107,7 +1107,7 @@ void eeh_probe_device(struct pci_dev *dev)
 	 * FIXME: HEY MA, LOOK AT ME, NO LOCKING!
 	 */
 	if (edev->pdev && edev->pdev != dev) {
-		eeh_rmv_from_parent_pe(edev);
+		eeh_pe_tree_remove(edev);
 		eeh_addr_cache_rmv_dev(edev->pdev);
 		eeh_sysfs_remove_device(edev->pdev);
 
@@ -1186,7 +1186,7 @@ void eeh_remove_device(struct pci_dev *dev)
 	edev->in_error = false;
 	dev->dev.archdata.edev = NULL;
 	if (!(edev->pe->state & EEH_PE_KEEP))
-		eeh_rmv_from_parent_pe(edev);
+		eeh_pe_tree_remove(edev);
 	else
 		edev->mode |= EEH_DEV_DISCONNECTED;
 }
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index b84d3cb2532e..4197e4559f65 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -542,7 +542,7 @@ static void *eeh_pe_detach_dev(struct eeh_pe *pe, void *userdata)
 			continue;
 
 		edev->mode &= ~(EEH_DEV_DISCONNECTED | EEH_DEV_IRQ_DISABLED);
-		eeh_rmv_from_parent_pe(edev);
+		eeh_pe_tree_remove(edev);
 	}
 
 	return NULL;
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index f20fb0ee6aec..97bf09db2ecd 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -356,7 +356,7 @@ static struct eeh_pe *eeh_pe_get_parent(struct eeh_dev *edev)
 }
 
 /**
- * eeh_add_to_parent_pe - Add EEH device to parent PE
+ * eeh_pe_tree_insert - Add EEH device to parent PE
  * @edev: EEH device
  *
  * Add EEH device to the parent PE. If the parent PE already
@@ -364,7 +364,7 @@ static struct eeh_pe *eeh_pe_get_parent(struct eeh_dev *edev)
  * we have to create new PE to hold the EEH device and the new
  * PE will be linked to its parent PE as well.
  */
-int eeh_add_to_parent_pe(struct eeh_dev *edev)
+int eeh_pe_tree_insert(struct eeh_dev *edev)
 {
 	struct eeh_pe *pe, *parent;
 	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
@@ -459,7 +459,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 }
 
 /**
- * eeh_rmv_from_parent_pe - Remove one EEH device from the associated PE
+ * eeh_pe_tree_remove - Remove one EEH device from the associated PE
  * @edev: EEH device
  *
  * The PE hierarchy tree might be changed when doing PCI hotplug.
@@ -467,7 +467,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
  * during EEH recovery. So we have to call the function remove the
  * corresponding PE accordingly if necessary.
  */
-int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
+int eeh_pe_tree_remove(struct eeh_dev *edev)
 {
 	struct eeh_pe *pe, *parent, *child;
 	bool keep, recover;
diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index bf11ac8427ac..e99b7c547d7e 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -263,7 +263,7 @@ void remove_sriov_vf_pdns(struct pci_dev *pdev)
 				 * have a configured PE.
 				 */
 				if (edev->pe)
-					eeh_rmv_from_parent_pe(edev);
+					eeh_pe_tree_remove(edev);
 
 				pdn->edev = NULL;
 				kfree(edev);
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 7cbb03a97a61..8c9fca773692 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -399,7 +399,7 @@ static struct eeh_dev *pnv_eeh_probe(struct pci_dev *pdev)
 	edev->pe_config_addr = phb->ioda.pe_rmap[config_addr];
 
 	/* Create PE */
-	ret = eeh_add_to_parent_pe(edev);
+	ret = eeh_pe_tree_insert(edev);
 	if (ret) {
 		eeh_edev_warn(edev, "Failed to add device to PE (code %d)\n", ret);
 		return NULL;
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 67931fe5f341..88639b65daa3 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -71,8 +71,8 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 		struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 
 		edev->pe_config_addr =  (pdn->busno << 16) | (pdn->devfn << 8);
-		eeh_rmv_from_parent_pe(edev); /* Remove as it is adding to bus pe */
-		eeh_add_to_parent_pe(edev);   /* Add as VF PE type */
+		eeh_pe_tree_remove(edev); /* Remove as it is adding to bus pe */
+		eeh_pe_tree_insert(edev);   /* Add as VF PE type */
 	}
 #endif
 	eeh_probe_device(pdev);
@@ -315,14 +315,14 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 
 		if (enable) {
 			eeh_add_flag(EEH_ENABLED);
-			eeh_add_to_parent_pe(edev);
+			eeh_pe_tree_insert(edev);
 		} else if (pdn->parent && pdn_to_eeh_dev(pdn->parent) &&
 			   (pdn_to_eeh_dev(pdn->parent))->pe) {
 			/* This device doesn't support EEH, but it may have an
 			 * EEH parent, in which case we mark it as supported.
 			 */
 			edev->pe_config_addr = pdn_to_eeh_dev(pdn->parent)->pe_config_addr;
-			eeh_add_to_parent_pe(edev);
+			eeh_pe_tree_insert(edev);
 		}
 		eeh_edev_dbg(edev, "EEH is %s on device (code %d)\n",
 			     (enable ? "enabled" : "unsupported"), ret);
-- 
2.26.2

