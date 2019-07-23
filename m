Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC37C7255B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 05:24:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tgg90KfmzDqM3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 13:24:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t49C2GgFzDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 13:44:30 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6N3gifs081932
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 23:44:28 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2twqq4w3w8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 23:44:28 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 23 Jul 2019 04:44:25 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 23 Jul 2019 04:44:23 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6N3i7Ru32309706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2019 03:44:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DBF811C04A;
 Tue, 23 Jul 2019 03:44:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A68811C04C;
 Tue, 23 Jul 2019 03:44:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jul 2019 03:44:21 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 660C3A038A;
 Tue, 23 Jul 2019 13:44:20 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/9] powerpc/eeh: Improve debug messages around device
 addition
Date: Tue, 23 Jul 2019 13:44:14 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1563853440.git.sbobroff@linux.ibm.com>
References: <cover.1563853440.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19072303-0012-0000-0000-00000335512A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072303-0013-0000-0000-0000216EDF92
Message-Id: <17b952606c300e4a43ab33aefc6e7043bd82d1c9.1563853440.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=29 phishscore=0 bulkscore=0 spamscore=0
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

Also remove useless comment.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/eeh.c                    |  2 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c | 14 ++++++++----
 arch/powerpc/platforms/pseries/eeh_pseries.c | 23 +++++++++++++++-----
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index d44533bba642..846cc697030c 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1278,7 +1278,7 @@ void eeh_add_device_late(struct pci_dev *dev)
 	pdn = pci_get_pdn_by_devfn(dev->bus, dev->devfn);
 	edev = pdn_to_eeh_dev(pdn);
 	if (edev->pdev == dev) {
-		pr_debug("EEH: Already referenced !\n");
+		pr_debug("EEH: Device %s already referenced!\n", pci_name(dev));
 		return;
 	}
 
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 1cd5ebd7299c..629f9390d9af 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -46,10 +46,7 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
 	if (!pdev->is_virtfn)
 		return;
 
-	/*
-	 * The following operations will fail if VF's sysfs files
-	 * aren't created or its resources aren't finalized.
-	 */
+	pr_debug("%s: EEH: Setting up device %s.\n", __func__, pci_name(pdev));
 	eeh_add_device_early(pdn);
 	eeh_add_device_late(pdev);
 	eeh_sysfs_add_device(pdev);
@@ -393,6 +390,10 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 	int ret;
 	int config_addr = (pdn->busno << 8) | (pdn->devfn);
 
+	pr_debug("%s: probing %04x:%02x:%02x.%01x\n",
+		__func__, hose->global_number, pdn->busno,
+		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
+
 	/*
 	 * When probing the root bridge, which doesn't have any
 	 * subordinate PCI devices. We don't have OF node for
@@ -487,6 +488,11 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 	/* Save memory bars */
 	eeh_save_bars(edev);
 
+	pr_debug("%s: EEH enabled on %02x:%02x.%01x PHB#%x-PE#%x\n",
+		__func__, pdn->busno, PCI_SLOT(pdn->devfn),
+		PCI_FUNC(pdn->devfn), edev->pe->phb->global_number,
+		edev->pe->addr);
+
 	return NULL;
 }
 
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 07e3fc2667aa..31733f6d642c 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -52,6 +52,8 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 	if (!pdev->is_virtfn)
 		return;
 
+	pr_debug("%s: EEH: Setting up device %s.\n", __func__, pci_name(pdev));
+
 	pdn->device_id  =  pdev->device;
 	pdn->vendor_id  =  pdev->vendor;
 	pdn->class_code =  pdev->class;
@@ -238,6 +240,10 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
 	int enable = 0;
 	int ret;
 
+	pr_debug("%s: probing %04x:%02x:%02x.%01x\n",
+		__func__, pdn->phb->global_number, pdn->busno,
+		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
+
 	/* Retrieve OF node and eeh device */
 	edev = pdn_to_eeh_dev(pdn);
 	if (!edev || edev->pe)
@@ -281,7 +287,12 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
 
 	/* Enable EEH on the device */
 	ret = eeh_ops->set_option(&pe, EEH_OPT_ENABLE);
-	if (!ret) {
+	if (ret) {
+		pr_debug("%s: EEH failed to enable on %02x:%02x.%01x PHB#%x-PE#%x (code %d)\n",
+			__func__, pdn->busno, PCI_SLOT(pdn->devfn),
+			PCI_FUNC(pdn->devfn), pe.phb->global_number,
+			pe.addr, ret);
+	} else {
 		/* Retrieve PE address */
 		edev->pe_config_addr = eeh_ops->get_pe_addr(&pe);
 		pe.addr = edev->pe_config_addr;
@@ -297,11 +308,6 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
 		if (enable) {
 			eeh_add_flag(EEH_ENABLED);
 			eeh_add_to_parent_pe(edev);
-
-			pr_debug("%s: EEH enabled on %02x:%02x.%01x PHB#%x-PE#%x\n",
-				__func__, pdn->busno, PCI_SLOT(pdn->devfn),
-				PCI_FUNC(pdn->devfn), pe.phb->global_number,
-				pe.addr);
 		} else if (pdn->parent && pdn_to_eeh_dev(pdn->parent) &&
 			   (pdn_to_eeh_dev(pdn->parent))->pe) {
 			/* This device doesn't support EEH, but it may have an
@@ -310,6 +316,11 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
 			edev->pe_config_addr = pdn_to_eeh_dev(pdn->parent)->pe_config_addr;
 			eeh_add_to_parent_pe(edev);
 		}
+		pr_debug("%s: EEH %s on %02x:%02x.%01x PHB#%x-PE#%x (code %d)\n",
+			__func__, (enable ? "enabled" : "unsupported"),
+			pdn->busno, PCI_SLOT(pdn->devfn),
+			PCI_FUNC(pdn->devfn), pe.phb->global_number,
+			pe.addr, ret);
 	}
 
 	/* Save memory bars */
-- 
2.22.0.216.g00a2a96fc9

