Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E88ED15896
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 06:38:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yn1S3hmhzDqc6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 14:38:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ymqc413LzDqBt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 14:30:20 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x474MEJA101485
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 May 2019 00:30:18 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sb1vqtbsw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 00:30:17 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 7 May 2019 05:30:15 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 May 2019 05:30:11 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x474UA5641615466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 May 2019 04:30:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39533A405C;
 Tue,  7 May 2019 04:30:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99425A4067;
 Tue,  7 May 2019 04:30:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 May 2019 04:30:09 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C4704A03B5;
 Tue,  7 May 2019 14:30:06 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/6] powerpc/eeh: EEH for pSeries hot plug
Date: Tue,  7 May 2019 14:30:05 +1000
X-Mailer: git-send-email 2.19.0.2.gcad72f5712
In-Reply-To: <cover.1557203383.git.sbobroff@linux.ibm.com>
References: <cover.1557203383.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050704-0012-0000-0000-000003190577
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050704-0013-0000-0000-0000215180BA
Message-Id: <f43783a60e55ff6c373b9f9744cb32ee9512c619.1557203383.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-07_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905070028
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

On PowerNV and pSeries, devices currently acquire EEH support from
several different places: Boot-time devices from eeh_probe_devices()
and eeh_addr_cache_build(), Virtual Function devices from the pcibios
bus add device hooks and hot plugged devices from pci_hp_add_devices()
(with other platforms using other methods as well).  Unfortunately,
pSeries machines currently discover hot plugged devices using
pci_rescan_bus(), not pci_hp_add_devices(), and so those devices do
not receive EEH support.

Rather than adding another case for pci_rescan_bus(), this change
widens the scope of the pcibios bus add device hooks so that they can
handle all devices. As a side effect this also supports devices
discovered after manually rescanning via /sys/bus/pci/rescan.

Note that on PowerNV, this change allows the EEH subsystem to become
enabled after boot as long as it has not been forced off, which was
not previously possible (it was already possible on pSeries).

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
v2 - Dropped changes to the PowerNV PHB EEH flag, instead refactor just enough to
     use the existing flag from multiple places.
   - Merge the little remaining work from the above change into the patch where
     it's used.

 arch/powerpc/kernel/eeh.c                    |  2 +-
 arch/powerpc/kernel/of_platform.c            |  3 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c | 39 +++++++++-----
 arch/powerpc/platforms/pseries/eeh_pseries.c | 54 ++++++++++----------
 4 files changed, 56 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 4160514d997c..1ed80adb40a1 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1285,7 +1285,7 @@ void eeh_add_device_late(struct pci_dev *dev)
 	struct pci_dn *pdn;
 	struct eeh_dev *edev;
 
-	if (!dev || !eeh_enabled())
+	if (!dev)
 		return;
 
 	pr_debug("EEH: Adding device %s\n", pci_name(dev));
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index becaec990140..d5818e9c4069 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -86,7 +86,8 @@ static int of_pci_phb_probe(struct platform_device *dev)
 	pcibios_claim_one_bus(phb->bus);
 
 	/* Finish EEH setup */
