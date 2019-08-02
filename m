Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFC57ECC6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 08:40:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Hbc4k3PzDqlR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 16:40:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 460HQx6r7GzDqp5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 16:32:57 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x726MdI2102372
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Aug 2019 02:32:55 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u4d8jn81t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 02:32:54 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Fri, 2 Aug 2019 07:32:53 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 2 Aug 2019 07:32:50 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x726WWJp36504006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Aug 2019 06:32:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F042A4065
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 06:32:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A606A4062
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 06:32:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 06:32:48 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9E6ACA038B
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 16:32:47 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/eeh: Remove unused return path from
 eeh_pe_dev_traverse()
Date: Fri,  2 Aug 2019 16:32:46 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1564727543.git.sbobroff@linux.ibm.com>
References: <cover.1564727543.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19080206-4275-0000-0000-00000353110C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080206-4276-0000-0000-0000386405C7
Message-Id: <9e18d36b1fa273304249d2976be2ffd0c4c0f933.1564727543.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=2 spamscore=0
 clxscore=1015 lowpriorityscore=2 mlxscore=0 impostorscore=0
 mlxlogscore=575 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908020067
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are no users of the early-out return value from
eeh_pe_dev_traverse(), so remove it.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 arch/powerpc/include/asm/eeh.h   |  6 +++---
 arch/powerpc/kernel/eeh.c        | 16 +++++-----------
 arch/powerpc/kernel/eeh_driver.c | 26 +++++++++++---------------
 arch/powerpc/kernel/eeh_pe.c     | 25 +++++++------------------
 4 files changed, 26 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index e1023a556721..10cb6342f60b 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -261,7 +261,7 @@ static inline bool eeh_state_active(int state)
 	== (EEH_STATE_MMIO_ACTIVE | EEH_STATE_DMA_ACTIVE);
 }
 
-typedef void *(*eeh_edev_traverse_func)(struct eeh_dev *edev, void *flag);
+typedef void (*eeh_edev_traverse_func)(struct eeh_dev *edev, void *flag);
 typedef void *(*eeh_pe_traverse_func)(struct eeh_pe *pe, void *flag);
 void eeh_set_pe_aux_size(int size);
 int eeh_phb_pe_create(struct pci_controller *phb);
@@ -275,8 +275,8 @@ int eeh_rmv_from_parent_pe(struct eeh_dev *edev);
 void eeh_pe_update_time_stamp(struct eeh_pe *pe);
 void *eeh_pe_traverse(struct eeh_pe *root,
 		      eeh_pe_traverse_func fn, void *flag);
-void *eeh_pe_dev_traverse(struct eeh_pe *root,
-			  eeh_edev_traverse_func fn, void *flag);
+void eeh_pe_dev_traverse(struct eeh_pe *root,
+			 eeh_edev_traverse_func fn, void *flag);
 void eeh_pe_restore_bars(struct eeh_pe *pe);
 const char *eeh_pe_loc_get(struct eeh_pe *pe);
 struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index b6683f367f7f..b7a884305ae5 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -696,7 +696,7 @@ int eeh_pci_enable(struct eeh_pe *pe, int function)
 	return rc;
 }
 
