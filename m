Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C22A372568
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 05:34:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tgvS0W8DzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 13:34:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t4Bk1jm9zDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 13:45:50 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6N3jhbc065152
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 23:45:47 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2twtfhr6nu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 23:45:45 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 23 Jul 2019 04:44:27 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 23 Jul 2019 04:44:24 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6N3i9sa40960448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2019 03:44:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C54914C04A;
 Tue, 23 Jul 2019 03:44:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AE244C044;
 Tue, 23 Jul 2019 03:44:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jul 2019 03:44:23 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 98172A03C2;
 Tue, 23 Jul 2019 13:44:20 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 9/9] powerpc/eeh: Convert log messages to eeh_edev_* macros
Date: Tue, 23 Jul 2019 13:44:20 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1563853440.git.sbobroff@linux.ibm.com>
References: <cover.1563853440.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19072303-0012-0000-0000-00000335512C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072303-0013-0000-0000-0000216EDF94
Message-Id: <d5bbb2e9a39da905d656524bdf9e1b6705fd526a.1563853440.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907230030
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
Cc: aik@ozlabs.ru, oohall@gmail.com, tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert existing messages, where appropriate, to use the eeh_edev_*
logging macros.

The only effect should be minor adjustments to the log messages, apart
from:

- A new message in pseries_eeh_probe() "Probing device" to match the
powernv case.
- The "Probing device" message in pnv_eeh_probe() is now generated
slightly later, which will mean that it is no longer emitted for
devices that aren't probed due to the initial checks.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
v3 * New in this version.

 arch/powerpc/include/asm/ppc-pci.h           |  5 --
 arch/powerpc/kernel/eeh.c                    | 19 +++-----
 arch/powerpc/kernel/eeh_cache.c              |  8 +--
 arch/powerpc/kernel/eeh_driver.c             |  4 +-
 arch/powerpc/kernel/eeh_pe.c                 | 51 +++++---------------
 arch/powerpc/platforms/powernv/eeh-powernv.c | 17 ++-----
 arch/powerpc/platforms/pseries/eeh_pseries.c | 21 +++-----
 7 files changed, 38 insertions(+), 87 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
index 72860de205a0..7f4be5a05eb3 100644
--- a/arch/powerpc/include/asm/ppc-pci.h
+++ b/arch/powerpc/include/asm/ppc-pci.h
@@ -62,11 +62,6 @@ void eeh_pe_dev_mode_mark(struct eeh_pe *pe, int mode);
 void eeh_sysfs_add_device(struct pci_dev *pdev);
 void eeh_sysfs_remove_device(struct pci_dev *pdev);
 