-	eeh_add_device_tree_late(phb->bus);
+	if (!eeh_has_flag(EEH_FORCE_DISABLED))
+		eeh_add_device_tree_late(phb->bus);
 
 	/* Add probed PCI devices to the device model */
 	pci_bus_add_devices(phb->bus);
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 0e374cdba961..90729d908a54 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -47,7 +47,7 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
 {
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 
-	if (!pdev->is_virtfn)
+	if (eeh_has_flag(EEH_FORCE_DISABLED))
 		return;
 
 	pr_debug("%s: EEH: Setting up device %s.\n", __func__, pci_name(pdev));
@@ -226,6 +226,25 @@ static const struct file_operations eeh_tree_state_debugfs_ops = {
 
 #endif /* CONFIG_DEBUG_FS */
 
+void pnv_eeh_enable_phbs(void)
+{
+	struct pci_controller *hose;
+	struct pnv_phb *phb;
+
+	list_for_each_entry(hose, &hose_list, list_node) {
+		phb = hose->private_data;
+		/*
+		 * If EEH is enabled, we're going to rely on that.
+		 * Otherwise, we restore to conventional mechanism
+		 * to clear frozen PE during PCI config access.
+		 */
+		if (eeh_enabled())
+			phb->flags |= PNV_PHB_FLAG_EEH;
+		else
+			phb->flags &= ~PNV_PHB_FLAG_EEH;
+	}
+}
+
 /**
  * pnv_eeh_post_init - EEH platform dependent post initialization
  *
@@ -264,19 +283,11 @@ int pnv_eeh_post_init(void)
 	if (!eeh_enabled())
 		disable_irq(eeh_event_irq);
 
+	pnv_eeh_enable_phbs();
+
 	list_for_each_entry(hose, &hose_list, list_node) {
 		phb = hose->private_data;
 
-		/*
-		 * If EEH is enabled, we're going to rely on that.
-		 * Otherwise, we restore to conventional mechanism
-		 * to clear frozen PE during PCI config access.
-		 */
-		if (eeh_enabled())
-			phb->flags |= PNV_PHB_FLAG_EEH;
-		else
-			phb->flags &= ~PNV_PHB_FLAG_EEH;
-
 		/* Create debugfs entries */
 #ifdef CONFIG_DEBUG_FS
 		if (phb->has_dbgfs || !phb->dbgfs)
@@ -487,7 +498,11 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 	 * Enable EEH explicitly so that we will do EEH check
 	 * while accessing I/O stuff
 	 */
-	eeh_add_flag(EEH_ENABLED);
+	if (!eeh_has_flag(EEH_ENABLED)) {
+		enable_irq(eeh_event_irq);
+		pnv_eeh_enable_phbs();
+		eeh_add_flag(EEH_ENABLED);
+	}
 
 	/* Save memory bars */
 	eeh_save_bars(edev);
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index ae06878fbdea..e68c79164974 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -55,44 +55,44 @@ static int ibm_get_config_addr_info;
 static int ibm_get_config_addr_info2;
 static int ibm_configure_pe;
 
-#ifdef CONFIG_PCI_IOV
 void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 {
 	struct pci_dn *pdn = pci_get_pdn(pdev);
-	struct pci_dn *physfn_pdn;
-	struct eeh_dev *edev;
 
-	if (!pdev->is_virtfn)
+	if (eeh_has_flag(EEH_FORCE_DISABLED))
 		return;
 
 	pr_debug("%s: EEH: Setting up device %s.\n", __func__, pci_name(pdev));
+#ifdef CONFIG_PCI_IOV
+	if (pdev->is_virtfn) {
+		struct pci_dn *physfn_pdn;
 
-	pdn->device_id  =  pdev->device;
-	pdn->vendor_id  =  pdev->vendor;
-	pdn->class_code =  pdev->class;
-	/*
-	 * Last allow unfreeze return code used for retrieval
-	 * by user space in eeh-sysfs to show the last command
-	 * completion from platform.
-	 */
-	pdn->last_allow_rc =  0;
-	physfn_pdn      =  pci_get_pdn(pdev->physfn);
-	pdn->pe_number  =  physfn_pdn->pe_num_map[pdn->vf_index];
-	edev = pdn_to_eeh_dev(pdn);
-
-	/*
-	 * The following operations will fail if VF's sysfs files
-	 * aren't created or its resources aren't finalized.
-	 */
+		pdn->device_id  =  pdev->device;
+		pdn->vendor_id  =  pdev->vendor;
+		pdn->class_code =  pdev->class;
+		/*
+		 * Last allow unfreeze return code used for retrieval
+		 * by user space in eeh-sysfs to show the last command
+		 * completion from platform.
+		 */
+		pdn->last_allow_rc =  0;
+		physfn_pdn      =  pci_get_pdn(pdev->physfn);
+		pdn->pe_number  =  physfn_pdn->pe_num_map[pdn->vf_index];
+	}
+#endif
 	eeh_add_device_early(pdn);
 	eeh_add_device_late(pdev);
-	edev->pe_config_addr =  (pdn->busno << 16) | (pdn->devfn << 8);
-	eeh_rmv_from_parent_pe(edev); /* Remove as it is adding to bus pe */
-	eeh_add_to_parent_pe(edev);   /* Add as VF PE type */
-	eeh_sysfs_add_device(pdev);
+#ifdef CONFIG_PCI_IOV
+	if (pdev->is_virtfn) {
+		struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 
-}
+		edev->pe_config_addr =  (pdn->busno << 16) | (pdn->devfn << 8);
+		eeh_rmv_from_parent_pe(edev); /* Remove as it is adding to bus pe */
+		eeh_add_to_parent_pe(edev);   /* Add as VF PE type */
+	}
 #endif
+	eeh_sysfs_add_device(pdev);
+}
 
 /*
  * Buffer for reporting slot-error-detail rtas calls. Its here
@@ -159,10 +159,8 @@ static int pseries_eeh_init(void)
 	/* Set EEH probe mode */
 	eeh_add_flag(EEH_PROBE_MODE_DEVTREE | EEH_ENABLE_IO_FOR_LOG);
 
-#ifdef CONFIG_PCI_IOV
 	/* Set EEH machine dependent code */
 	ppc_md.pcibios_bus_add_device = pseries_pcibios_bus_add_device;
-#endif
 
 	return 0;
 }
-- 
2.19.0.2.gcad72f5712