-static void *eeh_disable_and_save_dev_state(struct eeh_dev *edev,
+static void eeh_disable_and_save_dev_state(struct eeh_dev *edev,
 					    void *userdata)
 {
 	struct pci_dev *pdev = eeh_dev_to_pci_dev(edev);
@@ -707,7 +707,7 @@ static void *eeh_disable_and_save_dev_state(struct eeh_dev *edev,
 	 * state for the specified device
 	 */
 	if (!pdev || pdev == dev)
-		return NULL;
+		return;
 
 	/* Ensure we have D0 power state */
 	pci_set_power_state(pdev, PCI_D0);
@@ -720,18 +720,16 @@ static void *eeh_disable_and_save_dev_state(struct eeh_dev *edev,
 	 * interrupt from the device
 	 */
 	pci_write_config_word(pdev, PCI_COMMAND, PCI_COMMAND_INTX_DISABLE);
-
-	return NULL;
 }
 
-static void *eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
+static void eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
 {
 	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 	struct pci_dev *pdev = eeh_dev_to_pci_dev(edev);
 	struct pci_dev *dev = userdata;
 
 	if (!pdev)
-		return NULL;
+		return;
 
 	/* Apply customization from firmware */
 	if (pdn && eeh_ops->restore_config)
@@ -740,8 +738,6 @@ static void *eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
 	/* The caller should restore state for the specified device */
 	if (pdev != dev)
 		pci_restore_state(pdev);
-
-	return NULL;
 }
 
 int eeh_restore_vf_config(struct pci_dn *pdn)
@@ -956,7 +952,7 @@ int pcibios_set_pcie_reset_state(struct pci_dev *dev, enum pcie_reset_state stat
  * the indicated device and its children so that the bunch of the
  * devices could be reset properly.
  */
-static void *eeh_set_dev_freset(struct eeh_dev *edev, void *flag)
+static void eeh_set_dev_freset(struct eeh_dev *edev, void *flag)
 {
 	struct pci_dev *dev;
 	unsigned int *freset = (unsigned int *)flag;
@@ -964,8 +960,6 @@ static void *eeh_set_dev_freset(struct eeh_dev *edev, void *flag)
 	dev = eeh_dev_to_pci_dev(edev);
 	if (dev)
 		*freset |= dev->needs_freset;
-
-	return NULL;
 }
 
 static void eeh_pe_refreeze_passed(struct eeh_pe *root)
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 670b6159cef1..927b59d8a9e5 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -198,12 +198,12 @@ static void eeh_enable_irq(struct eeh_dev *edev)
 	}
 }
 
-static void *eeh_dev_save_state(struct eeh_dev *edev, void *userdata)
+static void eeh_dev_save_state(struct eeh_dev *edev, void *userdata)
 {
 	struct pci_dev *pdev;
 
 	if (!edev)
-		return NULL;
+		return;
 
 	/*
 	 * We cannot access the config space on some adapters.
@@ -213,14 +213,13 @@ static void *eeh_dev_save_state(struct eeh_dev *edev, void *userdata)
 	 * device is created.
 	 */
 	if (edev->pe && (edev->pe->state & EEH_PE_CFG_RESTRICTED))
-		return NULL;
+		return;
 
 	pdev = eeh_dev_to_pci_dev(edev);
 	if (!pdev)
-		return NULL;
+		return;
 
 	pci_save_state(pdev);
-	return NULL;
 }
 
 static void eeh_set_channel_state(struct eeh_pe *root, enum pci_channel_state s)
@@ -374,12 +373,12 @@ static enum pci_ers_result eeh_report_reset(struct eeh_dev *edev,
 	return driver->err_handler->slot_reset(edev->pdev);
 }
 
-static void *eeh_dev_restore_state(struct eeh_dev *edev, void *userdata)
+static void eeh_dev_restore_state(struct eeh_dev *edev, void *userdata)
 {
 	struct pci_dev *pdev;
 
 	if (!edev)
-		return NULL;
+		return;
 
 	/*
 	 * The content in the config space isn't saved because
@@ -391,15 +390,14 @@ static void *eeh_dev_restore_state(struct eeh_dev *edev, void *userdata)
 		if (list_is_last(&edev->entry, &edev->pe->edevs))
 			eeh_pe_restore_bars(edev->pe);
 
-		return NULL;
+		return;
 	}
 
 	pdev = eeh_dev_to_pci_dev(edev);
 	if (!pdev)
-		return NULL;
+		return;
 
 	pci_restore_state(pdev);
-	return NULL;
 }
 
 /**
@@ -478,7 +476,7 @@ static void *eeh_add_virt_device(struct eeh_dev *edev)
 	return NULL;
 }
 
-static void *eeh_rmv_device(struct eeh_dev *edev, void *userdata)
+static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
 {
 	struct pci_driver *driver;
 	struct pci_dev *dev = eeh_dev_to_pci_dev(edev);
@@ -493,7 +491,7 @@ static void *eeh_rmv_device(struct eeh_dev *edev, void *userdata)
 	 */
 	if (!eeh_edev_actionable(edev) ||
 	    (dev->hdr_type == PCI_HEADER_TYPE_BRIDGE))
-		return NULL;
+		return;
 
 	if (rmv_data) {
 		driver = eeh_pcid_get(dev);
@@ -502,7 +500,7 @@ static void *eeh_rmv_device(struct eeh_dev *edev, void *userdata)
 			    driver->err_handler->error_detected &&
 			    driver->err_handler->slot_reset) {
 				eeh_pcid_put(dev);
-				return NULL;
+				return;
 			}
 			eeh_pcid_put(dev);
 		}
@@ -535,8 +533,6 @@ static void *eeh_rmv_device(struct eeh_dev *edev, void *userdata)
 		pci_stop_and_remove_bus_device(dev);
 		pci_unlock_rescan_remove();
 	}
-
-	return NULL;
 }
 
 static void *eeh_pe_detach_dev(struct eeh_pe *pe, void *userdata)
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 236e6a667114..1a6254bcf056 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -231,29 +231,22 @@ void *eeh_pe_traverse(struct eeh_pe *root,
  * The function is used to traverse the devices of the specified
  * PE and its child PEs.
  */
-void *eeh_pe_dev_traverse(struct eeh_pe *root,
+void eeh_pe_dev_traverse(struct eeh_pe *root,
 			  eeh_edev_traverse_func fn, void *flag)
 {
 	struct eeh_pe *pe;
 	struct eeh_dev *edev, *tmp;
-	void *ret;
 
 	if (!root) {
 		pr_warn("%s: Invalid PE %p\n",
 			__func__, root);
-		return NULL;
+		return;
 	}
 
 	/* Traverse root PE */
-	eeh_for_each_pe(root, pe) {
-		eeh_pe_for_each_dev(pe, edev, tmp) {
-			ret = fn(edev, flag);
-			if (ret)
-				return ret;
-		}
-	}
-
-	return NULL;
+	eeh_for_each_pe(root, pe)
+		eeh_pe_for_each_dev(pe, edev, tmp)
+			fn(edev, flag);
 }
 
 /**
@@ -604,13 +597,11 @@ void eeh_pe_mark_isolated(struct eeh_pe *root)
 }
 EXPORT_SYMBOL_GPL(eeh_pe_mark_isolated);
 
-static void *__eeh_pe_dev_mode_mark(struct eeh_dev *edev, void *flag)
+static void __eeh_pe_dev_mode_mark(struct eeh_dev *edev, void *flag)
 {
 	int mode = *((int *)flag);
 
 	edev->mode |= mode;
-
-	return NULL;
 }
 
 /**
@@ -829,7 +820,7 @@ static void eeh_restore_device_bars(struct eeh_dev *edev)
  * the expansion ROM base address, the latency timer, and etc.
  * from the saved values in the device node.
  */
-static void *eeh_restore_one_device_bars(struct eeh_dev *edev, void *flag)
+static void eeh_restore_one_device_bars(struct eeh_dev *edev, void *flag)
 {
 	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 
@@ -841,8 +832,6 @@ static void *eeh_restore_one_device_bars(struct eeh_dev *edev, void *flag)
 
 	if (eeh_ops->restore_config && pdn)
 		eeh_ops->restore_config(pdn);
-
-	return NULL;
 }
 
 /**
-- 
2.22.0.216.g00a2a96fc9