-static inline const char *eeh_pci_name(struct pci_dev *pdev) 
-{ 
-	return pdev ? pci_name(pdev) : "<null>";
-} 
-
 static inline const char *eeh_driver_name(struct pci_dev *pdev)
 {
 	return (pdev && pdev->driver) ? pdev->driver->name : "<null>";
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index c0ec1b6b1e69..b6683f367f7f 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -461,8 +461,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	/* Access to IO BARs might get this far and still not want checking. */
 	if (!pe) {
 		eeh_stats.ignored_check++;
-		pr_debug("EEH: Ignored check for %s\n",
-			eeh_pci_name(dev));
+		eeh_edev_dbg(edev, "Ignored check\n");
 		return 0;
 	}
 
@@ -502,12 +501,11 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 			if (dn)
 				location = of_get_property(dn, "ibm,loc-code",
 						NULL);
-			printk(KERN_ERR "EEH: %d reads ignored for recovering device at "
-				"location=%s driver=%s pci addr=%s\n",
+			eeh_edev_err(edev, "%d reads ignored for recovering device at location=%s driver=%s\n",
 				pe->check_count,
 				location ? location : "unknown",
-				eeh_driver_name(dev), eeh_pci_name(dev));
-			printk(KERN_ERR "EEH: Might be infinite loop in %s driver\n",
+				eeh_driver_name(dev));
+			eeh_edev_err(edev, "Might be infinite loop in %s driver\n",
 				eeh_driver_name(dev));
 			dump_stack();
 		}
@@ -1268,12 +1266,11 @@ void eeh_add_device_late(struct pci_dev *dev)
 	if (!dev)
 		return;
 
-	pr_debug("EEH: Adding device %s\n", pci_name(dev));
-
 	pdn = pci_get_pdn_by_devfn(dev->bus, dev->devfn);
 	edev = pdn_to_eeh_dev(pdn);
+	eeh_edev_dbg(edev, "Adding device\n");
 	if (edev->pdev == dev) {
-		pr_debug("EEH: Device %s already referenced!\n", pci_name(dev));
+		eeh_edev_dbg(edev, "Device already referenced!\n");
 		return;
 	}
 
@@ -1374,10 +1371,10 @@ void eeh_remove_device(struct pci_dev *dev)
 	edev = pci_dev_to_eeh_dev(dev);
 
 	/* Unregister the device with the EEH/PCI address search system */
-	pr_debug("EEH: Removing device %s\n", pci_name(dev));
+	dev_dbg(&dev->dev, "EEH: Removing device\n");
 
 	if (!edev || !edev->pdev || !edev->pe) {
-		pr_debug("EEH: Not referenced !\n");
+		dev_dbg(&dev->dev, "EEH: Device not referenced!\n");
 		return;
 	}
 
diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_cache.c
index 8c8649172e97..45360b9eab90 100644
--- a/arch/powerpc/kernel/eeh_cache.c
+++ b/arch/powerpc/kernel/eeh_cache.c
@@ -145,8 +145,8 @@ eeh_addr_cache_insert(struct pci_dev *dev, resource_size_t alo,
 	piar->pcidev = dev;
 	piar->flags = flags;
 
-	pr_debug("PIAR: insert range=[%pap:%pap] dev=%s\n",
-		 &alo, &ahi, pci_name(dev));
+	eeh_edev_dbg(piar->edev, "PIAR: insert range=[%pap:%pap]\n",
+		 &alo, &ahi);
 
 	rb_link_node(&piar->rb_node, parent, p);
 	rb_insert_color(&piar->rb_node, &pci_io_addr_cache_root.rb_root);
@@ -226,8 +226,8 @@ static inline void __eeh_addr_cache_rmv_dev(struct pci_dev *dev)
 		piar = rb_entry(n, struct pci_io_addr_range, rb_node);
 
 		if (piar->pcidev == dev) {
-			pr_debug("PIAR: remove range=[%pap:%pap] dev=%s\n",
-				 &piar->addr_lo, &piar->addr_hi, pci_name(dev));
+			eeh_edev_dbg(piar->edev, "PIAR: remove range=[%pap:%pap]\n",
+				 &piar->addr_lo, &piar->addr_hi);
 			rb_erase(n, &pci_io_addr_cache_root.rb_root);
 			kfree(piar);
 			goto restart;
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 29424d5e5fea..87e531bafe75 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -460,9 +460,7 @@ static void *eeh_add_virt_device(struct eeh_dev *edev)
 	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 
 	if (!(edev->physfn)) {
-		pr_warn("%s: EEH dev %04x:%02x:%02x.%01x not for VF\n",
-			__func__, pdn->phb->global_number, pdn->busno,
-			PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
+		eeh_edev_warn(edev, "Not for VF\n");
 		return NULL;
 	}
 
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 854cef7b18f4..317a31624526 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -379,8 +379,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 
 	/* Check if the PE number is valid */
 	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr) {
-		pr_err("%s: Invalid PE#0 for edev 0x%x on PHB#%x\n",
-		       __func__, config_addr, pdn->phb->global_number);
+		eeh_edev_err(edev, "PE#0 is invalid for this PHB!\n");
 		return -EINVAL;
 	}
 
@@ -398,12 +397,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 
 		/* Put the edev to PE */
 		list_add_tail(&edev->entry, &pe->edevs);
-		pr_debug("EEH: Add %04x:%02x:%02x.%01x to Bus PE#%x\n",
-			 pdn->phb->global_number,
-			 pdn->busno,
-			 PCI_SLOT(pdn->devfn),
-			 PCI_FUNC(pdn->devfn),
-			 pe->addr);
+		eeh_edev_dbg(edev, "Added to bus PE\n");
 		return 0;
 	} else if (pe && (pe->type & EEH_PE_INVALID)) {
 		list_add_tail(&edev->entry, &pe->edevs);
@@ -420,13 +414,8 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 			parent = parent->parent;
 		}
 
-		pr_debug("EEH: Add %04x:%02x:%02x.%01x to Device "
-			 "PE#%x, Parent PE#%x\n",
-			 pdn->phb->global_number,
-			 pdn->busno,
-			 PCI_SLOT(pdn->devfn),
-			 PCI_FUNC(pdn->devfn),
-			 pe->addr, pe->parent->addr);
+		eeh_edev_dbg(edev, "Added to device PE (parent: PE#%x)\n",
+			     pe->parent->addr);
 		return 0;
 	}
 
@@ -468,13 +457,8 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	list_add_tail(&pe->child, &parent->child_list);
 	list_add_tail(&edev->entry, &pe->edevs);
 	edev->pe = pe;
-	pr_debug("EEH: Add %04x:%02x:%02x.%01x to "
-		 "Device PE#%x, Parent PE#%x\n",
-		 pdn->phb->global_number,
-		 pdn->busno,
-		 PCI_SLOT(pdn->devfn),
-		 PCI_FUNC(pdn->devfn),
-		 pe->addr, pe->parent->addr);
+	eeh_edev_dbg(edev, "Added to device PE (parent: PE#%x)\n",
+		     pe->parent->addr);
 
 	return 0;
 }
@@ -492,15 +476,10 @@ int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
 {
 	struct eeh_pe *pe, *parent, *child;
 	int cnt;
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 
 	pe = eeh_dev_to_pe(edev);
 	if (!pe) {
-		pr_debug("%s: No PE found for device %04x:%02x:%02x.%01x\n",
-			 __func__,  pdn->phb->global_number,
-			 pdn->busno,
-			 PCI_SLOT(pdn->devfn),
-			 PCI_FUNC(pdn->devfn));
+		eeh_edev_dbg(edev, "No PE found for device.\n");
 		return -EEXIST;
 	}
 
@@ -717,17 +696,13 @@ static void eeh_bridge_check_link(struct eeh_dev *edev)
 	if (!(edev->mode & (EEH_DEV_ROOT_PORT | EEH_DEV_DS_PORT)))
 		return;
 
-	pr_debug("%s: Check PCIe link for %04x:%02x:%02x.%01x ...\n",
-		 __func__, pdn->phb->global_number,
-		 pdn->busno,
-		 PCI_SLOT(pdn->devfn),
-		 PCI_FUNC(pdn->devfn));
+	eeh_edev_dbg(edev, "Checking PCIe link...\n");
 
 	/* Check slot status */
 	cap = edev->pcie_cap;
 	eeh_ops->read_config(pdn, cap + PCI_EXP_SLTSTA, 2, &val);
 	if (!(val & PCI_EXP_SLTSTA_PDS)) {
-		pr_debug("  No card in the slot (0x%04x) !\n", val);
+		eeh_edev_dbg(edev, "No card in the slot (0x%04x) !\n", val);
 		return;
 	}
 
@@ -736,7 +711,7 @@ static void eeh_bridge_check_link(struct eeh_dev *edev)
 	if (val & PCI_EXP_SLTCAP_PCP) {
 		eeh_ops->read_config(pdn, cap + PCI_EXP_SLTCTL, 2, &val);
 		if (val & PCI_EXP_SLTCTL_PCC) {
-			pr_debug("  In power-off state, power it on ...\n");
+			eeh_edev_dbg(edev, "In power-off state, power it on ...\n");
 			val &= ~(PCI_EXP_SLTCTL_PCC | PCI_EXP_SLTCTL_PIC);
 			val |= (0x0100 & PCI_EXP_SLTCTL_PIC);
 			eeh_ops->write_config(pdn, cap + PCI_EXP_SLTCTL, 2, val);
@@ -752,7 +727,7 @@ static void eeh_bridge_check_link(struct eeh_dev *edev)
 	/* Check link */
 	eeh_ops->read_config(pdn, cap + PCI_EXP_LNKCAP, 4, &val);
 	if (!(val & PCI_EXP_LNKCAP_DLLLARC)) {
-		pr_debug("  No link reporting capability (0x%08x) \n", val);
+		eeh_edev_dbg(edev, "No link reporting capability (0x%08x) \n", val);
 		msleep(1000);
 		return;
 	}
@@ -769,10 +744,10 @@ static void eeh_bridge_check_link(struct eeh_dev *edev)
 	}
 
 	if (val & PCI_EXP_LNKSTA_DLLLA)
-		pr_debug("  Link up (%s)\n",
+		eeh_edev_dbg(edev, "Link up (%s)\n",
 			 (val & PCI_EXP_LNKSTA_CLS_2_5GB) ? "2.5GB" : "5GB");
 	else
-		pr_debug("  Link not ready (0x%04x)\n", val);
+		eeh_edev_dbg(edev, "Link not ready (0x%04x)\n", val);
 }
 
 #define BYTE_SWAP(OFF)	(8*((OFF)/4)+3-(OFF))
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 7ee0df9ba2c8..43c3b7d81794 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -46,7 +46,7 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
 	if (eeh_has_flag(EEH_FORCE_DISABLED))
 		return;
 
-	pr_debug("%s: EEH: Setting up device %s.\n", __func__, pci_name(pdev));
+	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
 	eeh_add_device_early(pdn);
 	eeh_add_device_late(pdev);
 	eeh_sysfs_add_device(pdev);
@@ -399,10 +399,6 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 	int ret;
 	int config_addr = (pdn->busno << 8) | (pdn->devfn);
 
-	pr_debug("%s: probing %04x:%02x:%02x.%01x\n",
-		__func__, hose->global_number, pdn->busno,
-		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
-
 	/*
 	 * When probing the root bridge, which doesn't have any
 	 * subordinate PCI devices. We don't have OF node for
@@ -416,6 +412,8 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
 		return NULL;
 
+	eeh_edev_dbg(edev, "Probing device\n");
+
 	/* Initialize eeh device */
 	edev->class_code = pdn->class_code;
 	edev->mode	&= 0xFFFFFF00;
@@ -441,9 +439,7 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 	/* Create PE */
 	ret = eeh_add_to_parent_pe(edev);
 	if (ret) {
-		pr_warn("%s: Can't add PCI dev %04x:%02x:%02x.%01x to parent PE (%x)\n",
-			__func__, hose->global_number, pdn->busno,
-			PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn), ret);
+		eeh_edev_warn(edev, "Failed to add device to PE (code %d)\n", ret);
 		return NULL;
 	}
 
@@ -501,10 +497,7 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 	/* Save memory bars */
 	eeh_save_bars(edev);
 
-	pr_debug("%s: EEH enabled on %02x:%02x.%01x PHB#%x-PE#%x\n",
-		__func__, pdn->busno, PCI_SLOT(pdn->devfn),
-		PCI_FUNC(pdn->devfn), edev->pe->phb->global_number,
-		edev->pe->addr);
+	eeh_edev_dbg(edev, "EEH enabled on device\n");
 
 	return NULL;
 }
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 96ad41fbf96b..517982197451 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -49,7 +49,7 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 	if (eeh_has_flag(EEH_FORCE_DISABLED))
 		return;
 
-	pr_debug("%s: EEH: Setting up device %s.\n", __func__, pci_name(pdev));
+	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
 #ifdef CONFIG_PCI_IOV
 	if (pdev->is_virtfn) {
 		struct pci_dn *physfn_pdn;
@@ -238,10 +238,6 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
 	int enable = 0;
 	int ret;
 
-	pr_debug("%s: probing %04x:%02x:%02x.%01x\n",
-		__func__, pdn->phb->global_number, pdn->busno,
-		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
-
 	/* Retrieve OF node and eeh device */
 	edev = pdn_to_eeh_dev(pdn);
 	if (!edev || edev->pe)
@@ -255,6 +251,8 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
         if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
 		return NULL;
 
+	eeh_edev_dbg(edev, "Probing device\n");
+
 	/*
 	 * Update class code and mode of eeh device. We need
 	 * correctly reflects that current device is root port
@@ -284,12 +282,10 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
 	pe.config_addr = (pdn->busno << 16) | (pdn->devfn << 8);
 
 	/* Enable EEH on the device */
+	eeh_edev_dbg(edev, "Enabling EEH on device\n");
 	ret = eeh_ops->set_option(&pe, EEH_OPT_ENABLE);
 	if (ret) {
-		pr_debug("%s: EEH failed to enable on %02x:%02x.%01x PHB#%x-PE#%x (code %d)\n",
-			__func__, pdn->busno, PCI_SLOT(pdn->devfn),
-			PCI_FUNC(pdn->devfn), pe.phb->global_number,
-			pe.addr, ret);
+		eeh_edev_dbg(edev, "EEH failed to enable on device (code %d)\n", ret);
 	} else {
 		/* Retrieve PE address */
 		edev->pe_config_addr = eeh_ops->get_pe_addr(&pe);
@@ -314,11 +310,8 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
 			edev->pe_config_addr = pdn_to_eeh_dev(pdn->parent)->pe_config_addr;
 			eeh_add_to_parent_pe(edev);
 		}
-		pr_debug("%s: EEH %s on %02x:%02x.%01x PHB#%x-PE#%x (code %d)\n",
-			__func__, (enable ? "enabled" : "unsupported"),
-			pdn->busno, PCI_SLOT(pdn->devfn),
-			PCI_FUNC(pdn->devfn), pe.phb->global_number,
-			pe.addr, ret);
+		eeh_edev_dbg(edev, "EEH is %s on device (code %d)\n",
+			     (enable ? "enabled" : "unsupported"), ret);
 	}
 
 	/* Save memory bars */
-- 
2.22.0.216.g00a2a96fc9

